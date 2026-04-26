namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>h1</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlH1Element"), Alias("h1"), OutputType(typeof(string))]
public class NewH1ElementCommand(): NewElementCommand("h1", isVoid: false) {}
