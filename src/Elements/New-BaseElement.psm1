using module ../Write-Element.psm1

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
	[Parameter(Mandatory)]
	[uri] $Href

	<#
	.SYNOPSIS
		The default browsing context to show the results of navigation from elements without explicit `target` attribute.
	#>
	[string] $Target

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		$attributesToRender.href"] = Href.ToString();
		if ($Target) { $attributesToRender.target"] = Target;
	}
}
