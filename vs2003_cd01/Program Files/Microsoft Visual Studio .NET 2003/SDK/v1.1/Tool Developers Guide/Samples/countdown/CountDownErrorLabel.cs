using System.Windows.Forms;
using System.Drawing;

/* Label that shows error message at top of window in big, red characters */
class ErrorLabel : System.Windows.Forms.Label {

	/* constructor */
	internal ErrorLabel(System.Windows.Forms.Form parent) {
		Initialize();
		// add to form
		parent.Controls.Add(this);
	}

	/* initializes this label */
	private void Initialize() {
		// set the position
		Location = new Point(10,25);

		// set anchor
		Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right;

		// set the size of the label
		Size = new Size(400,50);

		// set the color
		ForeColor = System.Drawing.Color.Red;

		// set the font height
		Font = new System.Drawing.Font("Arial Black",20);

		// set the text of the label
		Text = "";
	}
}
