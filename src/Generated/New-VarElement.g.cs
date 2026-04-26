namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>var</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlVarElement"), Alias("var"), OutputType(typeof(string))]
public class NewVarElementCommand(): NewElementCommand("var", isVoid: false) {}
