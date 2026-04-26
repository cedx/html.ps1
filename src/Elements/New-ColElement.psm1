using System.Globalization;

<#
.SYNOPSIS
	Creates a new `col` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlColElement"), Alias("col"), OutputType(typeof(string))]
function New-HtmlColElementCommand(): NewElementCommand("col", isVoid: true) {

	<#
	.SYNOPSIS
		The number of consecutive columns the element spans.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.Positive)]
	int Span

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (Span > 0) attributes["span"] = Span.ToString(CultureInfo.InvariantCulture);
	}
}
