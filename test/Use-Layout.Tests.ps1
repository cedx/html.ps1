<#
.SYNOPSIS
	Tests the features of the `Use-Layout` cmdlet.
#>
Describe "Use-Layout" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../Html.psd1"
	}

	It "should render the specified content inside the given HTML layout" {
		$title = "My Application"
		$html = Write-HtmlView "$PSScriptRoot/../res/Content.WithLayout.ps1" @{ Heading = $title }
		$html | Should -BeLikeExactly '<!doctype html><html lang="*"><head>*'
		$html | Should -BeLikeExactly '*<h1>My Application</h1><div class="alert alert-success">Welcome to my website!</div>*'
		$html | Should -BeLikeExactly '*</body></html>'
	}
}
