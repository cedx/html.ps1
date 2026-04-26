namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>pre</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlPreElement"), Alias("pre"), OutputType(typeof(string))]
public class NewPreElementCommand(): NewElementCommand("pre", isVoid: false) {}
