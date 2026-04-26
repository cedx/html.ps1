namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>html</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlHtmlElement"), Alias("html"), OutputType(typeof(string))]
public class NewHtmlElementCommand(): NewElementCommand("html", isVoid: false) {}
