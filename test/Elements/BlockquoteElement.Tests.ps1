<#
.SYNOPSIS
	Tests the features of the `New-BlockquoteElement` cmdlet.
#>
Describe "New-BlockquoteElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "cite" attribute' {
		blockquote "Lorem Ipsum" -cite "https://example.com/" | Should -BeExactly '<blockquote cite="https://example.com/">Lorem Ipsum</blockquote>'
	}
}
