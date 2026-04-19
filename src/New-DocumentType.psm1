<#
.SYNOPSIS
	Creates a new document type declaration.
.INPUTS
	The value of the document type.
.OUTPUTS
	The rendered document type declaration.
#>
function New-HtmlDocumentType {
	[Alias("doctype")]
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The value of the document type.
		[Parameter(Position = 0, ValueFromPipeline)]
		[string] $Value = "html"
	)

	process {
		"<!doctype $([string]::IsNullOrWhiteSpace($Value) ? "html" : $Value)>"
	}
}
