namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>ruby</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlRubyElement"), Alias("ruby"), OutputType(typeof(string))]
public class NewRubyElementCommand(): NewElementCommand("ruby", isVoid: false) {}
