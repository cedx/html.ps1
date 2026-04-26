namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>search</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlSearchElement"), Alias("search"), OutputType(typeof(string))]
public class NewSearchElementCommand(): NewElementCommand("search", isVoid: false) {}
