using System;
using System.Text.Json;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => {
    var utcNow = DateTimeOffset.UtcNow;
    return JsonSerializer.Serialize(new {
        message = "There is no spoon",
        timestamp = utcNow.ToUnixTimeSeconds()
    });
});

app.Run();
