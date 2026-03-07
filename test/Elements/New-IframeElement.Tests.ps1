<#
.SYNOPSIS
	Tests the features of the `New-IframeElement` cmdlet.
#>
Describe "New-IframeElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "height" and "width" attributes' {
		iframe -src Index.php -height 200 | Should -BeIn '<iframe height="200" src="Index.php"></iframe>', '<iframe src="Index.php" height="200"></iframe>'
		iframe -src Index.php -width 460 | Should -BeIn '<iframe width="460" src="Index.php"></iframe>', '<iframe src="Index.php" width="460"></iframe>'
	}

	It 'should support the "loading" attribute' -ForEach eager, lazy {
		iframe -src Index.php -loading $_ | Should -BeIn "<iframe loading=""$_"" src=""Index.php""></iframe>", "<iframe src=""Index.php"" loading=""$_""></iframe>"
	}

	It 'should support the "sandbox" attribute' {
		$expected = '<iframe sandbox="allow-downloads allow-popups" src="Index.php"></iframe>', '<iframe src="Index.php" sandbox="allow-downloads allow-popups"></iframe>'
		iframe -src Index.php -sandbox allow-downloads, allow-popups | Should -BeIn $expected
	}
}
