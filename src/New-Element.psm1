using namespace System.Collections.Specialized
using namespace System.Net
using namespace System.Text
using module ./Format-KebabCase.psm1

<#
.SYNOPSIS
	The HTML-encoded string corresponding to a double quote.
#>
$EncodedDoubleQuote = [WebUtility]::HtmlEncode('"')

<#
.SYNOPSIS
	Creates a new HTML element.
.OUTPUTS
	The newly created HTML element.
#>
function New-HtmlElement {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The tag name of the element to create.
		[Parameter(Mandatory)]
		[string] $TagName,

		# The inner HTML of the element.
		[Parameter(Position = 0, ValueFromPipeline)]
		[object] $Content,

		# The custom attributes to render.
		[hashtable] $Attributes = @{},

		# Value indicating whether inputted text is automatically capitalized.
		[ValidateSet("characters", "none", "off", "on", "sentences", "words")]
		[string] $AutoCapitalize,

		# Value indicating whether the element should have input focus when the page loads.
		[switch] $AutoFocus,

		# The CSS class names applied to the element.
		[string[]] $Class = @(),

		# Value indicating whether the element is editable by the user.
		[ValidateSet("false", "plaintext-only", "true")]
		[string] $ContentEditable,

		# The data attributes to render.
		[hashtable] $Data = @{},

		# The directionality of the element's text.
		[ValidateSet("auto", "ltr", "rtl")]
		[string] $Dir,

		# Value indicating whether the element can be dragged.
		[ValidateSet("false", "true")]
		[string] $Draggable,

		# Value indicating whether the browser should not render the contents of the element.
		[switch] $Hidden,

		# The element identifier.
		[string] $Id,

		# A hint at the type of data that might be entered by the user while editing the element or its contents.
		[ValidateSet("decimal", "email", "none", "numeric", "search", "tel", "text", "url")]
		[string] $InputMode,

		# The element's language.
		[cultureinfo] $Lang,

		# Value indicating whether the element is a popover element.
		[ValidateSet("auto", "hint", "manual")]
		[string] $Popover,

		# The event handler attributes to render.
		[hashtable] $On = @{},

		# Value indicating whether the element is subject to spell-checking by the underlying browser/OS.
		[ValidateSet("false", "true")]
		[string] $SpellCheck,

		# The CSS styling declarations applied to the element.
		[OrderedDictionary] $Style = [ordered]@{},

		# Determines the relative ordering of the element for sequential focus navigation.
		[int] $TabIndex,

		# A text representing advisory information related to the element.
		[string] $Title,

		# Value indicating whether the element's text should be translated when the page is localized.
		[ValidateSet("no", "yes")]
		[string] $Translate,

		# Value indicating whether the element to create is a void element.
		[switch] $Void
	)

	process {
		if ($Id) { $Attributes["id"] = $Id }
		if ($AutoCapitalize) { $Attributes["autocapitalize"] = $AutoCapitalize }
		if ($AutoFocus) { $Attributes["autofocus"] = $true }
		if ($Class.Count) { $Attributes["class"] = ($Class -join " ").Trim() }
		if ($ContentEditable) { $Attributes["contenteditable"] = $ContentEditable }
		$Data.Keys.ForEach{ $Attributes["data-$(Format-KebabCase $_)"] = $Data.$_ } # TODO test numbers with comma / ToString() conversion
		if ($Dir) { $Attributes["dir"] = $Dir }
		if ($Draggable) { $Attributes["draggable"] = $Draggable }
		if ($Hidden) { $Attributes["hidden"] = $true }
		if ($InputMode) { $Attributes["inputmode"] = $InputMode }
		if ($Lang) { $Attributes["lang"] = $Lang.Name }
		$On.Keys.ForEach{ $Attributes["on$(([string] $_).ToLowerInvariant())"] = $On.$_ } # TODO test numbers with comma / ToString() conversion, double-quotes, etc.
		if ($Popover) { $Attributes["popover"] = $Popover }
		if ($SpellCheck) { $Attributes["spellcheck"] = $SpellCheck }
		if ($Style.Count) { $Attributes["style"] = $Style.ForEach{ "$(Format-KebabCase $_.Key): $($_.Value)" } -join "; " } # TODO test numbers with comma / ToString() conversion, double-quotes, etc.
		if ($TabIndex) { $Attributes["tabindex"] = $TabIndex }
		if ($Title) { $Attributes["title"] = $Title }
		if ($Translate) { $Attributes["translate"] = $Translate }

		# TODO test numbers with comma / ToString() conversion, double-quotes, etc.
		$builder = [StringBuilder] "<$TagName"
		foreach ($key in $Attributes.Keys) {
			switch ($Attributes.$key) {
				{ $null -eq $_ } { break }
				{ $_ -is [bool] } { if ($_) { $builder.Append(" $key") | Out-Null }; break }
				{ $_ -is [switch] } { if ($_.IsPresent) { $builder.Append(" $key") | Out-Null }; break }
				default { $builder.Append(" $key=""$(([string] $_).Replace('"', $Script:EncodedDoubleQuote))""") | Out-Null }
			}
		}

		$builder.Append(">") | Out-Null
		if (-not $Void) {
			$output = $Content -is [scriptblock] ? (& $Content) : ($null -ne $Content ? @($Content) : @())
			foreach ($value in $output) { $builder.Append($value) | Out-Null }
			$builder.Append("</$TagName>") | Out-Null
		}

		$builder.ToString()
	}
}
