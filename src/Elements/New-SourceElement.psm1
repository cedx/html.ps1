using System.Globalization;

<#
.SYNOPSIS
	Creates a new `source` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlSourceElement", DefaultParameterSetName = nameof(Src)), Alias("source"), OutputType(typeof(string))]
function New-HtmlSourceElementCommand(): NewElementCommand("source", isVoid: true) {

	<#
	.SYNOPSIS
		The intrinsic height of the image, in CSS pixels.
	#>
	[Parameter(ParameterSetName = nameof(SrcSet), ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	int Height = -1;

	<#
	.SYNOPSIS
		The media query for the resource's intended media.
	#>
	[Parameter(ParameterSetName = nameof(SrcSet), ValueFromPipelineByPropertyName)]
	[string] $Media

	<#
	.SYNOPSIS
		A list of source sizes that describe the final rendered width of the image.
	#>
	[Parameter(ParameterSetName = nameof(SrcSet), ValueFromPipelineByPropertyName)]
	[string[]] $Sizes = [];

	<#
	.SYNOPSIS
		The URL of the media resource
	#>
	[Parameter(Mandatory = true, ParameterSetName = nameof(Src), ValueFromPipelineByPropertyName)]
	required Uri Src

	<#
	.SYNOPSIS
		A list of one or more image URLs and their descriptors.
	#>
	[Parameter(Mandatory = true, ParameterSetName = nameof(SrcSet), ValueFromPipelineByPropertyName)]
	[string[]] $SrcSet = [];

	<#
	.SYNOPSIS
		The media type to use, optionally including a `codecs` parameter.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Type

	<#
	.SYNOPSIS
		The intrinsic width of the image, in CSS pixels.
	#>
	[Parameter(ParameterSetName = nameof(SrcSet), ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	int Width = -1;

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (!string.IsNullOrWhiteSpace(Type)) attributes["type"] = Type;

		switch (ParameterSetName) {
			case nameof(Src):
				attributes["src"] = Src.ToString();
				break;

			case nameof(SrcSet):
				attributes["srcset"] = string.Join(", ", SrcSet);
				if (Height >= 0) attributes["height"] = Height.ToString(CultureInfo.InvariantCulture);
				if (!string.IsNullOrWhiteSpace(Media)) attributes["media"] = Media;
				if (Sizes.Length > 0) attributes["sizes"] = string.Join(", ", Sizes);
				if (Width >= 0) attributes["width"] = Width.ToString(CultureInfo.InvariantCulture);
				break;
		}
	}
}
