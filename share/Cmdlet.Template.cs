<#
.SYNOPSIS
	Creates a new `{Tag}` element.
#>
[Cmdlet(VerbsCommon.New, "Html{CapitalizedTag}Element"), Alias("{Alias}"), OutputType(typeof(string))]
function New-Html{CapitalizedTag}Element: NewElementCommand("{Tag}", isVoid: {IsVoid}) {}
