using namespace System.Net.Mime
using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `form` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlFormElement"), Alias("form"), OutputType(typeof(string))]
function New-HtmlFormElement: NewElementCommand("form", isVoid: false) {

	<#
	.SYNOPSIS
		The URL that processes the form submission.
	#>
	Uri? Action

	<#
	.SYNOPSIS
		Value indicating whether input elements can by default have their values automatically completed by the browser.
	#>
		[ValidateSet("off", "on")]
	[string] $AutoComplete

	<#
	.SYNOPSIS
		The media type of the form submission.
	#>
		[ValidateSet(MediaTypeNames.Application.FormUrlEncoded, MediaTypeNames.Multipart.FormData, MediaTypeNames.Text.Plain)]
	[string] $Enctype

	<#
	.SYNOPSIS
		The HTTP method to submit the form with.
	#>
		[ValidateSet("dialog", "get", "post")]
	[string] $Method

	<#
	.SYNOPSIS
		The name of the form.
	#>
	[string] $Name

	<#
	.SYNOPSIS
		Value indicating whether the form shouldn't be validated when submitted.
	#>
	[switch] $NoValidate

	<#
	.SYNOPSIS
		The annotations and what kinds of links the form creates.
	#>
	[string[]] $Rel = @(),

	<#
	.SYNOPSIS
		The browsing context to show the response after submitting the form.
	#>
	[string] $Target

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (Action is not null) $attributesToRender.action"] = Action.ToString();
		if (AutoComplete is not null) $attributesToRender.autocomplete"] = AutoComplete;
		if (Enctype is not null) $attributesToRender.enctype"] = Enctype;
		if (Method is not null) $attributesToRender.method"] = Method;
		if ($Name) { $attributesToRender.name"] = Name;
		if (NoValidate) $attributesToRender.novalidate"] = true;
		if (Rel.Length > 0) $attributesToRender.rel"] = string.Join(' ', Rel).Trim();
		if ($Target) { $attributesToRender.target"] = Target;
	}
}
