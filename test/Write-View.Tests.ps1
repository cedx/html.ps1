<#
.SYNOPSIS
	Tests the features of the `Write-View` cmdlet.
#>
Describe "Write-View" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../Html.psd1"
	}

	It "should render the specified view file to an HTML string" {
		$html = Write-HtmlView "$PSScriptRoot/../res/Content.ps1" @{ Heading = "My Application" }
		$html | Should -BeExactly '<h1>My Application</h1><div class="alert alert-success">Welcome to my website!</div>'
	}

	It "should support TODO" {
		$title = "My Application"
		$html = Write-HtmlView "$PSScriptRoot/../res/Content.ps1" -Data @{ Heading = $title; Title = $title } -LayoutPath ./Layout.ps1
		$html | Should -BeLikeExactly '<!doctype html><html lang="*"><head>*'
		$html | Should -BeLikeExactly '*<h1>My Application</h1><div class="alert alert-success">Welcome to my website!</div>*'
		$html | Should -BeLikeExactly '*</body></html>'
	}
}
