using module ../New-Element.psm1

<#
.SYNOPSIS
	Creates a new `img` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlImgElement"), Alias("img"), OutputType(typeof(string))]
function New-HtmlImgElement: NewElementCommand("img", isVoid: true) {

	<#
	.SYNOPSIS
		A text to display on browsers that do not display images.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Alt

	<#
	.SYNOPSIS
		The intrinsic height of the image, in CSS pixels.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	int Height = -1;

	<#
	.SYNOPSIS
		Value indicating whether the image is part of a server-side map.
	#>
	[Parameter]
	[switch] $IsMap

	<#
	.SYNOPSIS
		Value indicating how the browser should load the image.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateSet("eager", "lazy")]
	[string] $Loading

	<#
	.SYNOPSIS
		The intended display sizes of the image.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string[]] $Sizes = @(),

	<#
	.SYNOPSIS
		The image URL.
	#>
	[Parameter(Mandatory, ValueFromPipelineByPropertyName)]
	required Uri Src

	<#
	.SYNOPSIS
		The possible image sources for the user agent to use.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string[]] $SrcSet = @(),

	<#
	.SYNOPSIS
		The partial URL (starting with `#`) of an image map associated with the element.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $UseMap

	<#
	.SYNOPSIS
		The intrinsic width of the image, in CSS pixels.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	int Width = -1;

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		attributes["src"] = Src.ToString();
		if (Alt is not null) attributes["alt"] = Alt;
		if (Height >= 0) attributes["height"] = Height
		if (IsMap) attributes["ismap"] = true;
		if (Loading is not null) attributes["loading"] = Loading;
		if (Sizes.Length > 0) attributes["sizes"] = string.Join(", ", Sizes);
		if (SrcSet.Length > 0) attributes["srcset"] = string.Join(", ", SrcSet);
		if (-not [string]::IsNullOrWhiteSpace(UseMap)) attributes["usemap"] = UseMap.StartsWith('#') ? UseMap : $"#{UseMap}";
		if (Width >= 0) attributes["width"] = Width
	}
}
