namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>body</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlBodyElement"), Alias("body"), OutputType(typeof(string))]
public class NewBodyElementCommand(): NewElementCommand("body", isVoid: false) {}
