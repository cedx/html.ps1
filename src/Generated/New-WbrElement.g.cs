namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>wbr</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlWbrElement"), Alias("wbr"), OutputType(typeof(string))]
public class NewWbrElementCommand(): NewElementCommand("wbr", isVoid: true) {}
