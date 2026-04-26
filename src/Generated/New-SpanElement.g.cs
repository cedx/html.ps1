namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>span</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlSpanElement"), Alias("span"), OutputType(typeof(string))]
public class NewSpanElementCommand(): NewElementCommand("span", isVoid: false) {}
