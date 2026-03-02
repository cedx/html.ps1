doctype
html -dir ltr -lang $PSCulture {
	& "$PSScriptRoot/Head.ps1"

	body {
		& "$PSScriptRoot/BodyHeader.ps1"

		main {
			noscript {
				"This application requires "; b JavaScript; " to be enabled in your browser."
			}

			article -class container-xl {
				h1 "My Title"
				div -class alert, alert-success "Welcome to my website!"
			}
		}

		& "$PSScriptRoot/BodyFooter.ps1"
	}
}
