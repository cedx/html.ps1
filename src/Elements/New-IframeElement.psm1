using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `iframe` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlIframeElement"), Alias("iframe"), OutputType(typeof(string))]
function New-HtmlIframeElement: NewElementCommand("iframe", isVoid: false) {

	<#
	.SYNOPSIS
		Specifies a permissions policy thaht defines what features are available to the frame based on the origin of the request.
	#>
	[string] $Allow

	<#
	.SYNOPSIS
		The height of the frame in CSS pixels.
	#>
	[ValidateRange(ValidateRangeKind.NonNegative)]
	int Height = -1;

	<#
	.SYNOPSIS
		Value indicating how the browser should load the frame.
	#>
		[ValidateSet("eager", "lazy")]
	[string] $Loading

	<#
	.SYNOPSIS
		A targetable name for the embedded browsing context.
	#>
	[string] $Name

	<#
	.SYNOPSIS
		Value indicating which referrer to send when fetching the frame's resource.
	#>
		[ValidateSet(
		"no-referrer-when-downgrade", "no-referrer", "origin-when-cross-origin", "origin",
		"same-origin", "strict-origin-when-cross-origin", "strict-origin", "unsafe-url"
	)]
	[string] $ReferrerPolicy

	<#
	.SYNOPSIS
		The restrictions applied to the content embedded in the frame.
	#>
	[string[]] $Sandbox = @(),

	<#
	.SYNOPSIS
		The URL of the page to embed.
	#>
	[Parameter(Mandatory)]
	required Uri Src

	<#
	.SYNOPSIS
		The width of the frame in CSS pixels.
	#>
	[ValidateRange(ValidateRangeKind.NonNegative)]
	int Width = -1;

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		attributes["src"] = Src.ToString();
		if (-not [string]::IsNullOrWhiteSpace(Allow)) attributes["allow"] = Allow;
		if (Height >= 0) attributes["height"] = Height
		if (Loading is not null) attributes["loading"] = Loading;
		if (-not [string]::IsNullOrWhiteSpace(Name)) attributes["name"] = Name;
		if (ReferrerPolicy is not null) attributes["referrerpolicy"] = ReferrerPolicy;
		if (Sandbox.Length > 0) attributes["sandbox"] = string.Join(' ', Sandbox).Trim();
		if (Width >= 0) attributes["width"] = Width
	}
}
