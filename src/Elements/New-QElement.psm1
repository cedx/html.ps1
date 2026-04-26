using module ../New-Element.psm1

<#
.SYNOPSIS
	Creates a new `q` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlQElement"), Alias("q"), OutputType(typeof(string))]
function New-HtmlQElement: NewElementCommand("q", isVoid: false) {

	<#
	.SYNOPSIS
		A URL that designates a source document or message for the information quoted.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
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
