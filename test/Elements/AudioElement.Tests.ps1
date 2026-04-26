<#
.SYNOPSIS
	Tests the features of the `New-AudioElement` cmdlet.
#>
Describe "New-AudioElement" {
	BeforeAll {
		Import-Module "$PSScriptRoot/../../Html.psd1"
	}

	It 'should support the "autoplay", "controls", "loop" and "muted" attributes' {
		audio -AutoPlay | Should -BeExactly "<audio autoplay></audio>"
		audio -Controls | Should -BeExactly "<audio controls></audio>"
		audio -Loop | Should -BeExactly "<audio loop></audio>"
		audio -Muted | Should -BeExactly "<audio muted></audio>"
	}

	It 'should support the "preload" attribute' -ForEach auto, none, metadata {
		audio -Preload $_ | Should -BeExactly "<audio preload=""$_""></audio>"
	}
}
