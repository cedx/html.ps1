namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>i</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlIElement"), Alias("i"), OutputType(typeof(string))]
public class NewIElementCommand(): NewElementCommand("i", isVoid: false) {}
