namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>rt</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlRtElement"), Alias("rt"), OutputType(typeof(string))]
public class NewRtElementCommand(): NewElementCommand("rt", isVoid: false) {}
