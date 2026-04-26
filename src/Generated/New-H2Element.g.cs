namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>h2</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlH2Element"), Alias("h2"), OutputType(typeof(string))]
public class NewH2ElementCommand(): NewElementCommand("h2", isVoid: false) {}
