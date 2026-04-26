<#
.SYNOPSIS
	Creates a new `script` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlScriptElement"), Alias("script"), OutputType(typeof(string))]
function New-HtmlScriptElementCommand(): NewElementCommand("script", isVoid: false) {

	<#
	.SYNOPSIS
		Value indicating whether the script will be fetched in parallel to parsing and evaluated as soon as it is available.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $Async

	<#
	.SYNOPSIS
		Value indicating whether CORS must be used when fetching the resource.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateSet("anonymous", "use-credentials")]
	[string] $CrossOrigin

	<#
	.SYNOPSIS
		Value indicating whether the script is meant to be executed after the document has been parsed, but before firing `DOMContentLoaded` event.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $Defer

	<#
	.SYNOPSIS
		A base64-encoded cryptographic hash of the resource (file) to fetch.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Integrity

	<#
	.SYNOPSIS
		The URI of an external script.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	Uri? Src

	<#
	.SYNOPSIS
		The type of script represented.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Type

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (Src is not null) attributes["src"] = Src.ToString();
		if (Async) attributes["async"] = true;
		if (CrossOrigin is not null) attributes["crossorigin"] = CrossOrigin;
		if (Defer) attributes["defer"] = true;
		if (!string.IsNullOrWhiteSpace(Integrity)) attributes["integrity"] = Integrity;
		if (!string.IsNullOrWhiteSpace(Type)) attributes["type"] = Type;
	}
}
