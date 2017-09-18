// DllCol.h : Declaration of the CDllCol

#ifndef __DLLCOL_H_
#define __DLLCOL_H_

#pragma warning (disable : 4530)

#include "resource.h"       // main symbols
#include <vector>
#include <string>
#include "VCUE_CopyString.h"

//////////////////////////////////////////////////////////////////////////////////////////////////
// Store the data in a vector of std::strings
typedef std::vector< std::string >         ContainerType;
// The collection interface exposes the data as BSTRs
typedef BSTR                               CollectionExposedType;
typedef IDllCol                            CollectionInterface;
// Use IEnumVARIANT as the enumerator for VB compatibility
typedef VARIANT                            EnumeratorExposedType;
typedef IEnumVARIANT                       EnumeratorInterface;
// Typedef the copy classes using existing typedefs
typedef VCUE::GenericCopy<EnumeratorExposedType, ContainerType::value_type>    EnumeratorCopyType;
typedef VCUE::GenericCopy<CollectionExposedType, ContainerType::value_type>    CollectionCopyType;

typedef CComEnumOnSTL< EnumeratorInterface, &__uuidof(EnumeratorInterface), EnumeratorExposedType, EnumeratorCopyType, ContainerType >    EnumeratorType;
typedef ICollectionOnSTLImpl< CollectionInterface, ContainerType, CollectionExposedType, CollectionCopyType, EnumeratorType >    CollectionType;

typedef ContainerType tVector;
/////////////////////////////////////////////////////////////////////////////
// CDllCol
class ATL_NO_VTABLE CDllCol : 
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CDllCol, &CLSID_DllCol>,
	public IDispatchImpl<CollectionType, &IID_IDllCol, &LIBID_MODULECOLLib>
{
public:
	CDllCol()
	  :  m_hProcHandle(0),
		 m_dwProcID(-1),
		 m_nModuleCount(0)
	{}

DECLARE_REGISTRY_RESOURCEID(IDR_DLLCOL)

DECLARE_PROTECT_FINAL_CONSTRUCT()

BEGIN_COM_MAP(CDllCol)
	COM_INTERFACE_ENTRY(IDllCol)
	COM_INTERFACE_ENTRY(IDispatch)
END_COM_MAP()

// IDllCol
public:
	STDMETHOD(ProcName)(/*[out, retval]*/BSTR * psName);
	bool Push_FileName(TCHAR * psFileName)
	{
		_ASSERTE(psFileName && !::IsBadReadPtr(psFileName, _tcslen(psFileName)));
		if (psFileName)
		{
			m_coll.push_back(psFileName);
			return true;
		}

		return false;
	}

	HANDLE PHANDLE()
	{
		return m_hProcHandle;
	}

	DWORD PID()
	{
		return m_dwProcID;
	}

	TCHAR * PNAME()
	{
		return m_sProcName;
	}

	DWORD PMODULECOUNT()
	{
		return m_nModuleCount;
	}

	void PHANDLE(HANDLE hIn)
	{
		m_hProcHandle = hIn;
	}

	void PID(DWORD dwID)
	{
		m_dwProcID = dwID;
	}

	void PNAME(TCHAR * psName)
	{
		_tcscpy(m_sProcName, psName);
	}

	void PMODULECOUNT(DWORD dwCount)
	{
		m_nModuleCount = dwCount;
	}


private:

	HANDLE m_hProcHandle;
	DWORD m_dwProcID;
	TCHAR m_sProcName[MAX_PATH];
	TCHAR m_sShName[MAX_PATH];
	DWORD m_nModuleCount;
};

#endif //__DLLCOL_H_
