namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>br</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlBrElement"), Alias("br"), OutputType(typeof(string))]
public class NewBrElementCommand(): NewElementCommand("br", isVoid: true) {}
