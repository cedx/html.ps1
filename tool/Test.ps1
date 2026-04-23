using module ./Cmdlets.psm1
& "$PSScriptRoot/Build.ps1"

"Running the test suite..."
Invoke-PowerShellTest test -EnableExit
