// VSAnalyzerAuto.cpp: implementation of the CVSAnalyzerAuto class.
//
//////////////////////////////////////////////////////////////////////
#include "VSAnalyzerAuto.h"
#include "windows.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
CVSAnalyzerAuto::CVSAnalyzerAuto()
{

}

CVSAnalyzerAuto::~CVSAnalyzerAuto()
{
	
}

/*******************************************************************
* Purpose:	Starts the Visual Studio .NET shell and store a reference
*			to it in m_pDTE. Also, gets a reference to the solution
*			collection and stores it in the m_spSolution.
* Returns:	HRESULT
*******************************************************************/
HRESULT CVSAnalyzerAuto::StartShell(void)
{
HRESULT hr = E_FAIL;

	// Create the shell and get an interface to it.

	CLSID clsidDTE;
	hr = CLSIDFromProgID(VS71DTEPROGID, &clsidDTE);
	if (FAILED(hr))
	{
		return hr;
	}

	hr = CoCreateInstance(clsidDTE, NULL, CLSCTX_LOCAL_SERVER,
						  __uuidof(_DTE), reinterpret_cast<void**>(&m_spDte));	
	_ASSERTE(SUCCEEDED(hr));
	if (FAILED(hr))
	{
		return hr;
	}
		
	// Get an interface to the solution.
	hr = m_spDte->get_Solution(&m_spSolution);
	_ASSERTE(SUCCEEDED(hr));
		

	// Make the shell visible. 
	struct Window *pwin = NULL;
	m_spDte->get_MainWindow(&pwin);	
	hr = pwin->put_Visible(VARIANT_TRUE);
	_ASSERTE(SUCCEEDED(hr));

	return hr;

}


/*******************************************************************
* Purpose:	Saves and closes the current project and  solution. 
*			Closes the shell.
* Returns:	HRESULT
*******************************************************************/
HRESULT CVSAnalyzerAuto::StopShell(void)
{
HRESULT hr = E_FAIL;

	// Save and close the project.
	hr = CloseProject();
	_ASSERTE(SUCCEEDED(hr));

	// Save and close the solution.
	if (m_spSolution)
	{
		hr = m_spSolution->Close(VARIANT_TRUE);
		_ASSERTE(SUCCEEDED(hr));
	}

	// Close the shell.
	if ( m_spDte )
	{
		hr = m_spDte->Quit();
		_ASSERTE(SUCCEEDED(hr));
		
	}

	return hr;
	
}

/*******************************************************************
* Purpose:	Deletes all files in the temporary directory of this sample.			
*               Use carefully.
* Returns:	void
*******************************************************************/
void CleanupProjectFolder(CComBSTR bstrProjectFolder)
{
	CComBSTR bstrCriteria;
	WIN32_FIND_DATA FindFileData;
	HANDLE hFind;
	BOOL bFound;

	bstrCriteria = bstrProjectFolder;
	bstrCriteria += "\\*.*";
 
	hFind = FindFirstFile(bstrCriteria, &FindFileData);
	if (hFind == INVALID_HANDLE_VALUE)
		return;

	bFound = TRUE;
	while (bFound)
	{
		if( wcscmp(FindFileData.cFileName,L".") && 
			wcscmp(FindFileData.cFileName,L"..") )
		{
			CComBSTR bstrFile;
			bstrFile = bstrProjectFolder;
			bstrFile += "\\";
			bstrFile += FindFileData.cFileName;

			DeleteFile(bstrFile);
		}

		bFound = FindNextFile(hFind, &FindFileData);
	}
	FindClose(hFind);
}


