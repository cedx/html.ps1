namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>figcaption</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlFigcaptionElement"), Alias("figcaption"), OutputType(typeof(string))]
public class NewFigcaptionElementCommand(): NewElementCommand("figcaption", isVoid: false) {}
