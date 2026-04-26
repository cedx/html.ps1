using module ../New-Element.psm1

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
		if (Disabled) attributes["disabled"] = true;
		if (-not [string]::IsNullOrWhiteSpace(Label)) attributes["label"] = Label;
		if (Selected) attributes["selected"] = true;
		if (Value is not null) attributes["value"] = Value;
	}
}
