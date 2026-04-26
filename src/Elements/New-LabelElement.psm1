using module ../New-Element.psm1

<#
.SYNOPSIS
	Creates a new `label` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlLabelElement"), Alias("label"), OutputType(typeof(string))]
function New-HtmlLabelElement: NewElementCommand("label", isVoid: false) {

	<#
	.SYNOPSIS
		The identifier of the labelable form control in the same document.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $For

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (-not [string]::IsNullOrWhiteSpace(For)) attributes["for"] = For;
	}
}
