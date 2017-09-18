/****************************************************************************************
 * Copyright (c) Microsoft Corporation.  All Rights Reserved.
 *
 * File:
 *  ProfilerHelper.h
 *
 * Description:
 *	
 *
 *
 ***************************************************************************************/
#ifndef __PROFILERHELPER_H__
#define __PROFILERHELPER_H__


/***************************************************************************************
 ********************                                               ********************
 ********************              Type Definitions                 ********************
 ********************                                               ********************
 ***************************************************************************************/

enum TransitionState
{ 
	UNINITIALIZED,
	MANAGED, 
	UNMANAGED
};

enum StackAction
{ 
	PUSH, 
	POP 
};

enum FunctionCounters
{ 
	ENTER, 
	LEAVE, 
	TAIL, 
	UNWIND
};

enum JitStatus
{ 
	NONE,
	JITTED, 
	PREJITTED,
};

/***************************************************************************************
 ********************                                               ********************
 ********************             StackBaseInfo Declaration         ********************
 ********************                                               ********************
 ***************************************************************************************/
class StackBaseInfo
{
	public:
    
    	StackBaseInfo( ULONG id );         
        virtual ~StackBaseInfo();
                
        
	public:
            
         StackBaseInfo *Clone();
		 void Dump();
        
        
 	public:
    
    	ULONG m_id;

    
}; // StackBaseInfo


/***************************************************************************************
 ********************                                               ********************
 ********************             BaseInfo Declaration              ********************
 ********************                                               ********************
 ***************************************************************************************/
class BaseInfo
{
	public:
    
    	BaseInfo( ULONG id );         
        virtual ~BaseInfo();
                
        
	public:
            
    	virtual void Dump();
        BOOL Compare( ULONG key );
        
        
 	public:
    
    	ULONG m_id;
        BOOL  m_isValid;
	    WCHAR m_name[MAX_LENGTH];
    
}; // BaseInfo

 
/***************************************************************************************
 ********************                                               ********************
 ********************            AppDomainInfo Declaration          ********************
 ********************                                               ********************
 ***************************************************************************************/
class AppDomainInfo :
	public BaseInfo
{
	public:

		AppDomainInfo( AppDomainID appDomainID );
   		virtual ~AppDomainInfo();
      

	public:
    
    	void Dump();        
        
        
	public:	
  	  	       	
		ProcessID m_processID;			
                       
}; // AppDomainInfo



/***************************************************************************************
 ********************                                               ********************
 ********************            AssemblyInfo  Declaration          ********************
 ********************                                               ********************
 ***************************************************************************************/
class AssemblyInfo :
	public BaseInfo
{
	public:

		AssemblyInfo( AssemblyID assemblyID );
   		virtual ~AssemblyInfo();
      

	public:
    
    	void Dump();        
        
        
	public:	
  	  	       	
		ModuleID	m_moduleID;
		AppDomainID	m_appDomainID;
                       
}; // AssemblyInfo


/***************************************************************************************
 ********************                                               ********************
 ********************            ModuleInfo Declaration             ********************
 ********************                                               ********************
 ***************************************************************************************/
class ModuleInfo :
	public BaseInfo
{
	public:

		ModuleInfo( ModuleID moduleID );
   		virtual ~ModuleInfo();
      

	public:
    
    	void Dump();        
        
        
	public:	
  	  	       	
		AssemblyID		m_assemblyID;	
        IMetaDataImport	*m_pMDImport;	
		LPCBYTE			m_pBaseLoadAddress;        
                       
}; // ModuleInfo


/***************************************************************************************
 ********************                                               ********************
 ********************             ClassInfo Declaration             ********************
 ********************                                               ********************
 ***************************************************************************************/
class ClassInfo :
	public BaseInfo
{
	public:

		ClassInfo( ClassID classID );
   		virtual ~ClassInfo();
      

	public:
    
    	void Dump();        
        
        
	public:	
  	  	       
		mdTypeDef m_token;
       	ModuleID  m_moduleID;	
                       
}; // ClassInfo


/***************************************************************************************
 ********************                                               ********************
 ********************            ThreadInfo Declaration             ********************
 ********************                                               ********************
 ***************************************************************************************/
