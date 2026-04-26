namespace Belin.Html.Elements;

/// <summary>
/// Creates a new <c>bdi</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlBdiElement"), Alias("bdi"), OutputType(typeof(string))]
public class NewBdiElementCommand(): NewElementCommand("bdi", isVoid: false) {}
