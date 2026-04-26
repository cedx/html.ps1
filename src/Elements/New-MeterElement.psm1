using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `meter` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlMeterElement"), Alias("meter"), OutputType(typeof(string))]
function New-HtmlMeterElement: NewElementCommand("meter", isVoid: false) {

	<#
	.SYNOPSIS
		The lower numeric bound of the high end of the measured range.
	#>
	double? High

	<#
	.SYNOPSIS
		The upper numeric bound of the low end of the measured range.
	#>
	double? Low

	<#
	.SYNOPSIS
		The upper numeric bound of the measured range.
	#>
	double? Max

	<#
	.SYNOPSIS
		The lower numeric bound of the measured range.
	#>
	double? Min

	<#
	.SYNOPSIS
		The optimal numeric value.
	#>
	double? Optimum

	<#
	.SYNOPSIS
		The current numeric value.
	#>
	double? Value

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (High is not null) $attributesToRender.high"] = High.Value
		if (Low is not null) $attributesToRender.low"] = Low.Value
		if (Max is not null) $attributesToRender.max"] = Max.Value
		if (Min is not null) $attributesToRender.min"] = Min.Value
		if (Optimum is not null) $attributesToRender.optimum"] = Optimum.Value
		if (Value is not null) $attributesToRender.value"] = Value.Value
	}
}
