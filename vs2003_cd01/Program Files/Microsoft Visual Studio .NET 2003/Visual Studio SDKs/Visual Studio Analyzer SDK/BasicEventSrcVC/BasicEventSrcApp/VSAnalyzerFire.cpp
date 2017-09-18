#include "VSAnalyzerFire.h"

//constructor
CVSAnalyzerFire::CVSAnalyzerFire(void)
{	

	//create an instance of the In-proc Event Creator	
	HRESULT hr = CoCreateInstance(CLSID_VSA_IEC, NULL, 
								  CLSCTX_INPROC_SERVER, 
								  IID_ISystemDebugEventFire, 
								  (void **)&m_spIEC );
	_ASSERTE(SUCCEEDED(hr));
}
//destructor
CVSAnalyzerFire::~CVSAnalyzerFire(void)
{
	
}

/******************************************************************
* Purpose:	Checks if the basic event source is registered.
* Returns:	True if the source is registered and False otherwise
*******************************************************************/
bool CVSAnalyzerFire::IsSourceRegistered(void)
{	

	//Create an instance of the Event Source Installer.	
	HRESULT hr = CoCreateInstance(CLSID_VSA_ESI, NULL, 
								  CLSCTX_INPROC_SERVER, 
								  IID_ISystemDebugEventInstall, 
								  (void **)&m_spESI );
	_ASSERTE(SUCCEEDED(hr));
	if (FAILED(hr))
	{
		return FALSE;
	}

	hr = m_spESI->IsSourceRegistered (BASIC_EVENT_SOURCE_GUID);
	_ASSERTE(SUCCEEDED(hr));	

	return( S_OK == hr );
}

/*******************************************************************
* Purpose:	Begins a session with Local Event Collector (LEC)
* Returns:	Nothing.
*******************************************************************/	
void CVSAnalyzerFire::BeginSession(void)
{
	HRESULT hr = m_spIEC->BeginSession( BASIC_EVENT_SOURCE_GUID, L"BasicEventSrcVCSession");
	_ASSERTE(SUCCEEDED(hr));

}

/******************************************************************
* Purpose:	Ends the session established with the LEC.
* Returns:  Nothing
*******************************************************************/
void CVSAnalyzerFire::EndSession(void)
{
	HRESULT hr = m_spIEC->EndSession();
	_ASSERTE(SUCCEEDED(hr));
}



/******************************************************************
* Purpose:	Fires custom nEvents custom events or 10 by default.
* Returns:  Nothing
*******************************************************************/
void CVSAnalyzerFire::FireCustomEvent(int nEvents)
{
	int nNumEvent;
	int const MAXPARAMS = 7;	

	//Data needed to generate out custom event. Depending on the
	//purpose of the event, you might need to send different data.
	// Declare a byteArray to hold binary data; event data can be one of five
	// different types, including binary data. All types are shown.
	BYTE byteArray[] = "\x00\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a";
	
	// Event data is passed in arrays of parameter names (keys) and values.
	// This array holds the parameter names. It is sized at 7 to show the
	// five different types of event data you can pass in combination with two
	// system-defined parameters
	// Standard event parameters (such as cVSAStandardParameterSourceHandle)
	// are defined in vaevt.h.

#if !defined(_WIN64)
#pragma warning(disable: 4311) // Pointer truncations warning. See vaevt.idl for more information.
#endif

	 DWORD rgKeys[ MAXPARAMS ] = {
	 cVSAStandardParameterCorrelationID,	// System-defined parameter
	(DWORD) L"First custom parameter",		// 5 custom parameters
	(DWORD) L"Second custom parameter",
	(DWORD) L"Third custom parameter",
	(DWORD) L"Forth custom parameter",
	(DWORD) L"Fifth custom parameter",
	cVSAStandardParameterArguments };		// Another system-defined parameter

	// This array holds the parameter values.
	DWORD rgValues[ MAXPARAMS ] = {
	(DWORD) L"XYZ",
	(DWORD) "This is an ANSI string",
	(DWORD) &SAMPLE_GUID_PARAMETER,
	0xFFFFFFFF,
	(DWORD) L"This is a unicode string",
	(DWORD) byteArray,
	(DWORD) byteArray };

#if !defined(_WIN64)
#pragma warning(default: 4311) // Pointer truncations warning.
#endif

	// Remember to specify cVSAParameterKeyString for ALL custom parameters
	// and to specify the length for all BYTE array data.
	DWORD rgTypes[ MAXPARAMS ] = { 
	cVSAParameterValueUnicodeString,
	cVSAParameterKeyString | cVSAParameterValueANSIString,
	cVSAParameterKeyString | cVSAParameterValueGUID,
	cVSAParameterKeyString | cVSAParameterValueDWORD,
	cVSAParameterKeyString | cVSAParameterValueUnicodeString,
	cVSAParameterKeyString | cVSAParameterValueBYTEArray | ( cVSAParameterValueLengthMask &
	sizeof(byteArray) ),
	cVSAParameterValueBYTEArray | ( cVSAParameterValueLengthMask &
	sizeof(byteArray) ) };

	if (S_OK == m_spIEC->IsActive ())
	{
		
		for (nNumEvent = 0; nNumEvent < nEvents; nNumEvent++)
		{		
				
				if ( S_OK == m_spIEC->FireEvent( CUSTOM_EVENT_GUID,
													MAXPARAMS,
													rgKeys,
													rgValues,
													rgTypes,0,0,
													cVSAEventDefaultSource | cVSAEventDefaultTarget) )
					wprintf (L"\nEvent#: %d fired.\n", nNumEvent);
				else
					wprintf (L"\nEvent#: %d WAS NOT fired.\n", nNumEvent);					
		}		
	}
	else 
	{		
		wprintf(L"\nSession not active! Nobody is subscribing to \"MyBasicCustomEventVC1\" events.\n");		
	}
	system("pause");
}

