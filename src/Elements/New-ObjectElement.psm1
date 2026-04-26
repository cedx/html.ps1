using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `object` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlObjectElement"), Alias("object"), OutputType(typeof(string))]
function New-HtmlObjectElement: NewElementCommand("object", isVoid: false) {

	<#
	.SYNOPSIS
		The URL of the resource being embedded.
	#>
	[Parameter(Mandatory)]
	required Uri Data

	<#
	.SYNOPSIS
		The identifier of a `form` element to associate with the element.
	#>
	[string] $Form

	<#
	.SYNOPSIS
		The height of the display resource, in CSS pixels.
	#>
	[ValidateRange(ValidateRangeKind.NonNegative)]
	int Height = -1;

	<#
	.SYNOPSIS
		The name of valid browsing context (HTML 5), or the name of the control (HTML 4).
	#>
	[string] $Name

	<#
	.SYNOPSIS
		The media type to use, optionally including a `codecs` parameter.
	#>
	[Parameter(Mandatory)]
	required string Type

	<#
	.SYNOPSIS
		The width of the display resource, in CSS pixels.
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
		$attributesToRender.data"] = Data.ToString();
		$attributesToRender.type"] = Type;
		if ($Form) { $attributesToRender.form"] = Form;
		if (Height >= 0) $attributesToRender.height"] = Height
		if ($Name) { $attributesToRender.name"] = Name;
		if (Width >= 0) $attributesToRender.width"] = Width
	}
}
