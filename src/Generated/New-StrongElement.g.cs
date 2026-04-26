namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>strong</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlStrongElement"), Alias("strong"), OutputType(typeof(string))]
public class NewStrongElementCommand(): NewElementCommand("strong", isVoid: false) {}
