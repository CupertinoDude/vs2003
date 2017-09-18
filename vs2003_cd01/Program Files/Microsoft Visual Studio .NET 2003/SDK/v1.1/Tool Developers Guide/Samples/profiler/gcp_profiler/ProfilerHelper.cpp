/****************************************************************************************
 * Copyright (c) Microsoft Corporation.  All Rights Reserved.
 *
 * File:
 *  ProfilerHelper.cpp
 *
 * Description:
 *	
 *
 *
 ***************************************************************************************/
#include "ProfilerHelper.h"


/***************************************************************************************
 ********************                                               ********************
 ********************             StackBaseInfo Implementation      ********************
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
StackBaseInfo::StackBaseInfo( ULONG id ) : 
	m_id( id )
{} // ctor         		


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
/* public virtual */
StackBaseInfo::~StackBaseInfo()
{} // dtor


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
StackBaseInfo *StackBaseInfo::Clone()
{
    return new StackBaseInfo( m_id );
    
} // BaseInfo::Clone


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
void StackBaseInfo::Dump()
{
	wprintf( L"\n" );
	wprintf( L"STACKED ID: 0x%08x\n", m_id );
    
} // BaseInfo::Dump


/***************************************************************************************
 ********************                                               ********************
 ********************             BaseInfo Implementation           ********************
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
BaseInfo::BaseInfo( ULONG id ) : 
	m_id( id ),
	m_isValid( TRUE )
{
   	wcscpy( m_name, L"UNKNOWN" ); 	

} // ctor         		


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
/* public virtual */
BaseInfo::~BaseInfo()
{} // dtor


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
BOOL BaseInfo::Compare( ULONG key )
{
    return (BOOL)(m_id == key);

} // BaseInfo::Compare


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
void BaseInfo::Dump( )
{
	wprintf( L"\n" );
	wprintf( L"ID: 0x%08x\n", m_id );
	wprintf( L"\n" );

} // BaseInfo::Dump


/***************************************************************************************
 ********************                                               ********************
 ********************           AppDomainInfo Implementation        ********************
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
AppDomainInfo::AppDomainInfo( AppDomainID appDomainID ) : 
    BaseInfo( appDomainID ),        	
	m_processID( 0 )

{} // ctor         		


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
/* public virtual */
AppDomainInfo::~AppDomainInfo()
{} // dtor
        

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
void AppDomainInfo::Dump()
{
	wprintf( L"\n" );
	wprintf( L"APPDOMAIN ID: 0x%08x\n", m_id );
	wprintf( L"\tNAME: %s\n", m_name );
	wprintf( L"\tPROCESS ID: 0x%08x\n", m_processID );
	wprintf( L"\n" );
        
} // AppDomainInfo::Dump

/***************************************************************************************
 ********************                                               ********************
 ********************           AssemblyInfo Implementation        ********************
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
AssemblyInfo::AssemblyInfo( AssemblyID assemblyID ) : 
    BaseInfo( assemblyID ),        	
	m_moduleID( 0 ),
	m_appDomainID( 0 )
{} // ctor         		


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
/* public virtual */
AssemblyInfo::~AssemblyInfo()
{} // dtor
        

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
void AssemblyInfo::Dump()
{
	wprintf( L"\n" );
	wprintf( L"ASSEMBLY ID: 0x%08x\n", m_id );
	wprintf( L"\tNAME: %s\n", m_name );
	wprintf( L"\tMODULE ID: 0x%08x\n", m_moduleID );
	wprintf( L"\tAPPDOMAIN ID: 0x%08x\n", m_appDomainID );
	wprintf( L"\n" );
        
} // AssemblyInfo::Dump


/***************************************************************************************
 ********************                                               ********************
 ********************           ModuleInfo Implementation           ********************
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
ModuleInfo::ModuleInfo( ModuleID moduleID ) : 
    BaseInfo( moduleID ),    
    m_pMDImport( NULL ),
    m_assemblyID( NULL ),    	
	m_pBaseLoadAddress( NULL )
{} // ctor         		


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
/* public virtual */
ModuleInfo::~ModuleInfo()
{
	if ( m_pMDImport !=  NULL )
	{
		m_pMDImport->Release();
		m_pMDImport = NULL;
	}

} // dtor
        

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
void ModuleInfo::Dump()
{
	wprintf( L"\n" );
	wprintf( L"MODULE ID: 0x%08x\n", m_id );
	wprintf( L"\tNAME: %s\n", m_name );
	wprintf( L"\tASSEMBLY ID: 0x%08x\n", m_assemblyID );
	wprintf( L"\tBASE ADDRESS: 0x%08x\n", m_pBaseLoadAddress );
	wprintf( L"\n" );

} // ModuleInfo::Dump


/***************************************************************************************
 ********************                                               ********************
 ********************            ClassInfo Implementation           ********************
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
ClassInfo::ClassInfo( ClassID classID ) : 
    BaseInfo( classID ),
    m_moduleID( 0 ),
    m_token( mdTypeDefNil )
{} // ctor         		


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
/* public virtual */
ClassInfo::~ClassInfo()
{} // dtor
        

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
void ClassInfo::Dump()
{
	wprintf( L"\n" );
	wprintf( L"CLASS ID: 0x%08x\n", m_id );
	wprintf( L"\tNAME: %s\n", m_name );
	wprintf( L"\tTOKEN: 0x%08x\n", m_token );
	wprintf( L"\tMODULE ID: 0x%08x\n", m_moduleID );
	wprintf( L"\n" );

} // ClassInfo::Dump


/***************************************************************************************
 ********************                                               ********************
 ********************            ThreadInfo Implementation          ********************
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
ThreadInfo::ThreadInfo( ThreadID threadID ) : 
	BaseInfo( threadID ),		
	m_hThread( NULL ), 
	m_win32ThreadID( 0 ),
	m_originalTID( threadID ),
	m_status( UNINITIALIZED )
{
   	m_pLatestUnwoundFunction = new CStack<StackBaseInfo *>();
	wcscpy( m_name, L"NOT-APPLICABLE" ); 	

} // ctor         		


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
/* public virtual */
ThreadInfo::~ThreadInfo()
{
    if ( m_pLatestUnwoundFunction != NULL )
	{
    	delete m_pLatestUnwoundFunction; 
		m_pLatestUnwoundFunction = NULL;
	}
    
} // dtor
        

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
void ThreadInfo::Dump()
{	
	wprintf( L"\n" );
	wprintf( L"THREAD ID: 0x%08x\n", m_id );
	wprintf( L"\tHANDLE: 0x%08x\n", m_hThread );
	wprintf( L"\tWIN32 ID: 0x%08x\n", m_win32ThreadID );
	wprintf( L"\n" );

} // ThreadInfo::Dump


