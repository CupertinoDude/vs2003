// VSAnalyzerAuto.h: interface for the CVSAnalyzerAuto class.
//
//////////////////////////////////////////////////////////////////////
#pragma once
#ifndef VSANALYZERAUTO_H
#define VSANALYZERAUTO_H

#define UNICODE

#include <stdio.h>

// Needed for CComPtr
// Also will include crtdbg.h, which is required to use the _ASSERTE() macro. 
#include <atlbase.h>

// We need to import the following three libraries in order to access the Visual Studio Analyzer automation model

// Office 10 library: Pre-requisite for Visual Studio .Net IDE automation object model
#import "libid:2DF8D04C-5BFA-101B-BDE5-00AA0044DE52" version("2.2") lcid("0") raw_interfaces_only named_guids rename("RGB", "RGBX") rename("DocumentProperties", "DocumentPropertiesX")

// DTE library: Importing Visual Studio .Net IDE automation object model
#import "libid:80CC9F66-E7D8-4DDD-85B6-D9E6CD0E93E2" version("7.0") lcid("0") raw_interfaces_only named_guids no_namespace rename("GetObject", "GetObjectX") rename("SearchPath", "SearchPathX") rename("FindText", "FindTextX") rename("ReplaceText", "ReplaceTextX")

// VSAnalyzerAuto library: Importing Visual Studio Analyzer automation model
#import "libid:6C736D51-1510-11D2-8F88-00A0C90A6B00" version("1.0") lcid("0") raw_interfaces_only named_guids no_namespace

class CVSAnalyzerAuto  
{
public:

	// Constructor.
	CVSAnalyzerAuto();

	//Destructor.
	~CVSAnalyzerAuto();
	
	/*******************************************************************
	* Purpose:	Starts the Visual Studio .NET shell and store a reference
	*			to it in m_pDTE. Also, gets a reference to the projects
	*			collection and stores it in the m_pVsaProjects.
	* Returns:	HRESULT
	*******************************************************************/
	HRESULT StartShell(void);

	/*******************************************************************
	* Purpose:	Saves and closes the current project and  solution. 
	*			Closes the shell.
	* Returns:	HRESULT
	*******************************************************************/
	HRESULT StopShell(void);

	/*******************************************************************
	* Purpose:	Cretes a VSAnalyzer project, which will open the 
	*			IDE/shell of a second instance of the Visual Studio.			
	* Returns:	HRESULT
	*******************************************************************/
	HRESULT CreateProject(BSTR strProjectName);

	/*******************************************************************
	* Purpose:	Opens a pre-existing project.
	* Returns:	HRESULT
	*******************************************************************/
	HRESULT OpenProject(BSTR	bstrProjectName, 
						BSTR	bstrProjectLocation);


	/*******************************************************************
	* Purpose:	Closes an open solution and all the projects in it.
	* Returns:	HRESULT
	*******************************************************************/
	HRESULT CloseProject(void);


	/*******************************************************************
	* Purpose:	Adds a filter to the project.
	* Returns:	HRESULT
	*******************************************************************/
	HRESULT AddFilter ( BSTR	bstrFilterName,
						BSTR	bstrFilterExpression);


	/*******************************************************************
	* Purpose:	Removes a filter from the project corresponding to the 
	*			bstrFilterName.
	* Returns:	HRESULT
	*******************************************************************/
	HRESULT RemoveFilter(BSTR	bstrFilterName);


	/*******************************************************************
	* Purpose:	Adds a machine to the project.
	* Returns:	HRESULT
	*******************************************************************/
	HRESULT AddMachine(BSTR bstrMachineName);


	/*******************************************************************
	* Purpose:	Removes a machine from the project.
	* Returns:	HRESULT
	*******************************************************************/
	HRESULT RemoveMachine(BSTR	bstrMachine);

	/*******************************************************************
	* Purpose:	Adds an event log to the project.
	* Returns:	HRESULT
	*******************************************************************/
	HRESULT AddEventLog(BSTR bstrEventLogName);

	/*******************************************************************
	* Purpose:	Removes an Event Log from the project
	* Returns:	HRESULT
	*******************************************************************/
	HRESULT RemoveEventLog(BSTR bstrEventLogName);

	/*******************************************************************
	* Purpose:	Adds a machine and a filter to an already created project.
	* Returns:	HRESULT
	*******************************************************************/
	HRESULT CreateProjectItems(void);
	

	/*******************************************************************
	* Purpose:	Activates a filter and starts the event recording.
	* Returns:	HRESULT
	*******************************************************************/
	HRESULT StartRecordingEvents(void); 

	/*******************************************************************
	* Purpose:	Stops the event recording and deactivates the used filter.
	* Returns:	HRESULT
	*******************************************************************/
	HRESULT StopRecordingEvents(void);

	/*******************************************************************
	* Purpose:	Reads the recorded event log and writes a summary 
	*           of the information on it.
	* Returns:	HRESULT
	*******************************************************************/
	HRESULT GetRecordingSummary(void);

private:	
	
	// Pointer to the DTE.
	CComPtr<_DTE>			m_spDte;
	
	// Pointer to the Solution. Used to add the project.
	CComPtr<_Solution>	m_spSolution;

	//Pointer to a VS Analyzer project.
	CComQIPtr<VSAnalyzerProject>		m_spProject;

	//Pointer to the only one filter in this particular project.
	CComPtr<VSAnalyzerFilter>			m_spFilter;

	//Pointer to the only one machine in this particular project.
	CComPtr<VSAnalyzerMachine>		m_spMachine;

	//Pointer to the only one event log in this particular project.
	CComPtr<VSAnalyzerEventLog>		m_spEventLog;
	
	
};

#define PROJECTNAME		L"AutomationVCProject"
#define FILTERNAME		L"AutomationVCFilter"
#define EVENTLOGNAME	L"AutomationVCEventLog"
#define VS71DTEPROGID	L"VisualStudio.DTE.7.1"

#endif // VSANALYZERAUTO_H


 
 
                
                
        
