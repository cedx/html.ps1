using module ../New-Element.psm1

<#
.SYNOPSIS
	Creates a new `canvas` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlCanvasElement"), Alias("canvas"), OutputType(typeof(string))]
function New-HtmlCanvasElement: NewElementCommand("canvas", isVoid: false) {

	<#
	.SYNOPSIS
		The height of the coordinate space in CSS pixels.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	int Height = -1;

	<#
	.SYNOPSIS
		The width of the coordinate space in CSS pixels.
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
		if (Height >= 0) attributes["height"] = Height
		if (Width >= 0) attributes["width"] = Width
	}
}
