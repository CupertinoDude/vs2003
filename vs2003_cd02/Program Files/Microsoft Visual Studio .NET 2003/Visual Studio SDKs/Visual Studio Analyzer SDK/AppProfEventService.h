

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 6.00.0361 */
/* at Tue Mar 18 18:03:38 2003
 */
/* Compiler settings for appprofeventservice.idl:
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

#ifndef __appprofeventservice_h__
#define __appprofeventservice_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IMSFTAppProfEventService_FWD_DEFINED__
#define __IMSFTAppProfEventService_FWD_DEFINED__
typedef interface IMSFTAppProfEventService IMSFTAppProfEventService;
#endif 	/* __IMSFTAppProfEventService_FWD_DEFINED__ */


#ifndef __MSFTAppProfEventService_FWD_DEFINED__
#define __MSFTAppProfEventService_FWD_DEFINED__

#ifdef __cplusplus
typedef class MSFTAppProfEventService MSFTAppProfEventService;
#else
typedef struct MSFTAppProfEventService MSFTAppProfEventService;
#endif /* __cplusplus */

#endif 	/* __MSFTAppProfEventService_FWD_DEFINED__ */


#ifndef __VSAWMIEventSourceProvider_FWD_DEFINED__
#define __VSAWMIEventSourceProvider_FWD_DEFINED__

#ifdef __cplusplus
typedef class VSAWMIEventSourceProvider VSAWMIEventSourceProvider;
#else
typedef struct VSAWMIEventSourceProvider VSAWMIEventSourceProvider;
#endif /* __cplusplus */

#endif 	/* __VSAWMIEventSourceProvider_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"
#include "WbemCli.h"
#include "wbemprov.h"

#ifdef __cplusplus
extern "C"{
#endif 

void * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void * ); 

#ifndef __IMSFTAppProfEventService_INTERFACE_DEFINED__
#define __IMSFTAppProfEventService_INTERFACE_DEFINED__

/* interface IMSFTAppProfEventService */
/* [helpstring][dual][uuid][object] */ 

typedef /* [helpstring][v1_enum] */ 
enum eAppProfEventDefaultFlags
    {	cAppProfEventNoFlags	= 0,
	cAppProfEventDefaultSource	= 0x1,
	cAppProfEventDefaultTarget	= 0x2,
	cAppProfEventOverwrite	= 0x4
    } 	AppProfEventDefaultFlags;

#if defined(__cplusplus)
extern "C++" {
inline AppProfEventDefaultFlags operator | (const AppProfEventDefaultFlags &left, const AppProfEventDefaultFlags &right)
{
  return (AppProfEventDefaultFlags)((int)left|(int)right);
}
inline AppProfEventDefaultFlags operator + (const AppProfEventDefaultFlags &left, const AppProfEventDefaultFlags &right)
{
  return (AppProfEventDefaultFlags)((int)left+(int)right);
}
} // extern C++
#endif

EXTERN_C const IID IID_IMSFTAppProfEventService;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dC2-5B33-452c-B283-4A073D656A7A")
    IMSFTAppProfEventService : public IDispatch
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetDefaults( 
            /* [in] */ IWbemObjectAccess *pIWbemObjectAccess,
            /* [in] */ AppProfEventDefaultFlags dwFlags) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IMSFTAppProfEventServiceVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IMSFTAppProfEventService * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IMSFTAppProfEventService * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IMSFTAppProfEventService * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IMSFTAppProfEventService * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IMSFTAppProfEventService * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IMSFTAppProfEventService * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IMSFTAppProfEventService * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetDefaults )( 
            IMSFTAppProfEventService * This,
            /* [in] */ IWbemObjectAccess *pIWbemObjectAccess,
            /* [in] */ AppProfEventDefaultFlags dwFlags);
        
        END_INTERFACE
    } IMSFTAppProfEventServiceVtbl;

    interface IMSFTAppProfEventService
    {
        CONST_VTBL struct IMSFTAppProfEventServiceVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IMSFTAppProfEventService_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IMSFTAppProfEventService_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IMSFTAppProfEventService_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IMSFTAppProfEventService_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define IMSFTAppProfEventService_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define IMSFTAppProfEventService_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define IMSFTAppProfEventService_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define IMSFTAppProfEventService_SetDefaults(This,pIWbemObjectAccess,dwFlags)	\
    (This)->lpVtbl -> SetDefaults(This,pIWbemObjectAccess,dwFlags)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring] */ HRESULT STDMETHODCALLTYPE IMSFTAppProfEventService_SetDefaults_Proxy( 
    IMSFTAppProfEventService * This,
    /* [in] */ IWbemObjectAccess *pIWbemObjectAccess,
    /* [in] */ AppProfEventDefaultFlags dwFlags);


void __RPC_STUB IMSFTAppProfEventService_SetDefaults_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IMSFTAppProfEventService_INTERFACE_DEFINED__ */



#ifndef __MSFTAppProfEventServiceLib_LIBRARY_DEFINED__
#define __MSFTAppProfEventServiceLib_LIBRARY_DEFINED__

/* library MSFTAppProfEventServiceLib */
/* [version][lcid][helpstring][uuid] */ 


EXTERN_C const IID LIBID_MSFTAppProfEventServiceLib;

EXTERN_C const CLSID CLSID_MSFTAppProfEventService;

#ifdef __cplusplus

class DECLSPEC_UUID("6c736dC3-5B33-452c-B283-4A073D656A7A")
MSFTAppProfEventService;
#endif

EXTERN_C const CLSID CLSID_VSAWMIEventSourceProvider;

#ifdef __cplusplus

class DECLSPEC_UUID("745FE21D-2E74-4f8b-BE22-894446A9F1CD")
VSAWMIEventSourceProvider;
#endif
#endif /* __MSFTAppProfEventServiceLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


