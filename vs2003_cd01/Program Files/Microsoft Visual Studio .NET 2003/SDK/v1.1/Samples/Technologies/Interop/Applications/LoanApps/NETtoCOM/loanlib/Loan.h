// Loan.h : Declaration of the CLoan

#ifndef __LOAN_H_
#define __LOAN_H_

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CLoan
class ATL_NO_VTABLE CLoan : 
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CLoan, &CLSID_Loan>,
	public IDispatchImpl<ILoan, &IID_ILoan, &LIBID_LoanLib>
{
public:
	CLoan()
	{
	}

DECLARE_REGISTRY_RESOURCEID(IDR_LOAN)

DECLARE_PROTECT_FINAL_CONSTRUCT()

BEGIN_COM_MAP(CLoan)
	COM_INTERFACE_ENTRY(ILoan)
	COM_INTERFACE_ENTRY(IDispatch)
END_COM_MAP()

private:
	double OpeningBalance;
	double Rate;
	double Payment;
	short Term;
	CComBSTR RiskRating;

// ILoan
public:
	STDMETHOD(get_RiskRating)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_RiskRating)(/*[in]*/ BSTR newVal);
	STDMETHOD(GetNextPmtDistribution)(/*[in]*/ double PmtAmt, /*[in, out]*/ double *Balance, /*[out]*/ double *PrinPortion, /*[out]*/ double *IntPortion, /*[out, retval]*/ VARIANT_BOOL *pVal);
	STDMETHOD(GetFirstPmtDistribution)(/*[in]*/ double PmtAmt, /*[out]*/ double *Balance, /*[out]*/ double *PrinPortion, /*[out]*/ double *IntPortion, /*[out, retval]*/ VARIANT_BOOL *pVal);
	STDMETHOD(ComputeTerm)(/*[out, retval]*/ short *pVal);
	STDMETHOD(ComputeOpeningBalance)(/*[out, retval]*/ double *pVal);
	STDMETHOD(ComputeRate)(/*[out, retval]*/ double *pVal);
	STDMETHOD(ComputePayment)(/*[out, retval]*/ double *pVal);
	STDMETHOD(get_Term)(/*[out, retval]*/ short *pVal);
	STDMETHOD(put_Term)(/*[in]*/ short newVal);
	STDMETHOD(get_Payment)(/*[out, retval]*/ double *pVal);
	STDMETHOD(put_Payment)(/*[in]*/ double newVal);
	STDMETHOD(get_Rate)(/*[out, retval]*/ double *pVal);
	STDMETHOD(put_Rate)(/*[in]*/ double newVal);
	STDMETHOD(get_OpeningBalance)(/*[out, retval]*/ double *pVal);
	STDMETHOD(put_OpeningBalance)(/*[in]*/ double newVal);
};

#endif //__LOAN_H_
