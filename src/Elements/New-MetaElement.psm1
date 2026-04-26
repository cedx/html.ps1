using module ../Write-Element.psm1

<#
.SYNOPSIS
	Creates a new `meta` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlMetaElement", DefaultParameterSetName = nameof(Name)), Alias("meta"), OutputType(typeof(string))]
function New-HtmlMetaElement: NewElementCommand("meta", isVoid: true) {

	<#
	.SYNOPSIS
		A charset declaration, giving the character encoding in which the document is encoded.
	#>
	[Parameter(Mandatory, ParameterSetName = nameof(Charset))]
	required string Charset

	<#
	.SYNOPSIS
		Contains the value for the `http-equiv` or `name attribute`, depending on which is used.
	#>
	[Parameter(Mandatory, ParameterSetName = nameof(HttpEquiv))]
	[Parameter(Mandatory, ParameterSetName = nameof(Name))]
	override [object] $Content { get => base.Content; set => base.Content = value; }

	<#
	.SYNOPSIS
		A pragma directive to simulate directives that could otherwise be given by an HTTP header.
	#>
	[Parameter(Mandatory, ParameterSetName = nameof(HttpEquiv))]
	required string HttpEquiv

	<#
	.SYNOPSIS
		Document-level metadata that applies to the whole page.
	#>
	[Parameter(Mandatory, ParameterSetName = nameof(Name))]
	required string Name

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);

		switch (ParameterSetName) {
			case nameof(Charset):
				$attributesToRender.charset"] = Charset;
				break;
			case nameof(HttpEquiv):
				$attributesToRender.http-equiv"] = HttpEquiv;
				$attributesToRender.content"] = Content;
				break;
			case nameof(Name):
				$attributesToRender.name"] = Name;
				$attributesToRender.content"] = Content;
				break;
		}
	}
}
