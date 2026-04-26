namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>tfoot</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlTfootElement"), Alias("tfoot"), OutputType(typeof(string))]
public class NewTfootElementCommand(): NewElementCommand("tfoot", isVoid: false) {}
