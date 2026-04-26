namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>figure</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlFigureElement"), Alias("figure"), OutputType(typeof(string))]
public class NewFigureElementCommand(): NewElementCommand("figure", isVoid: false) {}
