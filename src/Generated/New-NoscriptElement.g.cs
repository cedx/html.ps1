namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>noscript</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlNoscriptElement"), Alias("noscript"), OutputType(typeof(string))]
public class NewNoscriptElementCommand(): NewElementCommand("noscript", isVoid: false) {}
