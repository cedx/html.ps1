<#
.SYNOPSIS
	Tests the features of the `New-AreaElement` cmdlet.
#>
Describe "New-AreaElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "shape" and "coords" attributes' {
		$area = area -Href Index.html -shape circle -coords 100, 200, 64.7
		$area | Should -BeLikeExactly "<area *"
		$area | Should -BeLikeExactly '* href="Index.html"*'
		$area | Should -BeLikeExactly '* shape="circle"*'
		$area | Should -BeLikeExactly '* coords="100,200,64.7"*'
		$area | Should -BeLikeExactly "*>"
	}
}
