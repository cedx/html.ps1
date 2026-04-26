namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>article</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlArticleElement"), Alias("article"), OutputType(typeof(string))]
public class NewArticleElementCommand(): NewElementCommand("article", isVoid: false) {}
