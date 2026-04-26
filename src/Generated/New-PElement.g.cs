namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>p</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlPElement"), Alias("p"), OutputType(typeof(string))]
public class NewPElementCommand(): NewElementCommand("p", isVoid: false) {}
