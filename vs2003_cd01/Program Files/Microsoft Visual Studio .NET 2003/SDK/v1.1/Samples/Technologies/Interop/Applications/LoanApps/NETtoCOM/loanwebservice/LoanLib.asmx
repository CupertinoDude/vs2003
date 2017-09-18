<%@ WebService Language="C#" Class="LoanLibWrapper" %>

using System;
using System.Data;
using System.Web.Services;
using LoanLib;

public class LoanLibWrapper : WebService
{
	[WebMethod]
	public double Calculate(double Balance, double Rate, short Term, double Payment)
	{
		Loan ln = new Loan();
		ln.OpeningBalance = Balance;
		ln.Rate = Rate/100;
		ln.Term = Term;
		ln.Payment = Payment;
		
		if (Rate > 0.0 && Term > 0.0 && Balance > 0.0)
		{
			ln.ComputePayment();
			return ln.Payment;
		}
		else if (Rate == 0.0) 
		{
			ln.ComputeRate();
			return ln.Rate*100;
		}
		else if (Term == 0.0) 
		{
			ln.ComputeTerm();
			return ln.Term;
		}
		else if (Balance == 0.0) 
		{
			ln.ComputeOpeningBalance();
			return ln.OpeningBalance;
		}
		return 0;
	}
	
	[WebMethod]
	public DataSet Amortize(double Balance, double Rate, short Term, double Payment)
	{
		Loan ln = new Loan();
		ln.OpeningBalance = Balance;
		ln.Rate = Rate/100;
		ln.Term = Term;
		ln.Payment = Payment;
		
		if (Rate > 0.0 && Term > 0.0 && Balance > 0.0)
			ln.ComputePayment();
		else if (Rate == 0.0) 
			ln.ComputeRate();
		else if (Term == 0.0) 
			ln.ComputeTerm();
		else if (Balance == 0.0) 
			ln.ComputeOpeningBalance();
			
		DataSet ds = new DataSet();
		DataTable dt = new DataTable();
		DataColumn dc;
		DataRow dr;
			
		dc = new DataColumn("month", System.Type.GetType("System.Int16"));
		dt.Columns.Add(dc);
		dc = new DataColumn("payment", System.Type.GetType("System.Double"));
		dt.Columns.Add(dc);
		dc = new DataColumn("principal", System.Type.GetType("System.Double"));
		dt.Columns.Add(dc);
		dc = new DataColumn("interest", System.Type.GetType("System.Double"));
		dt.Columns.Add(dc);
		dc = new DataColumn("balance", System.Type.GetType("System.Double"));
		dt.Columns.Add(dc);
		
		ds.Tables.Add(dt);
		
		bool MorePmts;
		double curBalance = 0.0;
		double Principal = 0.0;
		double Interest = 0.0;

		MorePmts = ln.GetFirstPmtDistribution(ln.Payment, out curBalance, out Principal, out Interest);

		for (short PmtNbr = 1; MorePmts; PmtNbr++) 
		{
			dr = dt.NewRow();
			dr["month"] = PmtNbr;
			dr["payment"] = ln.Payment;
			dr["principal"] = Principal;
			dr["interest"] = Interest;
			dr["balance"] = curBalance;
			dt.Rows.Add(dr);		
			
		    MorePmts = ln.GetNextPmtDistribution(ln.Payment, ref curBalance, out Principal, out Interest);		}		
		return ds;
	}
}