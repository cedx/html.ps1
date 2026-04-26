<#
.SYNOPSIS
	Tests the features of the `New-ObjectElement` cmdlet.
#>
Describe "New-ObjectElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "data" and "type" attributes' {
		object -Data Image.jpg -Type image/jpeg | Should -BeIn '<object data="Image.jpg" type="image/jpeg"></object>', '<object type="image/jpeg" data="Image.jpg"></object>'
	}
}
