namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>h5</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlH5Element"), Alias("h5"), OutputType(typeof(string))]
public class NewH5ElementCommand(): NewElementCommand("h5", isVoid: false) {}
