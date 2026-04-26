namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>rp</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlRpElement"), Alias("rpTag"), OutputType(typeof(string))]
public class NewRpElementCommand(): NewElementCommand("rp", isVoid: false) {}
