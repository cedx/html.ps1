namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>h6</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlH6Element"), Alias("h6"), OutputType(typeof(string))]
public class NewH6ElementCommand(): NewElementCommand("h6", isVoid: false) {}
