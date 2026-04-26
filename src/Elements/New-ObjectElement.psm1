using System.Globalization;

<#
.SYNOPSIS
	Creates a new `object` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlObjectElement"), Alias("object"), OutputType(typeof(string))]
function New-HtmlObjectElementCommand(): NewElementCommand("object", isVoid: false) {

	<#
	.SYNOPSIS
		The URL of the resource being embedded.
	#>
	[Parameter(Mandatory = true, ValueFromPipelineByPropertyName)]
	required Uri Data

	<#
	.SYNOPSIS
		The identifier of a `form` element to associate with the element.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Form

	<#
	.SYNOPSIS
		The height of the display resource, in CSS pixels.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	int Height = -1;

	<#
	.SYNOPSIS
		The name of valid browsing context (HTML 5), or the name of the control (HTML 4).
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Name

	<#
	.SYNOPSIS
		The media type to use, optionally including a `codecs` parameter.
	#>
	[Parameter(Mandatory = true, ValueFromPipelineByPropertyName)]
	required string Type

	<#
	.SYNOPSIS
		The width of the display resource, in CSS pixels.
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
		attributes["data"] = Data.ToString();
		attributes["type"] = Type;
		if (!string.IsNullOrWhiteSpace(Form)) attributes["form"] = Form;
		if (Height >= 0) attributes["height"] = Height.ToString(CultureInfo.InvariantCulture);
		if (!string.IsNullOrWhiteSpace(Name)) attributes["name"] = Name;
		if (Width >= 0) attributes["width"] = Width.ToString(CultureInfo.InvariantCulture);
	}
}
