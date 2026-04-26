namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>dfn</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlDfnElement"), Alias("dfn"), OutputType(typeof(string))]
public class NewDfnElementCommand(): NewElementCommand("dfn", isVoid: false) {}
