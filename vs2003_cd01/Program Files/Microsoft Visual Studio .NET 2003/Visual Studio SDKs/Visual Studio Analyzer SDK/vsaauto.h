

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 6.00.0361 */
/* at Tue Mar 18 18:05:41 2003
 */
/* Compiler settings for vsaauto.idl:
    Oicf, W1, Zp8, env=Win32 (32b run)
    protocol : dce , ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data , no_format_optimization
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
//@@MIDL_FILE_HEADING(  )

#pragma warning( disable: 4049 )  /* more than 64k source lines */


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 440
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __vsaauto_h__
#define __vsaauto_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __VSAnalyzerProject_FWD_DEFINED__
#define __VSAnalyzerProject_FWD_DEFINED__
typedef interface VSAnalyzerProject VSAnalyzerProject;
#endif 	/* __VSAnalyzerProject_FWD_DEFINED__ */


#ifndef __VSAnalyzerMachine_FWD_DEFINED__
#define __VSAnalyzerMachine_FWD_DEFINED__
typedef interface VSAnalyzerMachine VSAnalyzerMachine;
#endif 	/* __VSAnalyzerMachine_FWD_DEFINED__ */


#ifndef __VSAnalyzerEventLog_FWD_DEFINED__
#define __VSAnalyzerEventLog_FWD_DEFINED__
typedef interface VSAnalyzerEventLog VSAnalyzerEventLog;
#endif 	/* __VSAnalyzerEventLog_FWD_DEFINED__ */


#ifndef __VSAnalyzerFilter_FWD_DEFINED__
#define __VSAnalyzerFilter_FWD_DEFINED__
typedef interface VSAnalyzerFilter VSAnalyzerFilter;
#endif 	/* __VSAnalyzerFilter_FWD_DEFINED__ */


#ifndef __VSAnalyzerEventField_FWD_DEFINED__
#define __VSAnalyzerEventField_FWD_DEFINED__
typedef interface VSAnalyzerEventField VSAnalyzerEventField;
#endif 	/* __VSAnalyzerEventField_FWD_DEFINED__ */


#ifndef __VSAnalyzerEvent_FWD_DEFINED__
#define __VSAnalyzerEvent_FWD_DEFINED__
typedef interface VSAnalyzerEvent VSAnalyzerEvent;
#endif 	/* __VSAnalyzerEvent_FWD_DEFINED__ */


#ifndef __VSAnalyzerProjectItems_FWD_DEFINED__
#define __VSAnalyzerProjectItems_FWD_DEFINED__
typedef interface VSAnalyzerProjectItems VSAnalyzerProjectItems;
#endif 	/* __VSAnalyzerProjectItems_FWD_DEFINED__ */


#ifndef __VSAnalyzerItemsList_FWD_DEFINED__
#define __VSAnalyzerItemsList_FWD_DEFINED__
typedef interface VSAnalyzerItemsList VSAnalyzerItemsList;
#endif 	/* __VSAnalyzerItemsList_FWD_DEFINED__ */


#ifndef __VSAnalyzerProjects_FWD_DEFINED__
#define __VSAnalyzerProjects_FWD_DEFINED__
typedef interface VSAnalyzerProjects VSAnalyzerProjects;
#endif 	/* __VSAnalyzerProjects_FWD_DEFINED__ */


#ifndef __VSAnalyzerEventLogsItem_FWD_DEFINED__
#define __VSAnalyzerEventLogsItem_FWD_DEFINED__
typedef interface VSAnalyzerEventLogsItem VSAnalyzerEventLogsItem;
#endif 	/* __VSAnalyzerEventLogsItem_FWD_DEFINED__ */


#ifndef __VSAnalyzerFiltersItem_FWD_DEFINED__
#define __VSAnalyzerFiltersItem_FWD_DEFINED__
typedef interface VSAnalyzerFiltersItem VSAnalyzerFiltersItem;
#endif 	/* __VSAnalyzerFiltersItem_FWD_DEFINED__ */


#ifndef __VSAnalyzerMachinesItem_FWD_DEFINED__
#define __VSAnalyzerMachinesItem_FWD_DEFINED__
typedef interface VSAnalyzerMachinesItem VSAnalyzerMachinesItem;
#endif 	/* __VSAnalyzerMachinesItem_FWD_DEFINED__ */


#ifndef __VSAnalyzerUserSelectionCallback_FWD_DEFINED__
#define __VSAnalyzerUserSelectionCallback_FWD_DEFINED__
typedef interface VSAnalyzerUserSelectionCallback VSAnalyzerUserSelectionCallback;
#endif 	/* __VSAnalyzerUserSelectionCallback_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"
#include "vaevt.h"

#ifdef __cplusplus
extern "C"{
#endif 

void * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void * ); 

/* interface __MIDL_itf_vsaauto_0000 */
/* [local] */ 







enum __VSANALYZERPROJECTPROPERTIES
    {	VSANALYZERPROJECTID_Name	= -800,
	VSANALYZERPROJECTID_AddMachine	= 1,
	VSANALYZERPROJECTID_RemoveMachine	= VSANALYZERPROJECTID_AddMachine + 1,
	VSANALYZERPROJECTID_MachineCount	= VSANALYZERPROJECTID_RemoveMachine + 1,
	VSANALYZERPROJECTID_Mahcines	= VSANALYZERPROJECTID_MachineCount + 1,
	VSANALYZERPROJECTID_AddEventLog	= VSANALYZERPROJECTID_Mahcines + 1,
	VSANALYZERPROJECTID_RemoveEventLog	= VSANALYZERPROJECTID_AddEventLog + 1,
	VSANALYZERPROJECTID_EventLogsCount	= VSANALYZERPROJECTID_RemoveEventLog + 1,
	VSANALYZERPROJECTID_EventLogs	= VSANALYZERPROJECTID_EventLogsCount + 1,
	VSANALYZERPROJECTID_AddFilter	= VSANALYZERPROJECTID_EventLogs + 1,
	VSANALYZERPROJECTID_RemoveFilter	= VSANALYZERPROJECTID_AddFilter + 1,
	VSANALYZERPROJECTID_FiltersCount	= VSANALYZERPROJECTID_RemoveFilter + 1,
	VSANALYZERPROJECTID_Filters	= VSANALYZERPROJECTID_FiltersCount + 1,
	VSANALYZERPROJECTID_StartRecording	= VSANALYZERPROJECTID_Filters + 1,
	VSANALYZERPROJECTID_StopRecording	= VSANALYZERPROJECTID_StartRecording + 1,
	VSANALYZERPROJECTID_PauseRecording	= VSANALYZERPROJECTID_StopRecording + 1,
	VSANALYZERPROJECTID_ResumeRecording	= VSANALYZERPROJECTID_PauseRecording + 1,
	VSANALYZERPROJECTID_Recording	= VSANALYZERPROJECTID_ResumeRecording + 1,
	VSANALYZERPROJECTID_Paused	= VSANALYZERPROJECTID_Recording + 1,
	VSANALYZERPROJECTID_Activate	= VSANALYZERPROJECTID_Paused + 1,
	VSANALYZERPROJECTID_Deactivate	= VSANALYZERPROJECTID_Activate + 1,
	VSANALYZERPROJECTID_DynamicEventSourcesFrequency	= VSANALYZERPROJECTID_Deactivate + 1,
	VSANALYZERPROJECTID_SetBlockOnOverflow	= VSANALYZERPROJECTID_DynamicEventSourcesFrequency + 1,
	VSANALYZERPROJECTID_SaveAll	= VSANALYZERPROJECTID_SetBlockOnOverflow + 1,
	VSANALYZERPROJECTID_Close	= VSANALYZERPROJECTID_SaveAll + 1,
	VSANALYZERPROJECTID_AttachUserSelectionCallback	= VSANALYZERPROJECTID_Close + 1,
	VSANALYZERPROJECTID_GetUserSelection	= VSANALYZERPROJECTID_AttachUserSelectionCallback + 1,
	VSANALYZERPROJECTID_SetUserSelection	= VSANALYZERPROJECTID_GetUserSelection + 1,
	VSANALYZERPROJECTID_Project	= VSANALYZERPROJECTID_SetUserSelection + 1
    } ;

enum __VSANALYZERMACHINEPROPERTIES
    {	VSANALYZERMACHINEID_Name	= -800,
	VSANALYZERMACHINEID_Connected	= DISPID_VALUE,
	VSANALYZERMACHINEID_ProjectItem	= 1,
	VSANALYZERMACHINEID_Connect	= VSANALYZERMACHINEID_ProjectItem + 1,
	VSANALYZERMACHINEID_Disconnect	= VSANALYZERMACHINEID_Connect + 1
    } ;

enum __VSANALYZEREVENTLOGPROPERTIES
    {	VSANALYZEREVENTLOGID_Name	= -800,
	VSANALYZEREVENTLOGID_Count	= DISPID_VALUE,
	VSANALYZEREVENTLOGID_NewEnum	= DISPID_NEWENUM,
	VSANALYZEREVENTLOGID_Recording	= 1,
	VSANALYZEREVENTLOGID_Paused	= VSANALYZEREVENTLOGID_Recording + 1,
	VSANALYZEREVENTLOGID_ProjectItem	= VSANALYZEREVENTLOGID_Paused + 1,
	VSANALYZEREVENTLOGID_Item	= VSANALYZEREVENTLOGID_ProjectItem + 1
    } ;

