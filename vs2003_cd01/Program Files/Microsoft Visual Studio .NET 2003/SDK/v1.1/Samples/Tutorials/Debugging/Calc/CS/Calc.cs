//==========================================================================
//  File:		calc.cs
//
//==========================================================================
#define TRACE
namespace Demo.Localize {

using System;
using System.Drawing;
using System.IO;
using System.Windows.Forms;

using System.Diagnostics;

using Demo.Localize.Math;
using Demo.Localize.ParseUtil;

public class VersioningDemo : Form {
	private System.ComponentModel.Container components;
	private TextBox txtFormula;
	private Label   lblFormula;
	private Button  btnEquals;
	private Button  btnClear;
	private Button[]  btnNumbers;
	private Button[]  btnOps;

	public VersioningDemo() {
		try {
			Trace.Listeners.Add(new TextWriterTraceListener(File.Create("output.txt")));
		}
		catch(System.IO.IOException) {
			MessageBox.Show("Another instance of this calculator is already running in the current directory. Logging will be disabled.", "Integer Calculator");
		}
		
		Trace.WriteLine("");
		Trace.WriteLine("Starting Tracing...");
		Trace.Indent();

		InitializeComponent();
	}

	private void VersioningDemoClosing(object sender, System.ComponentModel.CancelEventArgs evArgs) {
		Trace.Unindent();
		Trace.WriteLine("Dispose()");
		Trace.Close();
	}

	protected override void Dispose(bool disposing) {
		if (disposing){
			if (components != null) {
				components.Dispose();
	           	}
		}
		base.Dispose(disposing);
	}

	private void InitializeComponent() {
		Trace.WriteLine("InitializeComponent()");
		Trace.Indent();
		          
		Trace.WriteLine("Creating controls");
		components = new System.ComponentModel.Container();
		txtFormula = new TextBox();
		lblFormula = new Label();
		btnEquals  = new Button();
		btnClear   = new Button();
		btnNumbers = new Button[10];
		btnOps     = new Button[4];

		AutoScaleBaseSize = new System.Drawing.Size(5, 13);

		this.Text = "Welcome - Integer Calculator";

		this.ClientSize = new System.Drawing.Size(230, 230);
		this.Closing += new System.ComponentModel.CancelEventHandler(VersioningDemoClosing);
		
		Trace.WriteLine("Setting up Label and TextBox");

		lblFormula.Location = new System.Drawing.Point(8, 10);
		lblFormula.Text = "Formula and Results:";
		lblFormula.Size = new System.Drawing.Size(155, 20);

		txtFormula.Location = new System.Drawing.Point(8, 28);
		txtFormula.TabIndex = 0;
		txtFormula.Size = new System.Drawing.Size(150, 25);
		txtFormula.ReadOnly = true;

		Trace.WriteLine("Setting up numeric buttons");

		btnNumbers[0] = new Button();
		btnNumbers[0].Location = new Point(8, 180);
		btnNumbers[0].Text = "0";

		btnNumbers[1] = new Button();
		btnNumbers[1].Location = new Point(8, 60);
		btnNumbers[1].Text = "1";

		btnNumbers[2] = new Button();
		btnNumbers[2].Location = new Point(48, 60);
		btnNumbers[2].Text = "2";

		btnNumbers[3] = new Button();
		btnNumbers[3].Location = new Point(88, 60);
		btnNumbers[3].Text = "3";

		btnNumbers[4] = new Button();
		btnNumbers[4].Location = new Point(8, 100);
		btnNumbers[4].Text = "4";

		btnNumbers[5] = new Button();
		btnNumbers[5].Location = new Point(48, 100);
		btnNumbers[5].Text = "5";

		btnNumbers[6] = new Button();
		btnNumbers[6].Location = new Point(88, 100);
		btnNumbers[6].Text = "6";

		btnNumbers[7] = new Button();
		btnNumbers[7].Location = new Point(8, 140);
		btnNumbers[7].Text = "7";

		btnNumbers[8] = new Button();
		btnNumbers[8].Location = new Point(48, 140);
		btnNumbers[8].Text = "8";

		btnNumbers[9] = new Button();
		btnNumbers[9].Location = new Point(88, 140);
		btnNumbers[9].Text = "9";

		int j = 10, k = 20, z = 0;
		for (int i = 0; i < 10; i++) {
			z = j+k;
			btnNumbers[i].Size = new Size(30, 30);
			btnNumbers[i].Click += new System.EventHandler(btnNumbersClicked);
		}

		Trace.WriteLine("Setting up operations buttons");

		btnOps[0] = new Button();
		btnOps[0].Location = new Point(128, 60);
		btnOps[0].Text = "+";

		btnOps[1] = new Button();
		btnOps[1].Location = new Point(128, 100);
		btnOps[1].Text = "-";

		btnOps[2] = new Button();
		btnOps[2].Location = new Point(128, 140);
		btnOps[2].Text = "*";

		btnOps[3] = new Button();
		btnOps[3].Location = new Point(128, 180);
		btnOps[3].Text = "/";

		for (int i = 0; i < 4; i++) {
			btnOps[i].Size = new Size(30, 30);
			btnOps[i].Click += new System.EventHandler(btnOpClicked);
		}

		Trace.WriteLine("Adding Clear and Calculate");

		btnClear.Location = new Point(165, 28);
		btnClear.Size = new Size(50, 25);
		btnClear.Text = "Clear";
		btnClear.Click += new System.EventHandler(btnClearClicked);

		btnEquals.Location = new Point(48, 180);
		btnEquals.Size = new Size(70, 30);
		btnEquals.TabIndex = 1;
		btnEquals.Text = "Calculate";
		btnEquals.Click += new System.EventHandler(btnEqualsClicked);

		Trace.WriteLine("Adding to Controls collection");

		Controls.Add(txtFormula);
		Controls.Add(lblFormula);
		Controls.Add(btnEquals);
		Controls.Add(btnClear);

		for (int i = 0; i < 10; i++) {
			Controls.Add(btnNumbers[i]);
		}

		for (int i = 0; i < 4; i++) {
			Controls.Add(btnOps[i]);
		}
		Trace.Unindent();
	}

