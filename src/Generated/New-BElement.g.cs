namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>b</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlBElement"), Alias("b"), OutputType(typeof(string))]
public class NewBElementCommand(): NewElementCommand("b", isVoid: false) {}
