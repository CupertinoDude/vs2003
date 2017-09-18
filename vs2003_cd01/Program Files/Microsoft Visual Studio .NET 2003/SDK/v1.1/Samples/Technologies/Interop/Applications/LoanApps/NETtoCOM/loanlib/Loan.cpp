// Loan.cpp : Implementation of CLoan
#include "stdafx.h"
#include "math.h"
#include "LoanLib.h"
#include "Loan.h"

/////////////////////////////////////////////////////////////////////////////
// CLoan
static double Round(double value, short digits); 


STDMETHODIMP CLoan::get_OpeningBalance(double *pVal)
{
	*pVal = OpeningBalance;

	return S_OK;
}

STDMETHODIMP CLoan::put_OpeningBalance(double newVal)
{
	OpeningBalance = newVal;

	return S_OK;
}

STDMETHODIMP CLoan::get_Rate(double *pVal)
{
	*pVal = Rate;

	return S_OK;
}

STDMETHODIMP CLoan::put_Rate(double newVal)
{
	Rate = newVal;

	return S_OK;
}

STDMETHODIMP CLoan::get_Payment(double *pVal)
{
	*pVal = Payment;

	return S_OK;
}

STDMETHODIMP CLoan::put_Payment(double newVal)
{
	Payment = newVal;

	return S_OK;
}

STDMETHODIMP CLoan::get_Term(short *pVal)
{
	*pVal = Term;

	return S_OK;
}

STDMETHODIMP CLoan::put_Term(short newVal)
{
	Term = newVal;

	return S_OK;
}

STDMETHODIMP CLoan::ComputePayment(double *pVal)
{
	Payment = Round(OpeningBalance * (Rate / (1 - pow((1 + Rate), -Term))),2);

	*pVal = Payment;

	return S_OK;
}

STDMETHODIMP CLoan::ComputeOpeningBalance(double *pVal)
{
	OpeningBalance = Round(Payment / (Rate / (1 - pow((1 + Rate), -Term))),2);

	*pVal = OpeningBalance ;

	return S_OK;
}

STDMETHODIMP CLoan::ComputeRate(double *pVal)
{
	double DesiredPayment = Payment;

	for (Rate = 0.001; Rate < 28.0; Rate += 0.001)
	{
		Payment = Round(OpeningBalance * (Rate / (1 - pow((1 + Rate), -Term))),2);

		if (Payment >= DesiredPayment)
			break;

	}

	*pVal = Rate;	

	return S_OK;
}

STDMETHODIMP CLoan::ComputeTerm(short *pVal)
{
	double DesiredPayment = Payment;

	for (Term = 1; Term < 480 ; Term ++)
	{
		Payment = Round(OpeningBalance * (Rate / (1 - pow((1 + Rate), -Term))),2);

		if (Payment <= DesiredPayment)
			break;
	}

	*pVal = Term;	

	return S_OK;
}

STDMETHODIMP CLoan::GetFirstPmtDistribution(double PmtAmt, double *Balance, double *PrinPortion, double *IntPortion, VARIANT_BOOL *pVal)
{
	*Balance = OpeningBalance;

	GetNextPmtDistribution(PmtAmt, Balance, PrinPortion, IntPortion, pVal);
	return S_OK;
}

STDMETHODIMP CLoan::GetNextPmtDistribution(double PmtAmt, double *Balance, double *PrinPortion, double *IntPortion, VARIANT_BOOL *pVal)
{
	*IntPortion = Round(*Balance * Rate, 2);
	*PrinPortion = Round(PmtAmt - *IntPortion, 2);
	*Balance = Round(*Balance - *PrinPortion, 2);

	if (*Balance <= 0.0)
		*pVal = FALSE;
	else
		*pVal = TRUE;

	return S_OK;
}


STDMETHODIMP CLoan::get_RiskRating(BSTR *pVal)
{
	*pVal = RiskRating;

	return S_OK;
}

STDMETHODIMP CLoan::put_RiskRating(BSTR newVal)
{
	RiskRating = newVal;

	return S_OK;
}

static double Round(double value, short digits) 
{
	double factor = pow(10, digits);

	return floor(value * factor + 0.5)/factor;
}