/****************************************************************************************
 * Copyright (c) Microsoft Corporation.  All Rights Reserved.
 *
 * File:
 *  ProfilerCallBack.cpp
 *
 * Description:
 *  
 *
 *
 ***************************************************************************************/ 
#include "ProfilerCallback.h"

          
/***************************************************************************************
 ********************                                               ********************
 ********************     ProfilerCallBack Implementation           ********************
 ********************                                               ********************
 ***************************************************************************************/
ProfilerCallback *g_pCallbackObject;


/***************************************************************************************
 ********************                                               ********************
 ********************   Global Functions Used by Function Hooks     ********************
 ********************                                               ********************
 ***************************************************************************************/

//
// The functions EnterStub, LeaveStub and TailcallStub are basically wrappers 
// because the __declspec(naked) definition does not allow for example
// the use of ProfilerCallback::Enter(functionID);
//
// The hooks implementation has to be __declspec(naked) please read the 
// corprof.idl for more details. The FunctionIDMapper() does not have to be
//  __declspec(naked)
//
void __stdcall EnterStub( FunctionID functionID )
{
    ProfilerCallback::Enter( functionID );
}


void __stdcall LeaveStub( FunctionID functionID )
{
    ProfilerCallback::Leave( functionID );
}


void __stdcall TailcallStub( FunctionID functionID )
{
    ProfilerCallback::Tailcall( functionID );
}


void __declspec( naked ) EnterNaked()
{
    __asm
    {
        push eax
        push ecx
        push edx
        push [esp+16]
        call EnterStub
        pop edx
        pop ecx
        pop eax
        ret 4
    }
}


void __declspec( naked ) LeaveNaked()
{
    __asm
    {
        push eax
        push ecx
        push edx
        push [esp+16]
        call LeaveStub
        pop edx
        pop ecx
        pop eax
        ret 4
    }
}


void __declspec(naked) TailcallNaked()
{
    __asm
    {
        push eax
        push ecx
        push edx
        push [esp+16]
        call TailcallStub
        pop edx
        pop ecx
        pop eax
        ret 4
    }
}


/***************************************************************************************
 *  Method:
 *
 *
 *  Purpose:
 *                  
 *
 *  Parameters: 
 *
 *
 *  Return value:
 *
 *
 *  Notes:
 *
 ***************************************************************************************/
/* public */
ProfilerCallback::ProfilerCallback() :
    m_refCount( 0 ),
	m_dwShutdown( 0 )
{
    //
	// Hold a pointer to the callback interface. It will be used
	// if abnormal shutdown occurs for releasign the profiler ressources
	//
	// We are monitoring only the events that we are interested in. 
	// This maximizes the performance. We still need to implement all
	// the callbacks of the callback interface but the code will never be hit.
	//  
	// Notice that we disabled globally the inlining. This makes the profiler more
	// accurate in monitoring functions but also affects the execution time and 
	// performance
	//
    g_pCallbackObject = this;
	m_dwEventMask = (DWORD) (   COR_PRF_MONITOR_CLASS_LOADS
							  | COR_PRF_MONITOR_MODULE_LOADS
							  | COR_PRF_MONITOR_ASSEMBLY_LOADS
							  | COR_PRF_MONITOR_APPDOMAIN_LOADS
							  | COR_PRF_MONITOR_JIT_COMPILATION
							  | COR_PRF_MONITOR_EXCEPTIONS
							  | COR_PRF_MONITOR_THREADS
							  | COR_PRF_MONITOR_CODE_TRANSITIONS
							  | COR_PRF_MONITOR_ENTERLEAVE
							  | COR_PRF_MONITOR_CACHE_SEARCHES
							  | COR_PRF_DISABLE_INLINING );

} // ctor


/***************************************************************************************
 *  Method:
 *
 *
 *  Purpose:
 *
 *
 *  Parameters: 
 *
 *
 *  Return value:
 *
 *
 *  Notes:
 *
 ***************************************************************************************/
/* public */
ProfilerCallback::~ProfilerCallback()
{
   	g_pCallbackObject = NULL;
        
} // dtor

        
/***************************************************************************************
 *  Method:
 *
 *
 *  Purpose:
 *
 *
 *  Parameters: 
 *
 *
 *  Return value:
 *
 *
 *  Notes:
 *
 ***************************************************************************************/
