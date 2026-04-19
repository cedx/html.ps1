param (
	# The view data.
	[Parameter(Mandatory, Position = 0)]
	[hashtable] $Data
)

h1 $Data.Heading
div -class alert, alert-success "Welcome to my website!"
