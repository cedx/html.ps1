namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>h3</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlH3Element"), Alias("h3"), OutputType(typeof(string))]
public class NewH3ElementCommand(): NewElementCommand("h3", isVoid: false) {}
