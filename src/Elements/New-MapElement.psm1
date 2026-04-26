using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `map` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlMapElement"), Alias("map"), OutputType(typeof(string))]
function New-HtmlMapElement: NewElementCommand("map", isVoid: false) {

	<#
	.SYNOPSIS
		The map name so that it can be referenced.
	#>
	[string] $Name

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (-not [string]::IsNullOrWhiteSpace(Name)) attributes["name"] = Name;
	}
}
