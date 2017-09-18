/******************************************************************
* Sample Description:	
*	This sample will fire 10 user-defined events 
*	MyBasicCustomEventVC1 from the MyBasicCustomCategoryVC1	
*	category. It will also fire a group of 4 events which comprise
*	simulation of related events using the CorrelationID parameter. 
*	It will only work if BasicEventSrcVC is registered with 
*	BasicEventSrcVCSetup; otherwise it will display a notification
*	message.
*
******************************************************************/
#include "VSAnalyzerFire.h"

void main(void)
{
CVSAnalyzerFire *pCVSAnalyzerFire = NULL;

	//intialize STA
	HRESULT hr = CoInitialize(NULL);
	_ASSERTE(SUCCEEDED(hr));

	// Create an object of CVSAnalyzerFire helper class
	pCVSAnalyzerFire = new CVSAnalyzerFire;	
	_ASSERTE(NULL != pCVSAnalyzerFire);
	if (NULL == pCVSAnalyzerFire)
	{
		return;
	}

	// Check to see if the source is registered,only at startup.
	// No need to check afterwards. Once the source is registered with
	// the Analyzer, it will be registered until you unregister it 
	// explicitly.
	if (pCVSAnalyzerFire->IsSourceRegistered ())
	{
		pCVSAnalyzerFire->BeginSession ();

		//Fire 10 custom events. The default value of
		//the input parameter is 10. See the .h file.
		pCVSAnalyzerFire->FireCustomEvent();				
		
		//Fire the simple simulation.
		pCVSAnalyzerFire->FireSimulation ();
		
		//End the session and free the CVSAnalyzerFire object.
		pCVSAnalyzerFire->EndSession ();
	}
	else	
	{
		//If not show an error message and exit.
		wprintf(L"\nThe BasicEventSrcVC is not registered.\nUse BasicEventSrcVCSetup to register it.");
	}

	// Make sure to call the delete on the pCVSAnalyzerFire
	// before the CoUninitialize, so that the interface pointers
	// can be released properly.
	delete pCVSAnalyzerFire;

	//Uninitalize the STA.
	CoUninitialize();
}




