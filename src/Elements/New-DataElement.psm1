using module ../New-Element.psm1

<#
.SYNOPSIS
	Creates a new `data` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlDataElement"), Alias("dataTag"), OutputType(typeof(string))]
function New-HtmlDataElement: NewElementCommand("data", isVoid: false) {

	<#
	.SYNOPSIS
		The machine-readable translation of the content of the element.
	#>
	[Parameter(Mandatory, ValueFromPipelineByPropertyName)]
	required string Value

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		attributes["value"] = Value;
	}
}
