<#
.SYNOPSIS
	Tests the features of the `New-FieldsetElement` cmdlet.
#>
Describe "New-FieldsetElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "disabled" attribute' {
		fieldset -disabled | Should -BeExactly "<fieldset disabled></fieldset>"
	}

	It 'should support the "form" attribute' {
		fieldset -form MyForm | Should -BeExactly '<fieldset form="MyForm"></fieldset>'
	}
}
