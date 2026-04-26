namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>table</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlTableElement"), Alias("table"), OutputType(typeof(string))]
public class NewTableElementCommand(): NewElementCommand("table", isVoid: false) {}
