using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `textarea` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlTextareaElement"), Alias("textarea"), OutputType(typeof(string))]
function New-HtmlTextareaElement: NewElementCommand("textarea", isVoid: false) {

	<#
	.SYNOPSIS
		A hint for a user agent's autocomplete feature.
	#>
	[string[]] $AutoComplete = @(),

	<#
	.SYNOPSIS
		Value indicating whether automatic spelling correction and processing of text is enabled.
	#>
		[ValidateSet("off", "on")]
	[string] $AutoCorrect

	<#
	.SYNOPSIS
		The visible width of the text control, in average character widths.
	#>
	[ValidateRange(ValidateRangeKind.Positive)]
	int Cols

	<#
	.SYNOPSIS
		The field name to use for sending the element's directionality in form submission.
	#>
	[string] $DirName

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
		The maximum string length that the user can enter.
	#>
	[ValidateRange(ValidateRangeKind.NonNegative)]
	int MaxLength = -1;

	<#
	.SYNOPSIS
		The minimum string length required that the user should enter.
	#>
	[ValidateRange(ValidateRangeKind.NonNegative)]
	int MinLength = -1;

	<#
	.SYNOPSIS
		The name of the control.
	#>
	[string] $Name

	<#
	.SYNOPSIS
		A hint to the user of what can be entered in the control.
	#>
	[string] $Placeholder

	<#
	.SYNOPSIS
		Value indicating whether the user cannot modify the value of the control.
	#>
	[switch] $ReadOnly

	<#
	.SYNOPSIS
		Value indicating whether the user must fill in a value before submitting a form.
	#>
	[switch] $Required

	<#
	.SYNOPSIS
		The number of visible text lines for the control.
	#>
	[ValidateRange(ValidateRangeKind.Positive)]
	int Rows

	<#
	.SYNOPSIS
		Value indicating whether the control should wrap the value for form submission.
	#>
		[ValidateSet("hard", "soft")]
	[string] $Wrap

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (AutoComplete.Length > 0) $attributesToRender.autocomplete"] = string.Join(' ', AutoComplete).Trim();
		if (AutoCorrect is not null) $attributesToRender.autocorrect"] = AutoCorrect;
		if (Cols > 0) $attributesToRender.cols"] = Cols
		if ($DirName) { $attributesToRender.dirname"] = DirName;
		if (Disabled) $attributesToRender.disabled"] = true;
		if ($Form) { $attributesToRender.form"] = Form;
		if (MaxLength >= 0) $attributesToRender.maxlength"] = MaxLength
		if (MinLength >= 0) $attributesToRender.minlength"] = MinLength
		if ($Name) { $attributesToRender.name"] = Name;
		if ($Placeholder) { $attributesToRender.placeholder"] = Placeholder;
		if (ReadOnly) $attributesToRender.readonly"] = true;
		if (Required) $attributesToRender.required"] = true;
		if (Rows > 0) $attributesToRender.rows"] = Rows
		if (Wrap is not null) $attributesToRender.wrap"] = Wrap;
	}
}
