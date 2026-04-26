namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>ul</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlUlElement"), Alias("ul"), OutputType(typeof(string))]
public class NewUlElementCommand(): NewElementCommand("ul", isVoid: false) {}