/***************************************************************************************
 ********************                                               ********************
 ********************          FunctionInfo Implementation          ********************
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
FunctionInfo::FunctionInfo( FunctionID functionID ) : 
    BaseInfo( functionID ),    	
	m_left( 0 ),
	m_tail( 0 ),
	m_enter( 0 ),
	m_unwind( 0 ),
	m_jitStatus( NONE ),
	m_isPitched( FALSE ),
    m_classID( 0 ),
    m_moduleID( 0 ),
  	m_codeSize( 0 ),    	
    m_token( mdTokenNil ),
	m_pStartAddress( NULL )
{} // ctor         		


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
/* public virtual */
FunctionInfo::~FunctionInfo()
{} // dtor
        

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
void FunctionInfo::Dump()
{

	wprintf( L"\n" );
	wprintf( L"FUNCTION ID: 0x%08x\n", m_id );
	wprintf( L"\tNAME: %s\n", m_name );
	wprintf( L"\tTOKEN: 0x%08x\n", m_token );
	wprintf( L"\tCLASS ID: 0x%08x\n", m_classID );
	wprintf( L"\tMODULE ID: 0x%08x\n", m_moduleID );
	wprintf( L"\tCODE SIZE: %d bytes\n", m_codeSize );
	wprintf( L"\tSTART ADDRESS: 0x%08x", m_pStartAddress );
	wprintf( L"\n" );

	wprintf( L"\tDumping Enter-Leave event counters\n" );

	wprintf( L"\t\tEnter Counter:    %d\n",	m_enter );
	wprintf( L"\t\tLeft Counter:     %d\n",	m_left );
	wprintf( L"\t\tTailCall Counter: %d\n",	m_tail );
	wprintf( L"\t\tUnwind Counter:   %d\n",	m_unwind );

	wprintf( L"\n" );
                   
} // FunctionInfo::Dump


