# zie https://hub.docker.com/r/microsoft/dotnet
FROM mcr.microsoft.com/dotnet/sdk:9.0 as build-env
WORKDIR /app
COPY . .
RUN dotnet publish -c Release

FROM mcr.microsoft.com/dotnet/runtime:9.0 as runtime-env
# let op: mag anders heten!
WORKDIR /app
COPY --from=build-env /app/bin/ .
CMD ["dotnet", "Release/net9.0/voorbeelapplicatiecsharp.dll"]
