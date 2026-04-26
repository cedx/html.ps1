namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>div</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlDivElement"), Alias("div"), OutputType(typeof(string))]
public class NewDivElementCommand(): NewElementCommand("div", isVoid: false) {}
