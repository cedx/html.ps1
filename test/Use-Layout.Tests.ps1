<#
.SYNOPSIS
	Tests the features of the `Use-Layout` cmdlet.
#>
Describe "Use-Layout" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../Html.psd1"
	}

	It "should render the specified content inside the given HTML layout" {
		$html = Write-HtmlView "$PSScriptRoot/../res/Content.WithLayout.ps1" -Data @{ Heading = "My Application" }
		$html | Should -BeLikeExactly '<!doctype html><html lang="*"><head>*<title>My Application</title>*'
		$html | Should -BeLikeExactly '*<h1>My Application</h1><div class="alert alert-success">Welcome to my website!</div>*'
		$html | Should -BeLikeExactly "*<footer class=""text-center"">Copyright &copy; $((Get-Date).Year) - All rights reserved.</footer></body></html>"
	}
}
