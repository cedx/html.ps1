<#
.SYNOPSIS
	Tests the features of the `New-ButtonElement` cmdlet.
#>
Describe "New-ButtonElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "command" and "commandfor" attributes' {
		$expected = '<button command="show-modal" commandfor="DialogBox"></button>', '<button commandfor="DialogBox" command="show-modal"></button>'
		button -command show-modal -commandfor DialogBox | Should -BeIn $expected
	}

	It 'should support the "disabled" attribute' {
		button -disabled | Should -BeExactly '<button disabled></button>'
	}

	It 'should support the "disabled" attribute' -ForEach button, reset, submit {
		button -type $_ | Should -BeExactly "<button type=""$_""></button>"
	}
}
