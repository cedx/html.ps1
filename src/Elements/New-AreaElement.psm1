using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `area` element.
.INPUTS
	The inner HTML of the `area` element.
.OUTPUTS
	The newly created `area` element.
#>
function New-HtmlAreaElement {
	[Alias("area")]
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The hyperlink target for the area.
		[Parameter(Mandatory)]
		[uri] $Href,

		# The inner HTML of the element.
		[Parameter(Position = 0, ValueFromPipeline)]
		[object] $Content,

		# The custom attributes to render.
		[hashtable] $Attributes = @{},

		# A text to display on browsers that do not display images.
		[string] $Alt,

		# The browsing context to show the results of navigation.
		[ValidateCount(3, [int]::MaxValue)]
		[double[]] $Coords,

		# The suggested filename when the browser treats the linked URL as a download.
		[string] $Download,

		# A list of URLs. When the link is followed, the browser will send `POST` requests with the body `PING` to the URLs.
		[uri[]] $Ping = @(),

		# The relationship of the linked URL.
		[string[]] $Rel = @(),

		# The browsing context to show the results of navigation.
		[ValidateSet("circle", "default", "poly", "rect")]
		[string] $Shape,

		# The browsing context to show the results of navigation.
		[string] $Target
	)

	process {
		$attributesToRender = $Attributes.Clone()
		$attributesToRender.href = $Href
		if ($Alt) { $attributesToRender.alt = $Alt }
		if ($Download) { $attributesToRender.download = $Download }
		if ($Ping) { $attributesToRender.ping = ($Ping -join " ").Trim() }
		if ($Rel) { $attributesToRender.rel = ($Rel -join " ").Trim() }
		if ($Target) { $attributesToRender.target = $Target }

		if ($Shape) {
			$attributesToRender.shape = $Shape
			if ($Coords -and ($Shape -ne "default")) { $attributesToRender.coords = $Coords.ForEach{ [string] $_ } -join "," }
		}

		$MyInvocation.MyCommand.Parameters.Keys.ForEach{ $PSBoundParameters.Remove($_) | Out-Null }
		Write-HtmlElement -TagName area -Attributes $attributesToRender -Content $Content -Void @PSBoundParameters
	}
}
