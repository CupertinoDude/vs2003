

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 6.00.0361 */
/* at Tue Mar 18 18:05:43 2003
 */
/* Compiler settings for vsaeventclass.idl:
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

#ifndef __vsaeventclass_h__
#define __vsaeventclass_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IVSAnalyzerEventClass_FWD_DEFINED__
#define __IVSAnalyzerEventClass_FWD_DEFINED__
typedef interface IVSAnalyzerEventClass IVSAnalyzerEventClass;
#endif 	/* __IVSAnalyzerEventClass_FWD_DEFINED__ */


#ifndef __ISystemDebugRuntimeVariableChangeNotify_FWD_DEFINED__
#define __ISystemDebugRuntimeVariableChangeNotify_FWD_DEFINED__
typedef interface ISystemDebugRuntimeVariableChangeNotify ISystemDebugRuntimeVariableChangeNotify;
#endif 	/* __ISystemDebugRuntimeVariableChangeNotify_FWD_DEFINED__ */


#ifndef __ISystemDebugFilterChangeNotify_FWD_DEFINED__
#define __ISystemDebugFilterChangeNotify_FWD_DEFINED__
typedef interface ISystemDebugFilterChangeNotify ISystemDebugFilterChangeNotify;
#endif 	/* __ISystemDebugFilterChangeNotify_FWD_DEFINED__ */


#ifndef __CAnalyzerEventSystem_FWD_DEFINED__
#define __CAnalyzerEventSystem_FWD_DEFINED__

#ifdef __cplusplus
typedef class CAnalyzerEventSystem CAnalyzerEventSystem;
#else
typedef struct CAnalyzerEventSystem CAnalyzerEventSystem;
#endif /* __cplusplus */

#endif 	/* __CAnalyzerEventSystem_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 

void * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void * ); 

/* interface __MIDL_itf_vsaeventclass_0000 */
/* [local] */ 

typedef /* [helpstring][uuid] */  DECLSPEC_UUID("6c736d7D-1652-40f4-8A8F-22838B1F9839") 
enum EventAlert
    {	eAlertConnectedMachineEventsLost	= 0,
	eAlertSubscriberError	= eAlertConnectedMachineEventsLost + 1
    } 	eEventAlert;

typedef /* [helpstring][uuid] */  DECLSPEC_UUID("6c736d7D-1652-40f5-8A8F-22838B1F9839") 
enum EventAlertSeverity
    {	eAlertSeverityCatastrophic	= 0,
	eAlertSeverityError	= eAlertSeverityCatastrophic + 1,
	eAlertSeverityWarning	= eAlertSeverityError + 1,
	eAlertSeverityInformation	= eAlertSeverityWarning + 1
    } 	eEventAlertSeverity;



extern RPC_IF_HANDLE __MIDL_itf_vsaeventclass_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_vsaeventclass_0000_v0_0_s_ifspec;

#ifndef __IVSAnalyzerEventClass_INTERFACE_DEFINED__
#define __IVSAnalyzerEventClass_INTERFACE_DEFINED__

/* interface IVSAnalyzerEventClass */
/* [object][helpstring][version][uuid] */ 


