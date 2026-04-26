namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>sup</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlSupElement"), Alias("sup"), OutputType(typeof(string))]
public class NewSupElementCommand(): NewElementCommand("sup", isVoid: false) {}
