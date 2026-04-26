namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>code</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlCodeElement"), Alias("code"), OutputType(typeof(string))]
public class NewCodeElementCommand(): NewElementCommand("code", isVoid: false) {}