/* public */
ULONG ProfilerCallback::AddRef() 
{
    return InterlockedIncrement( &m_refCount );

} // ProfilerCallback::AddRef


/***************************************************************************************
 *  Method:
 *
 *
 *  Purpose:
 *
 *
 *  Parameters: 
 *
 *
 *  Return value:
 *
 *
 *  Notes:
 *
 ***************************************************************************************/
/* public */
ULONG ProfilerCallback::Release() 
{
    long refCount;


    refCount = InterlockedDecrement( &m_refCount );
    if ( refCount == 0 )
        delete this;
     

    return refCount;

} // ProfilerCallback::Release


/***************************************************************************************
 *  Method:
 *
 *
 *  Purpose:
 *
 *
 *  Parameters: 
 *
 *
 *  Return value:
 *
 *
 *  Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::QueryInterface( REFIID riid, void **ppInterface )
{
    if ( riid == IID_IUnknown )
        *ppInterface = static_cast<IUnknown *>( this ); 

    else if ( riid == IID_ICorProfilerCallback )
        *ppInterface = static_cast<ICorProfilerCallback *>( this );

    else
    {
        *ppInterface = NULL;


        return E_NOINTERFACE;
    }
    
    reinterpret_cast<IUnknown *>( *ppInterface )->AddRef();

    return S_OK;

} // ProfilerCallback::QueryInterface 


/***************************************************************************************
 *  Method:
 *
 *
 *  Purpose:
 *
 *
 *  Parameters: 
 *
 *
 *  Return value:
 *
 *
 *  Notes:
 *
 ***************************************************************************************/
/* public static */
HRESULT ProfilerCallback::CreateObject( REFIID riid, void **ppInterface )
{
    HRESULT hr = S_OK;
    
       
    if ( (riid == IID_IUnknown) || (riid == IID_ICorProfilerCallback) )
    {           
        ProfilerCallback *pProfilerCallback;
        
                
        pProfilerCallback = new ProfilerCallback();
        if ( pProfilerCallback != NULL )
        {
            pProfilerCallback->AddRef();
            *ppInterface = static_cast<ICorProfilerCallback *>( pProfilerCallback );
        }
        else
            hr = E_OUTOFMEMORY;
    }
    else
        hr = E_NOINTERFACE;
    

    return hr;

} // ProfilerCallback::CreateObject

/***************************************************************************************
 ********************                                               ********************
 ********************       Callbacks With Non Trivial 				********************
 ********************         Implementation Below   				********************
 ********************                                               ********************
 ***************************************************************************************/
/***************************************************************************************
 *  Method:
 *
 *
 *  Purpose:
 *
 *
 *  Parameters: 
 *
 *
 *  Return value:
 *
 *
 *  Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::Initialize( IUnknown *pICorProfilerInfoUnk )
{
    TEXT_OUTLN( "CLR Profiler General Code Profiler Sample" ) 
    
    HRESULT hr;

    
    hr = pICorProfilerInfoUnk->QueryInterface( IID_ICorProfilerInfo,
                                               (void **)&m_pProfilerInfo );   
    if ( SUCCEEDED( hr ) )
    {
        DWORD dwRequestedEvents = m_dwEventMask;

        hr = m_pProfilerInfo->SetEventMask(dwRequestedEvents);

        if ( SUCCEEDED( hr ) )
		{
            //
    		// Set the function hooks for enter, leave and tail calls
    		//
            hr = m_pProfilerInfo->SetEnterLeaveFunctionHooks ( (FunctionEnter *)&EnterNaked,
                                                               (FunctionLeave *)&LeaveNaked,
                                                               (FunctionTailcall *)&TailcallNaked );        
            if ( SUCCEEDED( hr ) )
    		{
    	        //
    			// Set the hooks for a function mapper
    			//
    			hr = m_pProfilerInfo->SetFunctionIDMapper( (FunctionIDMapper *)&FunctionMapper );			
    
    			if ( FAILED( hr ) )
    				Failure( "ICorProfilerInfo::SetFunctionIDMapper() FAILED" );
    		}
    		else
                Failure( "ICorProfilerInfo::SetEnterLeaveFunctionHooks() FAILED" );
        }
        else
            Failure( "ICorProfilerInfo::SetEventMask() FAILED" );
    }       
    else
        Failure( "Allocation for Profiler Test FAILED" );           
              
              
    return S_OK;

} // ProfilerCallback::Initialize


/***************************************************************************************
 *  Method:
 *
 *
 *  Purpose:
 *
 *
 *  Parameters: 
 *
 *
 *  Return value:
 *
 *
 *  Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::Shutdown()
{
	m_dwShutdown++;
	DumpTables();
    return S_OK;          

} // ProfilerCallback::Shutdown


/***************************************************************************************
 *  Method:
 *
 *
 *  Purpose:
 *
 *
 *  Parameters: 
 *
 *
 *  Return value:
 *
 *
 *  Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::DllDetachShutdown()
{
    //
    // If no shutdown came at DLL_DETACH, release yourself
	// this scenario will happen with any INTEROP program that
	// an unmanaged client uses a managed debuggee
    //
	m_dwShutdown++;
    if ( (m_dwShutdown == 1) && (g_pCallbackObject != NULL) )
	{
		DumpTables();
		g_pCallbackObject->Release();	
		g_pCallbackObject = NULL;
	}

    
    return S_OK;          

} // ProfilerCallback::DllExitShutdown


/***************************************************************************************
 ********************                                               ********************
 ******************** Callbacks With Default Implementation Below   ********************
 ********************                                               ********************
 ***************************************************************************************/

