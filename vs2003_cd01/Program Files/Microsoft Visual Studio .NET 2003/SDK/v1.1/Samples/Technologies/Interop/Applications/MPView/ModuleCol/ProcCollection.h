// ProcCollection.h : Declaration of the CProcCollection

#ifndef __PROCCOLLECTION_H_
#define __PROCCOLLECTION_H_

#include "resource.h"       // main symbols
#include "DllCol.h"
#include "DLink.h"

typedef CComObject<CDllCol> tCDllCol;

/////////////////////////////////////////////////////////////////////////////
// CProcCollection
class ATL_NO_VTABLE CProcCollection : 
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CProcCollection, &CLSID_ProcCollection>,
	public IDispatchImpl<IProcCollection, &IID_IProcCollection, &LIBID_MODULECOLLib>
{
public:
	CProcCollection()
	{
	}

	~CProcCollection();

DECLARE_REGISTRY_RESOURCEID(IDR_PROCCOLLECTION)

DECLARE_PROTECT_FINAL_CONSTRUCT()

BEGIN_COM_MAP(CProcCollection)
	COM_INTERFACE_ENTRY(IProcCollection)
	COM_INTERFACE_ENTRY(IDispatch)
END_COM_MAP()

// IProcCollection
public:
	STDMETHOD(GetCount)(/*[out, retval]*/long * pPCount);
	STDMETHOD(GetNextProc)(/*[in]*/ long nIndex, /*[out]*/IDllCol **, /*[out, retval]*/ long * lNext);
	STDMETHOD(GetFirstProc)(/*[out]*/IDllCol ** pUnk, /*[out, retval]*/long * phEnum);
	STDMETHOD(EnumerateProc)(/*[out, retval]*/long * pSuccess);

private:

	void CleanUp();

private:
	CDLink<tCDllCol> m_ProcLink;



};

#endif //__PROCCOLLECTION_H_
