<#
.SYNOPSIS
	Creates a new `fieldset` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlFieldsetElement"), Alias("fieldset"), OutputType(typeof(string))]
function New-HtmlFieldsetElementCommand(): NewElementCommand("fieldset", isVoid: false) {

	<#
	.SYNOPSIS
		Value indicating whether all form controls that are descendants of the element, are disabled.
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
		The name associated with the group.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Name

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (Disabled) attributes["disabled"] = true;
		if (!string.IsNullOrWhiteSpace(Form)) attributes["form"] = Form;
		if (!string.IsNullOrWhiteSpace(Name)) attributes["name"] = Name;
	}
}