/*******************************************************************
* Purpose:	Creates a VSAnalyzer project, which will open another 
*			IDE/shell of the Visual Studio.			
* Returns:	HRESULT
*******************************************************************/
HRESULT CVSAnalyzerAuto::CreateProject(BSTR strProjectName)
{
HRESULT hr = E_FAIL;
Project* pProject = NULL;
CComBSTR bstrTemplatePath;
CComBSTR bstrProjectName;
CComBSTR bstrProjectLocation;
WCHAR 	 wszTempPath[_MAX_PATH+1];
				
		

	if ((m_spDte == NULL) || (m_spSolution == NULL))
		return E_FAIL;								
	
	
	// GUID that will tell the shell, where to find 
	// the template for the VSAnalyzer project.	
	CComBSTR bstrVSAProjectGUID = L"{6C736D90-CE40-11D0-8A4D-00A0C91E2ACD}";	

	// Get the template project path from the registry.
	hr = m_spSolution->get_TemplatePath(bstrVSAProjectGUID, &bstrTemplatePath);
	_ASSERTE(SUCCEEDED(hr));
	if (FAILED(hr))
	{
		return hr;
	}

	// Create the fully qualified name of the template project.
	CComBSTR bstrTemplateName = bstrTemplatePath;
	// Add the name of template file for a Visual Studio Analyzer project.
	bstrTemplateName += L"\\Analyzer.vap";
	
	// Assign the project name to the BSTR, which will be passed to AddFromTemplate
	bstrProjectName = strProjectName;

	// Get the location of the temp directory, so that 
	// the Analyzer project can be created there.
	GetEnvironmentVariable(L"TEMP", wszTempPath, _MAX_PATH + 1);
	
	// Assign the location pointed to by the TEMP environment
	// variable plus a new directory to the BSTR, which used
	// by AddFromTemplate. If the directory (AutomationVC) 
	// does not exist, it will be automatically created by 
	// AddFromTemplate. 
	bstrProjectLocation = wszTempPath;
	bstrProjectLocation += L"\\AutomationVC";	

	// Warning: cleanup working directory (\temp\AutomationVC).
	CleanupProjectFolder(bstrProjectLocation);

	// Add a new project to the current solution, using a template.
	hr = m_spSolution->AddFromTemplate(bstrTemplateName, bstrProjectLocation, bstrProjectName, FALSE, &pProject);
	_ASSERTE(SUCCEEDED(hr));
	if (FAILED(hr))
	{
		return hr;
	}
	
	// Get an interface to VSAnalyzer project from the generic Project interface.
	m_spProject = pProject;
	
	pProject->Release();	

	return hr;
}

/*******************************************************************
* Purpose:	Closes an open solution and all the projects in it.
* Returns:	Nothing.
*******************************************************************/
HRESULT CVSAnalyzerAuto::CloseProject(void)
{
	// VARIANT_TRUE forces save of the project upon closing.
	HRESULT hr = m_spProject->Close(VARIANT_TRUE);
	_ASSERTE(SUCCEEDED(hr));
	return hr;
	
}


/*******************************************************************
* Purpose:	Adds a filter to the project and compiles it to see if
*			it has a valid filter expression.
* Returns:	HRESULT
*******************************************************************/
HRESULT CVSAnalyzerAuto::AddFilter (BSTR	bstrFilterName,
									BSTR	bstrFilterExpression)
{

HRESULT hr = E_FAIL; 
	
	// Check if the VSAnalyzer project is created (the object will 
	// have a reference to the created project.
	if( m_spProject == NULL )
		return E_FAIL;

	// Add a filter to the VSAnalyzer project. 
	// The VARIANT_TRUE parameter will force it to
	// overwrite any existing filter with the same name.
	hr = m_spProject->AddFilter(bstrFilterName, VARIANT_TRUE, &m_spFilter);
	_ASSERTE(SUCCEEDED(hr));
	if (FAILED(hr))
	{
		return hr;
	}

	// Set the filter expression.
	hr = m_spFilter->put_Expression(bstrFilterExpression);
	_ASSERTE(SUCCEEDED(hr));

	return hr;

}


