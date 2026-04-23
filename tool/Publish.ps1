using module ./Cmdlets.psm1

if ($Release) { & "$PSScriptRoot/Default.ps1" }
else {
	"The ""-Release"" switch must be set!"
	exit 1
}

"Publishing the package..."
$module = Import-PowerShellDataFile Html.psd1
$version = $module.ModuleVersion
New-GitTag "v$version"

$output = "var/PSModule"
New-Item $output/bin, $output/src -ItemType Directory | Out-Null
Copy-Item Html.psd1 $output/Belin.Html.psd1
Copy-Item *.md $output
Copy-Item src/*.psm1 $output/src -Recurse
$module.RootModule | Copy-Item -Destination $output/bin

$output = "var/PSGallery"
New-Item $output -ItemType Directory | Out-Null
Compress-PSResource var/PSModule $output
Get-Item "$output/*.nupkg" | ForEach-Object { Publish-PSResource -ApiKey $Env:PSGALLERY_API_KEY -NupkgPath $_ -Repository PSGallery }
