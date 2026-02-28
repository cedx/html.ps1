<#
.SYNOPSIS
	Tests the features of the `New-LinkElement` cmdlet.
#>
Describe "New-LinkElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "href" and "rel" attributes' {
		link -rel icon -href /Favicon.ico | Should -BeExactly '<link rel="icon" href="/Favicon.ico" />'
		link -rel stylesheet -href /Assets/Styles.css | Should -BeExactly '<link rel="stylesheet" href="/Assets/Styles.css" />'
	}

	It 'should support the "media" attribute' {
		link -rel alternate, stylesheet -href Styles.css -media print | Should -BeExactly '<link rel="alternate stylesheet" href="Styles.css" media="print" />'
		link -rel stylesheet -href Styles.css -media "screen and (width >= 600px)" | Should -BeExactly '<link rel="stylesheet" href="Styles.css" media="screen and (width >= 600px)" />'
	}

	It 'should support the "sizes" attribute' {
		link -rel icon -href Favicon.ico -sizes any | Should -BeExactly '<link rel="icon" href="Favicon.ico" sizes="any" />'
		link -rel icon -href Favicon.ico -sizes 320x200, 160x100 | Should -BeExactly '<link rel="icon" href="Favicon.ico" sizes="320x200 160x100" />'
	}
}
