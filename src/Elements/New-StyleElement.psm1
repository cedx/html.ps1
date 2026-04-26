using module ../New-Element.psm1

<#
.SYNOPSIS
	Creates a new `style` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlStyleElement"), Alias("style"), OutputType(typeof(string))]
function New-HtmlStyleElement: NewElementCommand("style", isVoid: false) {

	<#
	.SYNOPSIS
		Defines which media the style should be applied to.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Media

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (-not [string]::IsNullOrWhiteSpace(Media)) attributes["media"] = Media;
	}
}
