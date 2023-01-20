using ApiHelpers;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => {
    //var utcNow = DateTimeOffset.UtcNow;
    var res = Courier.GetMessage();
    return res;
});

app.Run("http://0.0.0.0:80");
