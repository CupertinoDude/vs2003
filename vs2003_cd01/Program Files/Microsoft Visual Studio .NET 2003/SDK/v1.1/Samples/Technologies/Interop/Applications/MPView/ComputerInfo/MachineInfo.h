// MachineInfo.h : Declaration of the CMachineInfo

#ifndef __MACHINEINFO_H_
#define __MACHINEINFO_H_

#include "resource.h"       // main symbols
#include <TCHAR.h>

/////////////////////////////////////////////////////////////////////////////
// CMachineInfo
class ATL_NO_VTABLE CMachineInfo : 
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CMachineInfo, &CLSID_MachineInfo>,
	public IDispatchImpl<IMachineInfo, &IID_IMachineInfo, &LIBID_COMPUTERINFOLib>
{
public:
	CMachineInfo()
	{
		QueryInformation();
	}

DECLARE_REGISTRY_RESOURCEID(IDR_MACHINEINFO)

DECLARE_PROTECT_FINAL_CONSTRUCT()

BEGIN_COM_MAP(CMachineInfo)
	COM_INTERFACE_ENTRY(IMachineInfo)
	COM_INTERFACE_ENTRY(IDispatch)
END_COM_MAP()

// IMachineInfo
public:
	STDMETHOD(get_MaxAppAddress)(/*[out, retval]*/ long *pVal);
	STDMETHOD(get_ServicePack)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(get_PlatForm)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(get_MachineType)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(get_ProcessorLevel)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(get_AllocationGranularity)(/*[out, retval]*/ long *pVal);
	STDMETHOD(get_NumberOfProcessors)(/*[out, retval]*/ long *pVal);
	STDMETHOD(get_ProcessorMask)(/*[out, retval]*/ long *pVal);
	STDMETHOD(get_MinAppAddress)(/*[out, retval]*/ long *pVal);
	STDMETHOD(get_PageSize)(/*[out, retval]*/ long *pVal);
	STDMETHOD(get_ProcessorArchitecture)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(get_ComputerName)(/*[out, retval]*/ BSTR *pVal);

private:

	void QueryInformation(); 

	TCHAR m_tcCompName[MAX_COMPUTERNAME_LENGTH + 1];
	TCHAR m_tcProcArch[50];
	long m_lPageSize;
	long m_lMinAppAddr;
	long m_lMaxAppAddr;
	long m_lProcMask;
	long m_lProcNum;
	long m_lAllocGranularity;
	TCHAR m_tcProcLevel[50];
	TCHAR m_tcOSType[50];
	TCHAR m_tcPlatForm[50];
	TCHAR m_ctServicePack[50];
};

#endif //__MACHINEINFO_H_
