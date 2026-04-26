@{
	# DefaultCommandPrefix = "Html"
	ModuleVersion = "2.0.0"
	PowerShellVersion = "7.6"

	Author = "Cédric Belin <cedx@outlook.com>"
	CompanyName = "Cedric-Belin.fr"
	Copyright = "© Cédric Belin"
	Description = "PowerShell cmdlets for rendering HTML documents."
	GUID = "3c16800c-921e-4c31-9fc3-00052d2f30ba"

	CmdletsToExport = @()
	VariablesToExport = @()

	AliasesToExport = @(
		"doctype"
		"a"
		"tag"
	)

	FunctionsToExport = @(
		"New-HtmlAElement"
		"New-HtmlDocumentType"
		"New-HtmlCustomElement"
	)

	NestedModules = @(
		"src/Elements/New-AElement.psm1"
		"src/New-DocumentType.psm1"
		"src/New-CustomElement.psm1"
	)

	PrivateData = @{
		PSData = @{
			LicenseUri = "https://github.com/cedx/html.ps1/blob/main/License.md"
			ProjectUri = "https://github.com/cedx/html.ps1"
			ReleaseNotes = "https://github.com/cedx/html.ps1/releases"
			Tags = "html", "renderer", "template", "templating", "web"
		}
	}
}
