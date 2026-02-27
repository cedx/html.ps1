<#
.SYNOPSIS
	Tests the features of the `New-Element` cmdlets.
#>
Describe "New-Element" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../Html.psd1"
	}

	It "should create an HTML element from the specified tag name" -ForEach @(
		@{ Tag = "a"; Expected = "<a></a>" }
		@{ Tag = "html"; Expected = "<html></html>" }
		@{ Tag = "strong"; Expected = "<strong></strong>" }
	) {
		& $tag | Should -BeExactly $expected
	}

	It "should handle void elements" -ForEach @(
		@{ Tag = "br"; Expected = "<br />" }
		@{ Tag = "embed"; Expected = "<embed />" }
		@{ Tag = "input"; Expected = "<input />" }
	) {
		& $tag | Should -BeExactly $expected
	}

	It 'should handle the "id" attribute' {
		article -Id "my-id" | Should -BeExactly '<article id="my-id"></article>'
	}

	It 'should handle the "class" attribute' {
		body -Class "btn", "btn-danger" | Should -BeExactly '<body class="btn btn-danger"></body>'
	}

	It 'should handle the "style" attribute' {
		$expected = '<code style="font-family: &quot;Segoe UI&quot;; font-size: 1rem"></code>', '<code style="font-size: 1rem; font-family: &quot;Segoe UI&quot;"></code>'
		code -Style @{ "font-family" = '"Segoe UI"'; "font-size" = "1rem" } | Should -BeIn $expected
	}

	It "should handle custom attributes" {
		$expected = '<input data-foo="&quot;bar&quot;" required />', '<input required data-foo="&quot;bar&quot;" />'
		input -Attributes @{ "data-foo" = '"bar"'; disabled = $false; required = $true } | Should -BeIn $expected
	}

	It "should handle the inner content" {
		$expected = "<main><div>Foo &gt; Bar <span>Baz &lt; Qux</span></div></main>"
		main { div { "Foo &gt; Bar"; " "; span "Baz &lt; Qux" } } | Should -BeExactly $expected
	}
}
