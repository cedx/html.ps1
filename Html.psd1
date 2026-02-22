@{
	DefaultCommandPrefix = "Html"
	ModuleVersion = "0.1.0"
	PowerShellVersion = "7.5"
	RootModule = "bin/Belin.Html.Cmdlets.dll"

	Author = "Cédric Belin <cedx@outlook.com>"
	CompanyName = "Cedric-Belin.fr"
	Copyright = "© Cédric Belin"
	Description = "TODO"
	GUID = "386e8ff7-f166-407e-8b42-9a5e2bac406d"

	AliasesToExport = @()
	FunctionsToExport = @()
	VariablesToExport = @()

	CmdletsToExport = @(
		"New-AElement"
		"New-BrElement"
		"Write-HtmlElement"
	)

	PrivateData = @{
		PSData = @{
			LicenseUri = "https://github.com/cedx/html.net/blob/main/License.md"
			ProjectUri = "https://github.com/cedx/html.net"
			ReleaseNotes = "https://github.com/cedx/html.net/releases"
			Tags = "TODO"
		}
	}
}