/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::AppDomainCreationStarted( AppDomainID appDomainID )
{
    
    //
    // Note that the appDomain is just being loaded so we don't expect the
    // data structure (representing the appDomain) to be complete
    // here. We have to wait until the creation is complete before attempting 
    // to get any info on the appDomain. 
	//
	// When we have a system Domain, then we can retrieve the full 
	// information at this point but for any other user-defined domains 
	// IcorProfilerInfo::GetAppDomain Info() will return hr == CORPROF_E_DATAINCOMPLETE.
	//
	// The reason for the different behavior is that the events for the system AppDomains
	// are send delayed after the actual AppDomain has been created and all 
	// the info is already available
	//

    return S_OK;

} // ProfilerCallback::AppDomainCreationStarted


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::AppDomainCreationFinished( AppDomainID appDomainID,
													 HRESULT hrStatus )
{

	_ASSERT_( SUCCEEDED( hrStatus ) );

	try
    {   
 		AddAppDomain( appDomainID );       
    }    
   	catch ( BaseException *exception )
    {
    	exception->ReportFailure();
        delete exception;
      	Failure();    
    }
    

    return S_OK;

} // ProfilerCallback::AppDomainCreationFinished


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::AppDomainShutdownStarted( AppDomainID appDomainID )
{
    //
	// At this point we can still use any information related to the 
	// appDomain that started shutting down. 
	//
    return S_OK;

} // ProfilerCallback::AppDomainShutdownStarted

	  

/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::AppDomainShutdownFinished( AppDomainID appDomainID,
													 HRESULT hrStatus )
{
	//
	// The information related to an appDomain is not valid at this point
	// We will mark the entry of the table as stale so we protect the profiler from
	// accessing invalid data
	//
	_ASSERT_( SUCCEEDED( hrStatus ) );

	try
    {   
 		RemoveAppDomain( appDomainID );       
    }    
   	catch ( BaseException *exception )
    {
    	exception->ReportFailure();
        delete exception;
      	Failure();    
    }
    
    return S_OK;

} // ProfilerCallback::AppDomainShutdownFinished


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::AssemblyLoadStarted( AssemblyID assemblyID )
{
    
    //
	// See AppDomainCreationStarted callback
	//
    return S_OK;

} // ProfilerCallback::AssemblyLoadStarted


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::AssemblyLoadFinished( AssemblyID assemblyID,
												HRESULT hrStatus )
{
	_ASSERT_( SUCCEEDED( hrStatus ) );

    try
    {   
 		AddAssembly( assemblyID );       
    }    
   	catch ( BaseException *exception )
    {
    	exception->ReportFailure();
        delete exception;
      	Failure();    
    }

    
    return S_OK;

} // ProfilerCallback::AssemblyLoadFinished


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::AssemblyUnloadStarted( AssemblyID assemblyID )
{
    //
	// At this point we can still use any information related to the 
	// assembly that started getting unloaded. 
	//
    return S_OK;

} // ProfilerCallback::AssemblyUnLoadStarted

	  
/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::AssemblyUnloadFinished( AssemblyID assemblyID,
												  HRESULT hrStatus )
{
	//
	// The information related to an assembly is not valid at this point
	// We will mark the entry of the table as stale so we protect the profiler from
	// accessing invalid data
	//
	_ASSERT_( SUCCEEDED( hrStatus ) );

    try
    {   
 		RemoveAssembly( assemblyID );       
    }    
   	catch ( BaseException *exception )
    {
    	exception->ReportFailure();
        delete exception;
      	Failure();    
    }


    return S_OK;

} // ProfilerCallback::AssemblyUnLoadFinished


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ModuleLoadStarted( ModuleID moduleID )
{
    //
    // The module is just being loaded so we don't expect the
    // data structure (representing the module) to be complete.
    // Calls to ICorProfilerInfo::GetModuleInfo wiil return 
    // CORPROF_E_DATAINCOMPLETE at all times
	//
    return S_OK;

} // ProfilerCallback::ModuleLoadStarted


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ModuleLoadFinished( ModuleID moduleID,
											  HRESULT hrStatus )
{
	_ASSERT_( SUCCEEDED( hrStatus ) );

    try
    {   
 		AddModule( moduleID );       
    }    
   	catch ( BaseException *exception )
    {
    	exception->ReportFailure();
        delete exception;
       
      	Failure();    
    }


    return S_OK;

} // ProfilerCallback::ModuleLoadFinished


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ModuleUnloadStarted( ModuleID moduleID )
{
   	//
	// At htis point we can use the information stored for the specific module.
	// This is the correct spot to release the metadata interface for the module
	//
   	ReleaseModuleMDInterface( moduleID );         		                

       
    return S_OK;

} // ProfilerCallback::ModuleUnloadStarted
	  

