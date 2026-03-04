<#
.SYNOPSIS
	Renders an HTML document from the given PowerShell script using the call operator.
#>
Import-Module Html

$context = @{ Title = "My Application"; Year = [datetime]::Now.Year }
& "$PSScriptRoot/../res/CallOperator/Document.ps1" @context | Out-String
