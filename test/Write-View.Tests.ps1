<#
.SYNOPSIS
	Tests the features of the `Write-View` cmdlet.
#>
Describe "Write-View" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../Html.psd1"
	}

	It "should render the specified view file to an HTML string" {
		$html = Write-HtmlView "$PSScriptRoot/../res/Content.WithoutLayout.ps1" -Data @{ Heading = "My Application" }
		$html | Should -BeExactly '<h1>My Application</h1><div class="alert alert-success">Welcome to my website!</div>'
	}
}
