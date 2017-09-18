// DllCol.cpp : Implementation of CDllCol
#include "stdafx.h"
#include "ModuleCol.h"
#include "DllCol.h"

/////////////////////////////////////////////////////////////////////////////
// CDllCol


STDMETHODIMP CDllCol::ProcName(BSTR *psName)
{
	CComBSTR bName = m_sProcName;
	*psName = bName.Detach();
	return S_OK;
}
