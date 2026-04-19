<#
.SYNOPSIS
	Tests the features of the `Out-String` cmdlet.
#>
Describe "Out-String" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../Html.psd1"
	}

	It "should render an HTML string from the input objects" {
		$newLine = [Environment]::NewLine
		"Hello ", "World!" | Out-HtmlString | Should -BeExactly "Hello World!$newLine"

		$anchor = a -href "https://cedric-belin.fr" { i -class icon "web" }
		$anchor | Out-HtmlString -NoNewLine | Should -BeExactly '<a href="https://cedric-belin.fr/"><i class="icon">web</i></a>'
	}
}
