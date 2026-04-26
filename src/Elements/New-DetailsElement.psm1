using module ../New-Element.psm1

<#
.SYNOPSIS
	Creates a new `details` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlDetailsElement"), Alias("details"), OutputType(typeof(string))]
function New-HtmlDetailsElement: NewElementCommand("details", isVoid: false) {

	<#
	.SYNOPSIS
		The group name allowing multiple `details` elements to be connected, with only one open at a time.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Name

	<#
	.SYNOPSIS
		Value indicating whether the details are currently visible.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $Open

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (-not [string]::IsNullOrWhiteSpace(Name)) attributes["name"] = Name;
		if (Open) attributes["open"] = true;
	}
}
