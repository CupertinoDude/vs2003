// MachineInfo.cpp : Implementation of CMachineInfo
#include "stdafx.h"
#include <windows.h>
#include "ComputerInfo.h"
#include "MachineInfo.h"

/////////////////////////////////////////////////////////////////////////////
// CMachineInfo
void CMachineInfo::QueryInformation()
{
	DWORD dwNoUse = MAX_COMPUTERNAME_LENGTH + 1;
	if (FALSE == GetComputerName(m_tcCompName, &dwNoUse) )
		_tcscpy(m_tcCompName, _T("Unknown host"));

	SYSTEM_INFO SysInfo;
	::GetSystemInfo(&SysInfo);

	switch(SysInfo.wProcessorArchitecture)
	{
		case PROCESSOR_ARCHITECTURE_INTEL: 	
						_tcscpy(m_tcProcArch, _T("Intel Architecture") );
						switch(SysInfo.wProcessorLevel)
						{
							case 3: _tcscpy(m_tcProcLevel, _T("Intel 80386"));
									break;
							case 4: _tcscpy(m_tcProcLevel, _T("Intel 80486"));
									break;
							case 5: _tcscpy(m_tcProcLevel, _T("Intel Pentium"));
									break;
							case 6: _tcscpy(m_tcProcLevel, _T("Intel Pentium Pro"));
									break;
							default:m_tcProcLevel[0] = _T('\0');
									break; 
						}	
						
						break;

		case PROCESSOR_ARCHITECTURE_MIPS:
						_tcscpy(m_tcProcArch, _T("MIPS Architecture") );
						if (SysInfo.wProcessorLevel == 0x0004)
							_tcscpy(m_tcProcLevel, _T("MIPS R4000"));
						else
							m_tcProcLevel[0] = _T('\0');
						break;

		case PROCESSOR_ARCHITECTURE_ALPHA:
						_tcscpy(m_tcProcArch, _T("ALPHA Architecture") );
						switch(SysInfo.wProcessorLevel)
						{
							case 21064: _tcscpy(m_tcProcLevel, _T("ALPHA 21064"));
										break;
							case 21066: _tcscpy(m_tcProcLevel, _T("ALPHA 21066"));
										break;
							case 21164: _tcscpy(m_tcProcLevel, _T("ALPHA 21164"));
									break;
							default:m_tcProcLevel[0] = _T('\0');
									break; 
						}	
	
						break;
		case PROCESSOR_ARCHITECTURE_PPC:
						_tcscpy(m_tcProcArch, _T("Power PC Architecture") );
						switch(SysInfo.wProcessorLevel)
						{
							case 1: _tcscpy(m_tcProcLevel, _T("Power PC 601"));
									break;
							case 3: _tcscpy(m_tcProcLevel, _T("Power PC 603"));
									break;
							case 4: _tcscpy(m_tcProcLevel, _T("Power PC 604"));
									break;
							case 6: _tcscpy(m_tcProcLevel, _T("Power PC 603+"));
									break;
							case 9: _tcscpy(m_tcProcLevel, _T("Power PC 604+"));
									break;
							case 20: _tcscpy(m_tcProcLevel, _T("Power PC 620"));
									break;
							default: m_tcProcLevel[0] = _T('\0');
									break; 
						}

						break;
		default:
						_tcscpy(m_tcProcArch, _T("Unknown Architecture") );
						break;
	}

	m_lPageSize = SysInfo.dwPageSize;
	m_lMinAppAddr = (long )SysInfo.lpMinimumApplicationAddress;
	m_lMaxAppAddr = (long) SysInfo.lpMaximumApplicationAddress;
	m_lProcMask = SysInfo.dwActiveProcessorMask;
	m_lProcNum = SysInfo.dwNumberOfProcessors;
	m_lAllocGranularity = SysInfo.dwAllocationGranularity;

	OSVERSIONINFO osVersion;
	osVersion.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);
	if (FALSE != GetVersionEx(&osVersion) )
	{
		switch(osVersion.dwPlatformId)
		{
		case VER_PLATFORM_WIN32s: 
					_tcscpy(m_tcPlatForm, _T("Win32s on Windows 3.1"));
					break;
		case VER_PLATFORM_WIN32_WINDOWS:
					if (0 == osVersion.dwMinorVersion)
						_tcscpy(m_tcPlatForm, _T("Win32s on Windows 95"));
					else
						_tcscpy(m_tcPlatForm, _T("Win32s on Windows 98"));
					break;
		case VER_PLATFORM_WIN32_NT: 
					_tcscpy(m_tcPlatForm, _T("Win32s on Windows NT"));
					break;
		default:
					m_tcPlatForm[0] = _T('\0');
					break;
		}

		switch(osVersion.dwMajorVersion)
		{
			case 3:	_tcscpy(m_tcOSType, _T("Windows NT 3.51"));
					break;
			case 4: _tcscpy(m_tcOSType, _T("Windows NT 4.0"));
					break;
			case 5: _tcscpy(m_tcOSType, _T("Windows 2000"));
					break;
			default:m_tcOSType[0] = _T('\0');
					break;
		}

		if (_tcslen(osVersion.szCSDVersion) == 0)
			_tcscpy(m_ctServicePack,_T("None"));
		else
			_tcscpy(m_ctServicePack,osVersion.szCSDVersion);
	}
	else
	{
		m_ctServicePack[0] = _T('\0');
		m_tcPlatForm[0] = _T('\0');
		m_tcOSType[0] = _T('\0');
	}
}


