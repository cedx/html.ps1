<#
.SYNOPSIS
	Creates a new `audio` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlAudioElement"), Alias("audio"), OutputType(typeof(string))]
function New-HtmlAudioElementCommand(): NewElementCommand("audio", isVoid: false) {

	<#
	.SYNOPSIS
		Value indicating whether playback should start automatically as soon as the audio signal allows.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $AutoPlay

	<#
	.SYNOPSIS
		Value indicating whether to offer controls to allow the user to control audio playback.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $Controls

	<#
	.SYNOPSIS
		Value indicating whether CORS must be used when fetching the resource.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateSet("anonymous", "use-credentials")]
	[string] $CrossOrigin

	<#
	.SYNOPSIS
		Value indicating whether to disable the capability of remote playback in devices that are attached using wired and wireless technologies.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $DisableRemotePlayback

	<#
	.SYNOPSIS
		Value indicating whether the audio player will automatically seek back to the start upon reaching the end of the audio.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $Loop

	<#
	.SYNOPSIS
		Value indicating whether the audio will be initially silenced.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $Muted

	<#
	.SYNOPSIS
		Value providing a hint to the browser about what the author thinks will lead to the best user experience.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateSet("auto", "none", "metadata")]
	[string] $Preload

	<#
	.SYNOPSIS
		The URL of the audio to embed.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	Uri? Src

	<#
	.SYNOPSIS
		Populates the specified attribute collection with the element attributes.
	#>
	/// <param name="attributes">The attribute collection to populate.</param>
	protected override void RenderAttributes(IDictionary<string, object?> attributes) {
		base.RenderAttributes(attributes);
		if (AutoPlay) attributes["autoplay"] = true;
		if (Controls) attributes["controls"] = true;
		if (CrossOrigin is not null) attributes["crossorigin"] = CrossOrigin;
		if (DisableRemotePlayback) attributes["disableremoteplayback"] = true;
		if (Loop) attributes["loop"] = true;
		if (Muted) attributes["muted"] = true;
		if (Preload is not null) attributes["preload"] = Preload;
		if (Src is not null) attributes["src"] = Src.ToString();
	}
}
