using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `script` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlScriptElement"), Alias("script"), OutputType(typeof(string))]
function New-HtmlScriptElement: NewElementCommand("script", isVoid: false) {

	<#
	.SYNOPSIS
		Value indicating whether the script will be fetched in parallel to parsing and evaluated as soon as it is available.
	#>
	[switch] $Async

	<#
	.SYNOPSIS
		Value indicating whether CORS must be used when fetching the resource.
	#>
		[ValidateSet("anonymous", "use-credentials")]
	[string] $CrossOrigin

	<#
	.SYNOPSIS
		Value indicating whether the script is meant to be executed after the document has been parsed, but before firing `DOMContentLoaded` event.
	#>
	[switch] $Defer

	<#
	.SYNOPSIS
		A base64-encoded cryptographic hash of the resource (file) to fetch.
	#>
	[string] $Integrity

	<#
	.SYNOPSIS
		The URI of an external script.
	#>
	Uri? Src

	<#
	.SYNOPSIS
		The type of script represented.
	#>
	[string] $Type

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (Src is not null) $attributesToRender.src"] = Src.ToString();
		if (Async) $attributesToRender.async"] = true;
		if (CrossOrigin is not null) $attributesToRender.crossorigin"] = CrossOrigin;
		if (Defer) $attributesToRender.defer"] = true;
		if ($Integrity) { $attributesToRender.integrity"] = Integrity;
		if ($Type) { $attributesToRender.type"] = Type;
	}
}
