<#
.SYNOPSIS
	Tests the features of the `Out-File` cmdlet.
#>
Describe "Out-File" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../Html.psd1"
	}

	It "should render an HTML string from the input objects" {
		$outFile = "$PSScriptRoot/../var/Out-File.Tests.html"

		"Hello ", "World!" | Out-HtmlFile $outFile
		$outFile | Should -FileContentMatchMultilineExactly "^Hello World!\r?\n$"

		a -href "https://cedric-belin.fr" { i -class icon "web" } | Out-HtmlFile $outFile -NoNewLine
		$outFile | Should -FileContentMatchMultilineExactly '^<a href="https://cedric-belin.fr/"><i class="icon">web</i></a>$'
	}
}
