using System;
using LoanLib;

namespace ConLoan {

public class LoanApp {

    public static void Main(String[] Args) {

		Loan ln = new Loan();
		
		if (Args.Length < 4) 
		{
			Console.WriteLine("Usage: ConLoan Balance Rate Term Payment");
			Console.WriteLine("    Either Balance, Rate, Term, or Payment must be 0");
			return;
		}

		ln.OpeningBalance = Convert.ToDouble(Args[0]);
		ln.Rate = Convert.ToDouble(Args[1])/100.0;
		ln.Term = Convert.ToInt16(Args[2]);
		ln.Payment = Convert.ToDouble(Args[3]);
		
		if (ln.OpeningBalance == 0.00) ln.ComputeOpeningBalance();
		if (ln.Rate == 0.00) ln.ComputeRate();
		if (ln.Term == 0) ln.ComputeTerm();
		if (ln.Payment == 0.00) ln.ComputePayment();

		Console.WriteLine("Balance = {0,10:0.00}", ln.OpeningBalance);
		Console.WriteLine("Rate    = {0,10:0.0%}", ln.Rate);
		Console.WriteLine("Term    = {0,10:0.00}", ln.Term);
		Console.WriteLine("Payment = {0,10:0.00}\n", ln.Payment);

		bool MorePmts;
		double Balance = 0.0;
		double Principal = 0.0;
		double Interest = 0.0;

		Console.WriteLine("{0,4}{1,10}{2,12}{3,10}{4,12}", "Nbr", "Payment", "Principal", "Interest", "Balance");
		Console.WriteLine("{0,4}{1,10}{2,12}{3,10}{4,12}", "---", "-------", "---------", "--------", "-------");

		MorePmts = ln.GetFirstPmtDistribution(ln.Payment, out Balance, out Principal, out Interest);

		for (short PmtNbr = 1; MorePmts; PmtNbr++) {
		
		    Console.WriteLine("{0,4}{1,10:0.00}{2,12:0.00}{3,10:0.00}{4,12:0.00}",
			PmtNbr, ln.Payment, Principal, Interest, Balance);
			
		    MorePmts = ln.GetNextPmtDistribution(ln.Payment, ref Balance, out Principal, out Interest); 

		}
    }
}
}


