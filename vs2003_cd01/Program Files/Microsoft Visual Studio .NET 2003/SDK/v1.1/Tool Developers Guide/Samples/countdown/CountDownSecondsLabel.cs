using System.Windows.Forms;
using System.Drawing;

/* Represents a label that displays the text "Seconds left" */
class SecondsLabel : System.Windows.Forms.Label {

	/* constructor */
	internal SecondsLabel(System.Windows.Forms.Form parent) {
		Initialize();
		// add to form
		parent.Controls.Add(this);
	}

	/* initializes this label */
	private void Initialize() {
		// set the position
		Location = new Point(200,100);

		// set anchor
		Anchor = AnchorStyles.Top | AnchorStyles.Bottom;

		// set the size of the label
		Size = new Size(200,30);

		// set the color
		ForeColor = System.Drawing.Color.DarkRed;

		// set the font height
		Font = new System.Drawing.Font("Verdana",15);

		// set the text of the label
		Text = "Seconds left";
	}
}
