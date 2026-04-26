namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>menu</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlMenuElement"), Alias("menu"), OutputType(typeof(string))]
public class NewMenuElementCommand(): NewElementCommand("menu", isVoid: false) {}
