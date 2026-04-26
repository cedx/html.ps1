using System.Globalization;
using System.Net.Mime;
using System.Text.RegularExpressions;

<#
.SYNOPSIS
	Creates a new `input` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlInputElement"), Alias("input"), OutputType(typeof(string))]
function New-HtmlInputElementCommand(): NewElementCommand("input", isVoid: true) {

	<#
	.SYNOPSIS
		Defines which file types are selectable in a file upload control.
	/// Valid for the `file` input type only.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Accept

	<#
	.SYNOPSIS
		A text to display on browsers that do not display images.
	/// Valid for the `image` input type only.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Alt

	<#
	.SYNOPSIS
		A hint for a user agent's autocomplete feature.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string[]] $AutoComplete = [];

	<#
	.SYNOPSIS
		Value indicating which camera to use for capture of image or video data.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateSet("environment", "user")]
	[string] $Capture

	<#
	.SYNOPSIS
		Value indicating whether the checkbox is checked or the radio button is the currently selected one.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $Checked

	<#
	.SYNOPSIS
		The field name to use for sending the element's directionality in form submission.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $DirName

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
	/// Valid for the `image` and `submit` input types only.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	Uri? FormAction

	<#
	.SYNOPSIS
		Value indicating how to encode the form data that is submitted.
	/// Valid for the `image` and `submit` input types only.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateSet(MediaTypeNames.Application.FormUrlEncoded, MediaTypeNames.Multipart.FormData, MediaTypeNames.Text.Plain)]
	[string] $FormEnctype

	<#
	.SYNOPSIS
		The HTTP method used to submit the form.
	/// Valid for the `image` and `submit` input types only.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateSet("dialog", "get", "post")]
	[string] $FormMethod

	<#
	.SYNOPSIS
		Value indicating whether the form is not to be validated when it is submitted.
	/// Valid for the `image` and `submit` input types only.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $FormNoValidate

	<#
	.SYNOPSIS
		The browsing context to show the response after submitting the form.
	/// Valid for the `image` and `submit` input types only.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $FormTarget

	<#
	.SYNOPSIS
		The intrinsic height of the image, in CSS pixels.
	/// Valid for the `image` input type only.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	int Height = -1;

	<#
	.SYNOPSIS
		The identifier of a `datalist` element located in the same document..
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $List

	<#
	.SYNOPSIS
		The greatest value in the range of permitted values.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	[string] $Max

	<#
	.SYNOPSIS
		The maximum string length that the user can enter.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	int MaxLength = -1;

	<#
	.SYNOPSIS
		The lowest value in the range of permitted values.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	[string] $Min

	<#
	.SYNOPSIS
		The minimum string length required that the user should enter.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	int MinLength = -1;

	<#
	.SYNOPSIS
		Value indicating whether the user can enter comma separated email addresses in the `email` widget or can choose more than one file with the `file` input.
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
		The regular expression that the <see cref="Value"/> must match in order for the value to pass constraint validation.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	Regex? Pattern

	<#
	.SYNOPSIS
		A hint to the user of what can be entered in the control.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Placeholder

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
		Value indicating whether the user cannot modify the value of the control.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $ReadOnly

	<#
	.SYNOPSIS
		Value indicating whether the user must fill in a value before submitting a form.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $Required

	<#
	.SYNOPSIS
		Value indicating how much of the input is shown.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.Positive)]
	int Size

	<#
	.SYNOPSIS
		The URL of the image file to display to represent the graphical button.
	/// Valid for the `image` input type only.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	Uri? Src

	<#
	.SYNOPSIS
		A number that specifies the granularity that the value must adhere to, or the special value `any`.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	[string] $Step

	<#
	.SYNOPSIS
		The type of control to render.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateSet(
		"button", "checkbox", "color", "date", "datetime-local", "email",
		"file", "hidden", "image", "month", "number", "password",
		"radio", "range", "reset", "search", "submit", "tel",
		"text", "time", "url", "week"
	)]
	[string] $Type

	<#
	.SYNOPSIS
		The value of the control.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[object] $Value

	<#
	.SYNOPSIS
		The intrinsic width of the image, in CSS pixels.
	/// Valid for the `image` input type only.
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
		if (!string.IsNullOrWhiteSpace(Accept)) attributes["accept"] = Accept;
		if (Alt is not null) attributes["alt"] = Alt;
		if (AutoComplete.Length > 0) attributes["autocomplete"] = string.Join(' ', AutoComplete).Trim();
		if (Capture is not null) attributes["capture"] = Capture;
		if (Checked) attributes["checked"] = true;
		if (!string.IsNullOrWhiteSpace(DirName)) attributes["dirname"] = DirName;
		if (Disabled) attributes["disabled"] = true;
		if (!string.IsNullOrWhiteSpace(Form)) attributes["form"] = Form;
		if (FormAction is not null) attributes["formaction"] = FormAction.ToString();
		if (FormEnctype is not null) attributes["formenctype"] = FormEnctype;
		if (FormMethod is not null) attributes["formmethod"] = FormMethod;
		if (FormNoValidate) attributes["formnovalidate"] = true;
		if (!string.IsNullOrWhiteSpace(FormTarget)) attributes["formtarget"] = FormTarget;
		if (Height >= 0) attributes["height"] = Height.ToString(CultureInfo.InvariantCulture);
		if (!string.IsNullOrWhiteSpace(List)) attributes["list"] = List;
		if (!string.IsNullOrWhiteSpace(Max)) attributes["max"] = Max;
		if (MaxLength >= 0) attributes["maxlength"] = MaxLength.ToString(CultureInfo.InvariantCulture);
		if (!string.IsNullOrWhiteSpace(Min)) attributes["min"] = Min;
		if (MinLength >= 0) attributes["minlength"] = MinLength.ToString(CultureInfo.InvariantCulture);
		if (Multiple) attributes["multiple"] = true;
		if (!string.IsNullOrWhiteSpace(Name)) attributes["name"] = Name;
		if (Pattern is not null) attributes["pattern"] = Pattern.ToString().Replace(@"\", @"\\");
		if (!string.IsNullOrWhiteSpace(Placeholder)) attributes["placeholder"] = Placeholder;
		if (!string.IsNullOrWhiteSpace(PopoverTarget)) attributes["popovertarget"] = PopoverTarget;
		if (PopoverTargetAction is not null) attributes["popovertargetaction"] = PopoverTargetAction;
		if (ReadOnly) attributes["readonly"] = true;
		if (Required) attributes["required"] = true;
		if (Size > 0) attributes["size"] = Size.ToString(CultureInfo.InvariantCulture);
		if (!string.IsNullOrWhiteSpace(Step)) attributes["step"] = Step;
		if (Type is not null) attributes["type"] = Type;
		if (Value is not null) attributes["value"] = Value;
		if (Width >= 0) attributes["width"] = Width.ToString(CultureInfo.InvariantCulture);
	}
}
