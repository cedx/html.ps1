using System.Globalization;

<#
.SYNOPSIS
	Creates a new `area` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlAreaElement"), Alias("area"), OutputType(typeof(string))]
function New-HtmlAreaElementCommand(): NewElementCommand("area", isVoid: true) {

	<#
	.SYNOPSIS
		A text to display on browsers that do not display images.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Alt

	<#
	.SYNOPSIS
		The browsing context to show the results of navigation.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateCount(3, int.MaxValue)]
	double[]? Coords

	<#
	.SYNOPSIS
		The suggested filename when the browser treats the linked URL as a download.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Download

	<#
	.SYNOPSIS
		The hyperlink target for the area.
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
		[ValidateSet("circle", "default", "poly", "rect")]
	[string] $Shape

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

		if (Shape is not null) {
			attributes["shape"] = Shape;
			if (Coords is not null && Shape != "default") attributes["coords"] = string.Join(',', Coords.Select(number => number.ToString(CultureInfo.InvariantCulture)));
		}

		if (Alt is not null) attributes["alt"] = Alt;
		if (!string.IsNullOrWhiteSpace(Download)) attributes["download"] = Download;
		if (Ping.Length > 0) attributes["ping"] = string.Join(' ', Ping.Select(url => url.ToString())).Trim();
		if (Rel.Length > 0) attributes["rel"] = string.Join(' ', Rel).Trim();
		if (!string.IsNullOrWhiteSpace(Target)) attributes["target"] = Target;
	}
}
