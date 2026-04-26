namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>main</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlMainElement"), Alias("main"), OutputType(typeof(string))]
public class NewMainElementCommand(): NewElementCommand("main", isVoid: false) {}
