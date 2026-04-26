namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>dt</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlDtElement"), Alias("dt"), OutputType(typeof(string))]
public class NewDtElementCommand(): NewElementCommand("dt", isVoid: false) {}
