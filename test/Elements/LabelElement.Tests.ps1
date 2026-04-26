<#
.SYNOPSIS
	Tests the features of the `New-LabelElement` cmdlet.
#>
Describe "New-LabelElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "for" attribute' {
		label -For MyID | Should -BeExactly '<label for="MyID"></label>'
	}
}
