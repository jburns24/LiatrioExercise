FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
WORKDIR /App

# Copy everything
COPY ./App ./
# Restore as distinct layers
RUN dotnet restore
# Build the solution so we can run the tests
RUN dotnet build
# Change directories into the test project directory
WORKDIR /App/ApiTests
# Run unit tests and only build the image if the tests pass
RUN dotnet test
# Build and publish a release
WORKDIR /App
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