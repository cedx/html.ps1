using module ../New-Element.psm1

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
		# The custom attributes to render.
		[Parameter(ValueFromPipelineByPropertyName)]
		[hashtable] $Attributes = @{},

		# The suggested filename when the browser treats the linked URL as a download.
		[Parameter(ValueFromPipelineByPropertyName)]
		[string] $Download,

		# The URL that the hyperlink points to.
		[Parameter(Mandatory, ValueFromPipelineByPropertyName)]
		[uri] $Href,

		# A list of URLs. When the link is followed, the browser will send `POST` requests with the body `PING` to the URLs.
		[Parameter(ValueFromPipelineByPropertyName)]
		[uri[]] $Ping = @(),

		# The relationship of the linked URL.
		[Parameter(ValueFromPipelineByPropertyName)]
		[string[]] $Rel = @(),

		# The browsing context to show the results of navigation.
		[Parameter(ValueFromPipelineByPropertyName)]
		[string] $Target
	)

	process {
		$attributesToRender = $Attributes.Clone()
		$attributesToRender.href = $Href
		if ($Download) { $attributesToRender.download = $Download }
		if ($Ping) { $attributesToRender.ping = ($Ping -join " ").Trim() }
		if ($Rel) { $attributesToRender.rel = ($Rel -join " ").Trim() }
		if ($Target) { $attributesToRender.target = $Target }

		$parameters = $PSBoundParameters.Clone()
		$MyInvocation.MyCommand.Parameters.Keys.ForEach{ $parameters.Remove($_) }
		New-Element -Attributes $attributesToRender @parameters
	}
}
