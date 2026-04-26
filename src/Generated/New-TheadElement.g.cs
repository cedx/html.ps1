namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>thead</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlTheadElement"), Alias("thead"), OutputType(typeof(string))]
public class NewTheadElementCommand(): NewElementCommand("thead", isVoid: false) {}
