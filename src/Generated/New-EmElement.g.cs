namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>em</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlEmElement"), Alias("em"), OutputType(typeof(string))]
public class NewEmElementCommand(): NewElementCommand("em", isVoid: false) {}
