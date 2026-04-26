namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>header</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlHeaderElement"), Alias("header"), OutputType(typeof(string))]
public class NewHeaderElementCommand(): NewElementCommand("header", isVoid: false) {}
