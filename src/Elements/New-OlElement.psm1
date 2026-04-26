using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `ol` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlOlElement"), Alias("ol"), OutputType(typeof(string))]
function New-HtmlOlElement: NewElementCommand("ol", isVoid: false) {

	<#
	.SYNOPSIS
		Value indicating whether the list's items are in reverse order.
	#>
	[switch] $Reversed

	<#
	.SYNOPSIS
		An integer to start counting from for the list items.
	#>
	[int] $Start

	<#
	.SYNOPSIS
		Value indicating the current ordinal value of the list item as defined by the `ol` element.
	#>
		[ValidateSet("1", "A", "a", "I", "i")]
	[string] $Type

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (Reversed) $attributesToRender.reversed"] = true;
		if (Start is not null) $attributesToRender.start"] = Start.Value
		if (Type is not null) $attributesToRender.type"] = Type;
	}
}
