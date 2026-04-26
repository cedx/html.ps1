namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>s</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlSElement"), Alias("s"), OutputType(typeof(string))]
public class NewSElementCommand(): NewElementCommand("s", isVoid: false) {}
