/******************************************************************
* Sample Description:	
*	This sample uses Automation to create a VS Analyzer project in 
*	your temp directory (the one pointed by the environment 
*	variable TEMP). This sample will open a VS Shell in order to
*	create the new project. The project will connect to the local 
*	machine. It will have one filter and one event log. It will start 
*	recording events immediately and will show a message asking the 
*	user to press a key in order to terminate it. Upon termination 
*	the sample will stop recording events, save the project, and
*	exit the VS Shell. 
*
******************************************************************/

// Including the header file built for this sample that defines 
// the helper class CVSAnalyzerAuto 
#include "VSAnalyzerAuto.h"


/******************************************************************
* Purpose:	Creates an instance of the CVSAnalyzerAuto class in 
*			the function scope so that its destruction occures before 
*			CoUninitialize in the main(), which will allow the smart
*			pointers (properties of this class) to correctly release
*			any interfaces they might have.
* Returns:	Nothing
******************************************************************/
void RunSample (void)
{
HRESULT hr = E_FAIL;
CVSAnalyzerAuto objCVSAAuto;

	
	wprintf(L"\nReady to start Visual Studio Analyzer. ");
	system("pause");	

	// Start the shell.
	objCVSAAuto.StartShell();
	
	// Create a new project. If it already exists the shell
	// will pop a message box and ask if you woould like
	// to overwrite it. The new project will be created in 
	// directory called AutomationVC under the tree pointed by
	// the TEMP environment variable. See CreateProject.
	hr = objCVSAAuto.CreateProject(PROJECTNAME);
	_ASSERTE(SUCCEEDED(hr));	

	// Add the machine(local), filter and event log to the project.
	objCVSAAuto.CreateProjectItems ();		

	wprintf(L"\nReady to start recording events. ");
	system("pause");

	// Start the recording of events.
	objCVSAAuto.StartRecordingEvents();

	wprintf(L"\nReady to stop recording events. ");
	system("pause");

	// Stop the event recording.
	objCVSAAuto.StopRecordingEvents();

	// Prints the summary to the console.
	objCVSAAuto.GetRecordingSummary();


	wprintf(L"\nReady to stop Visual Studio Analyzer. ");
	system("pause");

	// Close the shell.
	objCVSAAuto.StopShell ();


}

void main(void)
{


	// Init the STA for COM.
	CoInitialize(NULL);

	RunSample();	

	// Uninitialize the STA, any subsequent calls on
	// interfaces will fail.
	CoUninitialize();
}