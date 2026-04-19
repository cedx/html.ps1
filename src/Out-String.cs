namespace Belin.Html;

using System.Text;

/// <summary>
/// Outputs input objects as an HTML string.
/// </summary>
[Cmdlet(VerbsData.Out, "HtmlString"), OutputType(typeof(string))]
public class OutStringCommand: Cmdlet {

	/// <summary>
	/// The string builder used to concatenate the input objects.
	/// </summary>
	private readonly StringBuilder builder = new();

	/// <summary>
	/// The object to be written to a string.
	/// </summary>
	[Parameter(Position = 0, ValueFromPipeline = true)]
	public required object InputObject { get; set; }

	/// <summary>
	/// Value indicating whether to remove the final newline from the output.
	/// </summary>
	[Parameter]
	public SwitchParameter NoNewLine { get; set; }

	/// <summary>
	/// Performs initialization of command execution.
	/// </summary>
	protected override void BeginProcessing() => builder.Clear();

	/// <summary>
	/// Performs clean-up after the command execution.
	/// </summary>
	protected override void EndProcessing() {
		if (!NoNewLine) builder.AppendLine();
		WriteObject(builder.ToString());
	}

	/// <summary>
	/// Performs execution of this command.
	/// </summary>
	protected override void ProcessRecord() {
		var output = InputObject is ScriptBlock scriptBlock ? scriptBlock.Invoke().Select(psObject => psObject.BaseObject) : [InputObject];
		foreach (var value in output) builder.Append(value);
	}
}
