// FileInfo.h : Declaration of the CFileInfo

#ifndef __FILEINFO_H_
#define __FILEINFO_H_

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CFileInfo
class ATL_NO_VTABLE CFileInfo : 
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CFileInfo, &CLSID_FileInfo>,
	public IDispatchImpl<IFileInfo, &IID_IFileInfo, &LIBID_COMPUTERINFOLib>
{
public:
	CFileInfo()
	{
		m_sModifyTime[0] = '\0';
		m_sCreationTime[0] = '\0';
		m_sAccessTime[0] = '\0';
		m_lFileSize = 0l;
	}

DECLARE_REGISTRY_RESOURCEID(IDR_FILEINFO)

DECLARE_PROTECT_FINAL_CONSTRUCT()

BEGIN_COM_MAP(CFileInfo)
	COM_INTERFACE_ENTRY(IFileInfo)
	COM_INTERFACE_ENTRY(IDispatch)
END_COM_MAP()

// IFileInfo
public:
	STDMETHOD(QueryFileInfo)(/*[in]*/BSTR sFileName, /*[out, retval]*/ VARIANT_BOOL * bSuccess);
	STDMETHOD(get_ModifyTime)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(get_AccessTime)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(get_CreationTime)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(get_FileSize)(/*[out, retval]*/ long *pVal);

private:
	char m_sModifyTime[100];
	char m_sCreationTime[100];
	char m_sAccessTime[100];

	long m_lFileSize;

private:
	void ConvertTime(SYSTEMTIME & , TCHAR *);
};

#endif //__FILEINFO_H_
