namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>cite</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlCiteElement"), Alias("cite"), OutputType(typeof(string))]
public class NewCiteElementCommand(): NewElementCommand("cite", isVoid: false) {}
