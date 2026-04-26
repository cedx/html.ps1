using module ../New-Element.psm1

<#
.SYNOPSIS
	Creates a new `li` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlLiElement"), Alias("li"), OutputType(typeof(string))]
function New-HtmlLiElement: NewElementCommand("li", isVoid: false) {

	<#
	.SYNOPSIS
		The ordinal value of the list item as defined by the `ol` element.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[int] $Value

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (Value is not null) attributes["value"] = Value.Value
	}
}
