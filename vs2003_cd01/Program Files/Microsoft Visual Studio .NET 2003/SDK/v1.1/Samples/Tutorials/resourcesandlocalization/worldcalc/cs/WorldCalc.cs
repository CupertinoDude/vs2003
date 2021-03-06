//==========================================================================
//  File:		worldcalc.cs
//
//==========================================================================

[assembly: System.Reflection.AssemblyVersion("1.0.0.0")]

namespace Demo.Localize {

    using System;
    using System.Reflection;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
    using System.Resources;
    using System.Globalization;
    using System.Threading;

    using Demo.Localize.Math;
    using Demo.Localize.ParseUtil;

    public class VersioningDemo : Form {
        private System.ComponentModel.Container components;

		private ResourceManager rm;
		//private ResourceSet rs; // Used when working with a ResourceManager (See code below)

        private TextBox txtFormula;
		private Label   lblFormula;
		private Button  btnEquals;
		private Button  btnClear;
		private Button[]  btnNumbers;
		private Button[]  btnOps;

        public VersioningDemo(string culture) {
		//
		// If a specific culture is passed in through the command-line, use that -- otherwise
		// just use the current ui culture
		//
		if (culture != "") 
			try {
				Thread.CurrentThread.CurrentUICulture = new CultureInfo(culture);
			}
			catch (ArgumentException e){
				MessageBox.Show(this, e.Message, "Bad command-line argument");
			}

		InitializeComponent();
	
        }

	protected override void Dispose(bool disposing) {
		if (disposing){
			components.Dispose();
		}
		base.Dispose(disposing);
	}

        private void InitializeComponent() 
		{

			//  		
			// Create an instance of the resource manager.  The second parameter identifies
			// the "main" assembly.  All searching for satellites is done based on the location, etc ..
			// of the main assembly.
			//
			rm = new ResourceManager("MyStrings",  
                                      this.GetType().Assembly); 
									  
			//
			// ResourceSet loads all resources at one time. No "Fallback" provided.
			// To test using ResourceSet, change "rm.GetString()" to "rs.GetString()"
			// and uncomment the following line.
			//
			//rs = rm.GetResourceSet(Thread.CurrentThread.CurrentUICulture, true, true); 
                     
            components = new System.ComponentModel.Container();
            txtFormula = new TextBox();
			lblFormula = new Label();
			btnEquals  = new Button();
			btnClear   = new Button();
			btnNumbers = new Button[10];
			btnOps     = new Button[4];

            AutoScaleBaseSize = new System.Drawing.Size(5, 13);

			this.Text = rm.GetString("Math_Greeting");

            this.ClientSize = new System.Drawing.Size(250, 230);

            lblFormula.Location = new System.Drawing.Point(8, 10);
            lblFormula.Text = rm.GetString("Math_Formula_Label");
            lblFormula.Size = new System.Drawing.Size(155, 20);

            txtFormula.Location = new System.Drawing.Point(8, 28);
            txtFormula.TabIndex = 0;
            txtFormula.Size = new System.Drawing.Size(150, 25);
            txtFormula.ReadOnly = true;


            btnClear.Location = new Point(165, 28);
            btnClear.Size = new Size(80, 25);
            btnClear.Text = rm.GetString("Math_Clear_Button");
            btnClear.Click += new System.EventHandler(btnClearClicked);


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

			for (int i = 0; i < 10; i++) {
			    btnNumbers[i].Size = new Size(30, 30);
			    btnNumbers[i].Click += new System.EventHandler(btnNumbersClicked);
			}

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


			btnEquals.Location = new Point(48, 180);
			btnEquals.Size = new Size(70, 30);
			btnEquals.TabIndex = 1;
            btnEquals.Text = rm.GetString("Math_Calc_Button");
            btnEquals.Click += new System.EventHandler(btnEqualsClicked);

			

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
	    }


        private void btnClearClicked(object sender, EventArgs evArgs) {
            txtFormula.Text = "";
        }

        private void btnNumbersClicked(object sender, EventArgs evArgs) {
            Button btn = (Button) sender;
            txtFormula.Text += btn.Text;
        }

        private void btnOpClicked(object sender, EventArgs evArgs) {
            Button btn = (Button) sender;
            txtFormula.Text = txtFormula.Text + " " + btn.Text + " ";
        }

        private void btnEqualsClicked(object sender, EventArgs evArgs) {
			// parse the formula and get the arguments
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
					MessageBox.Show(rm.GetString("Math_Calc_Error"), rm.GetString("Math_Greeting"));
				}
			}
        }

        [System.STAThreadAttribute()]
        public static void Main(string[] args) {
			
			//
			// Main takes an optional argument identifying the culture you'd like displayed.
			//
		
			String strCulture = "";
			if (args.Length == 1) 
			{
				strCulture = args[0];
			}

            Application.Run(new VersioningDemo(strCulture));
        }

    }
}


