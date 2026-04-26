<#
.SYNOPSIS
	Tests the features of the `New-BaseElement` cmdlet.
#>
Describe "New-BaseElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "href" attribute' -ForEach "/base/", "https://localhost/base/" {
		base -Href $_ | Should -BeExactly "<base href=""$_"">"
	}

	It 'should support the "target" attribute' -ForEach "_blank", "my-iframe" {
		base -Href /base/ -Target $_ | Should -BeExactly "<base href=""/base/"" target=""$_"">"
	}
}
