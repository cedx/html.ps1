using namespace System.IO

<#
.SYNOPSIS
	Renders the specified view file as an HTML string.
.INPUTS
	The path to the view file.
.OUTPUTS
	The rendered HTML view.
#>
function Write-HtmlView {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The path to the view file.
		[Parameter(Mandatory, Position = 0, ValueFromPipeline)]
		[ValidateScript({ Test-Path $_ -PathType Leaf }, ErrorMessage = "The specified view path does not exist.")]
		[string] $Path,

		# The view data.
		[Parameter(Position = 1)]
		[hashtable] $Data,

		# The path to the layout file to apply to the view.
		# If the layout path is relative, it will be resolved with respect to the view path.
		[ValidateScript({ Test-Path $_ -IsValid }, ErrorMessage = "The specified layout path is invalid.")]
		[string] $LayoutPath
	)

	process {
		$content = $Data ? (& $Path $Data) : (& $Path) | Out-String -NoNewline
		if (-not $LayoutPath) { return $content }
		if (-not [Path]::IsPathFullyQualified($LayoutPath)) { $LayoutPath = Join-Path (Split-Path $Path -Resolve) $LayoutPath }
		$Data ? (& $LayoutPath $content $Data) : (& $LayoutPath $content) | Out-String -NoNewline
	}
}