EXTERN_C const IID IID_IVSAnalyzerEventClass;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dFA-0A13-11d3-9667-00105AA316F7")
    IVSAnalyzerEventClass : public IUnknown
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE DebugBeginSession( 
            /* [in] */ int nMachineId,
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR strSessionName) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE DebugEndSession( 
            /* [in] */ int nMachineId,
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR strSessionName) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE DebugFireEventObject( 
            /* [in] */ IUnknown *punkEventObject) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE DebugEventAlert( 
            /* [in] */ eEventAlert eventAlert,
            /* [in] */ BSTR bstrDescription,
            /* [in] */ eEventAlertSeverity eventAlertSev) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVSAnalyzerEventClassVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IVSAnalyzerEventClass * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IVSAnalyzerEventClass * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IVSAnalyzerEventClass * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *DebugBeginSession )( 
            IVSAnalyzerEventClass * This,
            /* [in] */ int nMachineId,
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR strSessionName);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *DebugEndSession )( 
            IVSAnalyzerEventClass * This,
            /* [in] */ int nMachineId,
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR strSessionName);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *DebugFireEventObject )( 
            IVSAnalyzerEventClass * This,
            /* [in] */ IUnknown *punkEventObject);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *DebugEventAlert )( 
            IVSAnalyzerEventClass * This,
            /* [in] */ eEventAlert eventAlert,
            /* [in] */ BSTR bstrDescription,
            /* [in] */ eEventAlertSeverity eventAlertSev);
        
        END_INTERFACE
    } IVSAnalyzerEventClassVtbl;

    interface IVSAnalyzerEventClass
    {
        CONST_VTBL struct IVSAnalyzerEventClassVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVSAnalyzerEventClass_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IVSAnalyzerEventClass_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IVSAnalyzerEventClass_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IVSAnalyzerEventClass_DebugBeginSession(This,nMachineId,guidSourceID,strSessionName)	\
    (This)->lpVtbl -> DebugBeginSession(This,nMachineId,guidSourceID,strSessionName)

#define IVSAnalyzerEventClass_DebugEndSession(This,nMachineId,guidSourceID,strSessionName)	\
    (This)->lpVtbl -> DebugEndSession(This,nMachineId,guidSourceID,strSessionName)

#define IVSAnalyzerEventClass_DebugFireEventObject(This,punkEventObject)	\
    (This)->lpVtbl -> DebugFireEventObject(This,punkEventObject)

#define IVSAnalyzerEventClass_DebugEventAlert(This,eventAlert,bstrDescription,eventAlertSev)	\
    (This)->lpVtbl -> DebugEventAlert(This,eventAlert,bstrDescription,eventAlertSev)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring] */ HRESULT STDMETHODCALLTYPE IVSAnalyzerEventClass_DebugBeginSession_Proxy( 
    IVSAnalyzerEventClass * This,
    /* [in] */ int nMachineId,
    /* [in] */ BSTR guidSourceID,
    /* [in] */ BSTR strSessionName);


void __RPC_STUB IVSAnalyzerEventClass_DebugBeginSession_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IVSAnalyzerEventClass_DebugEndSession_Proxy( 
    IVSAnalyzerEventClass * This,
    /* [in] */ int nMachineId,
    /* [in] */ BSTR guidSourceID,
    /* [in] */ BSTR strSessionName);


void __RPC_STUB IVSAnalyzerEventClass_DebugEndSession_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IVSAnalyzerEventClass_DebugFireEventObject_Proxy( 
    IVSAnalyzerEventClass * This,
    /* [in] */ IUnknown *punkEventObject);


void __RPC_STUB IVSAnalyzerEventClass_DebugFireEventObject_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IVSAnalyzerEventClass_DebugEventAlert_Proxy( 
    IVSAnalyzerEventClass * This,
    /* [in] */ eEventAlert eventAlert,
    /* [in] */ BSTR bstrDescription,
    /* [in] */ eEventAlertSeverity eventAlertSev);


void __RPC_STUB IVSAnalyzerEventClass_DebugEventAlert_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IVSAnalyzerEventClass_INTERFACE_DEFINED__ */


#ifndef __ISystemDebugRuntimeVariableChangeNotify_INTERFACE_DEFINED__
#define __ISystemDebugRuntimeVariableChangeNotify_INTERFACE_DEFINED__

/* interface ISystemDebugRuntimeVariableChangeNotify */
/* [object][helpstring][version][uuid] */ 


