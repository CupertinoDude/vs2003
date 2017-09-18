// FileInfo.cpp : Implementation of CFileInfo
#include "stdafx.h"
#include "ComputerInfo.h"
#include "FileInfo.h"

/////////////////////////////////////////////////////////////////////////////
// CFileInfo

STDMETHODIMP CFileInfo::get_FileSize(long *pVal)
{
	*pVal = m_lFileSize;
	return S_OK;
}

STDMETHODIMP CFileInfo::get_CreationTime(BSTR *pVal)
{
	CComBSTR cTime = m_sCreationTime;
	*pVal = cTime.Detach();
	return S_OK;
}

STDMETHODIMP CFileInfo::get_AccessTime(BSTR *pVal)
{
	CComBSTR aTime = m_sAccessTime;
	*pVal = aTime.Detach();
	return S_OK;
}

STDMETHODIMP CFileInfo::get_ModifyTime(BSTR *pVal)
{
	CComBSTR mTime = m_sModifyTime;
	*pVal = mTime.Detach();
	return S_OK;
}

STDMETHODIMP CFileInfo::QueryFileInfo(BSTR sFileName, VARIANT_BOOL * pbPath)
{
	_ASSERTE(!IsBadReadPtr(sFileName, sizeof(sFileName)) );
	if (FALSE == IsBadReadPtr(sFileName, sizeof(sFileName) ) )
	{
		char sPath[MAX_PATH];
		wcstombs(sPath, sFileName, MAX_PATH);
		if (*pbPath)
		{
			char sPath2[MAX_PATH];
			if ( NULL == SearchPath(NULL,				// search path
									sPath,			    // file name
									NULL,				// file extension
									MAX_PATH,			// size of buffer
									sPath2,				// found file name buffer
									NULL) )				// file component
			{
				*pbPath = false;
				return S_OK;
			}

			strcpy(sPath, sPath2);
		}
		
		HANDLE hFile = ::CreateFile(sPath,								// file name
									GENERIC_READ,						// access mode
									FILE_SHARE_READ|FILE_SHARE_WRITE, 	// share mode
									NULL,								// SD
									OPEN_EXISTING,						// how to create
									FILE_ATTRIBUTE_NORMAL,				// file attributes
									NULL);								// handle to template file
		
		if (INVALID_HANDLE_VALUE == hFile)
			goto Exit;
		
		m_lFileSize = ::GetFileSize(hFile, NULL);

		{
			FILETIME cft, aft, mft;
			SYSTEMTIME stime;

			if (NULL == ::GetFileTime(hFile, &cft, &aft, &mft) )
			{
				::CloseHandle(hFile);
				goto Exit;
			}
		
			FILETIME tft;
			::FileTimeToLocalFileTime(&cft, &tft);
			::FileTimeToSystemTime(&tft, &stime);
			ConvertTime(stime, m_sCreationTime);
			
			::FileTimeToLocalFileTime(&aft, &tft);
			::FileTimeToSystemTime(&tft, &stime);
			ConvertTime(stime, m_sAccessTime);

			::FileTimeToLocalFileTime(&mft, &tft);
			::FileTimeToSystemTime(&tft, &stime);
			ConvertTime(stime, m_sModifyTime);

		}

		*pbPath = true;
		return S_OK;
	}

Exit:
	*pbPath = false;
	return S_OK;

}

void CFileInfo::ConvertTime(SYSTEMTIME & stime, char * ptCh)
{
	//NOTE: ptCH is only 100 TCHARs long
	SYSTEMTIME st;
	::GetLocalTime(&st);

	//Handle the day
	if (st.wDay == stime.wDay && st.wYear == stime.wYear && st.wMonth == stime.wMonth)
		strcpy(ptCh, "Today, ");
	else
	{
		switch(stime.wDayOfWeek)
		{
			case 0: strcpy(ptCh, "Sun, ");
					break;

			case 1: strcpy(ptCh, "Mon, ");
					break;
			
			case 2: strcpy(ptCh, "Tue, ");
					break;

			case 3: strcpy(ptCh, "Wed, ");
					break;

			case 4: strcpy(ptCh, "Thur, ");
					break;

			case 5: strcpy(ptCh, "Fri, ");
					break;

			case 6: strcpy(ptCh, "Sat, ");
					break;
			
			default:strcpy(ptCh, " ");
					break;
		}
	}

	//handle the month
	switch(stime.wMonth)
	{
		case 1: strcat(ptCh, "Jan. ");
				break;

		case 2: strcat(ptCh, "Feb. ");
				break;

		case 3: strcat(ptCh, "Mar. ");
				break;

		case 4: strcat(ptCh, "Apr. ");
				break;

		case 5: strcat(ptCh, "May ");
				break;

		case 6: strcat(ptCh, "June ");
				break;

		case 7: strcat(ptCh, "July ");
				break;

		case 8: strcat(ptCh, "Aug. ");
				break;

		case 9: strcat(ptCh, "Sept. ");
				break;

		case 10: strcat(ptCh, "Oct. ");
				break;

		case 11: strcat(ptCh, "Nov. ");
				break;

		case 12: strcat(ptCh, "Dec. ");
				break;

		default: strcat(ptCh, " ");
				break;
	}

	//Handle the day of a month
	int nLen = strlen(ptCh);
	if (stime.wDay / 10 == 0)
	{
		ptCh[nLen] = '0';
		ptCh[++nLen] = (stime.wDay + '0');
	}
	else
	{
		ptCh[nLen] = (stime.wDay / 10 + '0');
		ptCh[++nLen]  = (stime.wDay % 10 + '0');
	}

	ptCh[++nLen] = ',';
	ptCh[++nLen] = ' ';

	//Add year here
	ptCh[++nLen] = stime.wYear / 1000 + '0';
	ptCh[++nLen] = (stime.wYear / 100) % 10 + '0';
	ptCh[++nLen] = (stime.wYear / 10) % 10 + '0';
	ptCh[++nLen] = (stime.wYear % 10) + '0';

	ptCh[++nLen] = ' ';

	char cAP = 'A';
	if (stime.wHour > 12)
	{
		stime.wHour -= 12;
		cAP = 'P';
	}

	if (0 == stime.wHour / 10)
		ptCh[++nLen] = (stime.wHour + '0');
	else
	{
		ptCh[++nLen] = (stime.wHour/10 + '0');
		ptCh[++nLen] = (stime.wHour%10 + '0');
	}
	
	ptCh[++nLen] = ':';

	if (0 == stime.wMinute / 10)
	{
		ptCh[++nLen] = '0';
		ptCh[++nLen] = (stime.wMinute + '0');
	}
	else
	{
		ptCh[++nLen] = (stime.wMinute/10 + '0');
		ptCh[++nLen] = (stime.wMinute%10 + '0');
	}

	ptCh[++nLen] = ':';


	if (0 == stime.wSecond / 10)
	{
		ptCh[++nLen] = '0';
		ptCh[++nLen] = (stime.wSecond + '0');
	}
	else
	{
		ptCh[++nLen] = (stime.wSecond/10 + '0');
		ptCh[++nLen] = (stime.wSecond%10 + '0');
	}
	
	ptCh[++nLen] = cAP;

	ptCh[++nLen] = 'M';
	ptCh[++nLen] = '\0';

}
