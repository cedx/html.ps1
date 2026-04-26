using namespace System.Xml
using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `time` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlTimeElement"), Alias("time"), OutputType(typeof(string))]
function New-HtmlTimeElement: NewElementCommand("time", isVoid: false) {

	<#
	.SYNOPSIS
		The time and/or date of the element.
	#>
	[object] $DateTime

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);

		if (DateTime is not null) {
			try {
				$attributesToRender.datetime"] = (DateTime is PSObject psObject ? psObject.BaseObject : DateTime) switch {
					DateOnly value => value.ToString("o"),
					DateTime value => value.ToString("o"),
					TimeOnly value => value.ToString("o"),
					TimeSpan value => XmlConvert.ToString(value),
					_ => throw new NotSupportedException("The specified date/time value is not supported.")
				};
			}
			catch (NotSupportedException e) {
				WriteError(new ErrorRecord(e, "New-TimeElement:NotSupportedException", ErrorCategory.InvalidArgument, DateTime));
			}
		}
	}
}
