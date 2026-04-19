param (
	# The view data.
	[Parameter(Mandatory, Position = 0)]
	[hashtable] $Data
)

footer -class text-center {
	"Copyright &copy; $($Data.Year) - All rights reserved."
}
