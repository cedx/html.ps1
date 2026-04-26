<#
.SYNOPSIS
	Creates a new `meta` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlMetaElement", DefaultParameterSetName = nameof(Name)), Alias("meta"), OutputType(typeof(string))]
function New-HtmlMetaElementCommand(): NewElementCommand("meta", isVoid: true) {

	<#
	.SYNOPSIS
		A charset declaration, giving the character encoding in which the document is encoded.
	#>
	[Parameter(Mandatory = true, ParameterSetName = nameof(Charset), ValueFromPipelineByPropertyName)]
	required string Charset

	<#
	.SYNOPSIS
		Contains the value for the `http-equiv` or `name attribute`, depending on which is used.
	#>
	[Parameter(Mandatory = true, ParameterSetName = nameof(HttpEquiv), ValueFromPipelineByPropertyName)]
	[Parameter(Mandatory = true, ParameterSetName = nameof(Name), ValueFromPipelineByPropertyName)]
	override [object] $Content { get => base.Content; set => base.Content = value; }

	<#
	.SYNOPSIS
		A pragma directive to simulate directives that could otherwise be given by an HTTP header.
	#>
	[Parameter(Mandatory = true, ParameterSetName = nameof(HttpEquiv), ValueFromPipelineByPropertyName)]
	required string HttpEquiv

	<#
	.SYNOPSIS
		Document-level metadata that applies to the whole page.
	#>
	[Parameter(Mandatory = true, ParameterSetName = nameof(Name), ValueFromPipelineByPropertyName)]
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
				attributes["charset"] = Charset;
				break;
			case nameof(HttpEquiv):
				attributes["http-equiv"] = HttpEquiv;
				attributes["content"] = Content;
				break;
			case nameof(Name):
				attributes["name"] = Name;
				attributes["content"] = Content;
				break;
		}
	}
}
