namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>nav</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlNavElement"), Alias("nav"), OutputType(typeof(string))]
public class NewNavElementCommand(): NewElementCommand("nav", isVoid: false) {}
