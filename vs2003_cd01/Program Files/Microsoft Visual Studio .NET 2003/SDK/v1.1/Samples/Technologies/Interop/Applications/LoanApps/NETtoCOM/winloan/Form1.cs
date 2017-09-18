namespace WinLoan
{
    using System;
    using System.Drawing;
    using System.Collections;
    using System.ComponentModel;
    using System.Windows.Forms;
    using System.Data;
    using System.Threading;

    /// <summary>
    ///    Summary description for Form1.
    /// </summary>
    public class Form1 : System.Windows.Forms.Form
    {
        /// <summary>
        ///    Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components;
		private System.Windows.Forms.Button button5;
		private System.Windows.Forms.Button button4;
		private System.Windows.Forms.Button button3;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.TextBox txtRiskRating;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.Button btnExit;
		private System.Windows.Forms.Button btnAmort;
		private System.Windows.Forms.Button btnCalculate;
		private System.Windows.Forms.TextBox txtPayment;
		private System.Windows.Forms.TextBox txtTerm;
		private System.Windows.Forms.TextBox txtRate;
		private System.Windows.Forms.TextBox txtBalance;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.ListView lstAmort;
		private LoanLib.Loan ln;

        public Form1()
        {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

			ln = new LoanLib.Loan();
			lstAmort.Columns.Add("Pmt",30,HorizontalAlignment.Left);
			lstAmort.Columns.Add("Payment",68,HorizontalAlignment.Right);
			lstAmort.Columns.Add("Principal",70,HorizontalAlignment.Right);
			lstAmort.Columns.Add("Interest",70,HorizontalAlignment.Right);
			lstAmort.Columns.Add("Balance",70,HorizontalAlignment.Right);
         }

        /// <summary>
        ///    Clean up any resources being used.
        /// </summary>
        public new virtual void Dispose()
        {
            base.Dispose();
            components.Dispose();
        }

        /// <summary>
        ///    Required method for Designer support - do not modify
        ///    the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
		{
			this.components = new System.ComponentModel.Container ();
			this.button5 = new System.Windows.Forms.Button ();
			this.btnExit = new System.Windows.Forms.Button ();
			this.button4 = new System.Windows.Forms.Button ();
			this.txtRiskRating = new System.Windows.Forms.TextBox ();
			this.button3 = new System.Windows.Forms.Button ();
			this.label2 = new System.Windows.Forms.Label ();
			this.button2 = new System.Windows.Forms.Button ();
			this.btnCalculate = new System.Windows.Forms.Button ();
			this.txtPayment = new System.Windows.Forms.TextBox ();
			this.button1 = new System.Windows.Forms.Button ();
			this.txtBalance = new System.Windows.Forms.TextBox ();
			this.label5 = new System.Windows.Forms.Label ();
			this.lstAmort = new System.Windows.Forms.ListView ();
			this.label4 = new System.Windows.Forms.Label ();
			this.txtRate = new System.Windows.Forms.TextBox ();
			this.txtTerm = new System.Windows.Forms.TextBox ();
			this.label3 = new System.Windows.Forms.Label ();
			this.label1 = new System.Windows.Forms.Label ();
			this.btnAmort = new System.Windows.Forms.Button ();
			//@this.TrayHeight = 90;
			//@this.TrayLargeIcon = false;
			//@this.TrayAutoArrange = true;
			button5.Location = new System.Drawing.Point (200, 120);
			button5.Size = new System.Drawing.Size (48, 22);
			button5.TabIndex = 14;
			button5.Text = "Clear";
			button5.Click += new System.EventHandler (this.button5_Click);
			btnExit.Location = new System.Drawing.Point (264, 88);
			btnExit.Size = new System.Drawing.Size (80, 24);
			btnExit.TabIndex = 17;
			btnExit.Text = "Exit";
			btnExit.Click += new System.EventHandler (this.btnExit_Click);
			button4.Location = new System.Drawing.Point (200, 96);
			button4.Size = new System.Drawing.Size (48, 22);
			button4.TabIndex = 13;
			button4.Text = "Clear";
			button4.Click += new System.EventHandler (this.button4_Click);
			txtRiskRating.Location = new System.Drawing.Point (112, 120);
			txtRiskRating.Text = "Medium";
			txtRiskRating.TabIndex = 9;
			txtRiskRating.Size = new System.Drawing.Size (75, 20);
			txtRiskRating.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			button3.Location = new System.Drawing.Point (200, 72);
			button3.Size = new System.Drawing.Size (48, 22);
			button3.TabIndex = 12;
			button3.Text = "Clear";
			button3.Click += new System.EventHandler (this.button3_Click);
			label2.Location = new System.Drawing.Point (16, 48);
			label2.Text = "Rate:";
			label2.Size = new System.Drawing.Size (128, 16);
			label2.Font = new System.Drawing.Font ("Microsoft Sans Serif", 10, System.Drawing.FontStyle.Bold);
			label2.TabIndex = 2;
			button2.Location = new System.Drawing.Point (200, 48);
			button2.Size = new System.Drawing.Size (48, 22);
			button2.TabIndex = 11;
			button2.Text = "Clear";
			button2.Click += new System.EventHandler (this.button2_Click);
			btnCalculate.Location = new System.Drawing.Point (264, 24);
			btnCalculate.Size = new System.Drawing.Size (80, 24);
			btnCalculate.TabIndex = 15;
			btnCalculate.Text = "Calculate";
			btnCalculate.Click += new System.EventHandler (this.btnCalculate_Click);
			txtPayment.Location = new System.Drawing.Point (112, 96);
			txtPayment.TabIndex = 8;
			txtPayment.Size = new System.Drawing.Size (75, 20);
			txtPayment.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			button1.Location = new System.Drawing.Point (200, 24);
			button1.Size = new System.Drawing.Size (48, 22);
			button1.TabIndex = 10;
			button1.Text = "Clear";
			button1.Click += new System.EventHandler (this.button1_Click);
			txtBalance.Location = new System.Drawing.Point (112, 24);
			txtBalance.Text = "10000";
			txtBalance.TabIndex = 0;
			txtBalance.Size = new System.Drawing.Size (75, 20);
			txtBalance.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			label5.Location = new System.Drawing.Point (16, 120);
			label5.Text = "Risk Rating:";
			label5.Size = new System.Drawing.Size (128, 16);
			label5.Font = new System.Drawing.Font ("Microsoft Sans Serif", 10, System.Drawing.FontStyle.Bold);
			label5.TabIndex = 12;
			label5.Click += new System.EventHandler (this.label5_Click);
			lstAmort.Location = new System.Drawing.Point (16, 160);
			lstAmort.Size = new System.Drawing.Size (328, 232);
			lstAmort.View = System.Windows.Forms.View.Details;
			lstAmort.ForeColor = System.Drawing.SystemColors.WindowText;
			lstAmort.TabIndex = 18;
			label4.Location = new System.Drawing.Point (16, 96);
			label4.Text = "Payment:";
			label4.Size = new System.Drawing.Size (128, 16);
			label4.Font = new System.Drawing.Font ("Microsoft Sans Serif", 10, System.Drawing.FontStyle.Bold);
			label4.TabIndex = 4;
			txtRate.Location = new System.Drawing.Point (112, 48);
			txtRate.Text = "1";
			txtRate.TabIndex = 6;
			txtRate.Size = new System.Drawing.Size (75, 20);
			txtRate.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			txtTerm.Location = new System.Drawing.Point (112, 72);
			txtTerm.Text = "60";
			txtTerm.TabIndex = 7;
			txtTerm.Size = new System.Drawing.Size (75, 20);
			txtTerm.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			label3.Location = new System.Drawing.Point (16, 72);
			label3.Text = "Term:";
			label3.Size = new System.Drawing.Size (128, 16);
			label3.Font = new System.Drawing.Font ("Microsoft Sans Serif", 10, System.Drawing.FontStyle.Bold);
			label3.TabIndex = 3;
			label1.Location = new System.Drawing.Point (16, 24);
			label1.Text = "Balance:";
			label1.Size = new System.Drawing.Size (128, 16);
			label1.Font = new System.Drawing.Font ("Microsoft Sans Serif", 10, System.Drawing.FontStyle.Bold);
			label1.TabIndex = 1;
			btnAmort.Location = new System.Drawing.Point (264, 56);
			btnAmort.Size = new System.Drawing.Size (80, 24);
			btnAmort.TabIndex = 16;
			btnAmort.Text = "Amortize";
			btnAmort.Click += new System.EventHandler (this.btnAmort_Click);
			this.Controls.Add (this.button5);
			this.Controls.Add (this.button4);
			this.Controls.Add (this.button3);
			this.Controls.Add (this.button2);
			this.Controls.Add (this.button1);
			this.Controls.Add (this.txtRiskRating);
			this.Controls.Add (this.label5);
			this.Controls.Add (this.btnExit);
			this.Controls.Add (this.btnAmort);
			this.Controls.Add (this.btnCalculate);
			this.Controls.Add (this.txtPayment);
			this.Controls.Add (this.txtTerm);
			this.Controls.Add (this.txtRate);
			this.Controls.Add (this.txtBalance);
			this.Controls.Add (this.label4);
			this.Controls.Add (this.label3);
			this.Controls.Add (this.label2);
			this.Controls.Add (this.label1);
			this.Controls.Add (this.lstAmort);
			this.Text = "WinLoan";
			this.AutoScaleBaseSize = new System.Drawing.Size (5, 13);
			this.ClientSize = new System.Drawing.Size (360, 405);
		}

		protected void btnCalculate_Click (object sender, System.EventArgs e)
		{
			if (txtBalance.Text.Length > 0) ln.OpeningBalance = Convert.ToDouble(txtBalance.Text);
				else ln.OpeningBalance = 0.0;
			if (txtRate.Text.Length > 0) ln.Rate = Convert.ToDouble(txtRate.Text)/100.0;
				else ln.Rate = 0.0;
			if (txtTerm.Text.Length > 0) ln.Term = Convert.ToInt16(txtTerm.Text);
				else ln.Term = 0;
			if (txtPayment.Text.Length > 0) ln.Payment = Convert.ToDouble(txtPayment.Text);
				else ln.Payment = 0.0;
			ln.RiskRating = txtRiskRating.Text;

			if (ln.Rate > 0.0 && ln.Term > 0.0 && ln.OpeningBalance > 0.0)
				ln.ComputePayment();
			else
			{
				if (ln.Rate == 0.0) ln.ComputeRate();
				if (ln.Term == 0.0) ln.ComputeTerm();
				if (ln.OpeningBalance == 0.0) ln.ComputeOpeningBalance();
			}

			txtPayment.Text = String.Format("{0:0.00}", ln.Payment);
			txtBalance.Text = String.Format("{0:0.00}", ln.OpeningBalance);
			txtRate.Text =  String.Format("{0:0.00}", ln.Rate*100.0);
			txtTerm.Text =  ln.Term.ToString();
			txtRiskRating.Text =  ln.RiskRating;
		}

		protected void btnAmort_Click (object sender, System.EventArgs e)
		{
			if (txtBalance.Text.Length == 0 || txtRate.Text.Length == 0 ||
			    txtTerm.Text.Length == 0 || txtPayment.Text.Length == 0)
				return;

			double Principal = 0.0;
			double Interest = 0.0;
			double Balance = 0.0;
			String[] SubItems = new String[5];

			lstAmort.Items.Clear();

			bool MorePmts = ln.GetFirstPmtDistribution(ln.Payment, out Balance, out Principal, out Interest);

			for (short PmtNbr = 1; MorePmts; PmtNbr++)
			{
				SubItems[0] = PmtNbr.ToString();
				SubItems[1] = String.Format("{0:0.00}", ln.Payment);
				SubItems[2] = String.Format("{0:0.00}", Principal);
				SubItems[3] = String.Format("{0:0.00}", Interest);
				SubItems[4] = String.Format("{0:0.00}", Balance);

				ListViewItem lvItem = new ListViewItem(SubItems);
				lstAmort.Items.Add(lvItem);

				MorePmts = ln.GetNextPmtDistribution(ln.Payment, ref Balance, out Principal, out Interest);
			}
		}

		protected void btnExit_Click (object sender, System.EventArgs e)
		{
			Application.Exit();
		}


		protected void button5_Click (object sender, System.EventArgs e)
		{
			txtRiskRating.Text = "";
		}

		protected void button4_Click (object sender, System.EventArgs e)
		{
			txtPayment.Text = "";
		}

		protected void button3_Click (object sender, System.EventArgs e)
		{
			txtTerm.Text = "";
		}

		protected void button2_Click (object sender, System.EventArgs e)
		{
			txtRate.Text = "";
		}

		protected void button1_Click (object sender, System.EventArgs e)
		{
			txtBalance.Text = "";
		}

		protected void label5_Click (object sender, System.EventArgs e)
		{
			txtRiskRating.Text = "";
		}

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        public static void Main(string[] args)
        {
            Thread.CurrentThread.ApartmentState = ApartmentState.STA;
            Application.Run(new Form1());
        }
    }
}
