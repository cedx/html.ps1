namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>caption</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlCaptionElement"), Alias("caption"), OutputType(typeof(string))]
public class NewCaptionElementCommand(): NewElementCommand("caption", isVoid: false) {}
