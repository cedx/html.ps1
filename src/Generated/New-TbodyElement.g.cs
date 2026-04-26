namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>tbody</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlTbodyElement"), Alias("tbody"), OutputType(typeof(string))]
public class NewTbodyElementCommand(): NewElementCommand("tbody", isVoid: false) {}
