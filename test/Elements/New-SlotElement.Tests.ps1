<#
.SYNOPSIS
	Tests the features of the `New-SlotElement` cmdlet.
#>
Describe "New-SlotElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "name" attribute' {
		slot -Name MyMap | Should -BeExactly '<slot name="MyMap"></slot>'
	}
}