/***************************************************************************************
 ********************                                               ********************
 ********************              PrfInfo Implementation           ********************
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
PrfInfo::PrfInfo() :         
    m_pProfilerInfo( NULL )
{

    InitializeCriticalSection( &m_criticalSection );
 
    // initialize tables	
    m_pClassTable = new SList<ClassInfo *, ClassID>();
    m_pThreadTable = new SList<ThreadInfo *, ThreadID>();
    m_pModuleTable = new SList<ModuleInfo *, ModuleID>();    
    m_pFunctionTable = new SList<FunctionInfo *, FunctionID>();
    m_pAssemblyTable = new SList<AssemblyInfo *, AssemblyID>();
    m_pAppDomainTable = new SList<AppDomainInfo *, AppDomainID>();

} // ctor


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
/* virtual public */
PrfInfo::~PrfInfo()
{

	// release the ICorProfilerInfoInterface
    if ( m_pProfilerInfo != NULL )
	{
    	m_pProfilerInfo->Release();
		m_pProfilerInfo = NULL;
	}

   	// clean up tables   	   	
	if ( m_pClassTable != NULL )
   		delete m_pClassTable;
    
    if ( m_pThreadTable != NULL )    
    	delete m_pThreadTable;
    
    if ( m_pModuleTable != NULL )    
    	delete m_pModuleTable;      
              
    if ( m_pFunctionTable != NULL )    
    	delete m_pFunctionTable;
        
  	if ( m_pAppDomainTable != NULL )
   		delete m_pAppDomainTable;

   	if ( m_pAssemblyTable != NULL )
   		delete m_pAssemblyTable;

  	DeleteCriticalSection( &m_criticalSection );

} // dtor 				 


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
/* throws BaseException */
void PrfInfo::AddAppDomain( AppDomainID appDomainID )
{    
    AppDomainInfo *pAppDomainInfo;
    
	
	pAppDomainInfo = m_pAppDomainTable->Lookup( appDomainID );
	//
	// there are 3 cases here:
	//	1. The entry was not found, a new appdomain is being created
	//	2. The entry was found but is invalid which implies that
	//	   it has previously been deleted
	//	3. The entry was found, it is valid therefore this is an error
	//
	//
	
	// case 1
	if ( pAppDomainInfo == NULL )
	{
		pAppDomainInfo = new AppDomainInfo( appDomainID );
	}
	
	// case 2
	else if ( pAppDomainInfo->m_isValid == FALSE )
	{
		//
		// delete the old entry and create a new one
		//
		m_pAppDomainTable->DelEntry( appDomainID );
		pAppDomainInfo = NULL;
		pAppDomainInfo = new AppDomainInfo( appDomainID );
	}
	
	// case 3
	else
   		_THROW_EXCEPTION( "Attempting to Add Duplicate AppDomain Entry" )
	

	if ( pAppDomainInfo != NULL )
  	{
    	try
        {
         	_GetAppDomainInfoHelper( &pAppDomainInfo );
            m_pAppDomainTable->AddEntry( pAppDomainInfo, appDomainID );	
       	}
        catch ( BaseException *exception )
        {
        	delete pAppDomainInfo;            
            throw;                       	
    	}
   	}
    else
    	_THROW_EXCEPTION( "Allocation for AppDomainInfo Object FAILED" )
        
} // PrfInfo::AddAppDomain


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
/* throws BaseException */
void PrfInfo::RemoveAppDomain( AppDomainID appDomainID )
{    
	if ( appDomainID != NULL )
  	{
    	AppDomainInfo *pAppDomainInfo;

    	
		pAppDomainInfo = m_pAppDomainTable->Lookup( appDomainID );
		if ( pAppDomainInfo != NULL )
		{
	    	_ASSERT_( pAppDomainInfo->m_isValid == TRUE );
	    	pAppDomainInfo->m_isValid = FALSE;
		}
		else
	    	_THROW_EXCEPTION( "AppDomain was not found in the AppDomain Table" )
	}
	else
    	_THROW_EXCEPTION( "AppDomainID is NULL" )


} // PrfInfo::RemoveAppDomain


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
/* throws BaseException */
void PrfInfo::AddAssembly( AssemblyID assemblyID )
{    
    AssemblyInfo *pAssemblyInfo;
    

	pAssemblyInfo = m_pAssemblyTable->Lookup( assemblyID );
	//
	// there are 3 cases here:
	//	1. The entry was not found, a new assembly is being created
	//	2. The entry was found but is invalid which implies that
	//	   it has previously been deleted
	//	3. The entry was found, it is valid therefore this is an error
	//
	//
	
	// case 1
	if ( pAssemblyInfo == NULL )
	{
		pAssemblyInfo = new AssemblyInfo( assemblyID );
	}
	
	// case 2
	else if ( pAssemblyInfo->m_isValid == FALSE )
	{
		//
		// delete the old entry and create a new one
		//
		m_pAssemblyTable->DelEntry( assemblyID );
		pAssemblyInfo = NULL;
		pAssemblyInfo = new AssemblyInfo( assemblyID );
	}
	
	// case 3
	else
   		_THROW_EXCEPTION( "Attempting to Add Duplicate Assembly Entry" )

    
    pAssemblyInfo = new AssemblyInfo( assemblyID );
	if ( pAssemblyInfo != NULL )
  	{
    	try
        {
        	_GetAssemblyInfoHelper( &pAssemblyInfo );
            m_pAssemblyTable->AddEntry( pAssemblyInfo, assemblyID );
      	}     
        catch ( BaseException *exception )
        {
        	delete pAssemblyInfo;
           	throw;            
    	}
   	}
    else
    	_THROW_EXCEPTION( "Allocation for AssemblyInfo Object FAILED" )
        
        
} // PrfInfo::AddAssembly


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
/* throws BaseException */
void PrfInfo::RemoveAssembly( AssemblyID assemblyID )
{    
	if ( assemblyID != NULL )
  	{
    	AssemblyInfo *pAssemblyInfo;

    	
		pAssemblyInfo = m_pAssemblyTable->Lookup( assemblyID );
		if ( pAssemblyInfo != NULL )
		{
	    	_ASSERT_( pAssemblyInfo->m_isValid == TRUE );
	    	pAssemblyInfo->m_isValid = FALSE;
		}
		else
	    	_THROW_EXCEPTION( "Assembly was not found in the Assembly Table" )
	}
	else
    	_THROW_EXCEPTION( "AssemblyID is NULL" )


} // PrfInfo::RemoveAssembly


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
/* throws BaseException */
void PrfInfo::AddModule( ModuleID moduleID )
{    
    ModuleInfo *pModuleInfo;
    

	pModuleInfo = m_pModuleTable->Lookup( moduleID );
	//
	// there are 3 cases here:
	//	1. The entry was not found, a new module is being created
	//	2. The entry was found but is invalid which implies that
	//	   it has previously been deleted
	//	3. The entry was found, it is valid therefore this is an error
	//
	//
	
	// case 1
	if ( pModuleInfo == NULL )
	{
		pModuleInfo = new ModuleInfo( moduleID );
	}
	
	// case 2
	else if ( pModuleInfo->m_isValid == FALSE )
	{
		//
		// delete the old entry and create a new one
		//
		m_pModuleTable->DelEntry( moduleID );
		pModuleInfo = NULL;
		pModuleInfo = new ModuleInfo( moduleID );
	}
	
	// case 3
	else
   		_THROW_EXCEPTION( "Attempting to Add Duplicate Module Entry" )

    pModuleInfo = new ModuleInfo( moduleID );
	if ( pModuleInfo != NULL )
  	{
    	try
        {      
    		_GetModuleInfoHelper( &pModuleInfo );
            m_pModuleTable->AddEntry( pModuleInfo, moduleID );	
       	}
        catch ( BaseException *exception )
		{    
        	delete pModuleInfo;
			throw;	
    	}
   	}
    else
    	_THROW_EXCEPTION( "Allocation for ModuleInfo Object FAILED" )
        
        
} // PrfInfo::AddModule


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
/* throws BaseException */
void PrfInfo::RemoveModule( ModuleID moduleID )
{    
	if ( moduleID != NULL )
  	{
    	ModuleInfo *pModuleInfo;

    	
		pModuleInfo = m_pModuleTable->Lookup( moduleID );
		if ( pModuleInfo != NULL )
		{
	    	_ASSERT_( pModuleInfo->m_isValid == TRUE );
	    	pModuleInfo->m_isValid = FALSE;
		}
		else
	    	_THROW_EXCEPTION( "Module was not found in the Module Table" )
	}
	else
    	_THROW_EXCEPTION( "ModuleID is NULL" )
		        
        
} // PrfInfo::RemoveModule


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
void PrfInfo::ReleaseModuleMDInterface( ModuleID moduleID )
{
  	ModuleInfo *pModuleInfo;
            
    
    // release the MetaData interface for the module here...        
  	pModuleInfo = m_pModuleTable->Lookup( moduleID );
   	if ( (pModuleInfo != NULL) && (pModuleInfo->m_pMDImport != NULL) )
    {
    	pModuleInfo->m_pMDImport->Release();
		pModuleInfo->m_pMDImport = NULL;
	}
          
} // PrfInfo::ReleaseModuleMDInterface


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
void PrfInfo::UpdateAssemblyInModule( ModuleID moduleID, AssemblyID assemblyID )
{
  	ModuleInfo *pModuleInfo;
            
    
    //
    // Update the Assembly for the module here...        
  	//
  	pModuleInfo = m_pModuleTable->Lookup( moduleID );
	if ( pModuleInfo != NULL )
	{
	    _ASSERT_( pModuleInfo->m_isValid == TRUE );
		if ( assemblyID != PROFILER_PARENT_UNKNOWN )
			pModuleInfo->m_assemblyID = assemblyID;
		
		else
			_THROW_EXCEPTION( "Assembly ID Not Valid - Unable to Update Profiler Tables" )		
	}
	else
		_THROW_EXCEPTION( "Module Does Not Exist In Profiler Tables" )		

          
} // PrfInfo::UpdateAssemblyInModule


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
/* throws BaseException */
void PrfInfo::AddClass( ClassID classID )
{    
    ClassInfo *pClassInfo;
    

	pClassInfo = m_pClassTable->Lookup( classID );
	//
	// there are 3 cases here:
	//	1. The entry was not found, a new class is being loaded
	//	2. The entry was found but is invalid which implies that
	//	   it has previously been deleted
	//	3. The entry was found, it is valid therefore this is an error
	//
	//
	
	// case 1
	if ( pClassInfo == NULL )
	{
		pClassInfo = new ClassInfo( classID );
	}
	
	// case 2
	else if ( pClassInfo->m_isValid == FALSE )
	{
		//
		// delete the old entry and create a new one
		//
		m_pModuleTable->DelEntry( classID );
		pClassInfo = NULL;
		pClassInfo = new ClassInfo( classID );
	}
	
	// case 3
	else
   		_THROW_EXCEPTION( "Attempting to Add Duplicate Class Entry" )

	if ( pClassInfo != NULL )
  	{
    	try
        {
        	_GetClassInfoHelper( &pClassInfo );                                                                                                                                             
			m_pClassTable->AddEntry( pClassInfo, classID ); 
        }
        catch ( BaseException *exception )                     
        {
        	delete pClassInfo;
            throw;           	
      	}
   	}
    else
    	_THROW_EXCEPTION( "Allocation for ClassInfo Object FAILED" )

        
} // PrfInfo::AddClass


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
/* throws BaseException */
void PrfInfo::RemoveClass( ClassID classID )
{    
	if ( classID != NULL )
  	{
    	ClassInfo *pClassInfo;

    	
		pClassInfo = m_pClassTable->Lookup( classID );
		if ( pClassInfo != NULL )
		{
	    	_ASSERT_( pClassInfo->m_isValid == TRUE );
	    	pClassInfo->m_isValid = FALSE;
		}
		else
	    	_THROW_EXCEPTION( "Class was not found in the Class Table" )
	}
	else
    	_THROW_EXCEPTION( "ClassID is NULL" )


} // PrfInfo::RemoveClass


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
/* throws BaseException */
void PrfInfo::AddThread( ThreadID threadID )
{    
   	///////////////////////////////////////////////////////////////////////////
    Synchronize guard( m_criticalSection );
    ///////////////////////////////////////////////////////////////////////////

	HRESULT hr;
	ThreadID myThreadID;

	hr = m_pProfilerInfo->GetCurrentThreadID( &myThreadID );
	
	if ( SUCCEEDED( hr ) )
	{
		
		if ( threadID == myThreadID )
		{
			ThreadInfo *pThreadInfo;
		    
		    pThreadInfo = new ThreadInfo( threadID );
			if ( pThreadInfo != NULL )
		  	{
		    	try
		        {
		    		_GetThreadInfoHelper( &pThreadInfo );
		        	m_pThreadTable->AddEntry( pThreadInfo, threadID );
		       	}
		        catch ( BaseException *exception )
		    	{
		        	delete pThreadInfo;
		            throw;    		     
		     	}                    
		    }
		    else
		    	_THROW_EXCEPTION( "Allocation for ThreadInfo Object FAILED" )
		}
		else
			_THROW_EXCEPTION( "Thread ID's do not match FAILED" )
	}
	else
    	_THROW_EXCEPTION( "ICorProfilerInfo::GetCurrentThreadID() FAILED" )
		        
} // PrfInfo::AddThread


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
/* throws BaseException */
void PrfInfo::RemoveThread( ThreadID threadID )
{    
   	///////////////////////////////////////////////////////////////////////////
    Synchronize guard( m_criticalSection );
    ///////////////////////////////////////////////////////////////////////////
    
	if ( threadID != NULL )
  	{
    	ThreadInfo *pThreadInfo;

    	
		pThreadInfo = m_pThreadTable->Lookup( threadID );
		if ( pThreadInfo != NULL )
		{
	    	_ASSERT_( pThreadInfo->m_isValid == TRUE );
	    	pThreadInfo->m_isValid = FALSE;
			pThreadInfo->m_id = 0xbadf00d;
		}
		else
	    	_THROW_EXCEPTION( "Thread was not found in the Thread Table" )
	}
	else
    	_THROW_EXCEPTION( "ThreadID is NULL" )
		        
        
} // PrfInfo::RemoveThread


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
/* throws BaseException */
void PrfInfo::UpdateTransitionState( TransitionState state )
{
   	///////////////////////////////////////////////////////////////////////////
    Synchronize guard( m_criticalSection );
    ///////////////////////////////////////////////////////////////////////////

	HRESULT hr;
	ThreadID threadID;


	hr = m_pProfilerInfo->GetCurrentThreadID( &threadID );
	if ( SUCCEEDED(hr) )
	{
		ThreadInfo *pThreadInfo = m_pThreadTable->Lookup( threadID );


		if ( pThreadInfo != NULL )
		{
			_ASSERT_( pThreadInfo->m_isValid == TRUE );
	 		pThreadInfo->m_status = state;
		
		}
		else 				
			_THROW_EXCEPTION( "Thread Structure was not found in the thread list" )
	}
	else
		_THROW_EXCEPTION( "ICorProfilerInfo::GetCurrentThreadID() FAILED" )

    
} // PrfInfo::UpdateTransitionState


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
/* throws BaseException */
void PrfInfo::UpdateOSThreadID( ThreadID managedThreadID, DWORD win32ThreadID )
{
   	///////////////////////////////////////////////////////////////////////////
    Synchronize guard( m_criticalSection );
    ///////////////////////////////////////////////////////////////////////////

	if ( managedThreadID != NULL )
  	{
	  	ThreadInfo *pThreadInfo;

		
		pThreadInfo = m_pThreadTable->Lookup( managedThreadID );
		if ( pThreadInfo != NULL )
		{
	    	_ASSERT_( pThreadInfo->m_isValid == TRUE );
			pThreadInfo->m_win32ThreadID = win32ThreadID;
		}
		else
	    	_THROW_EXCEPTION( "Thread was not found in the Thread Table" )
	}
	else
    	_THROW_EXCEPTION( "ThreadID is NULL" )
          
          
} // PrfInfo::UpdateOSThreadID


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
/* throws BaseException */
void PrfInfo::UpdateUnwindStack( FunctionID *functionID, StackAction action )
{
   	///////////////////////////////////////////////////////////////////////////
    Synchronize guard( m_criticalSection );
    ///////////////////////////////////////////////////////////////////////////

	HRESULT hr;
	ThreadID threadID;


	hr = m_pProfilerInfo->GetCurrentThreadID( &threadID );
	if ( SUCCEEDED(hr) )
	{
		ThreadInfo *pThreadInfo = m_pThreadTable->Lookup( threadID );


		if ( pThreadInfo != NULL )
		{
			StackBaseInfo *stackElement = NULL;
			

	    	_ASSERT_( pThreadInfo->m_isValid == TRUE );
			if ( action == PUSH )
			{
				stackElement = new StackBaseInfo( *functionID );
				(pThreadInfo->m_pLatestUnwoundFunction)->Push( stackElement );
			}
			else // we can only have POP
			{
				stackElement = NULL;
				stackElement = (pThreadInfo->m_pLatestUnwoundFunction)->Pop();
				if ( stackElement != NULL )
				{
					*functionID = stackElement->m_id;
					delete stackElement;
				}
				else
					_THROW_EXCEPTION( "Stack Contains Bad Data" );
			}
		}
		else 				
			_THROW_EXCEPTION( "Thread Structure was not found in the thread list" )
	}
	else
		_THROW_EXCEPTION( "ICorProfilerInfo::GetCurrentThreadID() FAILED" )

    
} // PrfInfo::UpdateUnwindStack


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
/* throws BaseException */
void PrfInfo::AddFunction( FunctionID functionID )
{    
	if ( functionID != NULL )
	{
	    FunctionInfo *pFunctionInfo;
	    

		pFunctionInfo = m_pFunctionTable->Lookup( functionID );
		if ( pFunctionInfo == NULL )
		{
		    pFunctionInfo = new FunctionInfo( functionID );
			if ( pFunctionInfo != NULL )
	            m_pFunctionTable->AddEntry( pFunctionInfo, functionID );

		    else
		    	_THROW_EXCEPTION( "Allocation for FunctionInfo Object FAILED" )
		}
		else
		{
			//
			// function has been jitted before, this is a re-jit, 
			// do no overwrite the entry, simply acknowledge  
			//
			if ( pFunctionInfo->m_isPitched == FALSE )
				_THROW_EXCEPTION( "Function exist in the table while it shouldn't" )
		}        
	}
	else
    	_THROW_EXCEPTION( "FunctionID is NULL" )

       
} // PrfInfo::AddFunction


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
/* throws BaseException */
void PrfInfo::UpdateFunction( FunctionID functionID, JitStatus status )
{    
	if ( functionID != NULL )
	{
	    FunctionInfo *pFunctionInfo;
	    

		pFunctionInfo = m_pFunctionTable->Lookup( functionID );
		if ( pFunctionInfo != NULL )
		{
			pFunctionInfo->m_jitStatus = status;
	    	try
	        {
	        	_GetFunctionInfoHelper( &pFunctionInfo );
	      	}
	        catch ( BaseException *exception )    
	        {
	        	delete pFunctionInfo;
				throw;            		
	      	}
		}
		else
			_THROW_EXCEPTION( "Function Does Not Exist in the Function Table" )
	}
	else
    	_THROW_EXCEPTION( "FunctionID is NULL" )

       
} // PrfInfo::AddFunction


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
/* throws BaseException */
void PrfInfo::RemoveFunction( FunctionID functionID )
{    
    if ( functionID != NULL )
	{
	    FunctionInfo *pFunctionInfo;
	    

		pFunctionInfo = m_pFunctionTable->Lookup( functionID );
		if ( pFunctionInfo != NULL )
		{
	    	pFunctionInfo->m_isValid = FALSE;
		}
		else
	    	_THROW_EXCEPTION( "Function was not found in the Function Table" )
	}
	else
    	_THROW_EXCEPTION( "FunctionID is NULL" )
		
        
} // PrfInfo::RemoveFunction


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
/* throws BaseException */
void PrfInfo::MarkFunctionAsPitched( FunctionID functionID )
{    
    if ( functionID != NULL )
	{
	    FunctionInfo *pFunctionInfo;
	    

		pFunctionInfo = m_pFunctionTable->Lookup( functionID );
		if ( pFunctionInfo != NULL )
		{
	    	_ASSERT_( pFunctionInfo->m_isValid == TRUE );
	    	pFunctionInfo->m_isPitched = TRUE;
		}
		else
	    	_THROW_EXCEPTION( "Function was not found in the Function Table" )
	}
	else
    	_THROW_EXCEPTION( "FunctionID is NULL" )
		
        
} // PrfInfo::MarkFunctionAsPitched


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
/* throws BaseException */
void PrfInfo::UpdateEnterExitCounters( FunctionID functionID, FunctionCounters which )
{
   	///////////////////////////////////////////////////////////////////////////
    Synchronize guard( m_criticalSection );
    ///////////////////////////////////////////////////////////////////////////

	FunctionInfo *pFunctionInfo;


	// Look in the table for a match
	pFunctionInfo = m_pFunctionTable->Lookup( functionID );
	if ( pFunctionInfo != NULL )
	{
		_ASSERT_( pFunctionInfo->m_isValid == TRUE );

		switch ( which )
		{
			case ENTER:
				InterlockedIncrement( &(pFunctionInfo->m_enter) );
				break;

			case LEAVE:
				InterlockedIncrement( &(pFunctionInfo->m_left) );
				break;

			case TAIL:
				InterlockedIncrement( &(pFunctionInfo->m_tail) );
				break;

			case UNWIND:
				InterlockedIncrement( &(pFunctionInfo->m_unwind) );
				break;

			default:
				_THROW_EXCEPTION( "PrfInfo::UpdateEnterExitCounters() has invalid parameters " )
		}
	}
	else
		_THROW_EXCEPTION( "ERROR: Entry was not found in the function table" )


} // PrfInfo::UpdateEnterExitCounters


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
void PrfInfo::DumpTables()
{
   	//
	// This is hack so we can run the tool under COMET
	//
	char logEnvironment[MAX_LENGTH];
    
    
 	if ( GetEnvironmentVariableA( "DBG_PRF_LOG", logEnvironment, MAX_LENGTH ) == 0 )
	{
	   	
	   	// dump thread table
	   	if ( m_pThreadTable != NULL )
	    {
			wprintf( L"*** THREAD TABLE ***\n" );
	    	m_pThreadTable->Dump();
	    	
			wprintf( L"\n" );
			wprintf( L"\n" );
	    }

	  	// dump AppDomain table
	   	if ( m_pAppDomainTable != NULL )
	    {
			wprintf( L"*** APP_DOMAIN TABLE ***" );
	    	m_pAppDomainTable->Dump();
	    	
			wprintf( L"\n" );
			wprintf( L"\n" );
	    }
		

	  	// dump Assembly table
	   	if ( m_pAssemblyTable != NULL )
	    {
			wprintf( L"*** ASSEMBLY TABLE ***\n" );
	    	m_pAssemblyTable->Dump();
	    	
			wprintf( L"\n" );
			wprintf( L"\n" );
	    }

	   	// dump module table
	   	if ( m_pModuleTable != NULL )
	    {
			wprintf( L"*** MODULE TABLE ***\n" );
	    	m_pModuleTable->Dump();
	    	
			wprintf( L"\n" );
			wprintf( L"\n" );
	    }
		
	    // dump class table
	   	if ( m_pClassTable != NULL )
	    {
			wprintf( L"*** CLASS TABLE ***\n" );
	    	m_pClassTable->Dump();
	    	
			wprintf( L"\n" );
			wprintf( L"\n" );
	    }
		    
	    // dump function table
	   	if ( m_pFunctionTable != NULL )
	    {
			wprintf( L"*** FUNCTION TABLE ***\n" );
	    	m_pFunctionTable->Dump();
	    	
			wprintf( L"\n" );
			wprintf( L"\n" );
	    }      
	}
	else
	{
		static count = 0;

		
		if ( count++ == 0 )
		{
			//
			// set the path for the result file of the profiler 
			// and in-process tests
			//
			FILE *stream;
		   	char tempBuffer[MAX_PATH];
		   	char resultFile[MAX_LENGTH];

			
			GetWindowsDirectoryA( tempBuffer, MAX_PATH );
			
			// set sentinel values
			tempBuffer[3] = NULL;
			resultFile[0] = NULL;
			sprintf( resultFile, "%sresult.out", tempBuffer );
		

			//
			// first time create file and write success
			//
			stream = fopen( resultFile, "w" );
		    if ( stream != NULL )
		    {
			    fprintf( stream, "0" );
			    fflush( stream );
			    fclose( stream );
			}
			else
			   TEXT_OUTLN( "Unable to create result file" );

		}
	}	

} // PrfInfo::DumpTables


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
void PrfInfo::Failure( char *message )
{
	if ( message == NULL )     	
	 	message = "**** SEVERE FAILURE: TURNING OFF APPLICABLE PROFILING EVENTS ****";  
	
	
	//
	// Display the error message and turn off the profiler events except the 
	// IMMUTABLE ones. Turning off the IMMUTABLE events can cause crashes. The only
	// place that we can safely enable or disable immutable events is the Initialize
	// callback.
	//		      	
	TEXT_OUTLN( message );
	m_pProfilerInfo->SetEventMask(  m_dwEventMask & (DWORD)COR_PRF_MONITOR_IMMUTABLE );    
               	         
} // PrfInfo::Failure


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
/* private */
/* throws BaseException */
void PrfInfo::_GetThreadInfoHelper( ThreadInfo **ppThreadInfo )
{
   	if ( m_pProfilerInfo != NULL )
    {
    	HRESULT hr;
        
        
	    //
	    // Assume that the thread starts running managed code
		// otherwise we would not get notified for its creation
	    //
	    (*ppThreadInfo)->m_status = MANAGED;

	    //
	    // Get the win32 threadID for the specific Runtime thread
	    //
	    hr = m_pProfilerInfo->GetThreadInfo( (*ppThreadInfo)->m_id, 
	        							     &((*ppThreadInfo)->m_win32ThreadID) );
	  	if ( SUCCEEDED( hr ) )
	   	{
	  		//
	  		// Get the thread handle
	  		//
	  		hr = m_pProfilerInfo->GetHandleFromThread( (*ppThreadInfo)->m_id, 
	    										       &((*ppThreadInfo)->m_hThread) );  	
			if ( FAILED( hr ) )
	      		_THROW_EXCEPTION( "ICorProfilerInfo::GetHandleFromThread() FAILED" )	
	  	}
	    else	
	    	_THROW_EXCEPTION( "ICorProfilerInfo::GetThreadInfo() FAILED" )
 	}
    else
    	_THROW_EXCEPTION( "ICorProfilerInfo Interface has NOT been Initialized" )		
    	
        
} // PrfInfo::_GetThreadInfoHelper


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
/* private */
/* throws BaseException */
void PrfInfo::_GetAppDomainInfoHelper( AppDomainInfo **ppAppDomainInfo )
{	
    if ( m_pProfilerInfo != NULL )
    {
    	HRESULT hr;
		ULONG dummy;
	    

		//
		// Fill in the rest of the AppDomainInfo data structure
		// Make sure that you are invoking this helper at from a 
		// "safe" point. Otherwise the GetAppDomainInfo will fail.
		//
	    hr = m_pProfilerInfo->GetAppDomainInfo( (*ppAppDomainInfo)->m_id,
	       							            MAX_LENGTH,
	                                            &dummy,
	                                            (*ppAppDomainInfo)->m_name,
											    &((*ppAppDomainInfo)->m_processID) ); 	
		if ( FAILED( hr ) )
			_THROW_EXCEPTION( "ICorProfilerInfo::GetAppDomainInfo() FAILED" )
   	}
    else
    	_THROW_EXCEPTION( "ICorProfilerInfo Interface has NOT been Initialized" )
                       
    
} // PrfInfo::_GetAppDomainInfoHelper


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
/* private */
/* throws BaseException */
void PrfInfo::_GetAssemblyInfoHelper( AssemblyInfo **ppAssemblyInfo )
{	
    if ( m_pProfilerInfo != NULL )
    {
    	HRESULT hr;
		ULONG dummy;
	    

		//
		// Fill in the rest of the AssemblyInfo data structure
		// Make sure that you are invoking this helper at from a 
		// "safe" point. Otherwise the GetAssemblyInfo will fail.
		//
	    hr = m_pProfilerInfo->GetAssemblyInfo( (*ppAssemblyInfo)->m_id,
	       							           MAX_LENGTH,
	                                           &dummy,
	                                           (*ppAssemblyInfo)->m_name,
											   &((*ppAssemblyInfo)->m_appDomainID),
											   &((*ppAssemblyInfo)->m_moduleID) ); 	
	    if ( SUCCEEDED( hr ) )
		{
	    	try
			{
				//
				// In certain occasions, the AppDomain name is NULL and we need to
				// wait until the assembly gets loaded to get its name
				//
				_SetAppDomainName( (*ppAssemblyInfo)->m_appDomainID ); 
			}
	        catch ( BaseException *exception )    
			{
				throw;            		
			}
		}
		else
			_THROW_EXCEPTION( "ICorProfilerInfo::GetAssemblyInfo() FAILED" )
   	}
    else
    	_THROW_EXCEPTION( "ICorProfilerInfo Interface has NOT been Initialized" )
               
    
} // PrfInfo::_GetAssemblyInfoHelper


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
/* private */
/* throws BaseException */
void PrfInfo::_GetModuleInfoHelper( ModuleInfo **ppModuleInfo )
{	
    if ( m_pProfilerInfo != NULL )
    {
    	HRESULT hr;
		ULONG dummy;

		//
		// Fill in the rest of the ModuleInfo data structure
		// We are not interested for the module token. It is pretty useless
		// since all the API's related to modules are using the moduleID.
		// Besides it alwasy has the same value for every module.
	    //
	    hr = m_pProfilerInfo->GetModuleInfo( (*ppModuleInfo)->m_id,
	       							         &((*ppModuleInfo)->m_pBaseLoadAddress),
											 MAX_LENGTH,
	                                         &dummy,
	                                         (*ppModuleInfo)->m_name,
											 NULL );
	  	if ( SUCCEEDED( hr ) )
	    {
			//
			// Store away a MetaDataImport  interface so you can get metadata 
			// information for the classes and the methods that the 
			// specific module contains. You need to free the interface
			// in the end but you do not need to AddRef it. The API
			// does an AddRef on it before returning.
			// 
	      	hr = m_pProfilerInfo->GetModuleMetaData( (*ppModuleInfo)->m_id, 
	            									 ofRead,
													 IID_IMetaDataImport, 
	                                                 (IUnknown **)(&((*ppModuleInfo)->m_pMDImport)) );
	        if ( FAILED( hr ) )            
				_THROW_EXCEPTION( "ICorProfilerInfo::GetModuleMetaData() FAILED" )
	  	} 
	    else
	    	_THROW_EXCEPTION( "ICorProfilerInfo::GetModuleInfo() FAILED" )
   	}
    else
    	_THROW_EXCEPTION( "ICorProfilerInfo Interface has NOT been Initialized" )
               
    
} // PrfInfo::_GetModuleInfoHelper


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
/* private */
/* throws BaseException */
void PrfInfo::_GetClassInfoHelper( ClassInfo **ppClassInfo )
{
    if ( m_pProfilerInfo != NULL )
    {
    	HRESULT hr;
        
        
	  	//
	  	// Fill in the rest of the ClassInfo data structure
		//
		hr = m_pProfilerInfo->GetClassIDInfo( (*ppClassInfo)->m_id, 
	        								  &((*ppClassInfo)->m_moduleID),  
	                                          &((*ppClassInfo)->m_token) );                                                                                                                                              
		if ( SUCCEEDED( hr ) )
	   	{             	
	      	ModuleInfo *pModuleInfo;
	            
	        
	        //
	        // To get the name of the class we have to find the module where 
	        // the class belongs to in order to use	the IMetaDataImport 
	        // interface that was casted away to obtain the class name    
	        //
	        pModuleInfo = m_pModuleTable->Lookup( (*ppClassInfo)->m_moduleID );
	        if ( pModuleInfo != NULL )
	        { 	           	                        
	          	//
				// Use the MetaData API to get information about the class
				//
	          	hr = pModuleInfo->m_pMDImport->GetTypeDefProps( (*ppClassInfo)->m_token, 
					                                            (*ppClassInfo)->m_name, 
					                                            MAX_LENGTH,
					                                            NULL, 
					                                            NULL, 
					                                            NULL ); 
		        if ( FAILED( hr ) )
		           	_THROW_EXCEPTION( "IMetaDataImport::GetTypeDefProps() FAILED" ) 
	      	}
	        else	     
	            _THROW_EXCEPTION( "Module for Class NOT Found" )	      
	    }
	    else    
	        _THROW_EXCEPTION( "ICorProfilerInfo::GetClassIDInfo() FAILED" )
   	}
    else
    	_THROW_EXCEPTION( "ICorProfilerInfo Interface has NOT been Initialized" )	
        
        
} // PrfInfo::_GetClassInfoHelper


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
/* private */
/* throws BaseException */
void PrfInfo::_GetFunctionInfoHelper( FunctionInfo **ppFunctionInfo )
{
	if ( m_pProfilerInfo != NULL )
    {
    	HRESULT hr;
        
        
	    //
		// Obtain information for a method related to the class and module 
		// it belongs to
		//
	    hr = m_pProfilerInfo->GetFunctionInfo( (*ppFunctionInfo)->m_id,
											   &((*ppFunctionInfo)->m_classID),
											   &((*ppFunctionInfo)->m_moduleID),
	                                           &((*ppFunctionInfo)->m_token) );
		if ( SUCCEEDED( hr ) )
		{   	
	     	//
			// Obtain information about the method's code size and start address
			//
	     	hr = m_pProfilerInfo->GetCodeInfo( (*ppFunctionInfo)->m_id, 
	               							   &((*ppFunctionInfo)->m_pStartAddress), 
	                                           &((*ppFunctionInfo)->m_codeSize) );                                                                                                                                                                  
			if ( SUCCEEDED( hr ) )
	        {
	            ModuleInfo *pModuleInfo;
	            
	            
	            //
	            // Find the module the class belongs to in order to use
	        	// the IMetaDataImport interface to obtain the class and
	            // function name
				//
	        	pModuleInfo = m_pModuleTable->Lookup( (*ppFunctionInfo)->m_moduleID );
	        	if ( pModuleInfo != NULL )
	        	{ 	            	
	            	ClassInfo *pClassInfo;
	                WCHAR className[MAX_LENGTH];                
	                WCHAR functionName[MAX_LENGTH];
                    
	                
	               	//
	               	// Check to se if the function belongs to a class; 
	                // if not, then it is obviously a global function
	                //
	                pClassInfo = m_pClassTable->Lookup( (*ppFunctionInfo)->m_classID );
	                if ( pClassInfo != NULL )
	                {			 	                                
						hr = pModuleInfo->m_pMDImport->GetTypeDefProps( pClassInfo->m_token, 
							                                            className, 
							                                            MAX_LENGTH,
							                                            NULL, 
							                                            NULL, 
							                                            NULL );
	                	if ( FAILED( hr ) )
	                   		_THROW_EXCEPTION( "IMetaDataImport::GetTypeDefProps() FAILED" )
	              	}
	                else
	                	wcscpy( className, L"<Global>" );
	                    
	
	             	//
	             	// We have the all the ingredients for calling IMetaDataImport::GetMethodProps()	                    
               		//
               		hr = pModuleInfo->m_pMDImport->GetMethodProps( (*ppFunctionInfo)->m_token,
	                                                               NULL,
	                                                               functionName,
	                                                               MAX_LENGTH,
	                                                               0,
	                                                               0,
	                                                               NULL,
	                                                               NULL,
	                                                               NULL, 
	                                                               NULL );
                   	if ( SUCCEEDED( hr ) )
                    	swprintf( (*ppFunctionInfo)->m_name, L"%s::%s", className, functionName );
                    
                    else
                   		_THROW_EXCEPTION( "IMetaDataImport::GetMethodProps() FAILED" )	                                                                         
	       		}
	            else
	            	_THROW_EXCEPTION( "Module for Function NOT Found" )	          
	        }
	       	else
	        	_THROW_EXCEPTION( "ICorProfilerInfo::GetCodeInfo() FAILED" )
	   	}
	   	else
	   		_THROW_EXCEPTION( "ICorProfilerInfo::GetFunctionInfo() FAILED" ) 
   	}
    else
    	_THROW_EXCEPTION( "ICorProfilerInfo Interface has NOT been Initialized" )	    


} // PrfInfo::_GetFunctionInfoHelper


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
/* private */
/* throws BaseException */
void PrfInfo::_SetAppDomainName( AppDomainID appDomainID )
{    
    if ( m_pProfilerInfo != NULL )
    {
		if (appDomainID != NULL)
		{
			//
			// Update the name of the AppDomain - It has to be non null at this stage
			//
			if (m_pAppDomainTable != NULL)
			{
				AppDomainInfo *pAppDomainInfo;
				pAppDomainInfo = m_pAppDomainTable->Lookup( appDomainID );

				if (pAppDomainInfo != NULL)
				{
					//
					// AppDomainID was found in the internal tables					
					//
					if (pAppDomainInfo->m_name[0] == NULL)
					{
						//
						// Appdomain name is not updated
						//
						HRESULT hr;
						ULONG dummy;
						

						//
						// Fill in the rest of the AppDomainInfo data structure
						//
						hr = m_pProfilerInfo->GetAppDomainInfo( pAppDomainInfo->m_id,
	       														MAX_LENGTH,
																&dummy,
																pAppDomainInfo->m_name,
																&(pAppDomainInfo->m_processID) ); 	
						//
						// This code performs verification that the GetAppDomainInfo 
						// returns the correct values. At this point we should ALWAYS get
						// S_OK ! 
						//
						if ( SUCCEEDED( hr ) )
						{
							//
							// Check if the acquired value for the name is not NULL
							//
							if ( pAppDomainInfo->m_name[0] == NULL )	
	            				_THROW_EXCEPTION( "Unexpected AppDomain Name from ICorProfilerInfo::GetAppDomainInfo()" );
						}
						else
							_THROW_EXCEPTION( "ICorProfilerInfo::GetAppDomainInfo() FAILED" )

					
					}// there is no else here, if the name is not null, then do nothing
				
				// end 	if (pAppDomainInfo->m_appDomainName == NULL)
				}
				else
				{
					//
					// An AppDomainCreationEvent arrives AFTER the assembly event for the 
					// system appdomain. This is possible to happen and the issue is considered
					// solved by design. Therefore, we will not fail if the entry in not 
					// in the table, we will simply print the out-of-order AppDomain ID.
					//
					//
					// This value can be used in the end to verify if this ID will exists 
					// in the AppDomain table. Do the following: 
					// 			1.	Store away the out-of-order appdomain ID's 
					//			2.  Verify in the PrfInfo .dtor that there is an entry for 
					//			    them in the appdomain list 
					//
					TEXT_OUTLN( "AppDomain ID NOT FOUND in AppDomain Table" );
				}
			}
			else
				_THROW_EXCEPTION( "AppDomain Table is NULL" )
		}
		else
			_THROW_EXCEPTION( "AppDomainID is NULL - Unable to proceed" )
	}
    else
    	_THROW_EXCEPTION( "ICorProfilerInfo Interface has NOT been Initialized" )


} // PrfInfo::_SetAppDomainName


// End of File