/*******************************************************************
* Purpose:	Removes a filter from the project corresponding to the 
*			bstrFilterName.
* Returns:	HRESULT
*******************************************************************/
HRESULT CVSAnalyzerAuto::RemoveFilter(BSTR	bstrFilterName)
{
HRESULT hr = E_FAIL;

	// Check if the VSAnalyzer project is created in the solution.
	// The CVSAnalyzerAuto object should have a reference to the project.
	if( m_spProject == NULL)
		return E_FAIL;

	// Remove the filter from the project.
	hr = m_spProject->RemoveFilter (bstrFilterName); 
	_ASSERTE(SUCCEEDED(hr));

	return hr;

}


/*******************************************************************
* Purpose:	Adds a machine to the project and establishes connection
*			with it. If the connection fails, the user is prompted
*			for another/existing machine name.
* Returns:	HRESULT
*******************************************************************/
HRESULT CVSAnalyzerAuto::AddMachine(BSTR bstrMachineName)
{
HRESULT hr= E_FAIL;
short nIsConnected = FALSE;



	// Check if the CVSAnalyzerAuto object has a reference to 
	// a VSAnalyzer project.
	if(m_spProject == NULL )
		return E_FAIL;								

	// Add the machine to the project. Even if the machine 
	// does not exist it will be added to the project and
	// the return HRESULT will be S_OK.
	hr = m_spProject->AddMachine(bstrMachineName, &m_spMachine);
	_ASSERTE(SUCCEEDED(hr));
	if (FAILED(hr))
	{
		return hr;
	}
	
	hr = m_spMachine->get_Connected (&nIsConnected);
	_ASSERTE(SUCCEEDED(hr));
	if (VARIANT_FALSE == nIsConnected)
	{
		// Not connected. Try to connect.
		// It is important to be able to connect to the machine, otherwise
		// everything else is pointles. We need to be able to connect to one 
		// machine in order to collect some data.
		hr = m_spMachine->Connect();			
		if (FAILED(hr))
		{
			// The machine does not exist.
			wprintf(L"\nInvalid machine name. ");
		}
		else
			nIsConnected = TRUE;
	}
	
	return hr;
}


/*******************************************************************
* Purpose:	Removes a machine from the project.
* Returns:	HRESULT
*******************************************************************/
HRESULT CVSAnalyzerAuto::RemoveMachine(BSTR	bstrMachine)
{
HRESULT hr = E_FAIL;

	// Check if the CVSAnalyzerAuto object has a reference to 
	// a VSAnalyzer project.	
	if( m_spProject == NULL)
		return E_FAIL;
	
	// Remove the machine from the project.
	hr = m_spProject->RemoveMachine (bstrMachine);
	_ASSERTE(SUCCEEDED(hr));

	return hr;

}


/*******************************************************************
* Purpose:	Adds an existing event log to the project.
* Returns:	Nothing.
*******************************************************************/
HRESULT CVSAnalyzerAuto::AddEventLog(BSTR	bstrEventLogName)
{
	HRESULT hr= E_FAIL; 


	if ( m_spProject == NULL )
		return E_INVALIDARG;

	//Adds an existing event log to the Analyzer project. If the event log 
	//does not exist, the function will fail.
	hr = m_spProject->AddEventLog(bstrEventLogName, &m_spEventLog);
		
	return hr;
}


/*******************************************************************
* Purpose:	Removes an Event Log from the project
* Returns:	Nothing.
*******************************************************************/
HRESULT CVSAnalyzerAuto::RemoveEventLog(BSTR bstrEventLogName)
{
	HRESULT hr = E_FAIL;

	// Check if the CVSAnalyzerAuto object has a reference to 
	// a VSAnalyzer project.
	if( m_spProject == NULL)
		return E_FAIL;

	// Remove the event log from the project.
	hr = m_spProject->RemoveEventLog (bstrEventLogName);
	_ASSERTE(SUCCEEDED(hr));

	return hr;
}



