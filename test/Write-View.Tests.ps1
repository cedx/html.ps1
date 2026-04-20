<#
.SYNOPSIS
	Tests the features of the `Write-View` cmdlet.
#>
Describe "Write-View" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../Html.psd1"
	}

	It "should render the specified view file to an HTML string" {
		$html = Write-HtmlView "$PSScriptRoot/../res/Header.ps1" -Data @{ AppName = "My Application" }
		$html | Should -BeLikeExactly '<header>*<div class="ms-2">My Application</div>*</header>'

		$html = Write-HtmlView "$PSScriptRoot/../res/Content.WithoutLayout.ps1" -Data @{ Title = "The headline" }
		$html | Should -BeExactly '<h1>The headline</h1><div class="alert alert-success">Welcome to my website!</div>'

		$html = Write-HtmlView "$PSScriptRoot/../res/Footer.ps1" -Data @{ Year = 1974 }
		$html | Should -BeExactly '<footer class="text-center">Copyright &copy; 1974 - All rights reserved.</footer>'
	}
}
