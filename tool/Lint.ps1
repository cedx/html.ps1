using module PSScriptAnalyzer

"Performing the static analysis of source code..."
Invoke-ScriptAnalyzer $PSScriptRoot, "test" -Recurse
Test-ModuleManifest Html.psd1 | Out-Null
