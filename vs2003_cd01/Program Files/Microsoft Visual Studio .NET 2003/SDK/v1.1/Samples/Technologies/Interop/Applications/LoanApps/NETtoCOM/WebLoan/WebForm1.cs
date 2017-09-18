namespace WebLoan
{
    using System;
    using System.Collections;
    using System.ComponentModel;
    using System.Data;
    using System.Drawing;
    using System.Web;
    using System.Web.SessionState;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    /// <summary>
    ///    Summary description for WebForm1.
    /// </summary>
    public class WebForm1 : System.Web.UI.Page
    {
		protected System.Web.UI.HtmlControls.HtmlTable DetailsTable;
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
		protected System.Web.UI.WebControls.Button Button2;
		protected System.Web.UI.WebControls.TextBox Payment;
		protected System.Web.UI.WebControls.TextBox Term;
		protected System.Web.UI.WebControls.TextBox Rate;
		protected System.Web.UI.WebControls.TextBox Balance;
		protected System.Web.UI.WebControls.DataList dataList1;
	
	public WebForm1()
	{
	    Page.Init += new System.EventHandler(Page_Init);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //
                // Evals true first time browser hits the page
                //
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Windows Form Designer.
            //
            InitializeComponent();
        }

        /// <summary>
        ///    Required method for Designer support - do not modify
        ///    the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
		{
			Button2.Click += new System.EventHandler (this.Button2_Click);
			this.Load += new System.EventHandler (this.Page_Load);
		}

		public void Button2_Click (object sender, System.EventArgs e)
		{
			LoanLib.Loan ln = new LoanLib.Loan();

			if (Rate.Text.Length > 0) ln.Rate = Convert.ToDouble(Rate.Text)/100.0;
			if (Payment.Text.Length > 0) ln.Payment = Convert.ToDouble(Payment.Text);
			if (Balance.Text.Length > 0) ln.OpeningBalance = Convert.ToDouble(Balance.Text);
			if (Term.Text.Length > 0) ln.Term = Convert.ToInt16(Term.Text);

			ln.ComputePayment();

			Payment.Text = String.Format("{0:0.00}", ln.Payment);
			Balance.Text = String.Format("{0:0.00}", ln.OpeningBalance);
			Rate.Text =  String.Format("{0:0.00}", ln.Rate*100.0);
			Term.Text =  ln.Term.ToString();

			DataGrid1.DataSource = CreateDataSource(ln);
			DataGrid1.DataBind();
   		
		}

		ICollection CreateDataSource(LoanLib.Loan ln) {
			double Principal = 0.0;
			double Interest = 0.0;
			double RemainingBalance = 0.0;
			DataTable dt = new DataTable();
			DataRow dr;

			dt.Columns.Add(new DataColumn("PmtNbr", typeof(Int32)));
			dt.Columns.Add(new DataColumn("Balance", typeof(double)));
			dt.Columns.Add(new DataColumn("Payment", typeof(double)));
			dt.Columns.Add(new DataColumn("Principal", typeof(double)));
			dt.Columns.Add(new DataColumn("Interest", typeof(double)));
			dt.Columns.Add(new DataColumn("EndBalance", typeof(double)));
			       
			bool MorePmts = ln.GetFirstPmtDistribution(ln.Payment, out RemainingBalance , out Principal, out Interest);
 
			for (short PmtNbr = 1; MorePmts; PmtNbr++)
			{
				dr = dt.NewRow();
				dr[0] = PmtNbr;
				dr[1] = RemainingBalance + Principal;
				dr[2] = ln.Payment;
				dr[3] = Principal;
				dr[4] = Interest;
				dr[5] = RemainingBalance;
				dt.Rows.Add(dr);

				MorePmts = ln.GetNextPmtDistribution(ln.Payment, ref RemainingBalance , out Principal, out Interest);
			}

			DataView dv = new DataView(dt);
			return dv;
		}
	          

    }
}
