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
		button -Command show-modal -CommandFor DialogBox | Should -BeIn $expected
	}

	It 'should support the "disabled" attribute' {
		button -Disabled | Should -BeExactly '<button disabled></button>'
	}

	It 'should support the "formnovalidate" attribute' {
		button -FormNoValidate | Should -BeExactly '<button formnovalidate></button>'
	}

	It 'should support the "type" attribute' -ForEach button, reset, submit {
		button -Type $_ | Should -BeExactly "<button type=""$_""></button>"
	}
}
