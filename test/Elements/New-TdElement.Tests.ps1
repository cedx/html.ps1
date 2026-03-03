<#
.SYNOPSIS
	Tests the features of the `New-TdElement` cmdlet.
#>
Describe "New-TdElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "colspan" and "rowspan" attributes' {
		td -colspan 1 -rowspan 3 | Should -BeIn '<td colspan="1" rowspan="3"></td>', '<td rowspan="3" colspan="1"></td>'
	}

	It 'should support the "headers" attribute' {
		td -headers tid1, tid2 | Should -BeExactly '<td headers="tid1 tid2"></td>'
	}
}
