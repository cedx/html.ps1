using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `template` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlTemplateElement"), Alias("template"), OutputType(typeof(string))]
function New-HtmlTemplateElement: NewElementCommand("template", isVoid: false) {

	<#
	.SYNOPSIS
		Value indicating whether the shadow root is clonable.
	#>
	[switch] $ShadowRootClonable

	<#
	.SYNOPSIS
		Value indicating whether the shadow root delegates focus.
	#>
	[switch] $ShadowRootDelegatesFocus

	<#
	.SYNOPSIS
		Value indicating whether to create a shadow root for the parent element.
	#>
		[ValidateSet("closed", "open")]
	[string] $ShadowRootMode

	<#
	.SYNOPSIS
		Value indicating whether the shadow root is serializable.
	#>
	[switch] $ShadowRootSerializable

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (ShadowRootMode is not null) $attributesToRender.shadowrootmode"] = ShadowRootMode;
		if (ShadowRootClonable) $attributesToRender.shadowrootclonable"] = true;
		if (ShadowRootDelegatesFocus) $attributesToRender.shadowrootdelegatesfocus"] = true;
		if (ShadowRootSerializable) $attributesToRender.shadowrootserializable"] = true;
	}
}
