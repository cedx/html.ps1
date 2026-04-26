namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>mark</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlMarkElement"), Alias("mark"), OutputType(typeof(string))]
public class NewMarkElementCommand(): NewElementCommand("mark", isVoid: false) {}
