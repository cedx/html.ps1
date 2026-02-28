namespace Belin.Html.Cmdlets.Elements;

using System.Globalization;

/// <summary>
/// Creates a new <c>html</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlElement"), Alias("html"), OutputType(typeof(string))]
public class NewHtmlElementCommand(): NewElementCommand("html", isVoid: false) {

	/// <summary>
	/// The directionality of the element's text.
	/// </summary>
	[Parameter(ValueFromPipelineByPropertyName = true)]
	public Directionality? Dir { get; set; }

	/// <summary>
	/// The element's language.
	/// </summary>
	[Parameter(ValueFromPipelineByPropertyName = true)]
	public CultureInfo? Lang { get; set; }

	/// <summary>
	/// Populates the specified attribute collection with the attributes of this element.
	/// </summary>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(Dictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (Dir is not null) attributes["dir"] = Dir.Value.ToString().ToLowerInvariant();
		if (Lang is not null) attributes["lang"] = Lang.Name;
	}
}
