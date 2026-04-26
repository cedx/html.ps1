<#
.SYNOPSIS
	Tests the features of the `New-OptgroupElement` cmdlet.
#>
Describe "New-OptgroupElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "disabled" attribute' {
		optgroup -Disabled | Should -BeExactly "<optgroup disabled></optgroup>"
	}

	It 'should support the "label" attribute' {
		optgroup -Label MyOptiongroup | Should -BeExactly '<optgroup label="MyOptiongroup"></optgroup>'
	}
}
