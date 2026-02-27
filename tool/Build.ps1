using namespace System.Collections.Generic

"Building the solution..."
$cmdletTemplate = Get-Content res/CmdletTemplate.cs -Raw
$aliasesToExport = [List[string]]::new()
$cmdletsToExport = [List[string]]::new()

(Import-PowerShellDataFile res/HtmlElements.psd1).HtmlElements | ForEach-Object {
	$replacements = @{
		CapitalizedTag = [char]::ToUpperInvariant($_.Tag[0]) + $_.Tag.Substring(1)
		IsVoid = $_.IsVoid.ToString().ToLowerInvariant()
		Tag = $_.Tag
	}

	$cmdlet = "New-$($replacements.CapitalizedTag)Element"
	$aliasesToExport.Add($_.Tag)
	$cmdletsToExport.Add($cmdlet)

	$content = $cmdletTemplate
	$replacements.Keys | ForEach-Object { $content = $content -replace "{$_}", $replacements.$_ }
	Set-Content "src/Elements/$cmdlet.g.cs" $content -NoNewline
}

$aliasesToExport.Add("doctype")
$aliases = ($aliasesToExport | ForEach-Object { "`t`t`"$_`"" }) -join [Environment]::NewLine
$cmdletsToExport.Add("New-Doctype")
$cmdlets = ($cmdletsToExport | ForEach-Object { "`t`t`"$_`"" }) -join [Environment]::NewLine

$content = Get-Content Html.psd1 -Raw
$content = $content -replace "AliasesToExport = @\([^)]+\)", "AliasesToExport = @(`n$aliases`n`t)"
$content = $content -replace "CmdletsToExport = @\([^)]+\)", "CmdletsToExport = @(`n$cmdlets`n`t)"
Set-Content Html.psd1 $content -NoNewline

dotnet build --configuration ($Release ? "Release" : "Debug")
