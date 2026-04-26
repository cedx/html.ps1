namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>legend</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlLegendElement"), Alias("legend"), OutputType(typeof(string))]
public class NewLegendElementCommand(): NewElementCommand("legend", isVoid: false) {}
