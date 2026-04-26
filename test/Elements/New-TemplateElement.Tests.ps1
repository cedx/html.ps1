<#
.SYNOPSIS
	Tests the features of the `New-TemplateElement` cmdlet.
#>
Describe "New-TemplateElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "shadowrootclonable" attribute' {
		template -shadowrootclonable | Should -BeExactly '<template shadowrootclonable></template>'
	}

	It 'should support the "shadowrootdelegatesfocus" attribute' {
		template -shadowrootdelegatesfocus | Should -BeExactly '<template shadowrootdelegatesfocus></template>'
	}

	It 'should support the "shadowrootmode" attribute' -ForEach closed, open {
		template -shadowrootmode $_ | Should -BeExactly "<template shadowrootmode=""$_""></template>"
	}

	It 'should support the "shadowrootserializable" attribute' {
		template -shadowrootserializable | Should -BeExactly '<template shadowrootserializable></template>'
	}

	It "should allow inner content" {
		template (b "Hello World!") | Should -BeExactly "<template><b>Hello World!</b></template>"
		template (button OK -Type submit) | Should -BeExactly '<template><button type="submit">OK</button></template>'
	}
}
