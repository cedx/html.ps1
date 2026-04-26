namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>aside</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlAsideElement"), Alias("aside"), OutputType(typeof(string))]
public class NewAsideElementCommand(): NewElementCommand("aside", isVoid: false) {}
