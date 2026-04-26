using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `blockquote` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlBlockquoteElement"), Alias("blockquote"), OutputType(typeof(string))]
function New-HtmlBlockquoteElement: NewElementCommand("blockquote", isVoid: false) {

	<#
	.SYNOPSIS
		A URL that designates a source document or message for the information quoted.
	#>
	Uri? Cite

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (Cite is not null) attributes["cite"] = Cite.ToString();
	}
}
