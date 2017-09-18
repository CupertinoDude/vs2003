/******************************************************************
* Sample Description:	
*			This sample will register the BasicEventSrcVC event 
*			source with VS Analyzer. It will also register 
*			a user-defined event (MyBasicCustomEventVC1) under 
*			a user-defined category (MyBasicCustomCategoryVC1)
*
******************************************************************/
#include <string.h>
#include "VSAnalyzerInstall.h"

void main( int argc, char *argv[])
{
HRESULT hr = S_FALSE;
	
	//Intialize an STA.
	hr = CoInitialize(NULL);
	_ASSERTE(SUCCEEDED(hr));	 

    if (1 == argc)
	{
		
		//Create an object of CVSAnalyzerInstall helper class.
		CVSAnalyzerInstall *pCVSA = NULL;
		pCVSA = new CVSAnalyzerInstall;
		_ASSERTE(NULL != pCVSA);	 
		if (NULL == pCVSA)
		{
			return;
		}

		//Register the Basice Event Source.
		pCVSA->RegisterBasicSource ();
		pCVSA->RegisterCustomCategory ();
		pCVSA->RegisterCustomEvent();

		//Destroy the helper object.
		delete pCVSA;
		wprintf(L"Basic Event Source is registered.\n");
		
	}
	else if ( (2 == argc) && _stricmp( argv[1], "/uninstall" ) == 0 )
	{
		//Create an object of CVSAnalyzerInstall helper class.
		CVSAnalyzerInstall *pCVSA = NULL;
		pCVSA = new CVSAnalyzerInstall;
		_ASSERTE(NULL != pCVSA);	 
		if (NULL == pCVSA)
		{
			return;
		}

		//Unregister the Basic Event Source.
		pCVSA->UnRegisterBasicSource();
		//No need to unregister categories and events of the event source, 
		//when the event source is unregistered all its categories and events
		//are unregistered automatically

		//Destroy the helper object
		delete pCVSA;
		wprintf(L"Basic Event Source is unregistered.\n");			
	}
	else
	{
		//Display the short help.
		wprintf(L"\nUsage:\n");
		wprintf(L"\nno switches - Registers the Basic Event Source.\n");
		wprintf(L"\n/uninstall - Unregisters the Basic Event Source.\n");		 
	}

	//Uninitalize the STA.
	CoUninitialize();

	//Pause the console so that the message text can be seen.
	system("pause");
	
}