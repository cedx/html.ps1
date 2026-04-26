using module ../New-Element.psm1

<#
.SYNOPSIS
	Creates a new `base` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlBaseElement"), Alias("base"), OutputType(typeof(string))]
function New-HtmlBaseElement: NewElementCommand("base", isVoid: true) {

	<#
	.SYNOPSIS
		The base URL to be used throughout the document for relative URLs.
	#>
	[Parameter(Mandatory, ValueFromPipelineByPropertyName)]
	[uri] $Href

	<#
	.SYNOPSIS
		The default browsing context to show the results of navigation from elements without explicit `target` attribute.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Target

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		attributes["href"] = Href.ToString();
		if (-not [string]::IsNullOrWhiteSpace(Target)) attributes["target"] = Target;
	}
}