/******************************************************************
* Purpose:	A simulation used to fire another method. In the whole 
*			simulation, two event pairs will be fired. Each 
*			pair has the same CorrelationID. The CorreletionID is 
*			used by the Analyzer to determine the relationship 
*			between the events. For example call (CALL) to the 
*			method FireSimulationCalledMethod and return (RETURN) 
*			from the same method should have the same CorrelationID, 
*			so that Analyzer can relate them and plot them the 
*			correct way. Within the FireSimulationCalledMethod
*			two more events will be fired - one upon entering(ENTER) and 
*			one before leaving (LEAVE). They should have the same 
*			correlation ID, which must be different from the 
*			Call/Return's pair Correlation ID.
*			The CorrelationID is a string.
* Returns:  Nothing
*******************************************************************/
void CVSAnalyzerFire::FireSimulation(void)
{
int const MAXPARAMS = 3;	

#if !defined(_WIN64)
#pragma warning(disable: 4311) // Pointer truncations warning. See vaevt.idl for more information.
#endif

	DWORD rgKeys[ MAXPARAMS ] = {
	 cVSAStandardParameterCorrelationID,	// System-defined parameter
	(DWORD) L"First custom parameter",		// 2 custom parameters
	(DWORD) L"Second custom parameter"};		// Another system-defined parameter

	// This array holds the parameter values.
	DWORD rgValues[ MAXPARAMS ] = {
	//Notice the correlation ID is different than for the 
	//ENTER/LEAVE pair in FireSimulationCalledMethod
	(DWORD) L"Correlation_CallingMethod",
	(DWORD) "This is an ANSI string",
	(DWORD) &SAMPLE_GUID_PARAMETER};

#if !defined(_WIN64)
#pragma warning(default: 4311) // Pointer truncations warning.
#endif

	// Remember to specify cVSAParameterKeyString for ALL custom parameters
	// and to specify the length for all BYTE array data.
	DWORD rgTypes[ MAXPARAMS ] = { 
	cVSAParameterValueUnicodeString,
	cVSAParameterKeyString | cVSAParameterValueANSIString,
	cVSAParameterKeyString | cVSAParameterValueGUID};
            
                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                       
            //This is to check that the session is active and ready to accept events.
            //The session will be activated by LEC when there is a subscriber who
            //wants to receive events from this specific source, otherwise it will be inactive.
            //You would want to change the IF statement to correctly handle the inactive case.
		//It is not necessary to call IsActive everytime before calling FireEvent, because
		//FireEvent calls it internally. It makes sense to use IsActive only when you 
		//need to do extra work to collect some of the data to be passed along with the event.
		//So before collecting the data, you can check if you can use it at all
            if (S_OK == m_spIEC->IsActive ())
			{
					//Session is active fire events.               
                    //An event fired before calling a method.                    
					if ( S_OK == m_spIEC->FireEvent( DEBUG_EVENT_CALL,
													MAXPARAMS,
													rgKeys,
													rgValues,
													rgTypes,0,0,
													cVSAEventDefaultSource | cVSAEventDefaultTarget) )
						wprintf(L"\nDEBUG_EVENT_CALL fired.\n");
					else
						wprintf(L"\nDEBUG_EVENT_CALL WAS NOT fired.\n");                  
		

					// Call a method and trace the enter and leave events by firing event 
					// upon entering and one right before returning.
                   FireSimulationCalledMethod ();
                                                                                                                                                                                    
                    
                    //an event fired upon return from the method                    
                    if ( S_OK == m_spIEC->FireEvent( DEBUG_EVENT_RETURN,
													MAXPARAMS,
													rgKeys,
													rgValues,
													rgTypes,0,0,
													cVSAEventDefaultSource | cVSAEventDefaultTarget) )

						wprintf(L"\nDEBUG_EVENT_RETURN fired.\n");
					else
						wprintf(L"\nDEBUG_EVENT_RETURN WAS NOT fired.\n");						                                                                                                                                                                                   
			}
            else 
			{		
				wprintf(L"\nSession not active! Nobody is subscribing to events from BasicEventSrcVC.\n");		
			}

			//pauses the console so that the user can see the text
			system("pause");
}

