using module ../New-Element.psm1

<#
.SYNOPSIS
	Creates a new `link` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlLinkElement"), Alias("link"), OutputType(typeof(string))]
function New-HtmlLinkElement: NewElementCommand("link", isVoid: true) {

	<#
	.SYNOPSIS
		Specifies the type of content being loaded by the `link`.
	#>
	[string] $As

	<#
	.SYNOPSIS
		Value indicating whether CORS must be used when fetching the resource.
	#>
		[ValidateSet("anonymous", "use-credentials")]
	[string] $CrossOrigin

	<#
	.SYNOPSIS
		The URL of the linked resource.
	#>
	[Parameter(Mandatory)]
	[uri] $Href

	<#
	.SYNOPSIS
		A base64-encoded cryptographic hash of the resource (file) to fetch.
	#>
	[string] $Integrity

	<#
	.SYNOPSIS
		The media that the linked resource applies to.
	#>
	[string] $Media

	<#
	.SYNOPSIS
		The relationship of the linked resource to the current document.
	#>
	[Parameter(Mandatory)]
	required [string[]] $Rel

	<#
	.SYNOPSIS
		The sizes of the icons for visual media contained in the resource.
	#>
	[string[]] $Sizes = @(),

	<#
	.SYNOPSIS
		The media type of the content linked to.
	#>
	[string] $Type

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		attributes["rel"] = string.Join(' ', Rel).Trim();
		attributes["href"] = Href.ToString();
		if (-not [string]::IsNullOrWhiteSpace(As)) attributes["as"] = As;
		if (CrossOrigin is not null) attributes["crossorigin"] = CrossOrigin;
		if (-not [string]::IsNullOrWhiteSpace(Integrity)) attributes["integrity"] = Integrity;
		if (-not [string]::IsNullOrWhiteSpace(Media)) attributes["media"] = Media;
		if (Sizes.Length > 0) attributes["sizes"] = string.Join(' ', Sizes).Trim();
		if (-not [string]::IsNullOrWhiteSpace(Type)) attributes["type"] = Type;
	}
}
