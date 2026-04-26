using module ./Write-Element.psm1

<#
.SYNOPSIS
	Creates a new custom element.
.INPUTS
	The inner HTML of the custom element.
.OUTPUTS
	The newly created custom element.
#>
function New-HtmlCustomElement {
	[Alias("tag")]
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The tag name of the custom element to create.
		[Parameter(Mandatory, Position = 0)]
		[ValidateScript({
			$index = $_.IndexOf("-")
			($index -gt 0) -and ($index -lt $_.Length) -and ($_.Length -ge 3)
		}, ErrorMessage = "The specified tag name is not a valid custom element name.")]
		[string] $TagName,

		# The inner HTML of the element.
		[Parameter(Position = 1, ValueFromPipeline)]
		[object] $Content,

		# The custom attributes to render.
		[hashtable] $Attributes = @{}
	)

	process {
		$MyInvocation.MyCommand.Parameters.Keys.ForEach{ $PSBoundParameters.Remove($_) | Out-Null }
		Write-HtmlElement -TagName $TagName.ToLowerInvariant() -Attributes $Attributes.Clone() -Content $Content @PSBoundParameters
	}
}
