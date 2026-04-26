using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `option` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlOptionElement"), Alias("option"), OutputType(typeof(string))]
function New-HtmlOptionElement: NewElementCommand("option", isVoid: false) {

	<#
	.SYNOPSIS
		Value indicating whether the option is not checkable.
	#>
	[switch] $Disabled

	<#
	.SYNOPSIS
		The label indicating the meaning of the option.
	#>
	[string] $Label

	<#
	.SYNOPSIS
		Value indicating whether the option is initially selected.
	#>
	[switch] $Selected

	<#
	.SYNOPSIS
		The value to be submitted with the form.
	#>
	[string] $Value

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (Disabled) $attributesToRender.disabled"] = true;
		if ($Label) { $attributesToRender.label"] = Label;
		if (Selected) $attributesToRender.selected"] = true;
		if (Value is not null) $attributesToRender.value"] = Value;
	}
}
