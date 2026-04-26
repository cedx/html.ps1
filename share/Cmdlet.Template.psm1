<#
.SYNOPSIS
	Creates a new `{Tag}` element.
.INPUTS
	The inner HTML of the `{Tag}` element.
.OUTPUTS
	The newly created `{Tag}` element.
#>
function New-Html{CapitalizedTag}Element {
	[Alias("{Alias}")]
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The inner HTML of the element.
		[Parameter(Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
		[object] $Content,

		# The custom attributes to render.
		[Parameter(ValueFromPipelineByPropertyName)]
		[hashtable] $Attributes = @{}
	)

	process {
		# TODO handle void elements !!! they don't have content !
		$attributesToRender = $Attributes.Clone()
		$MyInvocation.MyCommand.Parameters.Keys.ForEach{ $PSBoundParameters.Remove($_) | Out-Null }
		New-HtmlElement -TagName {Tag} -Attributes $attributesToRender -Content $Content -Void:{IsVoid} @PSBoundParameters
	}
}
