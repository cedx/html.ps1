using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `fieldset` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlFieldsetElement"), Alias("fieldset"), OutputType(typeof(string))]
function New-HtmlFieldsetElement: NewElementCommand("fieldset", isVoid: false) {

	<#
	.SYNOPSIS
		Value indicating whether all form controls that are descendants of the element, are disabled.
	#>
	[switch] $Disabled

	<#
	.SYNOPSIS
		The identifier of a `form` element to associate with the element.
	#>
	[string] $Form

	<#
	.SYNOPSIS
		The name associated with the group.
	#>
	[string] $Name

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (Disabled) $attributesToRender.disabled"] = true;
		if ($Form) { $attributesToRender.form"] = Form;
		if ($Name) { $attributesToRender.name"] = Name;
	}
}
