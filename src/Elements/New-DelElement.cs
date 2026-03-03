namespace Belin.Html.Cmdlets.Elements;

using System.Globalization;

/// <summary>
/// Creates a new <c>del</c> element.
/// </summary>
[Cmdlet(VerbsCommon.New, "HtmlDelElement"), Alias("delTag"), OutputType(typeof(string))]
public class NewDelElementCommand(): NewElementCommand("del", isVoid: false) {

	/// <summary>
	/// A URI for a resource that explains the change (for example, meeting minutes).
	/// </summary>
	[Parameter(ValueFromPipelineByPropertyName = true)]
	public Uri? Cite { get; set; }

	/// <summary>
	/// Value indicating the time and date of the change.
	/// </summary>
	[Parameter(ValueFromPipelineByPropertyName = true)]
	public object? DateTime { get; set; }

	/// <summary>
	/// Populates the specified attribute collection with the element attributes.
	/// </summary>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(Dictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (Cite is not null) attributes["cite"] = Cite.ToString();

		if (DateTime is not null) {
			try {
				attributes["datetime"] = (DateTime is PSObject psObject ? psObject.BaseObject : DateTime) switch {
					DateOnly value => value.ToString("o", CultureInfo.InvariantCulture),
					DateTime value => value.ToString("o", CultureInfo.InvariantCulture),
					_ => throw new NotSupportedException("The specified date/time value is not supported.")
				};
			}
			catch (NotSupportedException e) {
				ThrowTerminatingError(new ErrorRecord(e, "New-DelElement:NotSupportedException", ErrorCategory.InvalidArgument, null));
			}
		}
	}
}
