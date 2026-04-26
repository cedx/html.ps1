<#
.SYNOPSIS
	Creates a new `template` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlTemplateElement"), Alias("template"), OutputType(typeof(string))]
function New-HtmlTemplateElementCommand(): NewElementCommand("template", isVoid: false) {

	<#
	.SYNOPSIS
		Value indicating whether the shadow root is clonable.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $ShadowRootClonable

	<#
	.SYNOPSIS
		Value indicating whether the shadow root delegates focus.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $ShadowRootDelegatesFocus

	<#
	.SYNOPSIS
		Value indicating whether to create a shadow root for the parent element.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateSet("closed", "open")]
	[string] $ShadowRootMode

	<#
	.SYNOPSIS
		Value indicating whether the shadow root is serializable.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $ShadowRootSerializable

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (ShadowRootMode is not null) attributes["shadowrootmode"] = ShadowRootMode;
		if (ShadowRootClonable) attributes["shadowrootclonable"] = true;
		if (ShadowRootDelegatesFocus) attributes["shadowrootdelegatesfocus"] = true;
		if (ShadowRootSerializable) attributes["shadowrootserializable"] = true;
	}
}
