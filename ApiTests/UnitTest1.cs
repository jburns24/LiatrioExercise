using ApiHelpers;
namespace ApiTests;

public class Tests
{
    [SetUp]
    public void Setup()
    {}

    [Test]
    public void GetMessage_Returns_Valid_Json()
    {
        var message = Courier.GetMessage();
        Assert.IsNull(message);
    }
}
