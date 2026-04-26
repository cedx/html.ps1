<#
.SYNOPSIS
	Creates a new `a` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlAElement"), Alias("a"), OutputType(typeof(string))]
function New-HtmlAElementCommand(): NewElementCommand("a", isVoid: false) {

	<#
	.SYNOPSIS
		The suggested filename when the browser treats the linked URL as a download.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Download

	<#
	.SYNOPSIS
		The URL that the hyperlink points to.
	#>
	[Parameter(Mandatory = true, ValueFromPipelineByPropertyName)]
	[uri] $Href

	<#
	.SYNOPSIS
		A list of URLs. When the link is followed, the browser will send `POST` requests with the body `PING` to the URLs.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[uri[]] $Ping = [];

	<#
	.SYNOPSIS
		The relationship of the linked URL.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string[]] $Rel = [];

	<#
	.SYNOPSIS
		The browsing context to show the results of navigation.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Target

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		attributes["href"] = Href.ToString();
		if (!string.IsNullOrWhiteSpace(Download)) attributes["download"] = Download;
		if (Ping.Length > 0) attributes["ping"] = string.Join(' ', Ping.Select(url => url.ToString())).Trim();
		if (Rel.Length > 0) attributes["rel"] = string.Join(' ', Rel).Trim();
		if (!string.IsNullOrWhiteSpace(Target)) attributes["target"] = Target;
	}
}