/*******************************************************************
* Purpose:	Adds a machine and a filter to an already created project.
* Returns:	Nothing.
*******************************************************************/
HRESULT CVSAnalyzerAuto::CreateProjectItems(void)
{
HRESULT hr = E_FAIL;
WCHAR wczMachineName [MAX_COMPUTERNAME_LENGTH + 1];
CComBSTR bstrMachineName;
DWORD nMachineNameLen = sizeof(wczMachineName) / sizeof(wczMachineName[0]);
	
	// Get the local machine name. If unsuccessful return immediately.
	// Without a machine to connect to the sample is useless.
	if ( !GetComputerName(wczMachineName,&nMachineNameLen ))
		return E_FAIL;	

	bstrMachineName = wczMachineName;
	
	// Add the machine to record from.
	hr = AddMachine (bstrMachineName );
    
	// Add filter to the project for recording events. 
	// This is its visible to the user name.
	CComBSTR bstrFilterName = FILTERNAME;
	// Recording filter expression.
	CComBSTR bstrFilterExpression = L"Machine = 'All Machines' AND \
									 Component = 'All Components' AND \
									 Category = 'All Regular Events'";
	
	hr = AddFilter (bstrFilterName, bstrFilterExpression);

	return hr;
}


/*******************************************************************
* Purpose:	Activates a filter and starts the event recording.
* Returns:	Nothing.
*******************************************************************/
HRESULT CVSAnalyzerAuto::StartRecordingEvents(void)
{
HRESULT hr = E_FAIL;
CComBSTR bstrFilterName = FILTERNAME;
CComBSTR bstrEventLogName = EVENTLOGNAME;
		

	if ( (m_spProject == NULL) || ( m_spFilter == NULL) )
		return E_FAIL;	
	
	// Activate the filter in the project.
	hr = m_spProject->ActivateFilter(bstrFilterName);
	_ASSERTE(SUCCEEDED(hr));
	if (FAILED(hr))
	{
		return hr;
	}
	
	//Start the recording.
	//This method adds an event log to the VSAnalyzer project. If there is an 
	//event log with the same name, the operation will fail.
	hr = m_spProject->StartRecording(bstrEventLogName,&m_spEventLog);
	_ASSERTE(SUCCEEDED(hr));
	
	return hr;
}



/*******************************************************************
* Purpose:	Stops the event recording and deactivates the used filter.
* Returns:	Nothing.
*******************************************************************/
HRESULT CVSAnalyzerAuto::StopRecordingEvents(void)
{
HRESULT hr = E_FAIL;


	if ( (m_spProject == NULL) || (m_spEventLog == NULL) || ( m_spFilter == NULL) )
		return E_FAIL;

	// Deactivate the filter.
	hr = m_spProject->DeactivateFilter();
	_ASSERTE(SUCCEEDED(hr));
	// Might have failed to deactivate, continue anyway...

	// Stop the recording.
	hr = m_spProject->StopRecording();
	_ASSERTE(SUCCEEDED(hr));
	
	return hr;
}


