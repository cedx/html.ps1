using module ../New-Element.psm1

<#
.SYNOPSIS
	Creates a new `th` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlThElement"), Alias("th"), OutputType(typeof(string))]
function New-HtmlThElement: NewElementCommand("th", isVoid: false) {

	<#
	.SYNOPSIS
		A short, abbreviated description of the header cell's content provided as an alternative label to use for the header cell when referencing the cell in other contexts.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Abbr

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
	[string[]] $Headers = @(),

	<#
	.SYNOPSIS
		An integer indicating how many rows the header cell spans or extends.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	int RowSpan = -1;

	<#
	.SYNOPSIS
		Defines the cells that the header element relates to.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateSet("col", "colgroup", "row", "rowgroup")]
	[string] $Scope

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (-not [string]::IsNullOrWhiteSpace(Abbr)) attributes["abbr"] = Abbr;
		if (ColSpan >= 0) attributes["colspan"] = ColSpan
		if (Headers.Length > 0) attributes["headers"] = string.Join(' ', Headers).Trim();
		if (RowSpan >= 0) attributes["rowspan"] = RowSpan
		if (Scope is not null) attributes["scope"] = Scope;
	}
}
