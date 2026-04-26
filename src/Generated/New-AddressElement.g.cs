namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>address</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlAddressElement"), Alias("address"), OutputType(typeof(string))]
public class NewAddressElementCommand(): NewElementCommand("address", isVoid: false) {}
