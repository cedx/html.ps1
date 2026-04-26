using module ../Write-Element.psm1

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
	[string] $Alt

	<#
	.SYNOPSIS
		The intrinsic height of the image, in CSS pixels.
	#>
	[ValidateRange(ValidateRangeKind.NonNegative)]
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
		[ValidateSet("eager", "lazy")]
	[string] $Loading

	<#
	.SYNOPSIS
		The intended display sizes of the image.
	#>
	[string[]] $Sizes = @(),

	<#
	.SYNOPSIS
		The image URL.
	#>
	[Parameter(Mandatory)]
	required Uri Src

	<#
	.SYNOPSIS
		The possible image sources for the user agent to use.
	#>
	[string[]] $SrcSet = @(),

	<#
	.SYNOPSIS
		The partial URL (starting with `#`) of an image map associated with the element.
	#>
	[string] $UseMap

	<#
	.SYNOPSIS
		The intrinsic width of the image, in CSS pixels.
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
		$attributesToRender.src"] = Src.ToString();
		if (Alt is not null) $attributesToRender.alt"] = Alt;
		if (Height >= 0) $attributesToRender.height"] = Height
		if (IsMap) $attributesToRender.ismap"] = true;
		if (Loading is not null) $attributesToRender.loading"] = Loading;
		if (Sizes.Length > 0) $attributesToRender.sizes"] = string.Join(", ", Sizes);
		if (SrcSet.Length > 0) $attributesToRender.srcset"] = string.Join(", ", SrcSet);
		if ($UseMap) { $attributesToRender.usemap"] = UseMap.StartsWith('#') ? UseMap : $"#{UseMap}";
		if (Width >= 0) $attributesToRender.width"] = Width
	}
}
