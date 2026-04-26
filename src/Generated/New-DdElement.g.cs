namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>dd</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlDdElement"), Alias("dd"), OutputType(typeof(string))]
public class NewDdElementCommand(): NewElementCommand("dd", isVoid: false) {}
