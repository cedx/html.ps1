namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>kbd</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlKbdElement"), Alias("kbd"), OutputType(typeof(string))]
public class NewKbdElementCommand(): NewElementCommand("kbd", isVoid: false) {}
