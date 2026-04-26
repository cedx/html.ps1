using module ../New-Element.psm1

<#
.SYNOPSIS
	Creates a new `del` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlDelElement"), Alias("delTag"), OutputType(typeof(string))]
function New-HtmlDelElement: NewElementCommand("del", isVoid: false) {

	<#
	.SYNOPSIS
		A URI for a resource that explains the change.
	#>
	Uri? Cite

	<#
	.SYNOPSIS
		The date and time of the change.
	#>
	[object] $DateTime

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (Cite is not null) attributes["cite"] = Cite.ToString();

		if (DateTime is not null) {
			try {
				attributes["datetime"] = (DateTime is PSObject psObject ? psObject.BaseObject : DateTime) switch {
					DateOnly value => value.ToString("o"),
					DateTime value => value.ToString("o"),
					_ => throw new NotSupportedException("The specified date/time value is not supported.")
				};
			}
			catch (NotSupportedException e) {
				WriteError(new ErrorRecord(e, "New-DelElement:NotSupportedException", ErrorCategory.InvalidArgument, DateTime));
			}
		}
	}
}
