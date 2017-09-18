// ProcCollection.cpp : Implementation of CProcCollection
#include "stdafx.h"
#include "Psapi.h"
#include "ModuleCol.h"
#include "ProcCollection.h"
#include "DllCol.h"

/////////////////////////////////////////////////////////////////////////////
// CProcCollection


STDMETHODIMP CProcCollection::GetFirstProc(IDllCol ** ppUnk, long * phEnum)
{
	HRESULT hr = S_OK;

	if (!m_ProcLink.IsEmpty())
	{
		//Need to add ref here. QI for IUnknown should do it.
		CComObject<CDllCol> * pProcColl= (tCDllCol *) m_ProcLink.Head()->ptPayLoad;
		hr = pProcColl->QueryInterface(IID_IDllCol, (void **)ppUnk);
		*phEnum = (long)m_ProcLink.Head();
	}
	else
	{
		*ppUnk = NULL;
		*phEnum = 0;
	}

	return hr;
}

STDMETHODIMP CProcCollection::GetNextProc(long nIndex, IDllCol ** ppUnk, long *lNext)
{
	//OK. nIndex should be the pointer.
	//Assuming the pointer value in the list will not change
	//This is reasonable because the list will not change after it has been built
	HRESULT hr = S_OK;
	if (nIndex == 0)
	{
		*ppUnk = NULL;
		*lNext = 0;
		return hr;
	}

	Node * pNode = (Node *) nIndex;
	_ASSERTE(!IsBadReadPtr(pNode, sizeof(Node)) );
	if (!IsBadReadPtr(pNode, sizeof(Node)) )
	{
		pNode = pNode->pNext;
		*lNext = (long) pNode;
		if (pNode)
		{
			CComObject<CDllCol> * pProcColl= (CComObject<CDllCol> *) pNode->ptPayLoad;
			hr = pProcColl->QueryInterface(IID_IDllCol, (void **)ppUnk);
		}
	}

	return hr;
}


STDMETHODIMP CProcCollection::GetCount(long *pPCount)
{
	*pPCount = m_ProcLink.Count();
	return S_OK;
}

STDMETHODIMP CProcCollection::EnumerateProc(long *pSuccess)
{
	DWORD pidArray[1024] = {-1};
    DWORD cbNeededProc = 0, cbNeededModule = 0;
	HMODULE phModule[1024];
    TCHAR szName[MAX_PATH];
	TCHAR * psName = NULL;
	int i = 0, j = 0;
	HANDLE hProc = NULL;
	CComObject<CDllCol> * pProcColl= NULL;

	*pSuccess = 10;

    // EnumProcesses returns an array of process IDs
    if (!EnumProcesses(pidArray,			// array of process identifiers
					   sizeof(pidArray),	// size of array
					   &cbNeededProc) )			// number of bytes returned
	{
		*pSuccess = -1;
		goto Exit;
	}

	for (i = 1; i < cbNeededProc/sizeof(DWORD); ++i)
	{
		hProc = OpenProcess(PROCESS_QUERY_INFORMATION | PROCESS_VM_READ,// access flag
							FALSE,								        // handle inheritance option
							pidArray[i]);						        // process identifier
		if (hProc == NULL)
		{
			//well sometimes I can get an access denied error. So continue to get the enxt one
			continue;
		}

		if (NULL == EnumProcessModules(hProc,				// handle to process
									   phModule,			// array of module handles
									   sizeof(phModule),	// size of array
									   &cbNeededModule) )		    // number of bytes required
		{
			//For some reason I am getting the error saying ReadProcessMemory() can only
			//read part of the address space
			//If this is the reason for the failure, continue to get the modules
			if (GetLastError() != 0x0000012b)
			{

				CloseHandle(hProc);
				hProc = NULL;
				continue;
			}
		}

		if (NULL == GetModuleFileNameEx(hProc,				 // handle to process
										phModule[0],		 // handle to module
										szName,				 // path buffer
										MAX_PATH) )			 // maximum characters to retrieve
		{
			CloseHandle(hProc);
			hProc = NULL;
			continue;
		}

		CComObject<CDllCol>::CreateInstance(&pProcColl);
		_ASSERTE(pProcColl);
		if (pProcColl == NULL)
		{
			*pSuccess = -5;
			CloseHandle(hProc);
			hProc = NULL;
			goto Exit;
		}

		//Get the process name		
		pProcColl->PHANDLE(hProc);
		pProcColl->PNAME(szName);
		pProcColl->PID(pidArray[i]);
		pProcColl->PMODULECOUNT(cbNeededModule/sizeof(DWORD));

		//Now Add the modules inside this process
		for (j = 1; j < cbNeededModule/sizeof(DWORD); ++j)
		{
			if (NULL != ::GetModuleFileNameEx(hProc,			 // handle to process
			 								  phModule[j],		 // handle to module
											  szName,			 // path buffer
											  MAX_PATH) )		 // maximum characters to retrieve
				pProcColl->Push_FileName(szName);
			else
				_tcscpy(szName, _T("Unknown Module") );
		}

		//Add the process into the master list
		m_ProcLink.Insert(pProcColl);
		pProcColl = NULL;

		if (hProc != NULL)
		{
			::CloseHandle(hProc);
			hProc = NULL;
		}
		
	}

Exit:

	//Need to cleanup here if something happens

	return S_OK;
}


CProcCollection::~CProcCollection()
{
	CleanUp();
}

void CProcCollection::CleanUp()
{
	CComObject<CDllCol> * pProcColl= NULL;
	Node * pNode = m_ProcLink.Head();
	while(pNode)
	{
		pProcColl = (CComObject<CDllCol> *) pNode->ptPayLoad;
		_ASSERTE(pProcColl);
		if (pProcColl)
			pProcColl->Release();
		pNode = pNode->pNext;
	}
}
