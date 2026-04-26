namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>sub</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlSubElement"), Alias("sub"), OutputType(typeof(string))]
public class NewSubElementCommand(): NewElementCommand("sub", isVoid: false) {}
