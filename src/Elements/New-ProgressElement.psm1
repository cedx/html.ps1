using module ../New-Element.psm1

<#
.SYNOPSIS
	Creates a new `progress` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlProgressElement"), Alias("progress"), OutputType(typeof(string))]
function New-HtmlProgressElement: NewElementCommand("progress", isVoid: false) {

	<#
	.SYNOPSIS
		Describes how much work the task requires.
	#>
	[ValidateRange(ValidateRangeKind.NonNegative)]
	double? Max

	<#
	.SYNOPSIS
		Specifies how much of the task that has been completed.
	#>
	[ValidateRange(ValidateRangeKind.NonNegative)]
	double? Value

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (Max is not null) attributes["max"] = Max.Value
		if (Value is not null) attributes["value"] = Value.Value
	}
}
