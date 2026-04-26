using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `optgroup` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlOptgroupElement"), Alias("optgroup"), OutputType(typeof(string))]
function New-HtmlOptgroupElement: NewElementCommand("optgroup", isVoid: false) {

	<#
	.SYNOPSIS
		Value indicating whether none of the items in the option group is selectable.
	#>
	[switch] $Disabled

	<#
	.SYNOPSIS
		The name of the group of options.
	#>
	required string Label

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		attributes["label"] = Label;
		if (Disabled) attributes["disabled"] = true;
	}
}
