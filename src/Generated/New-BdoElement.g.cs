namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>bdo</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlBdoElement"), Alias("bdo"), OutputType(typeof(string))]
public class NewBdoElementCommand(): NewElementCommand("bdo", isVoid: false) {}
