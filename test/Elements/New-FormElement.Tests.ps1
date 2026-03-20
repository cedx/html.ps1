<#
.SYNOPSIS
	Tests the features of the `New-FormElement` cmdlet.
#>
Describe "New-FormElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "action" attribute' {
		form -action "/Process.php" | Should -BeExactly '<form action="/Process.php"></form>'
	}

	It 'should support the "enctype" attribute' -ForEach "application/x-www-form-urlencoded", "multipart/form-data", "text/plain" {
		form -enctype $_ | Should -BeExactly "<form enctype=""$_""></form>"
	}

	It 'should support the "method" attribute' -ForEach dialog, get, post {
		form -method $_ | Should -BeExactly "<form method=""$_""></form>"
	}

	It 'should support the "novalidate" attribute' {
		form -novalidate | Should -BeExactly '<form novalidate></form>'
	}

	It "should allow inner content" {
		form (button OK -type submit) | Should -BeExactly '<form><button type="submit">OK</button></form>'
		form (input -name UserName) | Should -BeExactly '<form><input name="UserName"></form>'
	}
}
