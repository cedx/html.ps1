using namespace System.Collections.Generic

"Deploying the assets..."
$cmdlets = [pscustomobject]@{
	Aliases = [List[string]]::new([string[]] @(
		"doctype" # New-HtmlDocumentType
		# "layout" # Use-HtmlLayout
		# "tag" # New-HtmlCustomElement
	))
	Functions = [List[string]]::new([string[]] @(
		# "New-HtmlCustomElement"
		"New-HtmlDocumentType"
		# "Use-HtmlLayout"
		# "Write-HtmlView"
	))
	Modules = [List[string]]::new([string[]] @(
		# "src/New-CustomElement.psm1"
		"src/New-DocumentType.psm1"
		# "src/Use-Layout.psm1"
		# "src/Write-View.psm1"
	))
}

# Generate the cmdlets.
New-Item src/Generated -Force -ItemType Directory | Out-Null
$cmdletTemplate = Get-Content share/Cmdlet.Template.psm1 -Raw

foreach ($element in (Import-PowerShellDataFile share/HtmlElements.psd1).Elements) {
	$parameters = @{
		Alias = (Get-Alias $element.Tag -ErrorAction Ignore) ? "$($element.Tag)Tag" : $element.Tag
		CapitalizedTag = [char]::ToUpperInvariant($element.Tag[0]) + $element.Tag.Substring(1)
		IsVoid = $element.IsVoid.ToString().ToLowerInvariant()
		Tag = $element.Tag
	}

	$cmdlets.Aliases.Add($parameters.Alias)
	$cmdlets.Functions.Add("New-Html$($parameters.CapitalizedTag)Element")

	$fileName = "New-$($parameters.CapitalizedTag)Element"
	$existingCmdlet = "src/Elements/$fileName.psm1"
	if (Test-Path $existingCmdlet) { $cmdlets.Modules.Add($existingCmdlet) }
	else {
		$generatedCmdlet = "src/Generated/$fileName.g.psm1"
		$cmdlets.Modules.Add($generatedCmdlet)

		$content = $cmdletTemplate
		foreach ($key in $parameters.Keys) { $content = $content -replace "{$key}", $parameters.$key }
		Set-Content $generatedCmdlet $content -NoNewline
	}
}

# Update the module manifest.
$cmdlets.Aliases.Sort()
$aliases = $cmdlets.Aliases.PSForEach{ "`t`t""$_""" } -join [Environment]::NewLine

$cmdlets.Functions.Sort()
$functions = $cmdlets.Functions.PSForEach{ "`t`t""$_""" } -join [Environment]::NewLine

$cmdlets.Modules.Sort()
$modules = $cmdlets.Modules.PSForEach{ "`t`t""$_""" } -join [Environment]::NewLine

$content = (Get-Content Html.psd1 -Raw) `
	-replace "AliasesToExport = @\([^)]+\)", "AliasesToExport = @(`n$aliases`n`t)" `
	-replace "FunctionsToExport = @\([^)]+\)", "FunctionsToExport = @(`n$functions`n`t)" `
	-replace "NestedModules = @\([^)]+\)", "NestedModules = @(`n$modules`n`t)"

Set-Content Html.psd1 $content -NoNewline
