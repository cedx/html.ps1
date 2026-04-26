using namespace System.Text.Json

<#
.SYNOPSIS
	Converts the specified name according to lowercase kebab-casing.
.INPUTS
	The name to convert.
.OUTPUTS
	The converted name.
#>
function Format-KebabCase {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The name to convert.
		[Parameter(Mandatory, Position = 0)]
		[AllowEmptyString()]
		[string] $InputObject
	)

	process {
		[JsonNamingPolicy]::KebabCaseLower.ConvertName($InputObject)
	}
}