enum __VSANALYZERFILTERPROPERTIES
    {	VSANALYZERFILTERID_Name	= -800,
	VSANALYZERFILTERID_Expression	= DISPID_VALUE,
	VSANALYZERFILTERID_ProjectItem	= 1,
	VSANALYZERFILTERID_Active	= VSANALYZERFILTERID_ProjectItem + 1,
	VSANALYZERFILTERID_EvaluateEvent	= VSANALYZERFILTERID_Active + 1,
	VSANALYZERFILTERID_Applied	= VSANALYZERFILTERID_EvaluateEvent + 1
    } ;


extern RPC_IF_HANDLE __MIDL_itf_vsaauto_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_vsaauto_0000_v0_0_s_ifspec;


#ifndef __MSVSAnalyzerAutomationLibrary_LIBRARY_DEFINED__
#define __MSVSAnalyzerAutomationLibrary_LIBRARY_DEFINED__

/* library MSVSAnalyzerAutomationLibrary */
/* [version][lcid][helpstring][uuid] */ 


EXTERN_C const IID LIBID_MSVSAnalyzerAutomationLibrary;

#ifndef __VSAnalyzerProject_INTERFACE_DEFINED__
#define __VSAnalyzerProject_INTERFACE_DEFINED__

/* interface VSAnalyzerProject */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_VSAnalyzerProject;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d51-1510-11d2-8F88-00A0C90A6B01")
    VSAnalyzerProject : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Name( 
            /* [retval][out] */ BSTR *pbstrName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddMachine( 
            /* [in] */ BSTR bstrMachineName,
            /* [retval][out] */ VSAnalyzerMachine **ppMachine) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE RemoveMachine( 
            /* [in] */ BSTR bstrMachineName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_MachinesCount( 
            /* [retval][out] */ int *pnCount) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Machines( 
            /* [retval][out] */ /* external definition not present */ ProjectItems **ppMachines) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddEventLog( 
            /* [in] */ BSTR bstrEventLogName,
            /* [retval][out] */ VSAnalyzerEventLog **ppEventLog) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE RemoveEventLog( 
            /* [in] */ BSTR bstrEventLogName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_EventLogsCount( 
            /* [retval][out] */ int *pnCount) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EventLogs( 
            /* [retval][out] */ /* external definition not present */ ProjectItems **ppEventLogs) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddFilter( 
            /* [in] */ BSTR bstrFilterName,
            /* [defaultvalue][in] */ VARIANT_BOOL fOverwrite,
            /* [retval][out] */ VSAnalyzerFilter **ppFilter) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE RemoveFilter( 
            /* [in] */ BSTR bstrFilterName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_FiltersCount( 
            /* [retval][out] */ int *pnCount) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Filters( 
            /* [retval][out] */ /* external definition not present */ ProjectItems **ppFilters) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE StartRecording( 
            /* [in] */ BSTR bstrEventLogName,
            /* [retval][out] */ VSAnalyzerEventLog **ppEventLog) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE StopRecording( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE PauseRecording( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ResumeRecording( void) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Recording( 
            /* [retval][out] */ VARIANT_BOOL *pfRecordingState) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_RecordingPaused( 
            /* [retval][out] */ VARIANT_BOOL *pfPausedState) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ActivateFilter( 
            /* [in] */ BSTR bstrFilterName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeactivateFilter( void) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_DynamicEventSourcesFrequency( 
            /* [in] */ int nMilliseconds) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_DynamicEventSourcesFrequency( 
            /* [retval][out] */ int *pnMilliseconds) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_BlockOnOverflow( 
            /* [defaultvalue][in] */ VARIANT_BOOL fBlockOnOverflow = TRUE) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_BlockOnOverflow( 
            /* [retval][out] */ VARIANT_BOOL *pfBlockOnOverflow) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SaveAll( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Close( 
            /* [defaultvalue][in] */ VARIANT_BOOL fSaveAll = TRUE) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AttachUserSelectionCallback( 
            /* [in] */ VSAnalyzerUserSelectionCallback *pCallbackObject) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetUserSelection( 
            /* [retval][out] */ VSAnalyzerEvent **ppEventObject) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetUserSelection( 
            /* [in] */ BSTR bstrEventLogName,
            /* [in] */ DWORD dwStartTimeLow,
            /* [in] */ DWORD dwStartTimeHigh,
            /* [in] */ DWORD dwEndTimeLow,
            /* [in] */ DWORD dwEndTimeHigh) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Project( 
            /* [retval][out] */ /* external definition not present */ Project **ppProject) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct VSAnalyzerProjectVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            VSAnalyzerProject * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            VSAnalyzerProject * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            VSAnalyzerProject * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            VSAnalyzerProject * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            VSAnalyzerProject * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            VSAnalyzerProject * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            VSAnalyzerProject * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Name )( 
            VSAnalyzerProject * This,
            /* [retval][out] */ BSTR *pbstrName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddMachine )( 
            VSAnalyzerProject * This,
            /* [in] */ BSTR bstrMachineName,
            /* [retval][out] */ VSAnalyzerMachine **ppMachine);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *RemoveMachine )( 
            VSAnalyzerProject * This,
            /* [in] */ BSTR bstrMachineName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MachinesCount )( 
            VSAnalyzerProject * This,
            /* [retval][out] */ int *pnCount);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Machines )( 
            VSAnalyzerProject * This,
            /* [retval][out] */ /* external definition not present */ ProjectItems **ppMachines);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddEventLog )( 
            VSAnalyzerProject * This,
            /* [in] */ BSTR bstrEventLogName,
            /* [retval][out] */ VSAnalyzerEventLog **ppEventLog);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *RemoveEventLog )( 
            VSAnalyzerProject * This,
            /* [in] */ BSTR bstrEventLogName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_EventLogsCount )( 
            VSAnalyzerProject * This,
            /* [retval][out] */ int *pnCount);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EventLogs )( 
            VSAnalyzerProject * This,
            /* [retval][out] */ /* external definition not present */ ProjectItems **ppEventLogs);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddFilter )( 
            VSAnalyzerProject * This,
            /* [in] */ BSTR bstrFilterName,
            /* [defaultvalue][in] */ VARIANT_BOOL fOverwrite,
            /* [retval][out] */ VSAnalyzerFilter **ppFilter);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *RemoveFilter )( 
            VSAnalyzerProject * This,
            /* [in] */ BSTR bstrFilterName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_FiltersCount )( 
            VSAnalyzerProject * This,
            /* [retval][out] */ int *pnCount);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Filters )( 
            VSAnalyzerProject * This,
            /* [retval][out] */ /* external definition not present */ ProjectItems **ppFilters);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *StartRecording )( 
            VSAnalyzerProject * This,
            /* [in] */ BSTR bstrEventLogName,
            /* [retval][out] */ VSAnalyzerEventLog **ppEventLog);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *StopRecording )( 
            VSAnalyzerProject * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *PauseRecording )( 
            VSAnalyzerProject * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *ResumeRecording )( 
            VSAnalyzerProject * This);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Recording )( 
            VSAnalyzerProject * This,
            /* [retval][out] */ VARIANT_BOOL *pfRecordingState);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_RecordingPaused )( 
            VSAnalyzerProject * This,
            /* [retval][out] */ VARIANT_BOOL *pfPausedState);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *ActivateFilter )( 
            VSAnalyzerProject * This,
            /* [in] */ BSTR bstrFilterName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeactivateFilter )( 
            VSAnalyzerProject * This);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_DynamicEventSourcesFrequency )( 
            VSAnalyzerProject * This,
            /* [in] */ int nMilliseconds);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DynamicEventSourcesFrequency )( 
            VSAnalyzerProject * This,
            /* [retval][out] */ int *pnMilliseconds);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_BlockOnOverflow )( 
            VSAnalyzerProject * This,
            /* [defaultvalue][in] */ VARIANT_BOOL fBlockOnOverflow);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_BlockOnOverflow )( 
            VSAnalyzerProject * This,
            /* [retval][out] */ VARIANT_BOOL *pfBlockOnOverflow);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SaveAll )( 
            VSAnalyzerProject * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Close )( 
            VSAnalyzerProject * This,
            /* [defaultvalue][in] */ VARIANT_BOOL fSaveAll);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AttachUserSelectionCallback )( 
            VSAnalyzerProject * This,
            /* [in] */ VSAnalyzerUserSelectionCallback *pCallbackObject);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetUserSelection )( 
            VSAnalyzerProject * This,
            /* [retval][out] */ VSAnalyzerEvent **ppEventObject);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetUserSelection )( 
            VSAnalyzerProject * This,
            /* [in] */ BSTR bstrEventLogName,
            /* [in] */ DWORD dwStartTimeLow,
            /* [in] */ DWORD dwStartTimeHigh,
            /* [in] */ DWORD dwEndTimeLow,
            /* [in] */ DWORD dwEndTimeHigh);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Project )( 
            VSAnalyzerProject * This,
            /* [retval][out] */ /* external definition not present */ Project **ppProject);
        
        END_INTERFACE
    } VSAnalyzerProjectVtbl;

    interface VSAnalyzerProject
    {
        CONST_VTBL struct VSAnalyzerProjectVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define VSAnalyzerProject_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define VSAnalyzerProject_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define VSAnalyzerProject_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define VSAnalyzerProject_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define VSAnalyzerProject_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define VSAnalyzerProject_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define VSAnalyzerProject_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define VSAnalyzerProject_get_Name(This,pbstrName)	\
    (This)->lpVtbl -> get_Name(This,pbstrName)

#define VSAnalyzerProject_AddMachine(This,bstrMachineName,ppMachine)	\
    (This)->lpVtbl -> AddMachine(This,bstrMachineName,ppMachine)

#define VSAnalyzerProject_RemoveMachine(This,bstrMachineName)	\
    (This)->lpVtbl -> RemoveMachine(This,bstrMachineName)

#define VSAnalyzerProject_get_MachinesCount(This,pnCount)	\
    (This)->lpVtbl -> get_MachinesCount(This,pnCount)

#define VSAnalyzerProject_Machines(This,ppMachines)	\
    (This)->lpVtbl -> Machines(This,ppMachines)

#define VSAnalyzerProject_AddEventLog(This,bstrEventLogName,ppEventLog)	\
    (This)->lpVtbl -> AddEventLog(This,bstrEventLogName,ppEventLog)

#define VSAnalyzerProject_RemoveEventLog(This,bstrEventLogName)	\
    (This)->lpVtbl -> RemoveEventLog(This,bstrEventLogName)

#define VSAnalyzerProject_get_EventLogsCount(This,pnCount)	\
    (This)->lpVtbl -> get_EventLogsCount(This,pnCount)

#define VSAnalyzerProject_EventLogs(This,ppEventLogs)	\
    (This)->lpVtbl -> EventLogs(This,ppEventLogs)

#define VSAnalyzerProject_AddFilter(This,bstrFilterName,fOverwrite,ppFilter)	\
    (This)->lpVtbl -> AddFilter(This,bstrFilterName,fOverwrite,ppFilter)

#define VSAnalyzerProject_RemoveFilter(This,bstrFilterName)	\
    (This)->lpVtbl -> RemoveFilter(This,bstrFilterName)

#define VSAnalyzerProject_get_FiltersCount(This,pnCount)	\
    (This)->lpVtbl -> get_FiltersCount(This,pnCount)

#define VSAnalyzerProject_Filters(This,ppFilters)	\
    (This)->lpVtbl -> Filters(This,ppFilters)

#define VSAnalyzerProject_StartRecording(This,bstrEventLogName,ppEventLog)	\
    (This)->lpVtbl -> StartRecording(This,bstrEventLogName,ppEventLog)

#define VSAnalyzerProject_StopRecording(This)	\
    (This)->lpVtbl -> StopRecording(This)

#define VSAnalyzerProject_PauseRecording(This)	\
    (This)->lpVtbl -> PauseRecording(This)

#define VSAnalyzerProject_ResumeRecording(This)	\
    (This)->lpVtbl -> ResumeRecording(This)

#define VSAnalyzerProject_get_Recording(This,pfRecordingState)	\
    (This)->lpVtbl -> get_Recording(This,pfRecordingState)

#define VSAnalyzerProject_get_RecordingPaused(This,pfPausedState)	\
    (This)->lpVtbl -> get_RecordingPaused(This,pfPausedState)

#define VSAnalyzerProject_ActivateFilter(This,bstrFilterName)	\
    (This)->lpVtbl -> ActivateFilter(This,bstrFilterName)

#define VSAnalyzerProject_DeactivateFilter(This)	\
    (This)->lpVtbl -> DeactivateFilter(This)

#define VSAnalyzerProject_put_DynamicEventSourcesFrequency(This,nMilliseconds)	\
    (This)->lpVtbl -> put_DynamicEventSourcesFrequency(This,nMilliseconds)

#define VSAnalyzerProject_get_DynamicEventSourcesFrequency(This,pnMilliseconds)	\
    (This)->lpVtbl -> get_DynamicEventSourcesFrequency(This,pnMilliseconds)

#define VSAnalyzerProject_put_BlockOnOverflow(This,fBlockOnOverflow)	\
    (This)->lpVtbl -> put_BlockOnOverflow(This,fBlockOnOverflow)

#define VSAnalyzerProject_get_BlockOnOverflow(This,pfBlockOnOverflow)	\
    (This)->lpVtbl -> get_BlockOnOverflow(This,pfBlockOnOverflow)

#define VSAnalyzerProject_SaveAll(This)	\
    (This)->lpVtbl -> SaveAll(This)

#define VSAnalyzerProject_Close(This,fSaveAll)	\
    (This)->lpVtbl -> Close(This,fSaveAll)

#define VSAnalyzerProject_AttachUserSelectionCallback(This,pCallbackObject)	\
    (This)->lpVtbl -> AttachUserSelectionCallback(This,pCallbackObject)

#define VSAnalyzerProject_GetUserSelection(This,ppEventObject)	\
    (This)->lpVtbl -> GetUserSelection(This,ppEventObject)

#define VSAnalyzerProject_SetUserSelection(This,bstrEventLogName,dwStartTimeLow,dwStartTimeHigh,dwEndTimeLow,dwEndTimeHigh)	\
    (This)->lpVtbl -> SetUserSelection(This,bstrEventLogName,dwStartTimeLow,dwStartTimeHigh,dwEndTimeLow,dwEndTimeHigh)

#define VSAnalyzerProject_get_Project(This,ppProject)	\
    (This)->lpVtbl -> get_Project(This,ppProject)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_get_Name_Proxy( 
    VSAnalyzerProject * This,
    /* [retval][out] */ BSTR *pbstrName);


void __RPC_STUB VSAnalyzerProject_get_Name_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_AddMachine_Proxy( 
    VSAnalyzerProject * This,
    /* [in] */ BSTR bstrMachineName,
    /* [retval][out] */ VSAnalyzerMachine **ppMachine);


void __RPC_STUB VSAnalyzerProject_AddMachine_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_RemoveMachine_Proxy( 
    VSAnalyzerProject * This,
    /* [in] */ BSTR bstrMachineName);


void __RPC_STUB VSAnalyzerProject_RemoveMachine_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_get_MachinesCount_Proxy( 
    VSAnalyzerProject * This,
    /* [retval][out] */ int *pnCount);


void __RPC_STUB VSAnalyzerProject_get_MachinesCount_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_Machines_Proxy( 
    VSAnalyzerProject * This,
    /* [retval][out] */ /* external definition not present */ ProjectItems **ppMachines);


void __RPC_STUB VSAnalyzerProject_Machines_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_AddEventLog_Proxy( 
    VSAnalyzerProject * This,
    /* [in] */ BSTR bstrEventLogName,
    /* [retval][out] */ VSAnalyzerEventLog **ppEventLog);


void __RPC_STUB VSAnalyzerProject_AddEventLog_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_RemoveEventLog_Proxy( 
    VSAnalyzerProject * This,
    /* [in] */ BSTR bstrEventLogName);


void __RPC_STUB VSAnalyzerProject_RemoveEventLog_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_get_EventLogsCount_Proxy( 
    VSAnalyzerProject * This,
    /* [retval][out] */ int *pnCount);


void __RPC_STUB VSAnalyzerProject_get_EventLogsCount_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_EventLogs_Proxy( 
    VSAnalyzerProject * This,
    /* [retval][out] */ /* external definition not present */ ProjectItems **ppEventLogs);


void __RPC_STUB VSAnalyzerProject_EventLogs_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_AddFilter_Proxy( 
    VSAnalyzerProject * This,
    /* [in] */ BSTR bstrFilterName,
    /* [defaultvalue][in] */ VARIANT_BOOL fOverwrite,
    /* [retval][out] */ VSAnalyzerFilter **ppFilter);


void __RPC_STUB VSAnalyzerProject_AddFilter_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_RemoveFilter_Proxy( 
    VSAnalyzerProject * This,
    /* [in] */ BSTR bstrFilterName);


void __RPC_STUB VSAnalyzerProject_RemoveFilter_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_get_FiltersCount_Proxy( 
    VSAnalyzerProject * This,
    /* [retval][out] */ int *pnCount);


void __RPC_STUB VSAnalyzerProject_get_FiltersCount_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_Filters_Proxy( 
    VSAnalyzerProject * This,
    /* [retval][out] */ /* external definition not present */ ProjectItems **ppFilters);


void __RPC_STUB VSAnalyzerProject_Filters_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_StartRecording_Proxy( 
    VSAnalyzerProject * This,
    /* [in] */ BSTR bstrEventLogName,
    /* [retval][out] */ VSAnalyzerEventLog **ppEventLog);


void __RPC_STUB VSAnalyzerProject_StartRecording_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_StopRecording_Proxy( 
    VSAnalyzerProject * This);


void __RPC_STUB VSAnalyzerProject_StopRecording_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_PauseRecording_Proxy( 
    VSAnalyzerProject * This);


void __RPC_STUB VSAnalyzerProject_PauseRecording_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_ResumeRecording_Proxy( 
    VSAnalyzerProject * This);


void __RPC_STUB VSAnalyzerProject_ResumeRecording_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_get_Recording_Proxy( 
    VSAnalyzerProject * This,
    /* [retval][out] */ VARIANT_BOOL *pfRecordingState);


void __RPC_STUB VSAnalyzerProject_get_Recording_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_get_RecordingPaused_Proxy( 
    VSAnalyzerProject * This,
    /* [retval][out] */ VARIANT_BOOL *pfPausedState);


void __RPC_STUB VSAnalyzerProject_get_RecordingPaused_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_ActivateFilter_Proxy( 
    VSAnalyzerProject * This,
    /* [in] */ BSTR bstrFilterName);


void __RPC_STUB VSAnalyzerProject_ActivateFilter_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_DeactivateFilter_Proxy( 
    VSAnalyzerProject * This);


void __RPC_STUB VSAnalyzerProject_DeactivateFilter_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_put_DynamicEventSourcesFrequency_Proxy( 
    VSAnalyzerProject * This,
    /* [in] */ int nMilliseconds);


void __RPC_STUB VSAnalyzerProject_put_DynamicEventSourcesFrequency_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_get_DynamicEventSourcesFrequency_Proxy( 
    VSAnalyzerProject * This,
    /* [retval][out] */ int *pnMilliseconds);


void __RPC_STUB VSAnalyzerProject_get_DynamicEventSourcesFrequency_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_put_BlockOnOverflow_Proxy( 
    VSAnalyzerProject * This,
    /* [defaultvalue][in] */ VARIANT_BOOL fBlockOnOverflow);


void __RPC_STUB VSAnalyzerProject_put_BlockOnOverflow_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_get_BlockOnOverflow_Proxy( 
    VSAnalyzerProject * This,
    /* [retval][out] */ VARIANT_BOOL *pfBlockOnOverflow);


void __RPC_STUB VSAnalyzerProject_get_BlockOnOverflow_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_SaveAll_Proxy( 
    VSAnalyzerProject * This);


void __RPC_STUB VSAnalyzerProject_SaveAll_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_Close_Proxy( 
    VSAnalyzerProject * This,
    /* [defaultvalue][in] */ VARIANT_BOOL fSaveAll);


void __RPC_STUB VSAnalyzerProject_Close_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_AttachUserSelectionCallback_Proxy( 
    VSAnalyzerProject * This,
    /* [in] */ VSAnalyzerUserSelectionCallback *pCallbackObject);


void __RPC_STUB VSAnalyzerProject_AttachUserSelectionCallback_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_GetUserSelection_Proxy( 
    VSAnalyzerProject * This,
    /* [retval][out] */ VSAnalyzerEvent **ppEventObject);


void __RPC_STUB VSAnalyzerProject_GetUserSelection_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_SetUserSelection_Proxy( 
    VSAnalyzerProject * This,
    /* [in] */ BSTR bstrEventLogName,
    /* [in] */ DWORD dwStartTimeLow,
    /* [in] */ DWORD dwStartTimeHigh,
    /* [in] */ DWORD dwEndTimeLow,
    /* [in] */ DWORD dwEndTimeHigh);


void __RPC_STUB VSAnalyzerProject_SetUserSelection_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerProject_get_Project_Proxy( 
    VSAnalyzerProject * This,
    /* [retval][out] */ /* external definition not present */ Project **ppProject);


void __RPC_STUB VSAnalyzerProject_get_Project_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __VSAnalyzerProject_INTERFACE_DEFINED__ */


#ifndef __VSAnalyzerMachine_INTERFACE_DEFINED__
#define __VSAnalyzerMachine_INTERFACE_DEFINED__

/* interface VSAnalyzerMachine */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_VSAnalyzerMachine;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d51-1510-11d2-8F88-00A0C90A6B03")
    VSAnalyzerMachine : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Name( 
            /* [retval][out] */ BSTR *pbstrName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Connected( 
            /* [retval][out] */ VARIANT_BOOL *pfVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ProjectItem( 
            /* [retval][out] */ /* external definition not present */ ProjectItem **ppProjectItem) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Connect( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Disconnect( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct VSAnalyzerMachineVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            VSAnalyzerMachine * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            VSAnalyzerMachine * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            VSAnalyzerMachine * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            VSAnalyzerMachine * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            VSAnalyzerMachine * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            VSAnalyzerMachine * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            VSAnalyzerMachine * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Name )( 
            VSAnalyzerMachine * This,
            /* [retval][out] */ BSTR *pbstrName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Connected )( 
            VSAnalyzerMachine * This,
            /* [retval][out] */ VARIANT_BOOL *pfVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProjectItem )( 
            VSAnalyzerMachine * This,
            /* [retval][out] */ /* external definition not present */ ProjectItem **ppProjectItem);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Connect )( 
            VSAnalyzerMachine * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Disconnect )( 
            VSAnalyzerMachine * This);
        
        END_INTERFACE
    } VSAnalyzerMachineVtbl;

    interface VSAnalyzerMachine
    {
        CONST_VTBL struct VSAnalyzerMachineVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define VSAnalyzerMachine_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define VSAnalyzerMachine_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define VSAnalyzerMachine_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define VSAnalyzerMachine_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define VSAnalyzerMachine_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define VSAnalyzerMachine_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define VSAnalyzerMachine_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define VSAnalyzerMachine_get_Name(This,pbstrName)	\
    (This)->lpVtbl -> get_Name(This,pbstrName)

#define VSAnalyzerMachine_get_Connected(This,pfVal)	\
    (This)->lpVtbl -> get_Connected(This,pfVal)

#define VSAnalyzerMachine_get_ProjectItem(This,ppProjectItem)	\
    (This)->lpVtbl -> get_ProjectItem(This,ppProjectItem)

#define VSAnalyzerMachine_Connect(This)	\
    (This)->lpVtbl -> Connect(This)

#define VSAnalyzerMachine_Disconnect(This)	\
    (This)->lpVtbl -> Disconnect(This)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerMachine_get_Name_Proxy( 
    VSAnalyzerMachine * This,
    /* [retval][out] */ BSTR *pbstrName);


void __RPC_STUB VSAnalyzerMachine_get_Name_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerMachine_get_Connected_Proxy( 
    VSAnalyzerMachine * This,
    /* [retval][out] */ VARIANT_BOOL *pfVal);


void __RPC_STUB VSAnalyzerMachine_get_Connected_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerMachine_get_ProjectItem_Proxy( 
    VSAnalyzerMachine * This,
    /* [retval][out] */ /* external definition not present */ ProjectItem **ppProjectItem);


void __RPC_STUB VSAnalyzerMachine_get_ProjectItem_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerMachine_Connect_Proxy( 
    VSAnalyzerMachine * This);


void __RPC_STUB VSAnalyzerMachine_Connect_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerMachine_Disconnect_Proxy( 
    VSAnalyzerMachine * This);


void __RPC_STUB VSAnalyzerMachine_Disconnect_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __VSAnalyzerMachine_INTERFACE_DEFINED__ */


#ifndef __VSAnalyzerEventLog_INTERFACE_DEFINED__
#define __VSAnalyzerEventLog_INTERFACE_DEFINED__

/* interface VSAnalyzerEventLog */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_VSAnalyzerEventLog;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d51-1510-11d2-8F88-00A0C90A6B05")
    VSAnalyzerEventLog : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Name( 
            /* [retval][out] */ BSTR *pbstrName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Recording( 
            /* [retval][out] */ VARIANT_BOOL *pfRecordingState) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Paused( 
            /* [retval][out] */ VARIANT_BOOL *pfPausedState) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ProjectItem( 
            /* [retval][out] */ /* external definition not present */ ProjectItem **ppProjectItem) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ int *pnEventsCount) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Item( 
            /* [in] */ VARIANT vIndex,
            /* [retval][out] */ VSAnalyzerEvent **ppVSAnalyzerEvent) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ IUnknown **ppunk) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct VSAnalyzerEventLogVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            VSAnalyzerEventLog * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            VSAnalyzerEventLog * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            VSAnalyzerEventLog * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            VSAnalyzerEventLog * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            VSAnalyzerEventLog * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            VSAnalyzerEventLog * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            VSAnalyzerEventLog * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Name )( 
            VSAnalyzerEventLog * This,
            /* [retval][out] */ BSTR *pbstrName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Recording )( 
            VSAnalyzerEventLog * This,
            /* [retval][out] */ VARIANT_BOOL *pfRecordingState);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Paused )( 
            VSAnalyzerEventLog * This,
            /* [retval][out] */ VARIANT_BOOL *pfPausedState);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProjectItem )( 
            VSAnalyzerEventLog * This,
            /* [retval][out] */ /* external definition not present */ ProjectItem **ppProjectItem);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            VSAnalyzerEventLog * This,
            /* [retval][out] */ int *pnEventsCount);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Item )( 
            VSAnalyzerEventLog * This,
            /* [in] */ VARIANT vIndex,
            /* [retval][out] */ VSAnalyzerEvent **ppVSAnalyzerEvent);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            VSAnalyzerEventLog * This,
            /* [retval][out] */ IUnknown **ppunk);
        
        END_INTERFACE
    } VSAnalyzerEventLogVtbl;

    interface VSAnalyzerEventLog
    {
        CONST_VTBL struct VSAnalyzerEventLogVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define VSAnalyzerEventLog_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define VSAnalyzerEventLog_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define VSAnalyzerEventLog_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define VSAnalyzerEventLog_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define VSAnalyzerEventLog_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define VSAnalyzerEventLog_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define VSAnalyzerEventLog_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define VSAnalyzerEventLog_get_Name(This,pbstrName)	\
    (This)->lpVtbl -> get_Name(This,pbstrName)

#define VSAnalyzerEventLog_get_Recording(This,pfRecordingState)	\
    (This)->lpVtbl -> get_Recording(This,pfRecordingState)

#define VSAnalyzerEventLog_get_Paused(This,pfPausedState)	\
    (This)->lpVtbl -> get_Paused(This,pfPausedState)

#define VSAnalyzerEventLog_get_ProjectItem(This,ppProjectItem)	\
    (This)->lpVtbl -> get_ProjectItem(This,ppProjectItem)

#define VSAnalyzerEventLog_get_Count(This,pnEventsCount)	\
    (This)->lpVtbl -> get_Count(This,pnEventsCount)

#define VSAnalyzerEventLog_Item(This,vIndex,ppVSAnalyzerEvent)	\
    (This)->lpVtbl -> Item(This,vIndex,ppVSAnalyzerEvent)

#define VSAnalyzerEventLog_get__NewEnum(This,ppunk)	\
    (This)->lpVtbl -> get__NewEnum(This,ppunk)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerEventLog_get_Name_Proxy( 
    VSAnalyzerEventLog * This,
    /* [retval][out] */ BSTR *pbstrName);


void __RPC_STUB VSAnalyzerEventLog_get_Name_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerEventLog_get_Recording_Proxy( 
    VSAnalyzerEventLog * This,
    /* [retval][out] */ VARIANT_BOOL *pfRecordingState);


void __RPC_STUB VSAnalyzerEventLog_get_Recording_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerEventLog_get_Paused_Proxy( 
    VSAnalyzerEventLog * This,
    /* [retval][out] */ VARIANT_BOOL *pfPausedState);


void __RPC_STUB VSAnalyzerEventLog_get_Paused_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerEventLog_get_ProjectItem_Proxy( 
    VSAnalyzerEventLog * This,
    /* [retval][out] */ /* external definition not present */ ProjectItem **ppProjectItem);


void __RPC_STUB VSAnalyzerEventLog_get_ProjectItem_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerEventLog_get_Count_Proxy( 
    VSAnalyzerEventLog * This,
    /* [retval][out] */ int *pnEventsCount);


void __RPC_STUB VSAnalyzerEventLog_get_Count_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerEventLog_Item_Proxy( 
    VSAnalyzerEventLog * This,
    /* [in] */ VARIANT vIndex,
    /* [retval][out] */ VSAnalyzerEvent **ppVSAnalyzerEvent);


void __RPC_STUB VSAnalyzerEventLog_Item_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerEventLog_get__NewEnum_Proxy( 
    VSAnalyzerEventLog * This,
    /* [retval][out] */ IUnknown **ppunk);


void __RPC_STUB VSAnalyzerEventLog_get__NewEnum_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __VSAnalyzerEventLog_INTERFACE_DEFINED__ */


#ifndef __VSAnalyzerFilter_INTERFACE_DEFINED__
#define __VSAnalyzerFilter_INTERFACE_DEFINED__

/* interface VSAnalyzerFilter */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_VSAnalyzerFilter;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d51-1510-11d2-8F88-00A0C90A6B07")
    VSAnalyzerFilter : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Name( 
            /* [retval][out] */ BSTR *pbstrName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Expression( 
            /* [retval][out] */ BSTR *pbstrFilterExpression) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Expression( 
            /* [in] */ BSTR bstrFilterExpression) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ProjectItem( 
            /* [retval][out] */ /* external definition not present */ ProjectItem **ppProjectItem) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Active( 
            /* [retval][out] */ VARIANT_BOOL *pfActiveState) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EvaluateEvent( 
            /* [in] */ VSAnalyzerEvent *pVSAnalyzerEvent,
            /* [retval][out] */ VARIANT_BOOL *pfPassesFilter) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Applied( 
            /* [retval][out] */ VARIANT_BOOL *pfAppliedState) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct VSAnalyzerFilterVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            VSAnalyzerFilter * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            VSAnalyzerFilter * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            VSAnalyzerFilter * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            VSAnalyzerFilter * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            VSAnalyzerFilter * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            VSAnalyzerFilter * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            VSAnalyzerFilter * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Name )( 
            VSAnalyzerFilter * This,
            /* [retval][out] */ BSTR *pbstrName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Expression )( 
            VSAnalyzerFilter * This,
            /* [retval][out] */ BSTR *pbstrFilterExpression);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Expression )( 
            VSAnalyzerFilter * This,
            /* [in] */ BSTR bstrFilterExpression);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProjectItem )( 
            VSAnalyzerFilter * This,
            /* [retval][out] */ /* external definition not present */ ProjectItem **ppProjectItem);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Active )( 
            VSAnalyzerFilter * This,
            /* [retval][out] */ VARIANT_BOOL *pfActiveState);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EvaluateEvent )( 
            VSAnalyzerFilter * This,
            /* [in] */ VSAnalyzerEvent *pVSAnalyzerEvent,
            /* [retval][out] */ VARIANT_BOOL *pfPassesFilter);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Applied )( 
            VSAnalyzerFilter * This,
            /* [retval][out] */ VARIANT_BOOL *pfAppliedState);
        
        END_INTERFACE
    } VSAnalyzerFilterVtbl;

    interface VSAnalyzerFilter
    {
        CONST_VTBL struct VSAnalyzerFilterVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define VSAnalyzerFilter_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define VSAnalyzerFilter_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define VSAnalyzerFilter_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define VSAnalyzerFilter_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define VSAnalyzerFilter_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define VSAnalyzerFilter_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define VSAnalyzerFilter_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define VSAnalyzerFilter_get_Name(This,pbstrName)	\
    (This)->lpVtbl -> get_Name(This,pbstrName)

#define VSAnalyzerFilter_get_Expression(This,pbstrFilterExpression)	\
    (This)->lpVtbl -> get_Expression(This,pbstrFilterExpression)

#define VSAnalyzerFilter_put_Expression(This,bstrFilterExpression)	\
    (This)->lpVtbl -> put_Expression(This,bstrFilterExpression)

#define VSAnalyzerFilter_get_ProjectItem(This,ppProjectItem)	\
    (This)->lpVtbl -> get_ProjectItem(This,ppProjectItem)

#define VSAnalyzerFilter_get_Active(This,pfActiveState)	\
    (This)->lpVtbl -> get_Active(This,pfActiveState)

#define VSAnalyzerFilter_EvaluateEvent(This,pVSAnalyzerEvent,pfPassesFilter)	\
    (This)->lpVtbl -> EvaluateEvent(This,pVSAnalyzerEvent,pfPassesFilter)

#define VSAnalyzerFilter_get_Applied(This,pfAppliedState)	\
    (This)->lpVtbl -> get_Applied(This,pfAppliedState)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerFilter_get_Name_Proxy( 
    VSAnalyzerFilter * This,
    /* [retval][out] */ BSTR *pbstrName);


void __RPC_STUB VSAnalyzerFilter_get_Name_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerFilter_get_Expression_Proxy( 
    VSAnalyzerFilter * This,
    /* [retval][out] */ BSTR *pbstrFilterExpression);


void __RPC_STUB VSAnalyzerFilter_get_Expression_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE VSAnalyzerFilter_put_Expression_Proxy( 
    VSAnalyzerFilter * This,
    /* [in] */ BSTR bstrFilterExpression);


void __RPC_STUB VSAnalyzerFilter_put_Expression_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerFilter_get_ProjectItem_Proxy( 
    VSAnalyzerFilter * This,
    /* [retval][out] */ /* external definition not present */ ProjectItem **ppProjectItem);


void __RPC_STUB VSAnalyzerFilter_get_ProjectItem_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerFilter_get_Active_Proxy( 
    VSAnalyzerFilter * This,
    /* [retval][out] */ VARIANT_BOOL *pfActiveState);


void __RPC_STUB VSAnalyzerFilter_get_Active_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerFilter_EvaluateEvent_Proxy( 
    VSAnalyzerFilter * This,
    /* [in] */ VSAnalyzerEvent *pVSAnalyzerEvent,
    /* [retval][out] */ VARIANT_BOOL *pfPassesFilter);


void __RPC_STUB VSAnalyzerFilter_EvaluateEvent_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerFilter_get_Applied_Proxy( 
    VSAnalyzerFilter * This,
    /* [retval][out] */ VARIANT_BOOL *pfAppliedState);


void __RPC_STUB VSAnalyzerFilter_get_Applied_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __VSAnalyzerFilter_INTERFACE_DEFINED__ */



#ifndef __VSAnalyzerConstants_MODULE_DEFINED__
#define __VSAnalyzerConstants_MODULE_DEFINED__


/* module VSAnalyzerConstants */
/* [helpstring][uuid] */ 

const LPWSTR VSAnalyzerProjectsKindVSA	=	L"{6c736d51-1510-11d2-8F88-00A0C90A6B21}";

const LPWSTR VSAnalyzerProjectKindVSA	=	L"{6c736d51-1510-11d2-8F88-00A0C90A6B22}";

const LPWSTR VSAnalyzerProjectItemsKindVSA	=	L"{6c736d51-1510-11d2-8F88-00A0C90A6B23}";

const LPWSTR VSAnalyzerProjectItemKindEventLog	=	L"{6c736d51-1510-11d2-8F88-00A0C90A6B24}";

const LPWSTR VSAnalyzerProjectItemKindFilter	=	L"{6c736d51-1510-11d2-8F88-00A0C90A6B25}";

const LPWSTR VSAnalyzerProjectItemKindMachine	=	L"{6c736d51-1510-11d2-8F88-00A0C90A6B26}";

const LPWSTR VSAnalyzerProjectItemsKindEventLogs	=	L"{6c736d51-1510-11d2-8F88-00A0C90A6B27}";

const LPWSTR VSAnalyzerProjectItemsKindFilters	=	L"{6c736d51-1510-11d2-8F88-00A0C90A6B28}";

const LPWSTR VSAnalyzerProjectItemsKindMachines	=	L"{6c736d51-1510-11d2-8F88-00A0C90A6B29}";

const LPWSTR VSAnalyzerProjectItemsKindEventLogsList	=	L"{6c736d51-1510-11d2-8F88-00A0C90A6B2A}";

const LPWSTR VSAnalyzerProjectItemsKindFiltersList	=	L"{6c736d51-1510-11d2-8F88-00A0C90A6B2B}";

const LPWSTR VSAnalyzerProjectItemsKindMachinesList	=	L"{6c736d51-1510-11d2-8F88-00A0C90A6B2C}";

const LPWSTR VSAnalyzerEventFieldEventId	=	L"EventId";

const LPWSTR VSAnalyzerEventFieldSessionName	=	L"SessionName";

const LPWSTR VSAnalyzerEventFieldType	=	L"Type";

const LPWSTR VSAnalyzerEventFieldTypeId	=	L"TypeId";

const LPWSTR VSAnalyzerEventFieldSourceName	=	L"SourceName";

const LPWSTR VSAnalyzerEventFieldSourceGUID	=	L"SourceGUID";

const LPWSTR VSAnalyzerEventFieldEventName	=	L"EventName";

const LPWSTR VSAnalyzerEventFieldEventGUID	=	L"EventGUID";

const LPWSTR VSAnalyzerEventFieldCategoryName	=	L"CategoryName";

const LPWSTR VSAnalyzerEventFieldFullCategoryName	=	L"FullCategoryName";

const LPWSTR VSAnalyzerEventFieldCategoryGUID	=	L"CategoryGUID";

const LPWSTR VSAnalyzerEventFieldEventTime	=	L"EventTime";

const LPWSTR VSAnalyzerEventFieldLoggedTime	=	L"LoggedTime";

const LPWSTR VSAnalyzerEventFieldDuration	=	L"Duration";

const LPWSTR VSAnalyzerEventFieldSourceMachine	=	L"SourceMachine";

const LPWSTR VSAnalyzerEventFieldSourceProcessId	=	L"SourceProcessId";

const LPWSTR VSAnalyzerEventFieldSourceThread	=	L"SourceThread";

const LPWSTR VSAnalyzerEventFieldSourceComponent	=	L"SourceComponent";

const LPWSTR VSAnalyzerEventFieldSourceSession	=	L"SourceSession";

const LPWSTR VSAnalyzerEventFieldTargetMachine	=	L"TargetMachine";

const LPWSTR VSAnalyzerEventFieldTargetProcessId	=	L"TargetProcessId";

const LPWSTR VSAnalyzerEventFieldTargetThread	=	L"TargetThread";

const LPWSTR VSAnalyzerEventFieldTargetComponent	=	L"TargetComponent";

const LPWSTR VSAnalyzerEventFieldTargetSession	=	L"TargetSession";

const LPWSTR VSAnalyzerEventFieldSecurityIdentity	=	L"SecurityIdentity";

const LPWSTR VSAnalyzerEventFieldCausalityID	=	L"CausailtyID";

const LPWSTR VSAnalyzerEventFieldSourceProcessName	=	L"SourceProcessName";

const LPWSTR VSAnalyzerEventFieldTargetProcessName	=	L"TargetProcessName";

const LPWSTR VSAnalyzerEventFieldSourceHandle	=	L"SourceHandle";

const LPWSTR VSAnalyzerEventFieldTargetHandle	=	L"TargetHandle";

const LPWSTR VSAnalyzerEventFieldArguments	=	L"Arguments";

const LPWSTR VSAnalyzerEventFieldReturnValue	=	L"ReturnValue";

const LPWSTR VSAnalyzerEventFieldException	=	L"Exception";

const LPWSTR VSAnalyzerEventFieldCorrelationID	=	L"CorrelationID";

const LPWSTR VSAnalyzerEventFieldDynamicEventData	=	L"DynamicEventData";

const LPWSTR VSAnalyzerEventFieldEventLogId	=	L"EventLogId";

const LPWSTR VSAnalyzerEventFieldEventLogName	=	L"EventLogName";

typedef /* [helpstring][v1_enum] */ 
enum VSAnalyzerUIEventField
    {	VSAnalyzerUIEventFieldFirst	= 1,
	VSAnalyzerUIEventFieldEventId	= 1,
	VSAnalyzerUIEventFieldSessionName	= 2,
	VSAnalyzerUIEventFieldType	= 3,
	VSAnalyzerUIEventFieldTypeId	= 4,
	VSAnalyzerUIEventFieldSourceName	= 5,
	VSAnalyzerUIEventFieldSourceGUID	= 6,
	VSAnalyzerUIEventFieldEventName	= 7,
	VSAnalyzerUIEventFieldEventGUID	= 8,
	VSAnalyzerUIEventFieldCategoryName	= 9,
	VSAnalyzerUIEventFieldFullCategoryName	= 10,
	VSAnalyzerUIEventFieldCategoryGUID	= 11,
	VSAnalyzerUIEventFieldEventTime	= 12,
	VSAnalyzerUIEventFieldLoggedTime	= 13,
	VSAnalyzerUIEventFieldDuration	= 14,
	VSAnalyzerUIEventFieldSourceMachine	= 15,
	VSAnalyzerUIEventFieldSourceProcessId	= 16,
	VSAnalyzerUIEventFieldSourceThread	= 17,
	VSAnalyzerUIEventFieldSourceComponent	= 18,
	VSAnalyzerUIEventFieldSourceSession	= 19,
	VSAnalyzerUIEventFieldTargetMachine	= 20,
	VSAnalyzerUIEventFieldTargetProcessId	= 21,
	VSAnalyzerUIEventFieldTargetThread	= 22,
	VSAnalyzerUIEventFieldTargetComponent	= 23,
	VSAnalyzerUIEventFieldTargetSession	= 24,
	VSAnalyzerUIEventFieldSecurityIdentity	= 25,
	VSAnalyzerUIEventFieldCausalityID	= 26,
	VSAnalyzerUIEventFieldSourceProcessName	= 27,
	VSAnalyzerUIEventFieldTargetProcessName	= 28,
	VSAnalyzerUIEventFieldSourceHandle	= 29,
	VSAnalyzerUIEventFieldTargetHandle	= 30,
	VSAnalyzerUIEventFieldArguments	= 31,
	VSAnalyzerUIEventFieldReturnValue	= 32,
	VSAnalyzerUIEventFieldException	= 33,
	VSAnalyzerUIEventFieldCorrelationID	= 34,
	VSAnalyzerUIEventFieldDynamicEventData	= 35,
	VSAnalyzerUIEventFieldEventLogId	= 36,
	VSAnalyzerUIEventFieldEventLogName	= 37,
	VSAnalyzerUIEventFieldLast	= 37
    } 	VSAnalyzerUIEventField;

#endif /* __VSAnalyzerConstants_MODULE_DEFINED__ */

#ifndef __VSAnalyzerEventField_INTERFACE_DEFINED__
#define __VSAnalyzerEventField_INTERFACE_DEFINED__

/* interface VSAnalyzerEventField */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_VSAnalyzerEventField;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d51-1510-11d2-8F88-00A0C90A6B08")
    VSAnalyzerEventField : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_FieldName( 
            /* [retval][out] */ BSTR *bstrFieldName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_FieldValue( 
            /* [retval][out] */ VARIANT *varFieldValue) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct VSAnalyzerEventFieldVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            VSAnalyzerEventField * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            VSAnalyzerEventField * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            VSAnalyzerEventField * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            VSAnalyzerEventField * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            VSAnalyzerEventField * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            VSAnalyzerEventField * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            VSAnalyzerEventField * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_FieldName )( 
            VSAnalyzerEventField * This,
            /* [retval][out] */ BSTR *bstrFieldName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_FieldValue )( 
            VSAnalyzerEventField * This,
            /* [retval][out] */ VARIANT *varFieldValue);
        
        END_INTERFACE
    } VSAnalyzerEventFieldVtbl;

    interface VSAnalyzerEventField
    {
        CONST_VTBL struct VSAnalyzerEventFieldVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define VSAnalyzerEventField_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define VSAnalyzerEventField_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define VSAnalyzerEventField_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define VSAnalyzerEventField_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define VSAnalyzerEventField_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define VSAnalyzerEventField_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define VSAnalyzerEventField_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define VSAnalyzerEventField_get_FieldName(This,bstrFieldName)	\
    (This)->lpVtbl -> get_FieldName(This,bstrFieldName)

#define VSAnalyzerEventField_get_FieldValue(This,varFieldValue)	\
    (This)->lpVtbl -> get_FieldValue(This,varFieldValue)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerEventField_get_FieldName_Proxy( 
    VSAnalyzerEventField * This,
    /* [retval][out] */ BSTR *bstrFieldName);


void __RPC_STUB VSAnalyzerEventField_get_FieldName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerEventField_get_FieldValue_Proxy( 
    VSAnalyzerEventField * This,
    /* [retval][out] */ VARIANT *varFieldValue);


void __RPC_STUB VSAnalyzerEventField_get_FieldValue_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __VSAnalyzerEventField_INTERFACE_DEFINED__ */


#ifndef __VSAnalyzerEvent_INTERFACE_DEFINED__
#define __VSAnalyzerEvent_INTERFACE_DEFINED__

/* interface VSAnalyzerEvent */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_VSAnalyzerEvent;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d51-1510-11d2-8F88-00A0C90A6B09")
    VSAnalyzerEvent : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ int *pnCount) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Item( 
            /* [in] */ VARIANT varIndex,
            /* [retval][out] */ VSAnalyzerEventField **ppVSAnalyzerEventField) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ IUnknown **punk) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ItemByStandardParameterEnum( 
            /* [in] */ VSAStandardParameters nParameterEnum,
            /* [retval][out] */ VSAnalyzerEventField **ppVSAnalyzerEventField) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EventTimeRaw( 
            /* [out] */ DWORD *pdwDataLow,
            /* [out] */ DWORD *pdwDataHigh) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE LoggedTimeRaw( 
            /* [out] */ DWORD *pdwDataLow,
            /* [out] */ DWORD *pdwDataHigh) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DurationRaw( 
            /* [out] */ DWORD *pdwDataLow,
            /* [out] */ DWORD *pdwDataHigh) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DynamicEventDataRaw( 
            /* [out] */ DWORD *pdwDataLow,
            /* [out] */ DWORD *pdwDataHigh) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct VSAnalyzerEventVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            VSAnalyzerEvent * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            VSAnalyzerEvent * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            VSAnalyzerEvent * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            VSAnalyzerEvent * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            VSAnalyzerEvent * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            VSAnalyzerEvent * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            VSAnalyzerEvent * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            VSAnalyzerEvent * This,
            /* [retval][out] */ int *pnCount);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Item )( 
            VSAnalyzerEvent * This,
            /* [in] */ VARIANT varIndex,
            /* [retval][out] */ VSAnalyzerEventField **ppVSAnalyzerEventField);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            VSAnalyzerEvent * This,
            /* [retval][out] */ IUnknown **punk);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *ItemByStandardParameterEnum )( 
            VSAnalyzerEvent * This,
            /* [in] */ VSAStandardParameters nParameterEnum,
            /* [retval][out] */ VSAnalyzerEventField **ppVSAnalyzerEventField);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EventTimeRaw )( 
            VSAnalyzerEvent * This,
            /* [out] */ DWORD *pdwDataLow,
            /* [out] */ DWORD *pdwDataHigh);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *LoggedTimeRaw )( 
            VSAnalyzerEvent * This,
            /* [out] */ DWORD *pdwDataLow,
            /* [out] */ DWORD *pdwDataHigh);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DurationRaw )( 
            VSAnalyzerEvent * This,
            /* [out] */ DWORD *pdwDataLow,
            /* [out] */ DWORD *pdwDataHigh);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DynamicEventDataRaw )( 
            VSAnalyzerEvent * This,
            /* [out] */ DWORD *pdwDataLow,
            /* [out] */ DWORD *pdwDataHigh);
        
        END_INTERFACE
    } VSAnalyzerEventVtbl;

    interface VSAnalyzerEvent
    {
        CONST_VTBL struct VSAnalyzerEventVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define VSAnalyzerEvent_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define VSAnalyzerEvent_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define VSAnalyzerEvent_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define VSAnalyzerEvent_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define VSAnalyzerEvent_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define VSAnalyzerEvent_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define VSAnalyzerEvent_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define VSAnalyzerEvent_get_Count(This,pnCount)	\
    (This)->lpVtbl -> get_Count(This,pnCount)

#define VSAnalyzerEvent_Item(This,varIndex,ppVSAnalyzerEventField)	\
    (This)->lpVtbl -> Item(This,varIndex,ppVSAnalyzerEventField)

#define VSAnalyzerEvent_get__NewEnum(This,punk)	\
    (This)->lpVtbl -> get__NewEnum(This,punk)

#define VSAnalyzerEvent_ItemByStandardParameterEnum(This,nParameterEnum,ppVSAnalyzerEventField)	\
    (This)->lpVtbl -> ItemByStandardParameterEnum(This,nParameterEnum,ppVSAnalyzerEventField)

#define VSAnalyzerEvent_EventTimeRaw(This,pdwDataLow,pdwDataHigh)	\
    (This)->lpVtbl -> EventTimeRaw(This,pdwDataLow,pdwDataHigh)

#define VSAnalyzerEvent_LoggedTimeRaw(This,pdwDataLow,pdwDataHigh)	\
    (This)->lpVtbl -> LoggedTimeRaw(This,pdwDataLow,pdwDataHigh)

#define VSAnalyzerEvent_DurationRaw(This,pdwDataLow,pdwDataHigh)	\
    (This)->lpVtbl -> DurationRaw(This,pdwDataLow,pdwDataHigh)

#define VSAnalyzerEvent_DynamicEventDataRaw(This,pdwDataLow,pdwDataHigh)	\
    (This)->lpVtbl -> DynamicEventDataRaw(This,pdwDataLow,pdwDataHigh)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerEvent_get_Count_Proxy( 
    VSAnalyzerEvent * This,
    /* [retval][out] */ int *pnCount);


void __RPC_STUB VSAnalyzerEvent_get_Count_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerEvent_Item_Proxy( 
    VSAnalyzerEvent * This,
    /* [in] */ VARIANT varIndex,
    /* [retval][out] */ VSAnalyzerEventField **ppVSAnalyzerEventField);


void __RPC_STUB VSAnalyzerEvent_Item_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE VSAnalyzerEvent_get__NewEnum_Proxy( 
    VSAnalyzerEvent * This,
    /* [retval][out] */ IUnknown **punk);


void __RPC_STUB VSAnalyzerEvent_get__NewEnum_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerEvent_ItemByStandardParameterEnum_Proxy( 
    VSAnalyzerEvent * This,
    /* [in] */ VSAStandardParameters nParameterEnum,
    /* [retval][out] */ VSAnalyzerEventField **ppVSAnalyzerEventField);


void __RPC_STUB VSAnalyzerEvent_ItemByStandardParameterEnum_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerEvent_EventTimeRaw_Proxy( 
    VSAnalyzerEvent * This,
    /* [out] */ DWORD *pdwDataLow,
    /* [out] */ DWORD *pdwDataHigh);


void __RPC_STUB VSAnalyzerEvent_EventTimeRaw_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerEvent_LoggedTimeRaw_Proxy( 
    VSAnalyzerEvent * This,
    /* [out] */ DWORD *pdwDataLow,
    /* [out] */ DWORD *pdwDataHigh);


void __RPC_STUB VSAnalyzerEvent_LoggedTimeRaw_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerEvent_DurationRaw_Proxy( 
    VSAnalyzerEvent * This,
    /* [out] */ DWORD *pdwDataLow,
    /* [out] */ DWORD *pdwDataHigh);


void __RPC_STUB VSAnalyzerEvent_DurationRaw_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerEvent_DynamicEventDataRaw_Proxy( 
    VSAnalyzerEvent * This,
    /* [out] */ DWORD *pdwDataLow,
    /* [out] */ DWORD *pdwDataHigh);


void __RPC_STUB VSAnalyzerEvent_DynamicEventDataRaw_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __VSAnalyzerEvent_INTERFACE_DEFINED__ */


#ifndef __VSAnalyzerProjectItems_INTERFACE_DEFINED__
#define __VSAnalyzerProjectItems_INTERFACE_DEFINED__

/* interface VSAnalyzerProjectItems */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_VSAnalyzerProjectItems;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d51-1510-11d2-8F88-00A0C90A6B0B")
    VSAnalyzerProjectItems : public IDispatch
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct VSAnalyzerProjectItemsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            VSAnalyzerProjectItems * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            VSAnalyzerProjectItems * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            VSAnalyzerProjectItems * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            VSAnalyzerProjectItems * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            VSAnalyzerProjectItems * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            VSAnalyzerProjectItems * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            VSAnalyzerProjectItems * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        END_INTERFACE
    } VSAnalyzerProjectItemsVtbl;

    interface VSAnalyzerProjectItems
    {
        CONST_VTBL struct VSAnalyzerProjectItemsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define VSAnalyzerProjectItems_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define VSAnalyzerProjectItems_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define VSAnalyzerProjectItems_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define VSAnalyzerProjectItems_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define VSAnalyzerProjectItems_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define VSAnalyzerProjectItems_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define VSAnalyzerProjectItems_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __VSAnalyzerProjectItems_INTERFACE_DEFINED__ */


#ifndef __VSAnalyzerItemsList_INTERFACE_DEFINED__
#define __VSAnalyzerItemsList_INTERFACE_DEFINED__

/* interface VSAnalyzerItemsList */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_VSAnalyzerItemsList;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d51-1510-11d2-8F88-00A0C90A6B0D")
    VSAnalyzerItemsList : public IDispatch
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct VSAnalyzerItemsListVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            VSAnalyzerItemsList * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            VSAnalyzerItemsList * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            VSAnalyzerItemsList * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            VSAnalyzerItemsList * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            VSAnalyzerItemsList * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            VSAnalyzerItemsList * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            VSAnalyzerItemsList * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        END_INTERFACE
    } VSAnalyzerItemsListVtbl;

    interface VSAnalyzerItemsList
    {
        CONST_VTBL struct VSAnalyzerItemsListVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define VSAnalyzerItemsList_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define VSAnalyzerItemsList_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define VSAnalyzerItemsList_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define VSAnalyzerItemsList_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define VSAnalyzerItemsList_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define VSAnalyzerItemsList_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define VSAnalyzerItemsList_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __VSAnalyzerItemsList_INTERFACE_DEFINED__ */


#ifndef __VSAnalyzerProjects_INTERFACE_DEFINED__
#define __VSAnalyzerProjects_INTERFACE_DEFINED__

/* interface VSAnalyzerProjects */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_VSAnalyzerProjects;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d51-1510-11d2-8F88-00A0C90A6B0F")
    VSAnalyzerProjects : public IDispatch
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct VSAnalyzerProjectsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            VSAnalyzerProjects * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            VSAnalyzerProjects * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            VSAnalyzerProjects * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            VSAnalyzerProjects * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            VSAnalyzerProjects * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            VSAnalyzerProjects * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            VSAnalyzerProjects * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        END_INTERFACE
    } VSAnalyzerProjectsVtbl;

    interface VSAnalyzerProjects
    {
        CONST_VTBL struct VSAnalyzerProjectsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define VSAnalyzerProjects_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define VSAnalyzerProjects_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define VSAnalyzerProjects_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define VSAnalyzerProjects_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define VSAnalyzerProjects_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define VSAnalyzerProjects_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define VSAnalyzerProjects_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __VSAnalyzerProjects_INTERFACE_DEFINED__ */


#ifndef __VSAnalyzerEventLogsItem_INTERFACE_DEFINED__
#define __VSAnalyzerEventLogsItem_INTERFACE_DEFINED__

/* interface VSAnalyzerEventLogsItem */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_VSAnalyzerEventLogsItem;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d51-1510-11d2-8F88-00A0C90A6C00")
    VSAnalyzerEventLogsItem : public IDispatch
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct VSAnalyzerEventLogsItemVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            VSAnalyzerEventLogsItem * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            VSAnalyzerEventLogsItem * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            VSAnalyzerEventLogsItem * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            VSAnalyzerEventLogsItem * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            VSAnalyzerEventLogsItem * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            VSAnalyzerEventLogsItem * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            VSAnalyzerEventLogsItem * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        END_INTERFACE
    } VSAnalyzerEventLogsItemVtbl;

    interface VSAnalyzerEventLogsItem
    {
        CONST_VTBL struct VSAnalyzerEventLogsItemVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define VSAnalyzerEventLogsItem_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define VSAnalyzerEventLogsItem_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define VSAnalyzerEventLogsItem_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define VSAnalyzerEventLogsItem_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define VSAnalyzerEventLogsItem_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define VSAnalyzerEventLogsItem_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define VSAnalyzerEventLogsItem_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __VSAnalyzerEventLogsItem_INTERFACE_DEFINED__ */


#ifndef __VSAnalyzerFiltersItem_INTERFACE_DEFINED__
#define __VSAnalyzerFiltersItem_INTERFACE_DEFINED__

/* interface VSAnalyzerFiltersItem */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_VSAnalyzerFiltersItem;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d51-1510-11d2-8F88-00A0C90A6C01")
    VSAnalyzerFiltersItem : public IDispatch
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct VSAnalyzerFiltersItemVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            VSAnalyzerFiltersItem * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            VSAnalyzerFiltersItem * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            VSAnalyzerFiltersItem * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            VSAnalyzerFiltersItem * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            VSAnalyzerFiltersItem * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            VSAnalyzerFiltersItem * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            VSAnalyzerFiltersItem * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        END_INTERFACE
    } VSAnalyzerFiltersItemVtbl;

    interface VSAnalyzerFiltersItem
    {
        CONST_VTBL struct VSAnalyzerFiltersItemVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define VSAnalyzerFiltersItem_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define VSAnalyzerFiltersItem_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define VSAnalyzerFiltersItem_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define VSAnalyzerFiltersItem_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define VSAnalyzerFiltersItem_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define VSAnalyzerFiltersItem_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define VSAnalyzerFiltersItem_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __VSAnalyzerFiltersItem_INTERFACE_DEFINED__ */


#ifndef __VSAnalyzerMachinesItem_INTERFACE_DEFINED__
#define __VSAnalyzerMachinesItem_INTERFACE_DEFINED__

/* interface VSAnalyzerMachinesItem */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_VSAnalyzerMachinesItem;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d51-1510-11d2-8F88-00A0C90A6C02")
    VSAnalyzerMachinesItem : public IDispatch
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct VSAnalyzerMachinesItemVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            VSAnalyzerMachinesItem * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            VSAnalyzerMachinesItem * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            VSAnalyzerMachinesItem * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            VSAnalyzerMachinesItem * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            VSAnalyzerMachinesItem * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            VSAnalyzerMachinesItem * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            VSAnalyzerMachinesItem * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        END_INTERFACE
    } VSAnalyzerMachinesItemVtbl;

    interface VSAnalyzerMachinesItem
    {
        CONST_VTBL struct VSAnalyzerMachinesItemVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define VSAnalyzerMachinesItem_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define VSAnalyzerMachinesItem_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define VSAnalyzerMachinesItem_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define VSAnalyzerMachinesItem_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define VSAnalyzerMachinesItem_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define VSAnalyzerMachinesItem_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define VSAnalyzerMachinesItem_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __VSAnalyzerMachinesItem_INTERFACE_DEFINED__ */


#ifndef __VSAnalyzerUserSelectionCallback_INTERFACE_DEFINED__
#define __VSAnalyzerUserSelectionCallback_INTERFACE_DEFINED__

/* interface VSAnalyzerUserSelectionCallback */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_VSAnalyzerUserSelectionCallback;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d51-1510-11d2-8F88-00A0C90A6C03")
    VSAnalyzerUserSelectionCallback : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE UserSelectionChanged( 
            /* [in] */ BSTR bstrEventLogName) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct VSAnalyzerUserSelectionCallbackVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            VSAnalyzerUserSelectionCallback * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            VSAnalyzerUserSelectionCallback * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            VSAnalyzerUserSelectionCallback * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            VSAnalyzerUserSelectionCallback * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            VSAnalyzerUserSelectionCallback * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            VSAnalyzerUserSelectionCallback * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            VSAnalyzerUserSelectionCallback * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *UserSelectionChanged )( 
            VSAnalyzerUserSelectionCallback * This,
            /* [in] */ BSTR bstrEventLogName);
        
        END_INTERFACE
    } VSAnalyzerUserSelectionCallbackVtbl;

    interface VSAnalyzerUserSelectionCallback
    {
        CONST_VTBL struct VSAnalyzerUserSelectionCallbackVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define VSAnalyzerUserSelectionCallback_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define VSAnalyzerUserSelectionCallback_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define VSAnalyzerUserSelectionCallback_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define VSAnalyzerUserSelectionCallback_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define VSAnalyzerUserSelectionCallback_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define VSAnalyzerUserSelectionCallback_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define VSAnalyzerUserSelectionCallback_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define VSAnalyzerUserSelectionCallback_UserSelectionChanged(This,bstrEventLogName)	\
    (This)->lpVtbl -> UserSelectionChanged(This,bstrEventLogName)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE VSAnalyzerUserSelectionCallback_UserSelectionChanged_Proxy( 
    VSAnalyzerUserSelectionCallback * This,
    /* [in] */ BSTR bstrEventLogName);


void __RPC_STUB VSAnalyzerUserSelectionCallback_UserSelectionChanged_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __VSAnalyzerUserSelectionCallback_INTERFACE_DEFINED__ */

#endif /* __MSVSAnalyzerAutomationLibrary_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


