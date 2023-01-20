FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
WORKDIR /App

# Copy everything
COPY ./App ./
# Set environment variable so we are listening on port 80 on all interfaces
ENV ASPNETCORE_URLS=http://0.0.0.0:5005
# Restore as distinct layers
RUN ls
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /App
EXPOSE 5005
COPY --from=build-env /App/out .
# Entrypoint seems like an important concept for container orchestration
# As according to the docs it makes the container run as an 'executable'
# meaning that when the .exe stops the container is stopped. This seems like
# an instramental feature for k8.
ENTRYPOINT [ "dotnet", "Api.dll" ]