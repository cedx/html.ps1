namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>picture</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlPictureElement"), Alias("picture"), OutputType(typeof(string))]
public class NewPictureElementCommand(): NewElementCommand("picture", isVoid: false) {}
