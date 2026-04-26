namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>footer</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlFooterElement"), Alias("footer"), OutputType(typeof(string))]
public class NewFooterElementCommand(): NewElementCommand("footer", isVoid: false) {}
