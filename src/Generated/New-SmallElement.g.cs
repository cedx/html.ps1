namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>small</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlSmallElement"), Alias("small"), OutputType(typeof(string))]
public class NewSmallElementCommand(): NewElementCommand("small", isVoid: false) {}
