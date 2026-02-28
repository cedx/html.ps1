<#
.SYNOPSIS
	Tests the features of the `New-HtmlElement` cmdlet.
#>
Describe "New-HtmlElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "dir" attribute' -ForEach "auto", "ltr", "rtl" {
		html -dir $_ | Should -BeExactly "<html dir=`"$_`"></html>"
	}

	It 'should support the "lang" attribute' -ForEach "fr-FR", "en-US" {
		html -lang $_ | Should -BeExactly "<html lang=`"$_`"></html>"
	}
}
