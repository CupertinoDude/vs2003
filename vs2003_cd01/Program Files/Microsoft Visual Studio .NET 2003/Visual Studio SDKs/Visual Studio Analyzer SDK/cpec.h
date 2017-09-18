

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 6.00.0361 */
/* at Tue Mar 18 18:03:50 2003
 */
/* Compiler settings for cpec.idl:
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

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif // __RPCNDR_H_VERSION__

#ifndef COM_NO_WINDOWS_H
#include "windows.h"
#include "ole2.h"
#endif /*COM_NO_WINDOWS_H*/

#ifndef __cpec_h__
#define __cpec_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __ISystemDebugEventCategory_FWD_DEFINED__
#define __ISystemDebugEventCategory_FWD_DEFINED__
typedef interface ISystemDebugEventCategory ISystemDebugEventCategory;
#endif 	/* __ISystemDebugEventCategory_FWD_DEFINED__ */


#ifndef __ISystemDebugComponent_FWD_DEFINED__
#define __ISystemDebugComponent_FWD_DEFINED__
typedef interface ISystemDebugComponent ISystemDebugComponent;
#endif 	/* __ISystemDebugComponent_FWD_DEFINED__ */


#ifndef __ISystemDebugProcess_FWD_DEFINED__
#define __ISystemDebugProcess_FWD_DEFINED__
typedef interface ISystemDebugProcess ISystemDebugProcess;
#endif 	/* __ISystemDebugProcess_FWD_DEFINED__ */


#ifndef __ISystemDebugMachine_FWD_DEFINED__
#define __ISystemDebugMachine_FWD_DEFINED__
typedef interface ISystemDebugMachine ISystemDebugMachine;
#endif 	/* __ISystemDebugMachine_FWD_DEFINED__ */


#ifndef __ISystemDebugEventsEnumComponents_FWD_DEFINED__
#define __ISystemDebugEventsEnumComponents_FWD_DEFINED__
typedef interface ISystemDebugEventsEnumComponents ISystemDebugEventsEnumComponents;
#endif 	/* __ISystemDebugEventsEnumComponents_FWD_DEFINED__ */


#ifndef __ISystemDebugEventsEnumEvents_FWD_DEFINED__
#define __ISystemDebugEventsEnumEvents_FWD_DEFINED__
typedef interface ISystemDebugEventsEnumEvents ISystemDebugEventsEnumEvents;
#endif 	/* __ISystemDebugEventsEnumEvents_FWD_DEFINED__ */


#ifndef __ISystemDebugEventsEnumConnectedMachines_FWD_DEFINED__
#define __ISystemDebugEventsEnumConnectedMachines_FWD_DEFINED__
typedef interface ISystemDebugEventsEnumConnectedMachines ISystemDebugEventsEnumConnectedMachines;
#endif 	/* __ISystemDebugEventsEnumConnectedMachines_FWD_DEFINED__ */


#ifndef __ISystemDebugEventsEnumProcesses_FWD_DEFINED__
#define __ISystemDebugEventsEnumProcesses_FWD_DEFINED__
typedef interface ISystemDebugEventsEnumProcesses ISystemDebugEventsEnumProcesses;
#endif 	/* __ISystemDebugEventsEnumProcesses_FWD_DEFINED__ */


#ifndef __ISystemDebugControlPEC_FWD_DEFINED__
#define __ISystemDebugControlPEC_FWD_DEFINED__
typedef interface ISystemDebugControlPEC ISystemDebugControlPEC;
#endif 	/* __ISystemDebugControlPEC_FWD_DEFINED__ */


#ifndef __ISystemDebugRuntimeVariablesSettings_FWD_DEFINED__
#define __ISystemDebugRuntimeVariablesSettings_FWD_DEFINED__
typedef interface ISystemDebugRuntimeVariablesSettings ISystemDebugRuntimeVariablesSettings;
#endif 	/* __ISystemDebugRuntimeVariablesSettings_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"
#include "clecinfo.h"
#include "RuntimeVariablesInfo.h"

#ifdef __cplusplus
extern "C"{
#endif 

void * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void * ); 

/* interface __MIDL_itf_cpec_0000 */
/* [local] */ 

typedef /* [helpstring][uuid][v1_enum] */  DECLSPEC_UUID("6c736dBA-75F5-43f9-9204-DE2F405B24FF") 
enum eVSAnalyzerComponentStatus
    {	eComponentStatusUnknown	= 0,
	eComponentInactive	= eComponentStatusUnknown + 1,
	eComponentActive	= eComponentInactive + 1
    } 	eVSAnalyzerComponentStatus;

typedef /* [helpstring][uuid][v1_enum] */  DECLSPEC_UUID("6c736dBD-75F5-43f9-9204-DE2F405B24FF") 
enum eVSAnalyzerOperatingSystemInfo
    {	eOperatingSystemUnknown	= 0,
	eWinNt	= eOperatingSystemUnknown + 1,
	eWin9x	= eWinNt + 1
    } 	eVSAnalyzerOperatingSystemInfo;

typedef /* [helpstring][uuid][v1_enum] */  DECLSPEC_UUID("6c736dBE-75F5-43f9-9204-DE2F405B24FF") 
enum eVSAnalyzerCapabilities
    {	eCapabilitiesUnknown	= 0,
	eAnalyzerComEnabled	= 1
    } 	eVSAnalyzerCapabilities;



extern RPC_IF_HANDLE __MIDL_itf_cpec_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_cpec_0000_v0_0_s_ifspec;

#ifndef __ISystemDebugEventCategory_INTERFACE_DEFINED__
#define __ISystemDebugEventCategory_INTERFACE_DEFINED__

/* interface ISystemDebugEventCategory */
/* [object][dual][helpstring][uuid] */ 