EXTERN_C const IID IID_ISystemDebugRuntimeVariableChangeNotify;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dD2-1E87-11d3-966A-00105AA316F7")
    ISystemDebugRuntimeVariableChangeNotify : public IUnknown
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RuntimeVariableChangeNotify( 
            /* [in] */ BSTR strComponentID,
            /* [in] */ BSTR strSessionName,
            /* [in] */ BSTR bstrRuntimeVariableName,
            /* [in] */ BSTR bstrRuntimeVariableValue) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugRuntimeVariableChangeNotifyVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugRuntimeVariableChangeNotify * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugRuntimeVariableChangeNotify * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugRuntimeVariableChangeNotify * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RuntimeVariableChangeNotify )( 
            ISystemDebugRuntimeVariableChangeNotify * This,
            /* [in] */ BSTR strComponentID,
            /* [in] */ BSTR strSessionName,
            /* [in] */ BSTR bstrRuntimeVariableName,
            /* [in] */ BSTR bstrRuntimeVariableValue);
        
        END_INTERFACE
    } ISystemDebugRuntimeVariableChangeNotifyVtbl;

    interface ISystemDebugRuntimeVariableChangeNotify
    {
        CONST_VTBL struct ISystemDebugRuntimeVariableChangeNotifyVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugRuntimeVariableChangeNotify_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugRuntimeVariableChangeNotify_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugRuntimeVariableChangeNotify_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugRuntimeVariableChangeNotify_RuntimeVariableChangeNotify(This,strComponentID,strSessionName,bstrRuntimeVariableName,bstrRuntimeVariableValue)	\
    (This)->lpVtbl -> RuntimeVariableChangeNotify(This,strComponentID,strSessionName,bstrRuntimeVariableName,bstrRuntimeVariableValue)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugRuntimeVariableChangeNotify_RuntimeVariableChangeNotify_Proxy( 
    ISystemDebugRuntimeVariableChangeNotify * This,
    /* [in] */ BSTR strComponentID,
    /* [in] */ BSTR strSessionName,
    /* [in] */ BSTR bstrRuntimeVariableName,
    /* [in] */ BSTR bstrRuntimeVariableValue);


void __RPC_STUB ISystemDebugRuntimeVariableChangeNotify_RuntimeVariableChangeNotify_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugRuntimeVariableChangeNotify_INTERFACE_DEFINED__ */


#ifndef __ISystemDebugFilterChangeNotify_INTERFACE_DEFINED__
#define __ISystemDebugFilterChangeNotify_INTERFACE_DEFINED__

/* interface ISystemDebugFilterChangeNotify */
/* [object][helpstring][version][uuid] */ 


EXTERN_C const IID IID_ISystemDebugFilterChangeNotify;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dD4-1E87-11d3-966A-00105AA316F7")
    ISystemDebugFilterChangeNotify : public IUnknown
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE FilterChangeNotify( 
            /* [in] */ BOOL fRecordingFilterExists) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugFilterChangeNotifyVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugFilterChangeNotify * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugFilterChangeNotify * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugFilterChangeNotify * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *FilterChangeNotify )( 
            ISystemDebugFilterChangeNotify * This,
            /* [in] */ BOOL fRecordingFilterExists);
        
        END_INTERFACE
    } ISystemDebugFilterChangeNotifyVtbl;

    interface ISystemDebugFilterChangeNotify
    {
        CONST_VTBL struct ISystemDebugFilterChangeNotifyVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugFilterChangeNotify_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugFilterChangeNotify_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugFilterChangeNotify_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugFilterChangeNotify_FilterChangeNotify(This,fRecordingFilterExists)	\
    (This)->lpVtbl -> FilterChangeNotify(This,fRecordingFilterExists)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugFilterChangeNotify_FilterChangeNotify_Proxy( 
    ISystemDebugFilterChangeNotify * This,
    /* [in] */ BOOL fRecordingFilterExists);


void __RPC_STUB ISystemDebugFilterChangeNotify_FilterChangeNotify_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugFilterChangeNotify_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_vsaeventclass_0261 */
/* [local] */ 

#define PROGID_VSAEventClass OLESTR("MSVSA.AnalyzerEventClass.1")


extern RPC_IF_HANDLE __MIDL_itf_vsaeventclass_0261_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_vsaeventclass_0261_v0_0_s_ifspec;


#ifndef __AnalyzerEventSystemLib_LIBRARY_DEFINED__
#define __AnalyzerEventSystemLib_LIBRARY_DEFINED__

/* library AnalyzerEventSystemLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_AnalyzerEventSystemLib;

EXTERN_C const CLSID CLSID_CAnalyzerEventSystem;

#ifdef __cplusplus

class DECLSPEC_UUID("6c736d22-0A20-11d3-9667-00105AA316F7")
CAnalyzerEventSystem;
#endif
#endif /* __AnalyzerEventSystemLib_LIBRARY_DEFINED__ */

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


