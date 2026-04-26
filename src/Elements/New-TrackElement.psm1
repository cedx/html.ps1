using module ../New-Element.psm1

<#
.SYNOPSIS
	Creates a new `track` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlTrackElement"), Alias("track"), OutputType(typeof(string))]
function New-HtmlTrackElement: NewElementCommand("track", isVoid: true) {

	<#
	.SYNOPSIS
		Value indicating whether the track should be enabled unless the user's preferences indicate that another track is more appropriate.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $Default

	<#
	.SYNOPSIS
		Value indicating how the text track is meant to be used.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateSet("captions", "chapters", "descriptions", "metadata", "subtitles")]
	[string] $Kind

	<#
	.SYNOPSIS
		A user-readable title of the text track which is used by the browser when listing available text tracks.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[string] $Label

	<#
	.SYNOPSIS
		The address of the track (`.vtt` file).
	#>
	[Parameter(Mandatory, ValueFromPipelineByPropertyName)]
	required Uri Src

	<#
	.SYNOPSIS
		The language of the track text data.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[cultureinfo] $SrcLang

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		attributes["src"] = Src.ToString();
		if (Default) attributes["default"] = true;
		if (Kind is not null) attributes["kind"] = Kind;
		if (-not [string]::IsNullOrWhiteSpace(Label)) attributes["label"] = Label;
		if (SrcLang is not null) attributes["srclang"] = SrcLang.Name;
	}
}
