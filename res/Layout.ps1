param (
	# The inner content.
	[Parameter(Mandatory, Position = 0)]
	[string] $Content,

	# The view data.
	[Parameter(Mandatory, Position = 1)]
	[hashtable] $Data
)

doctype
html -lang $PSCulture {
	head {
		meta -charset utf-8
		title $Data.Title

		meta -name color-scheme -content light
		meta -name viewport -content "initial-scale=1, width=device-width"

		link -rel icon -href Favicon.ico
		link -rel preload -href Assets/Font.woff2 -as font -crossorigin anonymous -type font/woff2

		link -rel stylesheet -href "https://cdn.jsdelivr.net/npm/bootstrap@5/dist/css/bootstrap.css" -integrity "sha256-2FMn2Zx6PuH5tdBQDRNwrOo60ts5wWPC9R8jK67b3t4"
		link -rel stylesheet -href Assets/Styles.css

		script -src "https://cdn.jsdelivr.net/npm/bootstrap@5/dist/js/bootstrap.js" -integrity "sha256-ew8UiV1pJH/YjpOEBInP1HxVvT/SfrCmwSoUzF9JIgc="
		script -src Assets/Scripts.js -type module
	}

	body {
		& "$PSScriptRoot/_Header.ps1"

		main {
			noscript { p "This application requires $(b JavaScript) to be enabled in your browser." }
			article -class container-xl { $Content }
		}

		& "$PSScriptRoot/_Footer.ps1" @{ Year = (Get-Date).Year }
	}
}
