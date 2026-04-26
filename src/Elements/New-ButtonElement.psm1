using namespace System.Net.Mime
using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `button` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlButtonElement"), Alias("button"), OutputType(typeof(string))]
function New-HtmlButtonElement: NewElementCommand("button", isVoid: false) {

	<#
	.SYNOPSIS
		The action to be performed on an element being controlled via the <see cref="CommandFor"/> attribute.
	#>
	[string] $Command

	<#
	.SYNOPSIS
		The identifier of an element to control.
	#>
	[string] $CommandFor

	<#
	.SYNOPSIS
		Value indicating whether to prevent the user from interacting with the element.
	#>
	[switch] $Disabled

	<#
	.SYNOPSIS
		The identifier of a `form` element to associate with the element.
	#>
	[string] $Form

	<#
	.SYNOPSIS
		The URL that processes the information submitted by the button.
	#>
	Uri? FormAction

	<#
	.SYNOPSIS
		Value indicating how to encode the form data that is submitted.
	#>
		[ValidateSet(MediaTypeNames.Application.FormUrlEncoded, MediaTypeNames.Multipart.FormData, MediaTypeNames.Text.Plain)]
	[string] $FormEnctype

	<#
	.SYNOPSIS
		The HTTP method used to submit the form.
	#>
		[ValidateSet("dialog", "get", "post")]
	[string] $FormMethod

	<#
	.SYNOPSIS
		Value indicating whether the form is not to be validated when it is submitted.
	#>
	[switch] $FormNoValidate

	<#
	.SYNOPSIS
		The browsing context to show the response after submitting the form.
	#>
	[string] $FormTarget

	<#
	.SYNOPSIS
		The name of the control.
	#>
	[string] $Name

	<#
	.SYNOPSIS
		The identifier of a popover element to control.
	#>
	[string] $PopoverTarget

	<#
	.SYNOPSIS
		The action to be performed on a popover element being controlled via the <see cref="PopoverTarget"/> attribute.
	#>
		[ValidateSet("hide", "show", "toggle")]
	[string] $PopoverTargetAction

	<#
	.SYNOPSIS
		The default behavior of the button.
	#>
		[ValidateSet("button", "reset", "submit")]
	[string] $Type

	<#
	.SYNOPSIS
		The value of the control.
	#>
	[object] $Value

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if ($Command) { $attributesToRender.command"] = Command;
		if ($CommandFor) { $attributesToRender.commandfor"] = CommandFor;
		if (Disabled) $attributesToRender.disabled"] = true;
		if ($Form) { $attributesToRender.form"] = Form;
		if (FormAction is not null) $attributesToRender.formaction"] = FormAction.ToString();
		if (FormEnctype is not null) $attributesToRender.formenctype"] = FormEnctype;
		if (FormMethod is not null) $attributesToRender.formmethod"] = FormMethod;
		if (FormNoValidate) $attributesToRender.formnovalidate"] = true;
		if ($FormTarget) { $attributesToRender.formtarget"] = FormTarget;
		if ($Name) { $attributesToRender.name"] = Name;
		if ($PopoverTarget) { $attributesToRender.popovertarget"] = PopoverTarget;
		if (PopoverTargetAction is not null) $attributesToRender.popovertargetaction"] = PopoverTargetAction;
		if (Type is not null) $attributesToRender.type"] = Type;
		if (Value is not null) $attributesToRender.value"] = Value;
	}
}
