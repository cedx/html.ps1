using System.Globalization;

<#
.SYNOPSIS
	Creates a new `select` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlSelectElement"), Alias("selectTag"), OutputType(typeof(string))]
function New-HtmlSelectElementCommand(): NewElementCommand("select", isVoid: false) {

	<#
	.SYNOPSIS
		A hint for a user agent's autocomplete feature.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string[]] $AutoComplete = [];

	<#
	.SYNOPSIS
		Value indicating whether to prevent the user from interacting with the element.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $Disabled

	<#
	.SYNOPSIS
		The identifier of a `form` element to associate with the element.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Form

	<#
	.SYNOPSIS
		Value indicating whether multiple options can be selected in the list.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $Multiple

	<#
	.SYNOPSIS
		The name of the control.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Name

	<#
	.SYNOPSIS
		Value indicating whether an option with a non-empty string value must be selected.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $Required

	<#
	.SYNOPSIS
		The number of rows in the list that should be visible at one time.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	int Size = -1;

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (AutoComplete.Length > 0) attributes["autocomplete"] = string.Join(' ', AutoComplete).Trim();
		if (Disabled) attributes["disabled"] = true;
		if (!string.IsNullOrWhiteSpace(Form)) attributes["form"] = Form;
		if (Multiple) attributes["multiple"] = true;
		if (!string.IsNullOrWhiteSpace(Name)) attributes["name"] = Name;
		if (Required) attributes["required"] = true;
		if (Size >= 0) attributes["size"] = Size.ToString(CultureInfo.InvariantCulture);
	}
}
