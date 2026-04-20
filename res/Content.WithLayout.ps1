param ([hashtable] $data)

layout "$PSScriptRoot/Layout.ps1" -Data @{ Title = $data.Heading } -Content {
	h1 $data.Heading
	div -class alert, alert-success "Welcome to my website!"
}