class ThreadInfo :
	public BaseInfo
{
	public:

		ThreadInfo( ThreadID threadID );         
		virtual ~ThreadInfo();
        

	public:
    
    	virtual void Dump();
                
        
	public:	
  	  		
        // 
		// Once a thread dies, it is possible for its ID to be re-used
		// We will remeber the originalID in order to print the information
		// for each thread in the end of the run.
		//
		DWORD m_originalTID;
        
		HANDLE					m_hThread;
		TransitionState			m_status;
        DWORD 					m_win32ThreadID;
		CStack<StackBaseInfo *> *m_pLatestUnwoundFunction;
		        
}; // ThreadInfo


/***************************************************************************************
 ********************                                               ********************
 ********************          FunctionInfo Declaration             ********************
 ********************                                               ********************
 ***************************************************************************************/
class FunctionInfo :
	public BaseInfo
{
	public:

		FunctionInfo( FunctionID functionID );
   		virtual ~FunctionInfo();
      

	public:
    
    	void Dump();     
        
        
	public:	
  	  	                        	
		// function counters
		LONG	 	m_enter;
		LONG	 	m_left;
		LONG	 	m_tail;
		LONG	 	m_unwind;

		// jit related information
		JitStatus	m_jitStatus;
		BOOL	 	m_isPitched;

        // other info
        mdToken  	m_token;               
        ClassID  	m_classID;
        ModuleID 	m_moduleID; 
        ULONG    	m_codeSize;
		LPCBYTE  	m_pStartAddress;
        
}; // FunctionInfo


/***************************************************************************************
 ********************                                               ********************
 ********************              PrfInfo Declaration              ********************
 ********************                                               ********************
 ***************************************************************************************/
class PrfInfo
{	         
    public:
    
        PrfInfo();                     
        virtual ~PrfInfo();                      
                      
                   
	// methods
   	
   	public:
                    
		// tables
		void DumpTables();
		void Failure( char *message = NULL );

        // class methods
        void AddClass( ClassID classID );
        void RemoveClass( ClassID classID );

    	// thread methods
    	void AddThread( ThreadID threadID );                        
    	void RemoveThread( ThreadID threadID );
    	void UpdateTransitionState( TransitionState state );                        
		void UpdateOSThreadID( ThreadID managedThreadID, DWORD osThreadID );
		void UpdateUnwindStack( FunctionID *functionID, StackAction action );
        
        // module methods
        void AddModule( ModuleID moduleID );         		
        void RemoveModule( ModuleID moduleID );         		
		void ReleaseModuleMDInterface( ModuleID moduleID );
		void UpdateAssemblyInModule( ModuleID moduleID, AssemblyID assemblyID );

        // function methods
        void AddFunction( FunctionID functionID ); 
        void UpdateFunction( FunctionID functionID, JitStatus status ); 
        void RemoveFunction( FunctionID functionID );
		void MarkFunctionAsPitched( FunctionID functionID );
        void UpdateEnterExitCounters( FunctionID functionID, FunctionCounters which );
 
        // assembly methods
        void AddAssembly( AssemblyID assemblyID );                                    
        void RemoveAssembly( AssemblyID assemblyID );                                    

        // appdomain methods
        void AddAppDomain( AppDomainID appDomainID );
        void RemoveAppDomain( AppDomainID appDomainID );


  	private:
    
    	void _GetClassInfoHelper( ClassInfo **ppClassInfo );
        void _GetThreadInfoHelper( ThreadInfo **ppThreadInfo );
        void _GetModuleInfoHelper( ModuleInfo **ppModuleInfo );           
        void _GetFunctionInfoHelper( FunctionInfo **ppFunctionInfo );
        void _GetAssemblyInfoHelper( AssemblyInfo **ppAssemblyInfo );        
		void _SetAppDomainName( AppDomainID AppDomainID );
        void _GetAppDomainInfoHelper( AppDomainInfo **ppAppDomainInfo );


	// data memebers

    protected:    

        DWORD m_dwEventMask;
        ICorProfilerInfo *m_pProfilerInfo;

        // tables		 
		SList<ClassInfo *, ClassID> *m_pClassTable;
        SList<ThreadInfo *, ThreadID> *m_pThreadTable;
        SList<ModuleInfo *, ModuleID> *m_pModuleTable;
        SList<FunctionInfo *, FunctionID> *m_pFunctionTable;
        SList<AssemblyInfo *, AssemblyID> *m_pAssemblyTable;
        SList<AppDomainInfo *, AppDomainID> *m_pAppDomainTable; 

	private:

		CRITICAL_SECTION m_criticalSection;

}; // PrfInfo


#endif // __PROFILERHELPER_H___

// End of File