"Deleting all generated files..."
Remove-Item src/Generated -ErrorAction Ignore -Force -Recurse
Remove-Item var/* -Exclude .gitkeep -Force -Recurse
