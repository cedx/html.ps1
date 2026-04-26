using System.Globalization;

<#
.SYNOPSIS
	Creates a new `th` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlTdElement"), Alias("td"), OutputType(typeof(string))]
function New-HtmlTdElementCommand(): NewElementCommand("td", isVoid: false) {

	<#
	.SYNOPSIS
		An integer indicating how many columns the header cell spans or extends.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	int ColSpan = -1;

	<#
	.SYNOPSIS
		A list of strings corresponding to the `id` attributes of the `th` elements that provide the headers for this header cell.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string[]] $Headers = [];

	<#
	.SYNOPSIS
		An integer indicating how many rows the header cell spans or extends.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	int RowSpan = -1;

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (ColSpan >= 0) attributes["colspan"] = ColSpan.ToString(CultureInfo.InvariantCulture);
		if (Headers.Length > 0) attributes["headers"] = string.Join(' ', Headers).Trim();
		if (RowSpan >= 0) attributes["rowspan"] = RowSpan.ToString(CultureInfo.InvariantCulture);
	}
}
