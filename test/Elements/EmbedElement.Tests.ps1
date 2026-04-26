<#
.SYNOPSIS
	Tests the features of the `New-EmbedElement` cmdlet.
#>
Describe "New-EmbedElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "src" and "type" attributes' {
		embed -src Image.jpg -type image/jpeg | Should -BeIn '<embed src="Image.jpg" type="image/jpeg">', '<embed type="image/jpeg" src="Image.jpg">'
	}
}
