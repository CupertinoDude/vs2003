using System;
using System.Reflection;
 
[assembly:AssemblyKeyFile("sample.snk")]
[assembly:AssemblyVersion("1.0.0.0")]

namespace LoanLib {
	
	public interface ILoan {
		double OpeningBalance{get; set;}
		double Rate{get; set;}
		double Payment{get; set;}	
		short  Term{get; set;}
		String RiskRating{get; set;}
		
   		double ComputePayment();
   		double ComputeOpeningBalance();
   		double ComputeRate();
   		short ComputeTerm();
   		bool GetFirstPmtDistribution(double PmtAmt, ref double Balance, out double PrinPortion, out double IntPortion);
   		bool GetNextPmtDistribution(double PmtAmt, ref double Balance, out double PrinPortion, out double IntPortion);
   	}

	public class Loan : ILoan {
		private double openingBalance;
		private double rate;
		private double payment;
		private short  term;
		private String riskRating;		
		
		public double OpeningBalance {
			get { return openingBalance; }
			set { openingBalance = value; }
		}
		
		public double Rate {
			get { return rate; }
			set { rate = value; }
		}
		
		public double Payment {
			get { return payment; }
			set { payment = value; }
		}
			
		public short Term {
			get { return term; }
			set { term = value; }
		}
			
		public String RiskRating {
			get { return riskRating; }
			set { riskRating = value; }
		}
		
		public double ComputePayment() {
		    Payment = Util.Round(OpeningBalance * (Rate / (1 - Math.Pow((1 + Rate), -Term))), 2);
		    return Payment;
		}

		public double ComputeOpeningBalance() {
			OpeningBalance = Util.Round(Payment / (Rate / (1 - Math.Pow((1 + Rate), -Term))), 2);
		    return OpeningBalance;
		}

		public double ComputeRate() {
			double DesiredPayment = Payment;

			for (Rate = 0.001; Rate < 28.0; Rate += 0.001) {
				Payment = Util.Round(OpeningBalance * (Rate / (1 - Math.Pow((1 + Rate), -Term))), 2);

				if (Payment >= DesiredPayment)
					break;
			}
			return Rate;	
		}

		public short ComputeTerm() {
			double DesiredPayment = Payment;

			for (Term = 1; Term < 480 ; Term ++) {
				Payment = Util.Round(OpeningBalance * (Rate / (1 - Math.Pow((1 + Rate), -Term))),2);

				if (Payment <= DesiredPayment)
					break;
			}

			return Term;	
		}

		public bool GetFirstPmtDistribution(double PmtAmt, ref double Balance, out double PrinPortion, out double IntPortion) {
		    Balance = OpeningBalance;
		    return GetNextPmtDistribution(PmtAmt, ref Balance, out PrinPortion, out IntPortion); 
		
		}

		public bool GetNextPmtDistribution(double PmtAmt, ref double Balance, out double PrinPortion, out double IntPortion) {
		    IntPortion = Util.Round(Balance * Rate, 2);
		    PrinPortion = Util.Round(PmtAmt - IntPortion,2);
		    Balance = Util.Round(Balance - PrinPortion,2);

		    if (Balance <= 0.0) 
			return false;

		    return true;
		}
    }

	internal class Util {
		//fixed precision rounding
		public static double Round(double value, short digits) {
			double factor = Math.Pow(10, digits);
			return Math.Round(value * factor) / factor;
	    }
	}

}
