namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>hr</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlHrElement"), Alias("hr"), OutputType(typeof(string))]
public class NewHrElementCommand(): NewElementCommand("hr", isVoid: true) {}