/******************************************************************
* Purpose:	A method, which will be called by the FireSimulation
*			method in order to be able to simualte Call/return 
*			sequence of events.
* Returns:  Nothing
*******************************************************************/
// Word "which" in first sentence should be "that".
void CVSAnalyzerFire::FireSimulationCalledMethod(void)
{
int const MAXPARAMS = 3;	

#if !defined(_WIN64)
#pragma warning(disable: 4311) // Pointer truncations warning. See vaevt.idl for more information.
#endif

	DWORD rgKeys[ MAXPARAMS ] = {
	 cVSAStandardParameterCorrelationID,	// System-defined parameter
	(DWORD) L"First custom parameter",		// 2 custom parameters
	(DWORD) L"Second custom parameter"};		// Another system-defined parameter

	// This array holds the parameter values.
	DWORD rgValues[ MAXPARAMS ] = {
	//Notice the Correletaion ID will be the different than the one used
	//by the calling method. 
	(DWORD) L"Correlation_CalledMethod", 
	(DWORD) "This is an ANSI string",
	(DWORD) &SAMPLE_GUID_PARAMETER};

#if !defined(_WIN64)
#pragma warning(default: 4311) // Pointer truncations warning.
#endif

	// Remember to specify cVSAParameterKeyString for ALL custom parameters
	// and to specify the length for all BYTE array data.
	DWORD rgTypes[ MAXPARAMS ] = { 
	cVSAParameterValueUnicodeString,
	cVSAParameterKeyString | cVSAParameterValueANSIString,
	cVSAParameterKeyString | cVSAParameterValueGUID};
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
		//an event fired when the method is entered                  
		if ( S_OK == m_spIEC->FireEvent( DEBUG_EVENT_ENTER,
										MAXPARAMS,
										rgKeys,
										rgValues,
										rgTypes,0,0,
										cVSAEventDefaultSource | cVSAEventDefaultTarget) )

			wprintf(L"\nDEBUG_EVENT_ENTER fired.\n");
		else
			wprintf(L"\nDEBUG_EVENT_ENTER WAS NOT fired.\n");

			                     

		//Simulate the work done in the method                    
		Sleep(9000);
		                                                                                                                                                                                    
		//An event fired before leaving the method                    
		if ( S_OK == m_spIEC->FireEvent( DEBUG_EVENT_LEAVE_NORMAL,
										MAXPARAMS,
										rgKeys,
										rgValues,
										rgTypes,0,0,
										cVSAEventDefaultSource | cVSAEventDefaultTarget) )
		
			wprintf(L"\nDEBUG_EVENT_LEAVE_NORMAL fired.\n");
		else
			wprintf(L"\nDEBUG_EVENT_LEAVE_NORMAL WAS NOT fired.\n");	
			
}
