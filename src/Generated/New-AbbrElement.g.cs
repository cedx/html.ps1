/// <summary>
/// Creates a new <c>abbr</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlAbbrElement"), Alias("abbr"), OutputType(typeof(string))]
public class NewAbbrElementCommand(): NewElementCommand("abbr", isVoid: false) {}
