using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `a` element.
.INPUTS
	The inner HTML of the `a` element.
.OUTPUTS
	The newly created `a` element.
#>
function New-HtmlAElement {
	[Alias("a")]
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The inner HTML of the element.
		[Parameter(Position = 0, ValueFromPipeline)]
		[object] $Content,

		# The custom attributes to render.
		[hashtable] $Attributes = @{},

		# The suggested filename when the browser treats the linked URL as a download.
		[string] $Download,

		# The URL that the hyperlink points to.
		[Parameter(Mandatory)]
		[uri] $Href,

		# A list of URLs. When the link is followed, the browser will send `POST` requests with the body `PING` to the URLs.
		[uri[]] $Ping = @(),

		# The relationship of the linked URL.
		[string[]] $Rel = @(),

		# The browsing context to show the results of navigation.
		[string] $Target
	)

	process {
		$attributesToRender = $Attributes.Clone()
		$attributesToRender.href = $Href
		if ($Download) { $attributesToRender.download = $Download }
		if ($Ping) { $attributesToRender.ping = ($Ping -join " ").Trim() }
		if ($Rel) { $attributesToRender.rel = ($Rel -join " ").Trim() }
		if ($Target) { $attributesToRender.target = $Target }

		$MyInvocation.MyCommand.Parameters.Keys.ForEach{ $PSBoundParameters.Remove($_) | Out-Null }
		Write-HtmlElement -TagName a -Attributes $attributesToRender -Content $Content @PSBoundParameters
	}
}
