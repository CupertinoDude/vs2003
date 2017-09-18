

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 6.00.0361 */
/* at Tue Mar 18 18:04:01 2003
 */
/* Compiler settings for iec.idl:
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

#ifndef __iec_h__
#define __iec_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __ISystemDebugEventShutdown_FWD_DEFINED__
#define __ISystemDebugEventShutdown_FWD_DEFINED__
typedef interface ISystemDebugEventShutdown ISystemDebugEventShutdown;
#endif 	/* __ISystemDebugEventShutdown_FWD_DEFINED__ */


#ifndef __ISystemDebugReadRuntimeVariablesSettings_FWD_DEFINED__
#define __ISystemDebugReadRuntimeVariablesSettings_FWD_DEFINED__
typedef interface ISystemDebugReadRuntimeVariablesSettings ISystemDebugReadRuntimeVariablesSettings;
#endif 	/* __ISystemDebugReadRuntimeVariablesSettings_FWD_DEFINED__ */


#ifndef __IECObj_FWD_DEFINED__
#define __IECObj_FWD_DEFINED__

#ifdef __cplusplus
typedef class IECObj IECObj;
#else
typedef struct IECObj IECObj;
#endif /* __cplusplus */

#endif 	/* __IECObj_FWD_DEFINED__ */


#ifndef __VSAnalyzerRuntimeVariablesObject_FWD_DEFINED__
#define __VSAnalyzerRuntimeVariablesObject_FWD_DEFINED__

#ifdef __cplusplus
typedef class VSAnalyzerRuntimeVariablesObject VSAnalyzerRuntimeVariablesObject;
#else
typedef struct VSAnalyzerRuntimeVariablesObject VSAnalyzerRuntimeVariablesObject;
#endif /* __cplusplus */

#endif 	/* __VSAnalyzerRuntimeVariablesObject_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"
#include "vaevt.h"
#include "RuntimeVariables.h"

#ifdef __cplusplus
extern "C"{
#endif 

void * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void * ); 

/* interface __MIDL_itf_iec_0000 */
/* [local] */ 

const wchar_t DEBUG_EVENT_CALL_STRING[  ]	=	L"6c736d61-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_RETURN_STRING[  ]	=	L"6c736d62-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_COMPONENT_START_STRING[  ]	=	L"6c736d63-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_COMPONENT_STOP_STRING[  ]	=	L"6c736d64-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_CALL_DATA_STRING[  ]	=	L"6c736d65-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_ENTER_STRING[  ]	=	L"6c736d66-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_ENTER_DATA_STRING[  ]	=	L"6c736d67-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_LEAVE_NORMAL_STRING[  ]	=	L"6c736d68-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_LEAVE_EXCEPTION_STRING[  ]	=	L"6c736d69-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_LEAVE_DATA_STRING[  ]	=	L"6c736d6a-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_RETURN_DATA_STRING[  ]	=	L"6c736d6b-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_RETURN_NORMAL_STRING[  ]	=	L"6c736d6c-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_RETURN_EXCEPTION_STRING[  ]	=	L"6c736d6d-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_QUERY_SEND_STRING[  ]	=	L"6c736d6e-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_QUERY_ENTER_STRING[  ]	=	L"6c736d6f-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_QUERY_LEAVE_STRING[  ]	=	L"6c736d70-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_QUERY_RESULT_STRING[  ]	=	L"6c736d71-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_TRANSACTION_START_STRING[  ]	=	L"6c736d72-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_TRANSACTION_COMMIT_STRING[  ]	=	L"6c736d73-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_TRANSACTION_ROLLBACK_STRING[  ]	=	L"6c736d74-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_DEBUG_EVENTS_LOST_STRING[  ]	=	L"6c736d75-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_CATEGORY_STARTSTOP_STRING[  ]	=	L"6c736d81-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_CATEGORY_CALLRETURN_STRING[  ]	=	L"6c736d82-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_CATEGORY_QUERYRESULT_STRING[  ]	=	L"6c736d83-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_CATEGORY_TRANSACTION_STRING[  ]	=	L"6c736d84-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_CATEGORY_ALL_STRING[  ]	=	L"6c736d85-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_CATEGORY_MEASURED_ALL_STRING[  ]	=	L"6c736d86-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_CATEGORY_PERFMON_STRING[  ]	=	L"6c736d87-bcbf-11d0-8a23-00aa00b58e10";

const wchar_t DEBUG_EVENT_SOURCE_USER_STRING[  ]	=	L"6c736d00-bcbf-11d0-8a23-00aa00b58e10";



extern RPC_IF_HANDLE __MIDL_itf_iec_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_iec_0000_v0_0_s_ifspec;

#ifndef __ISystemDebugEventShutdown_INTERFACE_DEFINED__
#define __ISystemDebugEventShutdown_INTERFACE_DEFINED__

/* interface ISystemDebugEventShutdown */
/* [object][uuid] */ 


