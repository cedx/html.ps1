namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>summary</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlSummaryElement"), Alias("summary"), OutputType(typeof(string))]
public class NewSummaryElementCommand(): NewElementCommand("summary", isVoid: false) {}