/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ModuleUnloadFinished( ModuleID moduleID,
												HRESULT hrStatus )
{
	//
	// The information related to a module is not valid at this point
	// We will mark the entry of the table as stale so we protect the profiler from
	// accessing invalid data
	//
	_ASSERT_( SUCCEEDED( hrStatus ) );

    try
    {   
 		RemoveModule( moduleID );       
    }    
   	catch ( BaseException *exception )
    {
    	exception->ReportFailure();
        delete exception;
       
      	Failure();    
    }

    
	return S_OK;

} // ProfilerCallback::ModuleUnloadFinished


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ModuleAttachedToAssembly( ModuleID moduleID,
													AssemblyID assemblyID )
{
	//
	// The assemblyID information is not always availabe at the ModuleLoadFinished 
	// callback. We need to wait for the ModuleAttachedToAssembly() notification 
	// before attempting to	read the information related to the assemblyID. See the
	// Profiling Documentation for more details
	//
	_ASSERT_( assemblyID != PROFILER_PARENT_UNKNOWN );

	try
	{   
		UpdateAssemblyInModule( moduleID, assemblyID );       			
	}    
	catch ( BaseException *exception )
	{
		exception->ReportFailure();
		delete exception;
   
  		Failure();    
	}

    
    return S_OK;

} // ProfilerCallback::ModuleAttachedToAssembly


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ClassLoadStarted( ClassID classID )
{
    //
    // The class is just being loaded so we don't expect the
    // data structure (representing the module) to be complete.
    // Calls to ICorProfilerInfo::GetClassInfo wiil return 
    // CORPROF_E_DATAINCOMPLETE at all times
	//
    return S_OK;

} // ProfilerCallback::ClassLoadStarted


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ClassLoadFinished( ClassID classID, 
											 HRESULT hrStatus )
{

	_ASSERT_( SUCCEEDED( hrStatus ) );

    try
    {    
       	AddClass( classID );       
   	}
    catch ( BaseException *exception )
    {    	
    	exception->ReportFailure();
        delete exception;
        
        Failure();    
    }


    return S_OK;

} // ProfilerCallback::ClassLoadFinished


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ClassUnloadStarted( ClassID classID )
{
    //
	// At this point we can still use any information related to the 
	// class that started getting unloaded. 
	//
    return S_OK;

} // ProfilerCallback::ClassUnloadStarted


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ClassUnloadFinished( ClassID classID, 
											   HRESULT hrStatus )
{
	_ASSERT_( SUCCEEDED( hrStatus ) );

    try
    {    
       	RemoveClass( classID );       
   	}
    catch ( BaseException *exception )
    {    	
    	exception->ReportFailure();
        delete exception;
        
        Failure();    
    }


    return S_OK;

} // ProfilerCallback::ClassUnloadFinished


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::FunctionUnloadStarted( FunctionID functionID )
{
	//
	// This callback is not implemented yet
    //
    return S_OK;

} // ProfilerCallback::FunctionUnloadStarted


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::JITCompilationStarted( FunctionID functionID,
                                                 BOOL fIsSafeToBlock )
{
    //
	// This is a safe spot to use Get/setILFunctionbody, before the function
	// gets JIT-compiled. We are not making use of those API's in the present sample
	// Code Profiler
	//
	try
	{      		
 		AddFunction( functionID );       
	}
	catch ( BaseException *exception )
	{
		exception->ReportFailure();
	    delete exception;
	   
	  	Failure();    
	}

    return S_OK;

} // ProfilerCallback::JITCompilationStarted


