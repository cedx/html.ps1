<#
.SYNOPSIS
	Creates a new `slot` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlSlotElement"), Alias("slot"), OutputType(typeof(string))]
function New-HtmlSlotElementCommand(): NewElementCommand("slot", isVoid: false) {

	<#
	.SYNOPSIS
		The slot's name.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Name

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (!string.IsNullOrWhiteSpace(Name)) attributes["name"] = Name;
	}
}