EXTERN_C const IID IID_ISystemDebugEventShutdown;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dcf-ab0d-11D0-a2ad-00A0C90f27e8")
    ISystemDebugEventShutdown : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Shutdown( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugEventShutdownVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugEventShutdown * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugEventShutdown * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugEventShutdown * This);
        
        HRESULT ( STDMETHODCALLTYPE *Shutdown )( 
            ISystemDebugEventShutdown * This);
        
        END_INTERFACE
    } ISystemDebugEventShutdownVtbl;

    interface ISystemDebugEventShutdown
    {
        CONST_VTBL struct ISystemDebugEventShutdownVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugEventShutdown_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugEventShutdown_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugEventShutdown_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugEventShutdown_Shutdown(This)	\
    (This)->lpVtbl -> Shutdown(This)

#endif /* COBJMACROS */


#endif 	/* C style interface */



HRESULT STDMETHODCALLTYPE ISystemDebugEventShutdown_Shutdown_Proxy( 
    ISystemDebugEventShutdown * This);


void __RPC_STUB ISystemDebugEventShutdown_Shutdown_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugEventShutdown_INTERFACE_DEFINED__ */


#ifndef __ISystemDebugReadRuntimeVariablesSettings_INTERFACE_DEFINED__
#define __ISystemDebugReadRuntimeVariablesSettings_INTERFACE_DEFINED__

/* interface ISystemDebugReadRuntimeVariablesSettings */
/* [object][uuid] */ 


EXTERN_C const IID IID_ISystemDebugReadRuntimeVariablesSettings;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d02-1222-11d3-BA1D-00105AA31A58")
    ISystemDebugReadRuntimeVariablesSettings : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetRuntimeVariable( 
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ LPCOLESTR strVariableName,
            /* [out] */ BSTR *pbstrVariableValue) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetRuntimeVariablesEnumerator( 
            /* [in] */ REFGUID guidSourceID,
            /* [out] */ ISystemDebugRuntimeVariablesEnum **ppISystemDebugRuntimeVariablesEnum) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugReadRuntimeVariablesSettingsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugReadRuntimeVariablesSettings * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugReadRuntimeVariablesSettings * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugReadRuntimeVariablesSettings * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetRuntimeVariable )( 
            ISystemDebugReadRuntimeVariablesSettings * This,
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ LPCOLESTR strVariableName,
            /* [out] */ BSTR *pbstrVariableValue);
        
        HRESULT ( STDMETHODCALLTYPE *GetRuntimeVariablesEnumerator )( 
            ISystemDebugReadRuntimeVariablesSettings * This,
            /* [in] */ REFGUID guidSourceID,
            /* [out] */ ISystemDebugRuntimeVariablesEnum **ppISystemDebugRuntimeVariablesEnum);
        
        END_INTERFACE
    } ISystemDebugReadRuntimeVariablesSettingsVtbl;

    interface ISystemDebugReadRuntimeVariablesSettings
    {
        CONST_VTBL struct ISystemDebugReadRuntimeVariablesSettingsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugReadRuntimeVariablesSettings_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugReadRuntimeVariablesSettings_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugReadRuntimeVariablesSettings_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugReadRuntimeVariablesSettings_GetRuntimeVariable(This,guidSourceID,strVariableName,pbstrVariableValue)	\
    (This)->lpVtbl -> GetRuntimeVariable(This,guidSourceID,strVariableName,pbstrVariableValue)

#define ISystemDebugReadRuntimeVariablesSettings_GetRuntimeVariablesEnumerator(This,guidSourceID,ppISystemDebugRuntimeVariablesEnum)	\
    (This)->lpVtbl -> GetRuntimeVariablesEnumerator(This,guidSourceID,ppISystemDebugRuntimeVariablesEnum)

#endif /* COBJMACROS */


#endif 	/* C style interface */



HRESULT STDMETHODCALLTYPE ISystemDebugReadRuntimeVariablesSettings_GetRuntimeVariable_Proxy( 
    ISystemDebugReadRuntimeVariablesSettings * This,
    /* [in] */ REFGUID guidSourceID,
    /* [in] */ LPCOLESTR strVariableName,
    /* [out] */ BSTR *pbstrVariableValue);


void __RPC_STUB ISystemDebugReadRuntimeVariablesSettings_GetRuntimeVariable_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugReadRuntimeVariablesSettings_GetRuntimeVariablesEnumerator_Proxy( 
    ISystemDebugReadRuntimeVariablesSettings * This,
    /* [in] */ REFGUID guidSourceID,
    /* [out] */ ISystemDebugRuntimeVariablesEnum **ppISystemDebugRuntimeVariablesEnum);


void __RPC_STUB ISystemDebugReadRuntimeVariablesSettings_GetRuntimeVariablesEnumerator_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugReadRuntimeVariablesSettings_INTERFACE_DEFINED__ */



#ifndef __IECLib_LIBRARY_DEFINED__
#define __IECLib_LIBRARY_DEFINED__

/* library IECLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_IECLib;

EXTERN_C const CLSID CLSID_IECObj;

#ifdef __cplusplus

class DECLSPEC_UUID("6c736dB1-BD94-11D0-8A23-00AA00B58E10")
IECObj;
#endif

EXTERN_C const CLSID CLSID_VSAnalyzerRuntimeVariablesObject;

#ifdef __cplusplus

class DECLSPEC_UUID("6c736dB5-BD94-11D0-8A23-00AA00B58E10")
VSAnalyzerRuntimeVariablesObject;
#endif
#endif /* __IECLib_LIBRARY_DEFINED__ */

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


