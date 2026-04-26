using module ../New-Element.psm1

<#
.SYNOPSIS
	Creates a new `embed` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlEmbedElement"), Alias("embed"), OutputType(typeof(string))]
function New-HtmlEmbedElement: NewElementCommand("embed", isVoid: true) {

	<#
	.SYNOPSIS
		The displayed height of the resource, in CSS pixels.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	int Height = -1;

	<#
	.SYNOPSIS
		The URL of the resource being embedded.
	#>
	[Parameter(Mandatory, ValueFromPipelineByPropertyName)]
	required Uri Src

	<#
	.SYNOPSIS
		The media type to use, optionally including a `codecs` parameter.
	#>
	[Parameter(Mandatory, ValueFromPipelineByPropertyName)]
	required string Type

	<#
	.SYNOPSIS
		The displayed height of the resource, in CSS pixels.
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
		attributes["type"] = Type;
		if (Height >= 0) attributes["height"] = Height
		if (Width >= 0) attributes["width"] = Width
	}
}
