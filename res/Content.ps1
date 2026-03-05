param (
	# The page heading.
	[Parameter(Mandatory)]
	[string] $Heading
)

h1 $Heading
div -class alert, alert-success "Welcome to my website!"
