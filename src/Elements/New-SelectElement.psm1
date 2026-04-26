using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `select` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlSelectElement"), Alias("selectTag"), OutputType(typeof(string))]
function New-HtmlSelectElement: NewElementCommand("select", isVoid: false) {

	<#
	.SYNOPSIS
		A hint for a user agent's autocomplete feature.
	#>
	[string[]] $AutoComplete = @(),

	<#
	.SYNOPSIS
		Value indicating whether to prevent the user from interacting with the element.
	#>
	[switch] $Disabled

	<#
	.SYNOPSIS
		The identifier of a `form` element to associate with the element.
	#>
	[string] $Form

	<#
	.SYNOPSIS
		Value indicating whether multiple options can be selected in the list.
	#>
	[switch] $Multiple

	<#
	.SYNOPSIS
		The name of the control.
	#>
	[string] $Name

	<#
	.SYNOPSIS
		Value indicating whether an option with a non-empty string value must be selected.
	#>
	[switch] $Required

	<#
	.SYNOPSIS
		The number of rows in the list that should be visible at one time.
	#>
	[ValidateRange(ValidateRangeKind.NonNegative)]
	int Size = -1;

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (AutoComplete.Length > 0) $attributesToRender.autocomplete"] = string.Join(' ', AutoComplete).Trim();
		if (Disabled) $attributesToRender.disabled"] = true;
		if ($Form) { $attributesToRender.form"] = Form;
		if (Multiple) $attributesToRender.multiple"] = true;
		if ($Name) { $attributesToRender.name"] = Name;
		if (Required) $attributesToRender.required"] = true;
		if (Size >= 0) $attributesToRender.size"] = Size
	}
}