/***************************************************************************************
 *  Method:
 *
 *
 *  Purpose:
 *
 *
 *  Parameters: 
 *
 *
 *  Return value:
 *
 *
 *  Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::JITCompilationFinished( FunctionID functionID,
                                                  HRESULT hrStatus,
                                                  BOOL fIsSafeToBlock )
{
    //
	// Add the function entry to the table that we maintain. All the information should
	// be available at this point. If the fucntion has been prejitted and the search
	// returned success, we will never hit that callback 
	//
	_ASSERT_( SUCCEEDED( hrStatus ) );


	try
	{      		
 		UpdateFunction( functionID, JITTED );       
	}
	catch ( BaseException *exception )
	{
		exception->ReportFailure();
	    delete exception;
	   
	  	Failure();    
	}

    return S_OK;

} // ProfilerCallback::JITCompilationFinished


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::JITCachedFunctionSearchStarted( FunctionID functionID,
														  BOOL *pbUseCachedFunction )
{
	//
	// If you found a prejitted version of a function then use it
    //
    *pbUseCachedFunction = TRUE;

	try
	{      		
 		AddFunction( functionID );       
	}
	catch ( BaseException *exception )
	{
		exception->ReportFailure();
	    delete exception;
	   
	  	Failure();    
	}

    
    return S_OK;
    
} // ProfilerCallback::JITCachedFunctionSearchStarted


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::JITCachedFunctionSearchFinished( FunctionID functionID,
														   COR_PRF_JIT_CACHE result )
{
    //
	// Add the function entry to the table that we maintain only if the search
	// has been successful. All the information should be available at this point.
	// If the fucntion has not been found, we will receive normal JIT compilation
	// started and finished callbacks 
	//

    if ( result != COR_PRF_CACHED_FUNCTION_NOT_FOUND )
	{
		try
		{      		
	 		UpdateFunction( functionID, PREJITTED );       
		}
		catch ( BaseException *exception )
		{
			exception->ReportFailure();
		    delete exception;
		   
		  	Failure();    
		}
	}
	// else we will JIT the function so we will receive JIT events

    return S_OK;
    
} // ProfilerCallback::JITCachedFunctionSearchFinished


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::JITFunctionPitched( FunctionID functionID )
{
	//
	// We have pitched a function, mark its entry as pitched.
	// We will rejit the function if it is needed again. We mark it here
	// as pitched so we will not fail when we will attempt to add an entry 
	// that already exists in the JitCompilationFinished callback
	//
	try
	{      		
 		MarkFunctionAsPitched( functionID );       
	}
	catch ( BaseException *exception )
	{
		exception->ReportFailure();
	    delete exception;
	   
	  	Failure();    
	}

    
    return S_OK;
    
} // ProfilerCallback::JITFunctionPitched


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::JITInlining( FunctionID callerID,
                                       FunctionID calleeID,
                                       BOOL *pfShouldInline )
{
	//
	// We disabled the inliner globally, it is an error if we hit that code
	//
	_ASSERT_( !"JitInlining Callback Ocurred" );

    return S_OK;

} // ProfilerCallback::JITInlining


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::UnmanagedToManagedTransition( FunctionID functionID,
                                                        COR_PRF_TRANSITION_REASON reason )
{
	//
	// Update the status of thread.
	//
	try
	{      		
 		UpdateTransitionState( MANAGED );       
	}
	catch ( BaseException *exception )
	{
		exception->ReportFailure();
	    delete exception;
	   
	  	Failure();    
	}


    return S_OK;

} // ProfilerCallback::UnmanagedToManagedTransition


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ManagedToUnmanagedTransition( FunctionID functionID,
                                                        COR_PRF_TRANSITION_REASON reason )
{
	//
	// Update the status of thread.
	//
	try
	{      		
 		UpdateTransitionState( UNMANAGED );       
	}
	catch ( BaseException *exception )
	{
		exception->ReportFailure();
	    delete exception;
	   
	  	Failure();    
	}


    return S_OK;

} // ProfilerCallback::ManagedToUnmanagedTransition


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */ 
HRESULT ProfilerCallback::ThreadCreated( ThreadID threadID )
{
	//
	// A thread has been created, its Id is valid to use immediately.
	//
	try
	{      		
 		AddThread( threadID );       
	}
	catch ( BaseException *exception )
	{
		exception->ReportFailure();
	    delete exception;
	   
	  	Failure();    
	}


    return S_OK; 
    
} // ProfilerCallback::ThreadCreated


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ThreadDestroyed( ThreadID threadID )
{
	//
	// A thread has been destroyed, mark its entry as invalid.
	//
	try
	{      		
 		RemoveThread( threadID );       
	}
	catch ( BaseException *exception )
	{
		exception->ReportFailure();
	    delete exception;
	   
	  	Failure();    
	}


    return S_OK;
    
} // ProfilerCallback::ThreadDestroyed


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ThreadAssignedToOSThread( ThreadID managedThreadID,
                                                    DWORD osThreadID ) 
{
	//
	// A Runtime thread has changed Win32 thread that is assigned to.
	//
	try
	{      		
 		UpdateOSThreadID( managedThreadID, osThreadID );       
	}
	catch ( BaseException *exception )
	{
		exception->ReportFailure();
	    delete exception;
	   
	  	Failure();    
	}


    return S_OK;
    
} // ProfilerCallback::ThreadAssignedToOSThread


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::RemotingClientInvocationStarted()
{
	//
	// This callback is not monitored - default implementation
    //
    return S_OK;
    
} // ProfilerCallback::RemotingClientInvocationStarted


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::RemotingClientSendingMessage( GUID *pCookie,
    													BOOL fIsAsync )
{
	//
	// This callback is not monitored - default implementation
    //
    return S_OK;
    
} // ProfilerCallback::RemotingClientSendingMessage


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::RemotingClientReceivingReply(	GUID *pCookie,
	    												BOOL fIsAsync )
{
	//
	// This callback is not monitored - default implementation
    //
    return S_OK;
    
} // ProfilerCallback::RemotingClientReceivingReply


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::RemotingClientInvocationFinished()
{
	//
	// This callback is not monitored - default implementation
	//
   return S_OK;
    
} // ProfilerCallback::RemotingClientInvocationFinished


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::RemotingServerReceivingMessage( GUID *pCookie,
    													  BOOL fIsAsync )
{
	//
	// This callback is not monitored - default implementation
    //
    return S_OK;
    
} // ProfilerCallback::RemotingServerReceivingMessage


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::RemotingServerInvocationStarted()
{
	//
	// This callback is not monitored - default implementation
    //
    return S_OK;
    
} // ProfilerCallback::RemotingServerInvocationStarted


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::RemotingServerInvocationReturned()
{
	//
	// This callback is not monitored - default implementation
    //
    return S_OK;
    
} // ProfilerCallback::RemotingServerInvocationReturned


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::RemotingServerSendingReply( GUID *pCookie,
    												  BOOL fIsAsync )
{
	//
	// This callback is not monitored - default implementation
    //
    return S_OK;

} // ProfilerCallback::RemotingServerSendingReply


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::RuntimeSuspendStarted( COR_PRF_SUSPEND_REASON suspendReason )
{
	//
	// This callback is not monitored - default implementation
    //
    return S_OK;
    
} // ProfilerCallback::RuntimeSuspendStarted


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::RuntimeSuspendFinished()
{
	//
	// This callback is not monitored - default implementation
    //
    return S_OK;
    
} // ProfilerCallback::RuntimeSuspendFinished


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::RuntimeSuspendAborted()
{
	//
	// This callback is not monitored - default implementation
    //
    return S_OK;
    
} // ProfilerCallback::RuntimeSuspendAborted


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::RuntimeResumeStarted()
{
	//
	// This callback is not monitored - default implementation
    //
    return S_OK;
    
} // ProfilerCallback::RuntimeResumeStarted


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::RuntimeResumeFinished()
{
	//
	// This callback is not monitored - default implementation
    //
    return S_OK;
    
} // ProfilerCallback::RuntimeResumeFinished


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::RuntimeThreadSuspended( ThreadID threadID )
{
	//
	// This callback is not monitored - default implementation
    //
    return S_OK;
    
} // ProfilerCallback::RuntimeThreadSuspended


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::RuntimeThreadResumed( ThreadID threadID )
{
	//
	// This callback is not monitored - default implementation
    //
    return S_OK;
    
} // ProfilerCallback::RuntimeThreadResumed


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::MovedReferences( ULONG cmovedObjectIDRanges,
                                           ObjectID oldObjectIDRangeStart[],
                                           ObjectID newObjectIDRangeStart[],
                                           ULONG cObjectIDRangeLength[] )
{
	//
	// This callback is not monitored - default implementation
    //
    return S_OK;

} // ProfilerCallback::MovedReferences


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ObjectAllocated( ObjectID objectID,
                                           ClassID classID )
{
	//
	// This callback is not implemented yet
    //
    return S_OK;

} // ProfilerCallback::ObjectAllocated


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ObjectsAllocatedByClass( ULONG classCount,
                                                   ClassID classIDs[],
                                                   ULONG objects[] )
{
	//
	// This callback is not monitored - default implementation
    //
    return S_OK;

} // ProfilerCallback::ObjectsAllocatedByClass


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ObjectReferences( ObjectID objectID,
                                            ClassID classID,
                                            ULONG objectRefs,
                                            ObjectID objectRefIDs[] )
{
	//
	// This callback is not monitored - default implementation
    //
    return S_OK;

} // ProfilerCallback::ObjectReferences


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::RootReferences( ULONG rootRefs,
                                          ObjectID rootRefIDs[] )
{
	//
	// This callback is not monitored - default implementation
    //
    return S_OK;

} // ProfilerCallback::RootReferences


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ExceptionThrown( ObjectID thrownObjectID )
{
	//
	// We are not extracting information about exceptions - default implementation
    //
    return S_OK;

} // ProfilerCallback::ExceptionThrown 


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ExceptionUnwindFunctionEnter( FunctionID functionID )
{
	//
	// We have to push the function ID to the stack related to the thread that
	// invoked the ExceptionUnwindFunctionEnter() callback. We need to cache the
	// functionID because in case of nested callback we will not which function's
	// counters to update  
	//
    try
    {
    	UpdateUnwindStack( &functionID, PUSH ); 
   	}
    catch ( BaseException *exception )
    {    	
    	exception->ReportFailure();
        delete exception;
        
        Failure();       	    
    }


    return S_OK;

} // ProfilerCallback::ExceptionUnwindFunctionEnter


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ExceptionUnwindFunctionLeave( )
{
	//
	// We have to pop the function ID from the stack related to the thread that
	// invoked the ExceptionUnwindFunctionLeave() callback. We will use this function 
	// ID to update its counters after we do a search in the function's list. 
	// 
    try
    {
    	FunctionID functionID;
    	
    	
    	//
    	// Pop the last function that was pushed to th thread's unwind stack
    	// and update the function's counters 
    	//
    	UpdateUnwindStack( &functionID, POP );
		UpdateEnterExitCounters( functionID, UNWIND );
   	}
    catch ( BaseException *exception )
    {    	
    	exception->ReportFailure();
        delete exception;
        
        Failure();       	    
    }


    return S_OK;

} // ProfilerCallback::ExceptionUnwindFunctionLeave


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ExceptionSearchFunctionEnter( FunctionID functionID )
{
	//
	// We are not extracting information about exceptions - default implementation
    //
    return S_OK;

} // ProfilerCallback::ExceptionSearchFunctionEnter


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ExceptionSearchFunctionLeave()
{
	//
	// We are not extracting information about exceptions - default implementation
    //
    return S_OK;

} // ProfilerCallback::ExceptionSearchFunctionLeave


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ExceptionSearchFilterEnter( FunctionID functionID )
{
	//
	// We are not extracting information about exceptions - default implementation
    //
    return S_OK;

} // ProfilerCallback::ExceptionSearchFilterEnter


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ExceptionSearchFilterLeave()
{
	//
	// We are not extracting information about exceptions - default implementation
    //
    return S_OK;

} // ProfilerCallback::ExceptionSearchFilterLeave 


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ExceptionSearchCatcherFound( FunctionID functionID )
{
	//
	// We are not extracting information about exceptions - default implementation
    //
    return S_OK;

} // ProfilerCallback::ExceptionSearchCatcherFound


