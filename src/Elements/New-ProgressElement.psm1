using System.Globalization;

<#
.SYNOPSIS
	Creates a new `progress` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlProgressElement"), Alias("progress"), OutputType(typeof(string))]
function New-HtmlProgressElementCommand(): NewElementCommand("progress", isVoid: false) {

	<#
	.SYNOPSIS
		Describes how much work the task requires.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	double? Max

	<#
	.SYNOPSIS
		Specifies how much of the task that has been completed.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	double? Value

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (Max is not null) attributes["max"] = Max.Value.ToString(CultureInfo.InvariantCulture);
		if (Value is not null) attributes["value"] = Value.Value.ToString(CultureInfo.InvariantCulture);
	}
}
