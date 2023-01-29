using ApiHelpers;
namespace ApiTests;

public class Tests
{
    [SetUp]
    public void Setup()
    { }

    [Test]
    public void GetMessage_Returns_Valid_Json()
    {
        var message = Courier.GetMessage();
        // throw new Exception("This is a bug fix me!!");
        Assert.IsNotNull(message);
    }
}
