<#
.SYNOPSIS
	Tests the features of the `New-ColElement` cmdlet.
#>
Describe "New-ColElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "span" attribute' -ForEach 1, 25 {
		col -Span $_ | Should -BeExactly "<col span=""$_"">"
	}
}