EXTERN_C const IID IID_ISystemDebugEventCategory;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dB8-75F5-43f9-9204-DE2F405B24FF")
    ISystemDebugEventCategory : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_EventCategoryId( 
            /* [retval][out] */ BSTR *pbstrEventCategoryId) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_EventSourceId( 
            /* [retval][out] */ BSTR *pbstrEventSourceId) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_EventParentId( 
            /* [retval][out] */ BSTR *pbstrParentId) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_VisibleName( 
            /* [retval][out] */ BSTR *pbstrVisibleName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_DisplayName( 
            /* [retval][out] */ BSTR *pbstrDisplayName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Description( 
            /* [retval][out] */ BSTR *pbstrDescription) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_IsDynamic( 
            /* [retval][out] */ VARIANT_BOOL *pfDynamic) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_IsEvent( 
            /* [retval][out] */ VARIANT_BOOL *pfEvent) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_EventType( 
            /* [retval][out] */ LONG *plEventType) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugEventCategoryVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugEventCategory * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugEventCategory * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugEventCategory * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            ISystemDebugEventCategory * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            ISystemDebugEventCategory * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            ISystemDebugEventCategory * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ISystemDebugEventCategory * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_EventCategoryId )( 
            ISystemDebugEventCategory * This,
            /* [retval][out] */ BSTR *pbstrEventCategoryId);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_EventSourceId )( 
            ISystemDebugEventCategory * This,
            /* [retval][out] */ BSTR *pbstrEventSourceId);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_EventParentId )( 
            ISystemDebugEventCategory * This,
            /* [retval][out] */ BSTR *pbstrParentId);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_VisibleName )( 
            ISystemDebugEventCategory * This,
            /* [retval][out] */ BSTR *pbstrVisibleName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DisplayName )( 
            ISystemDebugEventCategory * This,
            /* [retval][out] */ BSTR *pbstrDisplayName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Description )( 
            ISystemDebugEventCategory * This,
            /* [retval][out] */ BSTR *pbstrDescription);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsDynamic )( 
            ISystemDebugEventCategory * This,
            /* [retval][out] */ VARIANT_BOOL *pfDynamic);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsEvent )( 
            ISystemDebugEventCategory * This,
            /* [retval][out] */ VARIANT_BOOL *pfEvent);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_EventType )( 
            ISystemDebugEventCategory * This,
            /* [retval][out] */ LONG *plEventType);
        
        END_INTERFACE
    } ISystemDebugEventCategoryVtbl;

    interface ISystemDebugEventCategory
    {
        CONST_VTBL struct ISystemDebugEventCategoryVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugEventCategory_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugEventCategory_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugEventCategory_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugEventCategory_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define ISystemDebugEventCategory_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define ISystemDebugEventCategory_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define ISystemDebugEventCategory_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define ISystemDebugEventCategory_get_EventCategoryId(This,pbstrEventCategoryId)	\
    (This)->lpVtbl -> get_EventCategoryId(This,pbstrEventCategoryId)

#define ISystemDebugEventCategory_get_EventSourceId(This,pbstrEventSourceId)	\
    (This)->lpVtbl -> get_EventSourceId(This,pbstrEventSourceId)

#define ISystemDebugEventCategory_get_EventParentId(This,pbstrParentId)	\
    (This)->lpVtbl -> get_EventParentId(This,pbstrParentId)

#define ISystemDebugEventCategory_get_VisibleName(This,pbstrVisibleName)	\
    (This)->lpVtbl -> get_VisibleName(This,pbstrVisibleName)

#define ISystemDebugEventCategory_get_DisplayName(This,pbstrDisplayName)	\
    (This)->lpVtbl -> get_DisplayName(This,pbstrDisplayName)

#define ISystemDebugEventCategory_get_Description(This,pbstrDescription)	\
    (This)->lpVtbl -> get_Description(This,pbstrDescription)

#define ISystemDebugEventCategory_get_IsDynamic(This,pfDynamic)	\
    (This)->lpVtbl -> get_IsDynamic(This,pfDynamic)

#define ISystemDebugEventCategory_get_IsEvent(This,pfEvent)	\
    (This)->lpVtbl -> get_IsEvent(This,pfEvent)

#define ISystemDebugEventCategory_get_EventType(This,plEventType)	\
    (This)->lpVtbl -> get_EventType(This,plEventType)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventCategory_get_EventCategoryId_Proxy( 
    ISystemDebugEventCategory * This,
    /* [retval][out] */ BSTR *pbstrEventCategoryId);


void __RPC_STUB ISystemDebugEventCategory_get_EventCategoryId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventCategory_get_EventSourceId_Proxy( 
    ISystemDebugEventCategory * This,
    /* [retval][out] */ BSTR *pbstrEventSourceId);


void __RPC_STUB ISystemDebugEventCategory_get_EventSourceId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventCategory_get_EventParentId_Proxy( 
    ISystemDebugEventCategory * This,
    /* [retval][out] */ BSTR *pbstrParentId);


void __RPC_STUB ISystemDebugEventCategory_get_EventParentId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventCategory_get_VisibleName_Proxy( 
    ISystemDebugEventCategory * This,
    /* [retval][out] */ BSTR *pbstrVisibleName);


void __RPC_STUB ISystemDebugEventCategory_get_VisibleName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventCategory_get_DisplayName_Proxy( 
    ISystemDebugEventCategory * This,
    /* [retval][out] */ BSTR *pbstrDisplayName);


void __RPC_STUB ISystemDebugEventCategory_get_DisplayName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventCategory_get_Description_Proxy( 
    ISystemDebugEventCategory * This,
    /* [retval][out] */ BSTR *pbstrDescription);


void __RPC_STUB ISystemDebugEventCategory_get_Description_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventCategory_get_IsDynamic_Proxy( 
    ISystemDebugEventCategory * This,
    /* [retval][out] */ VARIANT_BOOL *pfDynamic);


void __RPC_STUB ISystemDebugEventCategory_get_IsDynamic_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventCategory_get_IsEvent_Proxy( 
    ISystemDebugEventCategory * This,
    /* [retval][out] */ VARIANT_BOOL *pfEvent);


void __RPC_STUB ISystemDebugEventCategory_get_IsEvent_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventCategory_get_EventType_Proxy( 
    ISystemDebugEventCategory * This,
    /* [retval][out] */ LONG *plEventType);


void __RPC_STUB ISystemDebugEventCategory_get_EventType_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugEventCategory_INTERFACE_DEFINED__ */


#ifndef __ISystemDebugComponent_INTERFACE_DEFINED__
#define __ISystemDebugComponent_INTERFACE_DEFINED__

/* interface ISystemDebugComponent */
/* [object][dual][helpstring][uuid] */ 


EXTERN_C const IID IID_ISystemDebugComponent;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dB9-75F5-43f9-9204-DE2F405B24FF")
    ISystemDebugComponent : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ComponentId( 
            /* [retval][out] */ BSTR *pbstrComponentId) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_VisibleName( 
            /* [retval][out] */ BSTR *pbstrVisibleName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_IsDynamic( 
            /* [retval][out] */ VARIANT_BOOL *pfDynamic) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ComponentStatus( 
            /* [retval][out] */ eVSAnalyzerComponentStatus *peComponentStatus) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugComponentVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugComponent * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugComponent * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugComponent * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            ISystemDebugComponent * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            ISystemDebugComponent * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            ISystemDebugComponent * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ISystemDebugComponent * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ComponentId )( 
            ISystemDebugComponent * This,
            /* [retval][out] */ BSTR *pbstrComponentId);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_VisibleName )( 
            ISystemDebugComponent * This,
            /* [retval][out] */ BSTR *pbstrVisibleName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsDynamic )( 
            ISystemDebugComponent * This,
            /* [retval][out] */ VARIANT_BOOL *pfDynamic);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ComponentStatus )( 
            ISystemDebugComponent * This,
            /* [retval][out] */ eVSAnalyzerComponentStatus *peComponentStatus);
        
        END_INTERFACE
    } ISystemDebugComponentVtbl;

    interface ISystemDebugComponent
    {
        CONST_VTBL struct ISystemDebugComponentVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugComponent_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugComponent_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugComponent_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugComponent_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define ISystemDebugComponent_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define ISystemDebugComponent_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define ISystemDebugComponent_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define ISystemDebugComponent_get_ComponentId(This,pbstrComponentId)	\
    (This)->lpVtbl -> get_ComponentId(This,pbstrComponentId)

#define ISystemDebugComponent_get_VisibleName(This,pbstrVisibleName)	\
    (This)->lpVtbl -> get_VisibleName(This,pbstrVisibleName)

#define ISystemDebugComponent_get_IsDynamic(This,pfDynamic)	\
    (This)->lpVtbl -> get_IsDynamic(This,pfDynamic)

#define ISystemDebugComponent_get_ComponentStatus(This,peComponentStatus)	\
    (This)->lpVtbl -> get_ComponentStatus(This,peComponentStatus)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugComponent_get_ComponentId_Proxy( 
    ISystemDebugComponent * This,
    /* [retval][out] */ BSTR *pbstrComponentId);


void __RPC_STUB ISystemDebugComponent_get_ComponentId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugComponent_get_VisibleName_Proxy( 
    ISystemDebugComponent * This,
    /* [retval][out] */ BSTR *pbstrVisibleName);


void __RPC_STUB ISystemDebugComponent_get_VisibleName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugComponent_get_IsDynamic_Proxy( 
    ISystemDebugComponent * This,
    /* [retval][out] */ VARIANT_BOOL *pfDynamic);


void __RPC_STUB ISystemDebugComponent_get_IsDynamic_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugComponent_get_ComponentStatus_Proxy( 
    ISystemDebugComponent * This,
    /* [retval][out] */ eVSAnalyzerComponentStatus *peComponentStatus);


void __RPC_STUB ISystemDebugComponent_get_ComponentStatus_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugComponent_INTERFACE_DEFINED__ */


#ifndef __ISystemDebugProcess_INTERFACE_DEFINED__
#define __ISystemDebugProcess_INTERFACE_DEFINED__

/* interface ISystemDebugProcess */
/* [object][dual][helpstring][uuid] */ 


EXTERN_C const IID IID_ISystemDebugProcess;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dBB-75F5-43f9-9204-DE2F405B24FF")
    ISystemDebugProcess : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_VisibleName( 
            /* [retval][out] */ BSTR *pbstrVisibleName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ProcessId( 
            /* [retval][out] */ int *piProcessId) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugProcessVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugProcess * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugProcess * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugProcess * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            ISystemDebugProcess * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            ISystemDebugProcess * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            ISystemDebugProcess * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ISystemDebugProcess * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_VisibleName )( 
            ISystemDebugProcess * This,
            /* [retval][out] */ BSTR *pbstrVisibleName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProcessId )( 
            ISystemDebugProcess * This,
            /* [retval][out] */ int *piProcessId);
        
        END_INTERFACE
    } ISystemDebugProcessVtbl;

    interface ISystemDebugProcess
    {
        CONST_VTBL struct ISystemDebugProcessVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugProcess_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugProcess_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugProcess_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugProcess_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define ISystemDebugProcess_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define ISystemDebugProcess_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define ISystemDebugProcess_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define ISystemDebugProcess_get_VisibleName(This,pbstrVisibleName)	\
    (This)->lpVtbl -> get_VisibleName(This,pbstrVisibleName)

#define ISystemDebugProcess_get_ProcessId(This,piProcessId)	\
    (This)->lpVtbl -> get_ProcessId(This,piProcessId)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugProcess_get_VisibleName_Proxy( 
    ISystemDebugProcess * This,
    /* [retval][out] */ BSTR *pbstrVisibleName);


void __RPC_STUB ISystemDebugProcess_get_VisibleName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugProcess_get_ProcessId_Proxy( 
    ISystemDebugProcess * This,
    /* [retval][out] */ int *piProcessId);


void __RPC_STUB ISystemDebugProcess_get_ProcessId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugProcess_INTERFACE_DEFINED__ */


#ifndef __ISystemDebugMachine_INTERFACE_DEFINED__
#define __ISystemDebugMachine_INTERFACE_DEFINED__

/* interface ISystemDebugMachine */
/* [object][dual][helpstring][uuid] */ 


EXTERN_C const IID IID_ISystemDebugMachine;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dBC-75F5-43f9-9204-DE2F405B24FF")
    ISystemDebugMachine : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_VisibleName( 
            /* [retval][out] */ BSTR *pbstrVisibleName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_MachineId( 
            /* [retval][out] */ int *piMachineId) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_OperatingSystemInfo( 
            /* [retval][out] */ eVSAnalyzerOperatingSystemInfo *pVSAnalyzerOsInfo) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Capabilities( 
            /* [retval][out] */ eVSAnalyzerCapabilities *pCapabilities) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugMachineVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugMachine * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugMachine * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugMachine * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            ISystemDebugMachine * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            ISystemDebugMachine * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            ISystemDebugMachine * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ISystemDebugMachine * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_VisibleName )( 
            ISystemDebugMachine * This,
            /* [retval][out] */ BSTR *pbstrVisibleName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MachineId )( 
            ISystemDebugMachine * This,
            /* [retval][out] */ int *piMachineId);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_OperatingSystemInfo )( 
            ISystemDebugMachine * This,
            /* [retval][out] */ eVSAnalyzerOperatingSystemInfo *pVSAnalyzerOsInfo);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Capabilities )( 
            ISystemDebugMachine * This,
            /* [retval][out] */ eVSAnalyzerCapabilities *pCapabilities);
        
        END_INTERFACE
    } ISystemDebugMachineVtbl;

    interface ISystemDebugMachine
    {
        CONST_VTBL struct ISystemDebugMachineVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugMachine_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugMachine_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugMachine_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugMachine_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define ISystemDebugMachine_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define ISystemDebugMachine_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define ISystemDebugMachine_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define ISystemDebugMachine_get_VisibleName(This,pbstrVisibleName)	\
    (This)->lpVtbl -> get_VisibleName(This,pbstrVisibleName)

#define ISystemDebugMachine_get_MachineId(This,piMachineId)	\
    (This)->lpVtbl -> get_MachineId(This,piMachineId)

#define ISystemDebugMachine_get_OperatingSystemInfo(This,pVSAnalyzerOsInfo)	\
    (This)->lpVtbl -> get_OperatingSystemInfo(This,pVSAnalyzerOsInfo)

#define ISystemDebugMachine_get_Capabilities(This,pCapabilities)	\
    (This)->lpVtbl -> get_Capabilities(This,pCapabilities)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugMachine_get_VisibleName_Proxy( 
    ISystemDebugMachine * This,
    /* [retval][out] */ BSTR *pbstrVisibleName);


void __RPC_STUB ISystemDebugMachine_get_VisibleName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugMachine_get_MachineId_Proxy( 
    ISystemDebugMachine * This,
    /* [retval][out] */ int *piMachineId);


void __RPC_STUB ISystemDebugMachine_get_MachineId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugMachine_get_OperatingSystemInfo_Proxy( 
    ISystemDebugMachine * This,
    /* [retval][out] */ eVSAnalyzerOperatingSystemInfo *pVSAnalyzerOsInfo);


void __RPC_STUB ISystemDebugMachine_get_OperatingSystemInfo_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ISystemDebugMachine_get_Capabilities_Proxy( 
    ISystemDebugMachine * This,
    /* [retval][out] */ eVSAnalyzerCapabilities *pCapabilities);


void __RPC_STUB ISystemDebugMachine_get_Capabilities_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugMachine_INTERFACE_DEFINED__ */


#ifndef __ISystemDebugEventsEnumComponents_INTERFACE_DEFINED__
#define __ISystemDebugEventsEnumComponents_INTERFACE_DEFINED__

/* interface ISystemDebugEventsEnumComponents */
/* [object][helpstring][uuid] */ 


EXTERN_C const IID IID_ISystemDebugEventsEnumComponents;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dFA-C552-11d2-9648-00105AA316F7")
    ISystemDebugEventsEnumComponents : public IUnknown
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Next( 
            /* [in] */ ULONG cElements,
            /* [length_is][size_is][out] */ ISystemDebugComponent **ppIComponent,
            /* [optional][out] */ ULONG *pcElementsFetched) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Skip( 
            /* [in] */ ULONG cElements) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Clone( 
            /* [retval][out] */ ISystemDebugEventsEnumComponents **ppIDebugEventsEnumComponents) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Reset( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugEventsEnumComponentsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugEventsEnumComponents * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugEventsEnumComponents * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugEventsEnumComponents * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Next )( 
            ISystemDebugEventsEnumComponents * This,
            /* [in] */ ULONG cElements,
            /* [length_is][size_is][out] */ ISystemDebugComponent **ppIComponent,
            /* [optional][out] */ ULONG *pcElementsFetched);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Skip )( 
            ISystemDebugEventsEnumComponents * This,
            /* [in] */ ULONG cElements);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Clone )( 
            ISystemDebugEventsEnumComponents * This,
            /* [retval][out] */ ISystemDebugEventsEnumComponents **ppIDebugEventsEnumComponents);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Reset )( 
            ISystemDebugEventsEnumComponents * This);
        
        END_INTERFACE
    } ISystemDebugEventsEnumComponentsVtbl;

    interface ISystemDebugEventsEnumComponents
    {
        CONST_VTBL struct ISystemDebugEventsEnumComponentsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugEventsEnumComponents_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugEventsEnumComponents_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugEventsEnumComponents_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugEventsEnumComponents_Next(This,cElements,ppIComponent,pcElementsFetched)	\
    (This)->lpVtbl -> Next(This,cElements,ppIComponent,pcElementsFetched)

#define ISystemDebugEventsEnumComponents_Skip(This,cElements)	\
    (This)->lpVtbl -> Skip(This,cElements)

#define ISystemDebugEventsEnumComponents_Clone(This,ppIDebugEventsEnumComponents)	\
    (This)->lpVtbl -> Clone(This,ppIDebugEventsEnumComponents)

#define ISystemDebugEventsEnumComponents_Reset(This)	\
    (This)->lpVtbl -> Reset(This)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventsEnumComponents_Next_Proxy( 
    ISystemDebugEventsEnumComponents * This,
    /* [in] */ ULONG cElements,
    /* [length_is][size_is][out] */ ISystemDebugComponent **ppIComponent,
    /* [optional][out] */ ULONG *pcElementsFetched);


void __RPC_STUB ISystemDebugEventsEnumComponents_Next_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventsEnumComponents_Skip_Proxy( 
    ISystemDebugEventsEnumComponents * This,
    /* [in] */ ULONG cElements);


void __RPC_STUB ISystemDebugEventsEnumComponents_Skip_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventsEnumComponents_Clone_Proxy( 
    ISystemDebugEventsEnumComponents * This,
    /* [retval][out] */ ISystemDebugEventsEnumComponents **ppIDebugEventsEnumComponents);


void __RPC_STUB ISystemDebugEventsEnumComponents_Clone_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventsEnumComponents_Reset_Proxy( 
    ISystemDebugEventsEnumComponents * This);


void __RPC_STUB ISystemDebugEventsEnumComponents_Reset_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugEventsEnumComponents_INTERFACE_DEFINED__ */


#ifndef __ISystemDebugEventsEnumEvents_INTERFACE_DEFINED__
#define __ISystemDebugEventsEnumEvents_INTERFACE_DEFINED__

/* interface ISystemDebugEventsEnumEvents */
/* [object][helpstring][uuid] */ 


EXTERN_C const IID IID_ISystemDebugEventsEnumEvents;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dFB-C552-11d2-9648-00105AA316F7")
    ISystemDebugEventsEnumEvents : public IUnknown
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Next( 
            /* [in] */ ULONG cElements,
            /* [length_is][size_is][out] */ ISystemDebugEventCategory **ppIEventCategoryInfo,
            /* [optional][out] */ ULONG *pcElementsFetched) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Skip( 
            /* [in] */ ULONG cElements) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Clone( 
            /* [retval][out] */ ISystemDebugEventsEnumEvents **ppIDebugEventsEnumEvents) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Reset( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugEventsEnumEventsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugEventsEnumEvents * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugEventsEnumEvents * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugEventsEnumEvents * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Next )( 
            ISystemDebugEventsEnumEvents * This,
            /* [in] */ ULONG cElements,
            /* [length_is][size_is][out] */ ISystemDebugEventCategory **ppIEventCategoryInfo,
            /* [optional][out] */ ULONG *pcElementsFetched);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Skip )( 
            ISystemDebugEventsEnumEvents * This,
            /* [in] */ ULONG cElements);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Clone )( 
            ISystemDebugEventsEnumEvents * This,
            /* [retval][out] */ ISystemDebugEventsEnumEvents **ppIDebugEventsEnumEvents);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Reset )( 
            ISystemDebugEventsEnumEvents * This);
        
        END_INTERFACE
    } ISystemDebugEventsEnumEventsVtbl;

    interface ISystemDebugEventsEnumEvents
    {
        CONST_VTBL struct ISystemDebugEventsEnumEventsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugEventsEnumEvents_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugEventsEnumEvents_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugEventsEnumEvents_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugEventsEnumEvents_Next(This,cElements,ppIEventCategoryInfo,pcElementsFetched)	\
    (This)->lpVtbl -> Next(This,cElements,ppIEventCategoryInfo,pcElementsFetched)

#define ISystemDebugEventsEnumEvents_Skip(This,cElements)	\
    (This)->lpVtbl -> Skip(This,cElements)

#define ISystemDebugEventsEnumEvents_Clone(This,ppIDebugEventsEnumEvents)	\
    (This)->lpVtbl -> Clone(This,ppIDebugEventsEnumEvents)

#define ISystemDebugEventsEnumEvents_Reset(This)	\
    (This)->lpVtbl -> Reset(This)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventsEnumEvents_Next_Proxy( 
    ISystemDebugEventsEnumEvents * This,
    /* [in] */ ULONG cElements,
    /* [length_is][size_is][out] */ ISystemDebugEventCategory **ppIEventCategoryInfo,
    /* [optional][out] */ ULONG *pcElementsFetched);


void __RPC_STUB ISystemDebugEventsEnumEvents_Next_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventsEnumEvents_Skip_Proxy( 
    ISystemDebugEventsEnumEvents * This,
    /* [in] */ ULONG cElements);


void __RPC_STUB ISystemDebugEventsEnumEvents_Skip_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventsEnumEvents_Clone_Proxy( 
    ISystemDebugEventsEnumEvents * This,
    /* [retval][out] */ ISystemDebugEventsEnumEvents **ppIDebugEventsEnumEvents);


void __RPC_STUB ISystemDebugEventsEnumEvents_Clone_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventsEnumEvents_Reset_Proxy( 
    ISystemDebugEventsEnumEvents * This);


void __RPC_STUB ISystemDebugEventsEnumEvents_Reset_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugEventsEnumEvents_INTERFACE_DEFINED__ */


#ifndef __ISystemDebugEventsEnumConnectedMachines_INTERFACE_DEFINED__
#define __ISystemDebugEventsEnumConnectedMachines_INTERFACE_DEFINED__

/* interface ISystemDebugEventsEnumConnectedMachines */
/* [object][helpstring][uuid] */ 


EXTERN_C const IID IID_ISystemDebugEventsEnumConnectedMachines;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dFC-C552-11d2-9648-00105AA316F7")
    ISystemDebugEventsEnumConnectedMachines : public IUnknown
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Next( 
            /* [in] */ ULONG cElements,
            /* [length_is][size_is][out] */ ISystemDebugMachine **ppIMachine,
            /* [optional][out] */ ULONG *pcElementsFetched) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Skip( 
            /* [in] */ ULONG cElements) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Clone( 
            /* [retval][out] */ ISystemDebugEventsEnumConnectedMachines **ppIDebugEventsEnumConnnectedMachines) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Reset( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugEventsEnumConnectedMachinesVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugEventsEnumConnectedMachines * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugEventsEnumConnectedMachines * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugEventsEnumConnectedMachines * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Next )( 
            ISystemDebugEventsEnumConnectedMachines * This,
            /* [in] */ ULONG cElements,
            /* [length_is][size_is][out] */ ISystemDebugMachine **ppIMachine,
            /* [optional][out] */ ULONG *pcElementsFetched);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Skip )( 
            ISystemDebugEventsEnumConnectedMachines * This,
            /* [in] */ ULONG cElements);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Clone )( 
            ISystemDebugEventsEnumConnectedMachines * This,
            /* [retval][out] */ ISystemDebugEventsEnumConnectedMachines **ppIDebugEventsEnumConnnectedMachines);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Reset )( 
            ISystemDebugEventsEnumConnectedMachines * This);
        
        END_INTERFACE
    } ISystemDebugEventsEnumConnectedMachinesVtbl;

    interface ISystemDebugEventsEnumConnectedMachines
    {
        CONST_VTBL struct ISystemDebugEventsEnumConnectedMachinesVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugEventsEnumConnectedMachines_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugEventsEnumConnectedMachines_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugEventsEnumConnectedMachines_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugEventsEnumConnectedMachines_Next(This,cElements,ppIMachine,pcElementsFetched)	\
    (This)->lpVtbl -> Next(This,cElements,ppIMachine,pcElementsFetched)

#define ISystemDebugEventsEnumConnectedMachines_Skip(This,cElements)	\
    (This)->lpVtbl -> Skip(This,cElements)

#define ISystemDebugEventsEnumConnectedMachines_Clone(This,ppIDebugEventsEnumConnnectedMachines)	\
    (This)->lpVtbl -> Clone(This,ppIDebugEventsEnumConnnectedMachines)

#define ISystemDebugEventsEnumConnectedMachines_Reset(This)	\
    (This)->lpVtbl -> Reset(This)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventsEnumConnectedMachines_Next_Proxy( 
    ISystemDebugEventsEnumConnectedMachines * This,
    /* [in] */ ULONG cElements,
    /* [length_is][size_is][out] */ ISystemDebugMachine **ppIMachine,
    /* [optional][out] */ ULONG *pcElementsFetched);


void __RPC_STUB ISystemDebugEventsEnumConnectedMachines_Next_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventsEnumConnectedMachines_Skip_Proxy( 
    ISystemDebugEventsEnumConnectedMachines * This,
    /* [in] */ ULONG cElements);


void __RPC_STUB ISystemDebugEventsEnumConnectedMachines_Skip_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventsEnumConnectedMachines_Clone_Proxy( 
    ISystemDebugEventsEnumConnectedMachines * This,
    /* [retval][out] */ ISystemDebugEventsEnumConnectedMachines **ppIDebugEventsEnumConnnectedMachines);


void __RPC_STUB ISystemDebugEventsEnumConnectedMachines_Clone_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventsEnumConnectedMachines_Reset_Proxy( 
    ISystemDebugEventsEnumConnectedMachines * This);


void __RPC_STUB ISystemDebugEventsEnumConnectedMachines_Reset_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugEventsEnumConnectedMachines_INTERFACE_DEFINED__ */


#ifndef __ISystemDebugEventsEnumProcesses_INTERFACE_DEFINED__
#define __ISystemDebugEventsEnumProcesses_INTERFACE_DEFINED__

/* interface ISystemDebugEventsEnumProcesses */
/* [object][helpstring][uuid] */ 


EXTERN_C const IID IID_ISystemDebugEventsEnumProcesses;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d26-C5CE-11d2-9648-00105AA316F7")
    ISystemDebugEventsEnumProcesses : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Next( 
            /* [in] */ ULONG cElements,
            /* [length_is][size_is][out] */ ISystemDebugProcess **ppIProcess,
            /* [optional][out] */ ULONG *pcElementsFetched) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Skip( 
            /* [in] */ ULONG cElements) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Clone( 
            /* [retval][out] */ ISystemDebugEventsEnumProcesses **ppIDebugEventsEnumProcesses) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Reset( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugEventsEnumProcessesVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugEventsEnumProcesses * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugEventsEnumProcesses * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugEventsEnumProcesses * This);
        
        HRESULT ( STDMETHODCALLTYPE *Next )( 
            ISystemDebugEventsEnumProcesses * This,
            /* [in] */ ULONG cElements,
            /* [length_is][size_is][out] */ ISystemDebugProcess **ppIProcess,
            /* [optional][out] */ ULONG *pcElementsFetched);
        
        HRESULT ( STDMETHODCALLTYPE *Skip )( 
            ISystemDebugEventsEnumProcesses * This,
            /* [in] */ ULONG cElements);
        
        HRESULT ( STDMETHODCALLTYPE *Clone )( 
            ISystemDebugEventsEnumProcesses * This,
            /* [retval][out] */ ISystemDebugEventsEnumProcesses **ppIDebugEventsEnumProcesses);
        
        HRESULT ( STDMETHODCALLTYPE *Reset )( 
            ISystemDebugEventsEnumProcesses * This);
        
        END_INTERFACE
    } ISystemDebugEventsEnumProcessesVtbl;

    interface ISystemDebugEventsEnumProcesses
    {
        CONST_VTBL struct ISystemDebugEventsEnumProcessesVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugEventsEnumProcesses_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugEventsEnumProcesses_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugEventsEnumProcesses_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugEventsEnumProcesses_Next(This,cElements,ppIProcess,pcElementsFetched)	\
    (This)->lpVtbl -> Next(This,cElements,ppIProcess,pcElementsFetched)

#define ISystemDebugEventsEnumProcesses_Skip(This,cElements)	\
    (This)->lpVtbl -> Skip(This,cElements)

#define ISystemDebugEventsEnumProcesses_Clone(This,ppIDebugEventsEnumProcesses)	\
    (This)->lpVtbl -> Clone(This,ppIDebugEventsEnumProcesses)

#define ISystemDebugEventsEnumProcesses_Reset(This)	\
    (This)->lpVtbl -> Reset(This)

#endif /* COBJMACROS */


#endif 	/* C style interface */



HRESULT STDMETHODCALLTYPE ISystemDebugEventsEnumProcesses_Next_Proxy( 
    ISystemDebugEventsEnumProcesses * This,
    /* [in] */ ULONG cElements,
    /* [length_is][size_is][out] */ ISystemDebugProcess **ppIProcess,
    /* [optional][out] */ ULONG *pcElementsFetched);


void __RPC_STUB ISystemDebugEventsEnumProcesses_Next_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugEventsEnumProcesses_Skip_Proxy( 
    ISystemDebugEventsEnumProcesses * This,
    /* [in] */ ULONG cElements);


void __RPC_STUB ISystemDebugEventsEnumProcesses_Skip_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugEventsEnumProcesses_Clone_Proxy( 
    ISystemDebugEventsEnumProcesses * This,
    /* [retval][out] */ ISystemDebugEventsEnumProcesses **ppIDebugEventsEnumProcesses);


void __RPC_STUB ISystemDebugEventsEnumProcesses_Clone_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugEventsEnumProcesses_Reset_Proxy( 
    ISystemDebugEventsEnumProcesses * This);


void __RPC_STUB ISystemDebugEventsEnumProcesses_Reset_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugEventsEnumProcesses_INTERFACE_DEFINED__ */


#ifndef __ISystemDebugControlPEC_INTERFACE_DEFINED__
#define __ISystemDebugControlPEC_INTERFACE_DEFINED__

/* interface ISystemDebugControlPEC */
/* [object][dual][helpstring][uuid] */ 


EXTERN_C const IID IID_ISystemDebugControlPEC;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d9A-C533-11d2-9648-00105AA316F7")
    ISystemDebugControlPEC : public IDispatch
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE OpenSession( 
            /* [retval][out] */ int *pnSessionId) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE CloseSession( 
            /* [in] */ int nSessionId) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE EnumerateAllComponents( 
            /* [in] */ int nSessionId,
            /* [retval][out] */ ISystemDebugEventsEnumComponents **pEnum) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE EnumerateMachineComponents( 
            /* [in] */ int nSessionId,
            /* [in] */ int nMachineId,
            /* [retval][out] */ ISystemDebugEventsEnumComponents **pEnum) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE EnumerateAllEvents( 
            /* [in] */ int nSessionId,
            /* [retval][out] */ ISystemDebugEventsEnumEvents **pEnum) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE EnumerateComponentEvents( 
            /* [in] */ int nSessionId,
            /* [in] */ GUID guidComponentId,
            /* [retval][out] */ ISystemDebugEventsEnumEvents **pEnum) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE EnumerateConnectedMachines( 
            /* [in] */ int nSessionId,
            /* [retval][out] */ ISystemDebugEventsEnumConnectedMachines **pEnum) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE EnumerateMachineProcesses( 
            /* [in] */ int nSessionId,
            /* [in] */ int nMachineId,
            /* [retval][out] */ ISystemDebugEventsEnumProcesses **pEnum) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE ConnectToMachine( 
            /* [in] */ int nSessionId,
            /* [in] */ BSTR strMachineName,
            /* [retval][out] */ int *pnMachineId) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetMachineInfo( 
            /* [in] */ int nMachineId,
            /* [retval][out] */ ISystemDebugMachine **ppIMachine) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetMachineConnectionInfo( 
            /* [in] */ BSTR strMachineName,
            /* [retval][out] */ struct SystemDebugEventConnectionInfo **ppConnectionInfo) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE InitiateEventFlow( 
            /* [in] */ int nSessionId,
            /* [in] */ int nMachineId) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetMachineBlockOnOverflow( 
            /* [in] */ int nSessionId,
            /* [in] */ VARIANT_BOOL fBlock) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetMachineDynamicFrequency( 
            /* [in] */ int nSessionId,
            /* [in] */ int nFrequency) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE DisconnectFromMachine( 
            /* [in] */ int nSessionId,
            /* [in] */ int nMachineId) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Subscribe( 
            /* [in] */ int nSessionId,
            /* [in] */ IUnknown *punkReceiver) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Unsubscribe( 
            /* [in] */ int nSessionId) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetFilter( 
            /* [in] */ int nSessionId,
            /* [in] */ BSTR bstrFilterText) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE ClearFilter( 
            /* [in] */ int nSessionId) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugControlPECVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugControlPEC * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugControlPEC * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugControlPEC * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            ISystemDebugControlPEC * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            ISystemDebugControlPEC * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            ISystemDebugControlPEC * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ISystemDebugControlPEC * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *OpenSession )( 
            ISystemDebugControlPEC * This,
            /* [retval][out] */ int *pnSessionId);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *CloseSession )( 
            ISystemDebugControlPEC * This,
            /* [in] */ int nSessionId);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EnumerateAllComponents )( 
            ISystemDebugControlPEC * This,
            /* [in] */ int nSessionId,
            /* [retval][out] */ ISystemDebugEventsEnumComponents **pEnum);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EnumerateMachineComponents )( 
            ISystemDebugControlPEC * This,
            /* [in] */ int nSessionId,
            /* [in] */ int nMachineId,
            /* [retval][out] */ ISystemDebugEventsEnumComponents **pEnum);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EnumerateAllEvents )( 
            ISystemDebugControlPEC * This,
            /* [in] */ int nSessionId,
            /* [retval][out] */ ISystemDebugEventsEnumEvents **pEnum);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EnumerateComponentEvents )( 
            ISystemDebugControlPEC * This,
            /* [in] */ int nSessionId,
            /* [in] */ GUID guidComponentId,
            /* [retval][out] */ ISystemDebugEventsEnumEvents **pEnum);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EnumerateConnectedMachines )( 
            ISystemDebugControlPEC * This,
            /* [in] */ int nSessionId,
            /* [retval][out] */ ISystemDebugEventsEnumConnectedMachines **pEnum);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EnumerateMachineProcesses )( 
            ISystemDebugControlPEC * This,
            /* [in] */ int nSessionId,
            /* [in] */ int nMachineId,
            /* [retval][out] */ ISystemDebugEventsEnumProcesses **pEnum);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *ConnectToMachine )( 
            ISystemDebugControlPEC * This,
            /* [in] */ int nSessionId,
            /* [in] */ BSTR strMachineName,
            /* [retval][out] */ int *pnMachineId);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetMachineInfo )( 
            ISystemDebugControlPEC * This,
            /* [in] */ int nMachineId,
            /* [retval][out] */ ISystemDebugMachine **ppIMachine);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetMachineConnectionInfo )( 
            ISystemDebugControlPEC * This,
            /* [in] */ BSTR strMachineName,
            /* [retval][out] */ struct SystemDebugEventConnectionInfo **ppConnectionInfo);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *InitiateEventFlow )( 
            ISystemDebugControlPEC * This,
            /* [in] */ int nSessionId,
            /* [in] */ int nMachineId);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetMachineBlockOnOverflow )( 
            ISystemDebugControlPEC * This,
            /* [in] */ int nSessionId,
            /* [in] */ VARIANT_BOOL fBlock);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetMachineDynamicFrequency )( 
            ISystemDebugControlPEC * This,
            /* [in] */ int nSessionId,
            /* [in] */ int nFrequency);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *DisconnectFromMachine )( 
            ISystemDebugControlPEC * This,
            /* [in] */ int nSessionId,
            /* [in] */ int nMachineId);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Subscribe )( 
            ISystemDebugControlPEC * This,
            /* [in] */ int nSessionId,
            /* [in] */ IUnknown *punkReceiver);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Unsubscribe )( 
            ISystemDebugControlPEC * This,
            /* [in] */ int nSessionId);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetFilter )( 
            ISystemDebugControlPEC * This,
            /* [in] */ int nSessionId,
            /* [in] */ BSTR bstrFilterText);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *ClearFilter )( 
            ISystemDebugControlPEC * This,
            /* [in] */ int nSessionId);
        
        END_INTERFACE
    } ISystemDebugControlPECVtbl;

    interface ISystemDebugControlPEC
    {
        CONST_VTBL struct ISystemDebugControlPECVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugControlPEC_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugControlPEC_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugControlPEC_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugControlPEC_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define ISystemDebugControlPEC_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define ISystemDebugControlPEC_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define ISystemDebugControlPEC_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define ISystemDebugControlPEC_OpenSession(This,pnSessionId)	\
    (This)->lpVtbl -> OpenSession(This,pnSessionId)

#define ISystemDebugControlPEC_CloseSession(This,nSessionId)	\
    (This)->lpVtbl -> CloseSession(This,nSessionId)

#define ISystemDebugControlPEC_EnumerateAllComponents(This,nSessionId,pEnum)	\
    (This)->lpVtbl -> EnumerateAllComponents(This,nSessionId,pEnum)

#define ISystemDebugControlPEC_EnumerateMachineComponents(This,nSessionId,nMachineId,pEnum)	\
    (This)->lpVtbl -> EnumerateMachineComponents(This,nSessionId,nMachineId,pEnum)

#define ISystemDebugControlPEC_EnumerateAllEvents(This,nSessionId,pEnum)	\
    (This)->lpVtbl -> EnumerateAllEvents(This,nSessionId,pEnum)

#define ISystemDebugControlPEC_EnumerateComponentEvents(This,nSessionId,guidComponentId,pEnum)	\
    (This)->lpVtbl -> EnumerateComponentEvents(This,nSessionId,guidComponentId,pEnum)

#define ISystemDebugControlPEC_EnumerateConnectedMachines(This,nSessionId,pEnum)	\
    (This)->lpVtbl -> EnumerateConnectedMachines(This,nSessionId,pEnum)

#define ISystemDebugControlPEC_EnumerateMachineProcesses(This,nSessionId,nMachineId,pEnum)	\
    (This)->lpVtbl -> EnumerateMachineProcesses(This,nSessionId,nMachineId,pEnum)

#define ISystemDebugControlPEC_ConnectToMachine(This,nSessionId,strMachineName,pnMachineId)	\
    (This)->lpVtbl -> ConnectToMachine(This,nSessionId,strMachineName,pnMachineId)

#define ISystemDebugControlPEC_GetMachineInfo(This,nMachineId,ppIMachine)	\
    (This)->lpVtbl -> GetMachineInfo(This,nMachineId,ppIMachine)

#define ISystemDebugControlPEC_GetMachineConnectionInfo(This,strMachineName,ppConnectionInfo)	\
    (This)->lpVtbl -> GetMachineConnectionInfo(This,strMachineName,ppConnectionInfo)

#define ISystemDebugControlPEC_InitiateEventFlow(This,nSessionId,nMachineId)	\
    (This)->lpVtbl -> InitiateEventFlow(This,nSessionId,nMachineId)

#define ISystemDebugControlPEC_SetMachineBlockOnOverflow(This,nSessionId,fBlock)	\
    (This)->lpVtbl -> SetMachineBlockOnOverflow(This,nSessionId,fBlock)

#define ISystemDebugControlPEC_SetMachineDynamicFrequency(This,nSessionId,nFrequency)	\
    (This)->lpVtbl -> SetMachineDynamicFrequency(This,nSessionId,nFrequency)

#define ISystemDebugControlPEC_DisconnectFromMachine(This,nSessionId,nMachineId)	\
    (This)->lpVtbl -> DisconnectFromMachine(This,nSessionId,nMachineId)

#define ISystemDebugControlPEC_Subscribe(This,nSessionId,punkReceiver)	\
    (This)->lpVtbl -> Subscribe(This,nSessionId,punkReceiver)

#define ISystemDebugControlPEC_Unsubscribe(This,nSessionId)	\
    (This)->lpVtbl -> Unsubscribe(This,nSessionId)

#define ISystemDebugControlPEC_SetFilter(This,nSessionId,bstrFilterText)	\
    (This)->lpVtbl -> SetFilter(This,nSessionId,bstrFilterText)

#define ISystemDebugControlPEC_ClearFilter(This,nSessionId)	\
    (This)->lpVtbl -> ClearFilter(This,nSessionId)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_OpenSession_Proxy( 
    ISystemDebugControlPEC * This,
    /* [retval][out] */ int *pnSessionId);


void __RPC_STUB ISystemDebugControlPEC_OpenSession_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_CloseSession_Proxy( 
    ISystemDebugControlPEC * This,
    /* [in] */ int nSessionId);


void __RPC_STUB ISystemDebugControlPEC_CloseSession_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_EnumerateAllComponents_Proxy( 
    ISystemDebugControlPEC * This,
    /* [in] */ int nSessionId,
    /* [retval][out] */ ISystemDebugEventsEnumComponents **pEnum);


void __RPC_STUB ISystemDebugControlPEC_EnumerateAllComponents_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_EnumerateMachineComponents_Proxy( 
    ISystemDebugControlPEC * This,
    /* [in] */ int nSessionId,
    /* [in] */ int nMachineId,
    /* [retval][out] */ ISystemDebugEventsEnumComponents **pEnum);


void __RPC_STUB ISystemDebugControlPEC_EnumerateMachineComponents_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_EnumerateAllEvents_Proxy( 
    ISystemDebugControlPEC * This,
    /* [in] */ int nSessionId,
    /* [retval][out] */ ISystemDebugEventsEnumEvents **pEnum);


void __RPC_STUB ISystemDebugControlPEC_EnumerateAllEvents_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_EnumerateComponentEvents_Proxy( 
    ISystemDebugControlPEC * This,
    /* [in] */ int nSessionId,
    /* [in] */ GUID guidComponentId,
    /* [retval][out] */ ISystemDebugEventsEnumEvents **pEnum);


void __RPC_STUB ISystemDebugControlPEC_EnumerateComponentEvents_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_EnumerateConnectedMachines_Proxy( 
    ISystemDebugControlPEC * This,
    /* [in] */ int nSessionId,
    /* [retval][out] */ ISystemDebugEventsEnumConnectedMachines **pEnum);


void __RPC_STUB ISystemDebugControlPEC_EnumerateConnectedMachines_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_EnumerateMachineProcesses_Proxy( 
    ISystemDebugControlPEC * This,
    /* [in] */ int nSessionId,
    /* [in] */ int nMachineId,
    /* [retval][out] */ ISystemDebugEventsEnumProcesses **pEnum);


void __RPC_STUB ISystemDebugControlPEC_EnumerateMachineProcesses_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_ConnectToMachine_Proxy( 
    ISystemDebugControlPEC * This,
    /* [in] */ int nSessionId,
    /* [in] */ BSTR strMachineName,
    /* [retval][out] */ int *pnMachineId);


void __RPC_STUB ISystemDebugControlPEC_ConnectToMachine_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_GetMachineInfo_Proxy( 
    ISystemDebugControlPEC * This,
    /* [in] */ int nMachineId,
    /* [retval][out] */ ISystemDebugMachine **ppIMachine);


void __RPC_STUB ISystemDebugControlPEC_GetMachineInfo_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_GetMachineConnectionInfo_Proxy( 
    ISystemDebugControlPEC * This,
    /* [in] */ BSTR strMachineName,
    /* [retval][out] */ struct SystemDebugEventConnectionInfo **ppConnectionInfo);


void __RPC_STUB ISystemDebugControlPEC_GetMachineConnectionInfo_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_InitiateEventFlow_Proxy( 
    ISystemDebugControlPEC * This,
    /* [in] */ int nSessionId,
    /* [in] */ int nMachineId);


void __RPC_STUB ISystemDebugControlPEC_InitiateEventFlow_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_SetMachineBlockOnOverflow_Proxy( 
    ISystemDebugControlPEC * This,
    /* [in] */ int nSessionId,
    /* [in] */ VARIANT_BOOL fBlock);


void __RPC_STUB ISystemDebugControlPEC_SetMachineBlockOnOverflow_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_SetMachineDynamicFrequency_Proxy( 
    ISystemDebugControlPEC * This,
    /* [in] */ int nSessionId,
    /* [in] */ int nFrequency);


void __RPC_STUB ISystemDebugControlPEC_SetMachineDynamicFrequency_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_DisconnectFromMachine_Proxy( 
    ISystemDebugControlPEC * This,
    /* [in] */ int nSessionId,
    /* [in] */ int nMachineId);


void __RPC_STUB ISystemDebugControlPEC_DisconnectFromMachine_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_Subscribe_Proxy( 
    ISystemDebugControlPEC * This,
    /* [in] */ int nSessionId,
    /* [in] */ IUnknown *punkReceiver);


void __RPC_STUB ISystemDebugControlPEC_Subscribe_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_Unsubscribe_Proxy( 
    ISystemDebugControlPEC * This,
    /* [in] */ int nSessionId);


void __RPC_STUB ISystemDebugControlPEC_Unsubscribe_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_SetFilter_Proxy( 
    ISystemDebugControlPEC * This,
    /* [in] */ int nSessionId,
    /* [in] */ BSTR bstrFilterText);


void __RPC_STUB ISystemDebugControlPEC_SetFilter_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugControlPEC_ClearFilter_Proxy( 
    ISystemDebugControlPEC * This,
    /* [in] */ int nSessionId);


void __RPC_STUB ISystemDebugControlPEC_ClearFilter_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugControlPEC_INTERFACE_DEFINED__ */


#ifndef __ISystemDebugRuntimeVariablesSettings_INTERFACE_DEFINED__
#define __ISystemDebugRuntimeVariablesSettings_INTERFACE_DEFINED__

/* interface ISystemDebugRuntimeVariablesSettings */
/* [object][helpstring][uuid] */ 


EXTERN_C const IID IID_ISystemDebugRuntimeVariablesSettings;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d00-1222-11d3-BA1D-00105AA31A58")
    ISystemDebugRuntimeVariablesSettings : public IUnknown
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetRuntimeVariable( 
            /* [in] */ int nSessionId,
            /* [in] */ BSTR bstrVariableName,
            /* [in] */ int nValuesCount,
            /* [size_is][in] */ struct SystemDebugRuntimeVariableValue Values[  ]) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE ClearRuntimeVariables( 
            /* [in] */ int nSessionId,
            /* [in] */ int nVariablesCount,
            /* [size_is][in] */ BSTR *pbstrNames) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugRuntimeVariablesSettingsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugRuntimeVariablesSettings * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugRuntimeVariablesSettings * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugRuntimeVariablesSettings * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetRuntimeVariable )( 
            ISystemDebugRuntimeVariablesSettings * This,
            /* [in] */ int nSessionId,
            /* [in] */ BSTR bstrVariableName,
            /* [in] */ int nValuesCount,
            /* [size_is][in] */ struct SystemDebugRuntimeVariableValue Values[  ]);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *ClearRuntimeVariables )( 
            ISystemDebugRuntimeVariablesSettings * This,
            /* [in] */ int nSessionId,
            /* [in] */ int nVariablesCount,
            /* [size_is][in] */ BSTR *pbstrNames);
        
        END_INTERFACE
    } ISystemDebugRuntimeVariablesSettingsVtbl;

    interface ISystemDebugRuntimeVariablesSettings
    {
        CONST_VTBL struct ISystemDebugRuntimeVariablesSettingsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugRuntimeVariablesSettings_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugRuntimeVariablesSettings_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugRuntimeVariablesSettings_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugRuntimeVariablesSettings_SetRuntimeVariable(This,nSessionId,bstrVariableName,nValuesCount,Values)	\
    (This)->lpVtbl -> SetRuntimeVariable(This,nSessionId,bstrVariableName,nValuesCount,Values)

#define ISystemDebugRuntimeVariablesSettings_ClearRuntimeVariables(This,nSessionId,nVariablesCount,pbstrNames)	\
    (This)->lpVtbl -> ClearRuntimeVariables(This,nSessionId,nVariablesCount,pbstrNames)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugRuntimeVariablesSettings_SetRuntimeVariable_Proxy( 
    ISystemDebugRuntimeVariablesSettings * This,
    /* [in] */ int nSessionId,
    /* [in] */ BSTR bstrVariableName,
    /* [in] */ int nValuesCount,
    /* [size_is][in] */ struct SystemDebugRuntimeVariableValue Values[  ]);


void __RPC_STUB ISystemDebugRuntimeVariablesSettings_SetRuntimeVariable_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugRuntimeVariablesSettings_ClearRuntimeVariables_Proxy( 
    ISystemDebugRuntimeVariablesSettings * This,
    /* [in] */ int nSessionId,
    /* [in] */ int nVariablesCount,
    /* [size_is][in] */ BSTR *pbstrNames);


void __RPC_STUB ISystemDebugRuntimeVariablesSettings_ClearRuntimeVariables_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugRuntimeVariablesSettings_INTERFACE_DEFINED__ */


/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     unsigned long *, unsigned long            , BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserMarshal(  unsigned long *, unsigned char *, BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserUnmarshal(unsigned long *, unsigned char *, BSTR * ); 
void                      __RPC_USER  BSTR_UserFree(     unsigned long *, BSTR * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


