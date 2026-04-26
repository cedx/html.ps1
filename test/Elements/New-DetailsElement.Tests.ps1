<#
.SYNOPSIS
	Tests the features of the `New-DetailsElement` cmdlet.
#>
Describe "New-DetailsElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "name" attribute' {
		details -Name MyGroup | Should -BeExactly '<details name="MyGroup"></details>'
	}

	It 'should support the "open" attribute' {
		details -open | Should -BeExactly '<details open></details>'
	}
}
