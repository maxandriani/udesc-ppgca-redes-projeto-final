#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["src/CollectorCli/CollectorCli.csproj", "src/CollectorCli/"]
RUN dotnet restore "src/CollectorCli/CollectorCli.csproj"
COPY . .
WORKDIR "/src/src/CollectorCli"
RUN dotnet build "CollectorCli.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "CollectorCli.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "CollectorCli.dll"]