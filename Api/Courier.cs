using System.Text.Json;

namespace ApiHelpers
{
    public static class Courier
    {
        public static string GetMessage()
        {
            var utcNow = DateTimeOffset.UtcNow;
            return JsonSerializer.Serialize(new {
                message = "There is no spoon",
                timestamp = utcNow.ToUnixTimeSeconds()
            });
        }

    }
}
