using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `source` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlSourceElement", DefaultParameterSetName = nameof(Src)), Alias("source"), OutputType(typeof(string))]
function New-HtmlSourceElement: NewElementCommand("source", isVoid: true) {

	<#
	.SYNOPSIS
		The intrinsic height of the image, in CSS pixels.
	#>
	[Parameter(ParameterSetName = nameof(SrcSet)), ValidateRange(ValidateRangeKind.NonNegative)]
	int Height = -1;

	<#
	.SYNOPSIS
		The media query for the resource's intended media.
	#>
	[Parameter(ParameterSetName = nameof(SrcSet))]
	[string] $Media

	<#
	.SYNOPSIS
		A list of source sizes that describe the final rendered width of the image.
	#>
	[Parameter(ParameterSetName = nameof(SrcSet))]
	[string[]] $Sizes = @(),

	<#
	.SYNOPSIS
		The URL of the media resource
	#>
	[Parameter(Mandatory, ParameterSetName = nameof(Src))]
	required Uri Src

	<#
	.SYNOPSIS
		A list of one or more image URLs and their descriptors.
	#>
	[Parameter(Mandatory, ParameterSetName = nameof(SrcSet))]
	[string[]] $SrcSet = @(),

	<#
	.SYNOPSIS
		The media type to use, optionally including a `codecs` parameter.
	#>
	[string] $Type

	<#
	.SYNOPSIS
		The intrinsic width of the image, in CSS pixels.
	#>
	[Parameter(ParameterSetName = nameof(SrcSet)), ValidateRange(ValidateRangeKind.NonNegative)]
	int Width = -1;

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if ($Type) { $attributesToRender.type"] = Type;

		switch (ParameterSetName) {
			case nameof(Src):
				$attributesToRender.src"] = Src.ToString();
				break;

			case nameof(SrcSet):
				$attributesToRender.srcset"] = string.Join(", ", SrcSet);
				if (Height >= 0) $attributesToRender.height"] = Height
				if ($Media) { $attributesToRender.media"] = Media;
				if (Sizes.Length > 0) $attributesToRender.sizes"] = string.Join(", ", Sizes);
				if (Width >= 0) $attributesToRender.width"] = Width
				break;
		}
	}
}
