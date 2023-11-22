using System.CommandLine;
using CollectorCli;

var sourceFolderOpt = new Option<DirectoryInfo>(new string[] { "--source", "-s" }, "Source folder");
var containerNameOpt = new Option<string>(new string[] { "--container", "-c" }, "Container Name");
var collectCmd = new Command("collect", "Collect files from a folder and upload to a BlobStorage container")
{
    sourceFolderOpt,
    containerNameOpt
};
collectCmd.SetHandler((context) =>
{
    var source = context.ParseResult.GetValueForOption(sourceFolderOpt);
    var container = context.ParseResult.GetValueForOption(containerNameOpt);
    var connectionString = Environment.GetEnvironmentVariable("CONNECTION_STRINGS__BLOB_STORAGE");

    if (connectionString is null)
        throw new Exception("Azure Blob Storage configuration is missing. Perhaps you forget to set CONNECTION_STRINGS__BLOB_STORAGE env");

    if (source is null)
        throw new ArgumentNullException("Source folder is missing. Perhaps you forget to ser --source=/path/to/source");

    if (container is null)
        throw new ArgumentNullException("Container name is missing. Perhaps you forget to set --container=NameOfTheContainer");

    return CollectCmd.HandleAsync(connectionString, source, container, context.GetCancellationToken());
});

var rootCmd = new RootCommand("Result Collector")
{
    collectCmd
};

await rootCmd.InvokeAsync(args);