/*******************************************************************
* Purpose:	Reads the recorded event log and writes a summary 
*           of the information on it.
* Returns:	Nothing.
*******************************************************************/
HRESULT CVSAnalyzerAuto::GetRecordingSummary(void)
{
HRESULT hr = E_FAIL;
CComPtr<VSAnalyzerEvent>	pEventObjectLongest;
int nEvents,nLongestDuration;
CComVariant vIndex;

if (m_spEventLog == NULL)
		return E_FAIL;

	hr = m_spEventLog->get_Count(&nEvents);
	_ASSERTE(SUCCEEDED(hr));
	if (FAILED(hr))
	{
		wprintf(L"Failed to retrieve number of events collected.  %x\n", hr);
		return hr;
	}

	wprintf(L"Total Events Collected: %d\n",nEvents);

	nLongestDuration = 0;
	vIndex.vt = VT_I4;
	for(vIndex.intVal=1;vIndex.intVal<=nEvents;vIndex.intVal++)
	{
		CComPtr<VSAnalyzerEvent>	pEventObject;
		CComPtr<VSAnalyzerEventField>	pEventFieldObject;
		CComVariant vField;
		CComVariant vValue;
		CComBSTR bstrDuration;

		hr = m_spEventLog->Item(vIndex,&pEventObject);
		_ASSERTE(SUCCEEDED(hr));
		if (SUCCEEDED(hr))
		{

			// Using the field index is the fastest access method for
			// the fields in an event
			vField.vt = VT_I4;
			vField.intVal = VSAnalyzerUIEventFieldDuration;
			hr = pEventObject->Item(vField,&pEventFieldObject);
			_ASSERTE(SUCCEEDED(hr));
			if (FAILED(hr))
			{
				continue;	// get the next item
			}

			hr = pEventFieldObject->get_FieldValue(&vValue);
			_ASSERTE(SUCCEEDED(hr));
			if (FAILED(hr))
			{
				continue;	// get the next item
			}

			vValue.ChangeType(VT_INT);

			if(vValue.intVal > nLongestDuration)
			{
				nLongestDuration = vValue.intVal;
				pEventObjectLongest = pEventObject;
			}
		}
	}

	if(nLongestDuration)
	{
		nLongestDuration = nLongestDuration / 10000;
		wprintf(L"Longest Event: %i milliseconds\n",nLongestDuration);

		// This section illustrates three methods for accessing
		// fields in an event

		// By the field index:
		{
		CComPtr<VSAnalyzerEventField>	pEventFieldObject;
		CComVariant vField;
		CComVariant vValue;

			vField.vt = VT_I4;
			vField.intVal = VSAnalyzerUIEventFieldEventId;
			hr = pEventObjectLongest->Item(vField,&pEventFieldObject);
			_ASSERTE(SUCCEEDED(hr));
			if (FAILED(hr))
			{
				return hr;
			}

			hr = pEventFieldObject->get_FieldValue(&vValue);
			_ASSERTE(SUCCEEDED(hr));
			if (FAILED(hr))
			{
				return hr;
			}

			wprintf(L"EventID: %i, ",vValue.intVal);
		}

		// By the field firing code (only for standard fields allowed at firing time):
		{
		CComPtr<VSAnalyzerEventField>	pEventFieldObject;
		CComVariant vField;
		CComVariant vValue;

			hr = pEventObjectLongest->ItemByStandardParameterEnum(cVSAStandardParameterSourceMachine,&pEventFieldObject);
			_ASSERTE(SUCCEEDED(hr));
			if (FAILED(hr))
			{
				return hr;
			}

			hr = pEventFieldObject->get_FieldValue(&vValue);
			_ASSERTE(SUCCEEDED(hr));
			_ASSERTE(vValue.vt==VT_BSTR);
			if (FAILED(hr) || vValue.vt != VT_BSTR)
			{
				return E_FAIL;
			}

			wprintf(L"fired from machine [%s] ",vValue.bstrVal);
		}


		// By field name:
		{
		CComPtr<VSAnalyzerEventField>	pEventFieldObject;
		CComVariant vField;
		CComVariant vValue;

			vField.vt = VT_BSTR;
			vField.bstrVal = ::SysAllocString(VSAnalyzerEventFieldEventTime);
			hr = pEventObjectLongest->Item(vField,&pEventFieldObject);
			_ASSERTE(SUCCEEDED(hr));
			if (FAILED(hr))
			{
				return hr;
			}

			hr = pEventFieldObject->get_FieldValue(&vValue);
			_ASSERTE(SUCCEEDED(hr));
			_ASSERTE(vValue.vt==VT_BSTR);
			if (FAILED(hr) || vValue.vt != VT_BSTR)
			{
				return E_FAIL;
			}

			wprintf(L"at %s",vValue.bstrVal);
		}
	}

	return S_OK;
}
               
                
        