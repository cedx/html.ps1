namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>section</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlSectionElement"), Alias("section"), OutputType(typeof(string))]
public class NewSectionElementCommand(): NewElementCommand("section", isVoid: false) {}
