using System.Globalization;

<#
.SYNOPSIS
	Creates a new `meter` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlMeterElement"), Alias("meter"), OutputType(typeof(string))]
function New-HtmlMeterElementCommand(): NewElementCommand("meter", isVoid: false) {

	<#
	.SYNOPSIS
		The lower numeric bound of the high end of the measured range.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	double? High

	<#
	.SYNOPSIS
		The upper numeric bound of the low end of the measured range.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	double? Low

	<#
	.SYNOPSIS
		The upper numeric bound of the measured range.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	double? Max

	<#
	.SYNOPSIS
		The lower numeric bound of the measured range.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	double? Min

	<#
	.SYNOPSIS
		The optimal numeric value.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	double? Optimum

	<#
	.SYNOPSIS
		The current numeric value.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	double? Value

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (High is not null) attributes["high"] = High.Value.ToString(CultureInfo.InvariantCulture);
		if (Low is not null) attributes["low"] = Low.Value.ToString(CultureInfo.InvariantCulture);
		if (Max is not null) attributes["max"] = Max.Value.ToString(CultureInfo.InvariantCulture);
		if (Min is not null) attributes["min"] = Min.Value.ToString(CultureInfo.InvariantCulture);
		if (Optimum is not null) attributes["optimum"] = Optimum.Value.ToString(CultureInfo.InvariantCulture);
		if (Value is not null) attributes["value"] = Value.Value.ToString(CultureInfo.InvariantCulture);
	}
}