STDMETHODIMP CMachineInfo::get_ComputerName(BSTR *pVal)
{
	CComBSTR bstrName = m_tcCompName;
	*pVal = bstrName.Detach();
	return S_OK;
}

STDMETHODIMP CMachineInfo::get_ProcessorArchitecture(BSTR *pVal)
{
	CComBSTR bstrArch = m_tcProcArch;
	*pVal = bstrArch.Detach();
	return S_OK;
}

STDMETHODIMP CMachineInfo::get_PageSize(long *pVal)
{
	*pVal = m_lPageSize;
	return S_OK;
}

STDMETHODIMP CMachineInfo::get_MinAppAddress(long *pVal)
{
	* pVal = m_lMinAppAddr;
	return S_OK;
}

STDMETHODIMP CMachineInfo::get_ProcessorMask(long *pVal)
{
	*pVal = m_lProcMask;
	return S_OK;
}

STDMETHODIMP CMachineInfo::get_NumberOfProcessors(long *pVal)
{
	*pVal = m_lProcNum;
	return S_OK;
}

STDMETHODIMP CMachineInfo::get_AllocationGranularity(long *pVal)
{
	* pVal = m_lAllocGranularity;
	return S_OK;
}

STDMETHODIMP CMachineInfo::get_ProcessorLevel(BSTR *pVal)
{
	CComBSTR bstrProc = m_tcProcLevel;
	*pVal = bstrProc.Detach(); 
	return S_OK;
}

STDMETHODIMP CMachineInfo::get_MachineType(BSTR *pVal)
{
	CComBSTR bstrOS = m_tcOSType;
	*pVal = bstrOS.Detach();
	return S_OK;
}

STDMETHODIMP CMachineInfo::get_PlatForm(BSTR *pVal)
{
	CComBSTR bstrPlat = m_tcPlatForm;
	*pVal = bstrPlat.Detach();
	return S_OK;
}

STDMETHODIMP CMachineInfo::get_ServicePack(BSTR *pVal)
{
	CComBSTR bstrSvP = m_ctServicePack;
	*pVal = bstrSvP.Detach();
	return S_OK;
}

STDMETHODIMP CMachineInfo::get_MaxAppAddress(long *pVal)
{
	// TODO: Add your implementation code here

	return S_OK;
}
