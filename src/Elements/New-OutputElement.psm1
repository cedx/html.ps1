using module ../New-Element.psm1

<#
.SYNOPSIS
	Creates a new `output` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlOutputElement"), Alias("output"), OutputType(typeof(string))]
function New-HtmlOutputElement: NewElementCommand("output", isVoid: false) {

	<#
	.SYNOPSIS
		A list of other elements' identifiers, indicating that those elements contributed input values to the calculation.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string[]] $For = @(),

	<#
	.SYNOPSIS
		The identifier of a `form` element to associate with the element.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Form

	<#
	.SYNOPSIS
		The element's name.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Name

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (For.Length > 0) attributes["for"] = string.Join(' ', For).Trim();
		if (-not [string]::IsNullOrWhiteSpace(Form)) attributes["form"] = Form;
		if (-not [string]::IsNullOrWhiteSpace(Name)) attributes["name"] = Name;
	}
}