	private void btnClearClicked(object sender, EventArgs evArgs) {
		txtFormula.Text = "";
	}

	private void btnNumbersClicked(object sender, EventArgs evArgs) {
		Button btn = (Button) sender;
		Trace.WriteLine(btn.Text + " Clicked");
		txtFormula.Text += btn.Text;

		string test;
		test = txtFormula.Text;
		Trace.Assert(test != "0", "Oops", "Leading zero");
		Trace.WriteLineIf(test == "0", "Oops: Leading zero");
	}

	private void btnOpClicked(object sender, EventArgs evArgs) {
		Button btn = (Button) sender;
		Trace.WriteLine(btn.Text + " Clicked");
		txtFormula.Text += " " + btn.Text + " ";
	}

	private void btnEqualsClicked(object sender, EventArgs evArgs) {
		// parse the formula and get the arguments
		Trace.WriteLine("Calculate Clicked");
		if (txtFormula.Text != "") 
		{
			try 
			{
				Parser p = new Parser();
				Arguments a = p.Parse(txtFormula.Text);
				// do the calc and display the results
				IntegerMath m = new IntegerMath();
				txtFormula.Text = m.GetResult(Convert.ToInt32(a.Arg1), a.Op, Convert.ToInt32(a.Arg2));
			}
			catch 
			{
				MessageBox.Show("Invalid Formula. Please try again.", "Integer Calculator");
			}
		}
	}

	[System.STAThreadAttribute()]
	public static void Main(string[] args) {
		Form f = new VersioningDemo();
		f.ShowDialog();
		//throw(new System.Exception());  //a runtime error
	}
}
}


