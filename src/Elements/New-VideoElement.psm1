using System.Globalization;

<#
.SYNOPSIS
	Creates a new `video` element.
#>
[Cmdlet(VerbsCommon.New, "HtmlVideoElement"), Alias("video"), OutputType(typeof(string))]
function New-HtmlVideoElementCommand(): NewElementCommand("video", isVoid: false) {

	<#
	.SYNOPSIS
		Value indicating whether playback should start automatically as soon as the video signal allows.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $AutoPlay

	<#
	.SYNOPSIS
		Value indicating whether to offer controls to allow the user to control video playback.
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
		Value indicating whether to prevent the browser from suggesting a Picture-in-Picture context menu or to request Picture-in-Picture automatically.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $DisablePictureInPicture

	<#
	.SYNOPSIS
		Value indicating whether to disable the capability of remote playback in devices that are attached using wired and wireless technologies.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $DisableRemotePlayback

	<#
	.SYNOPSIS
		The height of the video's display area, in CSS pixels.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	int Height = -1;

	<#
	.SYNOPSIS
		Value indicating whether the video player will automatically seek back to the start upon reaching the end of the video.
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
		Value indicating whether the video is to be played "inline", that is, within the element's playback area.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	[switch] $PlaysInline

	<#
	.SYNOPSIS
		The URL for an image to be shown while the video is downloading.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	Uri? Poster

	<#
	.SYNOPSIS
		Value providing a hint to the browser about what the author thinks will lead to the best user experience.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateSet("auto", "none", "metadata")]
	[string] $Preload

	<#
	.SYNOPSIS
		The URL of the video to embed.
	#>
	[Parameter(ValueFromPipelineByPropertyName)]
	Uri? Src

	<#
	.SYNOPSIS
		The width of the video's display area, in CSS pixels.
	#>
	[Parameter(ValueFromPipelineByPropertyName), ValidateRange(ValidateRangeKind.NonNegative)]
	int Width = -1;

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
		if (DisablePictureInPicture) attributes["disablepictureinpicture"] = true;
		if (DisableRemotePlayback) attributes["disableremoteplayback"] = true;
		if (Height >= 0) attributes["height"] = Height.ToString(CultureInfo.InvariantCulture);
		if (Loop) attributes["loop"] = true;
		if (Muted) attributes["muted"] = true;
		if (PlaysInline) attributes["playsinline"] = true;
		if (Poster is not null) attributes["poster"] = Poster.ToString();
		if (Preload is not null) attributes["preload"] = Preload;
		if (Src is not null) attributes["src"] = Src.ToString();
		if (Width >= 0) attributes["width"] = Width.ToString(CultureInfo.InvariantCulture);
	}
}
