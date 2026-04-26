using module ../New-Element.psm1

<#
.SYNOPSIS
	Creates a new `th` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlTdElement"), Alias("td"), OutputType(typeof(string))]
function New-HtmlTdElement: NewElementCommand("td", isVoid: false) {

	<#
	.SYNOPSIS
		An integer indicating how many columns the header cell spans or extends.
	#>
	[ValidateRange(ValidateRangeKind.NonNegative)]
	int ColSpan = -1;

	<#
	.SYNOPSIS
		A list of strings corresponding to the `id` attributes of the `th` elements that provide the headers for this header cell.
	#>
	[string[]] $Headers = @(),

	<#
	.SYNOPSIS
		An integer indicating how many rows the header cell spans or extends.
	#>
	[ValidateRange(ValidateRangeKind.NonNegative)]
	int RowSpan = -1;

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (ColSpan >= 0) attributes["colspan"] = ColSpan
		if (Headers.Length > 0) attributes["headers"] = string.Join(' ', Headers).Trim();
		if (RowSpan >= 0) attributes["rowspan"] = RowSpan
	}
}
