using module ../New-Element.psm1

<#
.SYNOPSIS
	Creates a new `dialog` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlDialogElement"), Alias("dialog"), OutputType(typeof(string))]
function New-HtmlDialogElement: NewElementCommand("dialog", isVoid: false) {

	<#
	.SYNOPSIS
		Specifies the types of user actions that can be used to close the element.
	#>
		[ValidateSet("any", "closerequest", "none")]
	[string] $ClosedBy

	<#
	.SYNOPSIS
		Value indicating whether the dialog box is active and is available for interaction.
	#>
	[switch] $Open

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (ClosedBy is not null) attributes["closedby"] = ClosedBy;
		if (Open) attributes["open"] = true;
	}
}
