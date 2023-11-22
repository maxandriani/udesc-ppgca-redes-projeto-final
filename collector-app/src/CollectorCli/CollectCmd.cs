using Azure.Storage.Blobs;

namespace CollectorCli;

public static class CollectCmd {
    public static async Task<int> HandleAsync(string connectionString, DirectoryInfo source, string container, CancellationToken cancellationToken = default)
    {
        try {
            var blobServiceClient = new BlobServiceClient(connectionString);
            var containerClient = blobServiceClient.GetBlobContainerClient(container);

            if (source.Exists is false)
                throw new IOException($"Directory {source.FullName} not found.");

            foreach (var file in GetAllFiles(source))
            {
                await containerClient.UploadBlobAsync(file.FullName, File.OpenRead(file.FullName), cancellationToken);
                Console.WriteLine($"File: {file.FullName} uploaded to {container}.");
            }

            return 0;
        }
        catch(Exception ex)
        {
            Console.WriteLine(ex.Message);
            Console.WriteLine(ex.StackTrace);
            return 1;
        }
    }

    private static IEnumerable<FileInfo> GetAllFiles(DirectoryInfo source)
    {
        foreach (var directory in source.GetDirectories())
        {
            foreach (var file in GetAllFiles(directory))
            {
                yield return file;
            }
        }

        foreach (var file in source.GetFiles())
        {
            yield return file;
        }
    }
}