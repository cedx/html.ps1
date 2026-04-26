namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>head</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlHeadElement"), Alias("head"), OutputType(typeof(string))]
public class NewHeadElementCommand(): NewElementCommand("head", isVoid: false) {}
