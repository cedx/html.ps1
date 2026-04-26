namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>title</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlTitleElement"), Alias("title"), OutputType(typeof(string))]
public class NewTitleElementCommand(): NewElementCommand("title", isVoid: false) {}
