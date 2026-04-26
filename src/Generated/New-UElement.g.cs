namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>u</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlUElement"), Alias("u"), OutputType(typeof(string))]
public class NewUElementCommand(): NewElementCommand("u", isVoid: false) {}
