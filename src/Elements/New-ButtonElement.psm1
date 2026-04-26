using System.Net.Mime;

<#
.SYNOPSIS
	Creates a new `button` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlButtonElement"), Alias("button"), OutputType(typeof(string))]
function New-HtmlButtonElementCommand(): NewElementCommand("button", isVoid: false) {

	<#
	.SYNOPSIS
		The action to be performed on an element being controlled via the <see cref="CommandFor"/> attribute.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Command

	<#
	.SYNOPSIS
		The identifier of an element to control.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $CommandFor

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
		The URL that processes the information submitted by the button.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	Uri? FormAction

	<#
	.SYNOPSIS
		Value indicating how to encode the form data that is submitted.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateSet(MediaTypeNames.Application.FormUrlEncoded, MediaTypeNames.Multipart.FormData, MediaTypeNames.Text.Plain)]
	[string] $FormEnctype

	<#
	.SYNOPSIS
		The HTTP method used to submit the form.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateSet("dialog", "get", "post")]
	[string] $FormMethod

	<#
	.SYNOPSIS
		Value indicating whether the form is not to be validated when it is submitted.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $FormNoValidate

	<#
	.SYNOPSIS
		The browsing context to show the response after submitting the form.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $FormTarget

	<#
	.SYNOPSIS
		The name of the control.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Name

	<#
	.SYNOPSIS
		The identifier of a popover element to control.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $PopoverTarget

	<#
	.SYNOPSIS
		The action to be performed on a popover element being controlled via the <see cref="PopoverTarget"/> attribute.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateSet("hide", "show", "toggle")]
	[string] $PopoverTargetAction

	<#
	.SYNOPSIS
		The default behavior of the button.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateSet("button", "reset", "submit")]
	[string] $Type

	<#
	.SYNOPSIS
		The value of the control.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[object] $Value

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (!string.IsNullOrWhiteSpace(Command)) attributes["command"] = Command;
		if (!string.IsNullOrWhiteSpace(CommandFor)) attributes["commandfor"] = CommandFor;
		if (Disabled) attributes["disabled"] = true;
		if (!string.IsNullOrWhiteSpace(Form)) attributes["form"] = Form;
		if (FormAction is not null) attributes["formaction"] = FormAction.ToString();
		if (FormEnctype is not null) attributes["formenctype"] = FormEnctype;
		if (FormMethod is not null) attributes["formmethod"] = FormMethod;
		if (FormNoValidate) attributes["formnovalidate"] = true;
		if (!string.IsNullOrWhiteSpace(FormTarget)) attributes["formtarget"] = FormTarget;
		if (!string.IsNullOrWhiteSpace(Name)) attributes["name"] = Name;
		if (!string.IsNullOrWhiteSpace(PopoverTarget)) attributes["popovertarget"] = PopoverTarget;
		if (PopoverTargetAction is not null) attributes["popovertargetaction"] = PopoverTargetAction;
		if (Type is not null) attributes["type"] = Type;
		if (Value is not null) attributes["value"] = Value;
	}
}
