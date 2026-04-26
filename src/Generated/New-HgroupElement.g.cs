namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>hgroup</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlHgroupElement"), Alias("hgroup"), OutputType(typeof(string))]
public class NewHgroupElementCommand(): NewElementCommand("hgroup", isVoid: false) {}
