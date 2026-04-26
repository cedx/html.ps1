namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>samp</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlSampElement"), Alias("samp"), OutputType(typeof(string))]
public class NewSampElementCommand(): NewElementCommand("samp", isVoid: false) {}
