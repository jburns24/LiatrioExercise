Running the app
1) install dotnet
2) accept development certificates `dotnet dev-certs https --trust` *doesnt work on linux
3) build/run api app with `dotnet run` (in the `API` repo)
4) Test application code at solution root with `dotnet test` (last exit code can be queried to determine if tests passed)

Struggles:
Well I have not really built a from the ground up app in dotnet so this was harder than I anticipated. Struggles were

Made two separate projects one for the site and another for nunit. Needed to make a solution out of those. dotnet was pretty easy to fix that
