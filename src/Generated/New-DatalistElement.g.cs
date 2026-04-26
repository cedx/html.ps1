namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>datalist</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlDatalistElement"), Alias("datalist"), OutputType(typeof(string))]
public class NewDatalistElementCommand(): NewElementCommand("datalist", isVoid: false) {}
