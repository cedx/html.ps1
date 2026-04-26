namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>h4</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlH4Element"), Alias("h4"), OutputType(typeof(string))]
public class NewH4ElementCommand(): NewElementCommand("h4", isVoid: false) {}