/***************************************************************************************
 *  Method:
 *
 *
 *  Purpose:
 *
 *
 *  Parameters:
 *
 *
 *  Return value:
 *
 *
 *  Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ExceptionCLRCatcherFound()
{
    return S_OK;
}


/***************************************************************************************
 *  Method:
 *
 *
 *  Purpose:
 *
 *
 *  Parameters:
 *
 *
 *  Return value:
 *
 *
 *  Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ExceptionCLRCatcherExecute()
{
    return S_OK;
}


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ExceptionOSHandlerEnter( FunctionID functionID )
{
	//
	// We are not extracting information about exceptions - default implementation
    //
    return S_OK;

} // ProfilerCallback::ExceptionOSHandlerEnter

    
/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ExceptionOSHandlerLeave( FunctionID functionID )
{
	//
	// We are not extracting information about exceptions - default implementation
    //
    return S_OK;

} // ProfilerCallback::ExceptionOSHandlerLeave


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ExceptionUnwindFinallyEnter( FunctionID functionID )
{
	//
	// We are not extracting information about exceptions - default implementation
    //
    return S_OK;

} // ProfilerCallback::ExceptionUnwindFinallyEnter


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ExceptionUnwindFinallyLeave()
{
	//
	// We are not extracting information about exceptions - default implementation
    //
    return S_OK;

} // ProfilerCallback::ExceptionUnwindFinallyLeave


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ExceptionCatcherEnter( FunctionID functionID,
    											 ObjectID objectID )
{
	//
	// We are not extracting information about exceptions - default implementation
    //
    return S_OK;

} // ProfilerCallback::ExceptionCatcherEnter


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::ExceptionCatcherLeave()
{
	//
	// We are not extracting information about exceptions - default implementation
    //
    return S_OK;

} // ProfilerCallback::ExceptionCatcherLeave


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::COMClassicVTableCreated( ClassID wrappedClassID,
													REFGUID implementedIID,
													void *pVTable,
													ULONG cSlots )
{
    return S_OK;

} // ProfilerCallback::COMClassicVTableCreated


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
HRESULT ProfilerCallback::COMClassicVTableDestroyed( ClassID wrappedClassID,
    												  REFGUID implementedIID,
													  void *pVTable )
{
    return S_OK;

} // ProfilerCallback::COMClassicVTableDestroyed


/***************************************************************************************
 *  Method:
 *
 *
 *  Purpose:
 *
 *
 *  Parameters: 
 *
 *
 *  Return value:
 *
 *
 *  Notes:
 *
 ***************************************************************************************/
