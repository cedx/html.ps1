using module ../Write-Element.psm1

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
	[string[]] $For = @(),

	<#
	.SYNOPSIS
		The identifier of a `form` element to associate with the element.
	#>
	[string] $Form

	<#
	.SYNOPSIS
		The element's name.
	#>
	[string] $Name

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (For.Length > 0) $attributesToRender.for"] = string.Join(' ', For).Trim();
		if ($Form) { $attributesToRender.form"] = Form;
		if ($Name) { $attributesToRender.name"] = Name;
	}
}
