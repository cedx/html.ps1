namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>tr</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlTrElement"), Alias("tr"), OutputType(typeof(string))]
public class NewTrElementCommand(): NewElementCommand("tr", isVoid: false) {}