/* public */
void ProfilerCallback::Enter( FunctionID functionID )
{
	g_pCallbackObject->UpdateEnterExitCounters( functionID, ENTER );

} // ProfilerCallback::Enter


/***************************************************************************************
 *  Method:
 *
 *
 *  Purpose:
 *
 *
 *  Parameters: 
 *
 *
 *  Return value:
 *
 *
 *  Notes:
 *
 ***************************************************************************************/
/* public */
void ProfilerCallback::Leave( FunctionID functionID )
{
	g_pCallbackObject->UpdateEnterExitCounters( functionID, LEAVE );

} // ProfilerCallback::Leave


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
void ProfilerCallback::Tailcall( FunctionID functionID )
{
	g_pCallbackObject->UpdateEnterExitCounters( functionID, TAIL );
 
} // ProfilerCallback::Tailcall


/***************************************************************************************
 *	Method:
 *
 *
 *	Purpose:
 *
 *
 *	Parameters: 
 *
 *
 *	Return value:
 *
 *
 *	Notes:
 *
 ***************************************************************************************/
/* public */
UINT_PTR ProfilerCallback::FunctionMapper( FunctionID functionID,
										   BOOL *pbHookFunction )
{
	//
	// Use a default function mapper implementation
	//
	*pbHookFunction = TRUE;	


	return (UINT_PTR) functionID;
 
} // ProfilerCallback::FunctionMapper


/***************************************************************************************
 ********************                                               ********************
 ********************              DllMain/ClassFactory             ********************
 ********************                                               ********************
 ***************************************************************************************/ 
#include "dllmain.hpp"

// End of File

