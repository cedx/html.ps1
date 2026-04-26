namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>dl</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlDlElement"), Alias("dl"), OutputType(typeof(string))]
public class NewDlElementCommand(): NewElementCommand("dl", isVoid: false) {}
