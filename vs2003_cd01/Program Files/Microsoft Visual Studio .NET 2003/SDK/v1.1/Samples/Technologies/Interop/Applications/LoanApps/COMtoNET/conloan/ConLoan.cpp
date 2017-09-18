// ConLoan.cpp : Defines the entry point for the console application.
//
#include "stdafx.h"
#import "..\LoanLib\LoanLib.tlb" raw_interfaces_only
using namespace LoanLib;

int main(int argc, char* argv[])
{
	HRESULT hr = CoInitialize(NULL);

	ILoanPtr pILoan(__uuidof(Loan));

	if (argc < 5) 
	{
		printf("Usage: ConLoan Balance Rate Term Payment\n");
		printf("    Either Balance, Rate, Term, or Payment must be 0\n");
		return -1;
	}

	double openingBalance = atof(argv[1]);
	double rate = atof(argv[2])/100.0;
	short  term = atoi(argv[3]);
	double payment = atof(argv[4]);

	pILoan->put_OpeningBalance(openingBalance);
	pILoan->put_Rate(rate);
	pILoan->put_Term(term);
	pILoan->put_Payment(payment);

	if (openingBalance == 0.00) pILoan->ComputeOpeningBalance(&openingBalance);
	if (rate == 0.00) pILoan->ComputeRate(&rate);
	if (term == 0) pILoan->ComputeTerm(&term);
	if (payment == 0.00) pILoan->ComputePayment(&payment);

	printf("Balance = %.2f\n", openingBalance);
	printf("Rate    = %.1f%%\n", rate*100);
	printf("Term    = %.2i\n", term);
	printf("Payment = %.2f\n", payment);

	VARIANT_BOOL MorePmts;
	double Balance = 0.0;
	double Principal = 0.0;
	double Interest = 0.0;

	printf("%4s%10s%12s%10s%12s\n", "Nbr", "Payment", "Principal", "Interest", "Balance");
	printf("%4s%10s%12s%10s%12s\n", "---", "-------", "---------", "--------", "-------");

	pILoan->GetFirstPmtDistribution(payment, &Balance, &Principal, &Interest, &MorePmts);

	for (short PmtNbr = 1; MorePmts; PmtNbr++) 
	{
		printf("%4i%10.2f%12.2f%10.2f%12.2f\n",
		PmtNbr, payment, Principal, Interest, Balance);
		
		pILoan->GetNextPmtDistribution(payment, &Balance, &Principal, &Interest, &MorePmts); 
	}

	CoUninitialize();
	return 0;
}

