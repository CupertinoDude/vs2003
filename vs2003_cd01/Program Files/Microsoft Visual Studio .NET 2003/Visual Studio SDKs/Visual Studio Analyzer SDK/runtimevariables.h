

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 6.00.0361 */
/* at Tue Mar 18 18:05:01 2003
 */
/* Compiler settings for runtimevariables.idl:
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

#ifndef __runtimevariables_h__
#define __runtimevariables_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __ISystemDebugRuntimeVariablesEnum_FWD_DEFINED__
#define __ISystemDebugRuntimeVariablesEnum_FWD_DEFINED__
typedef interface ISystemDebugRuntimeVariablesEnum ISystemDebugRuntimeVariablesEnum;
#endif 	/* __ISystemDebugRuntimeVariablesEnum_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"
#include "RuntimeVariablesInfo.h"

#ifdef __cplusplus
extern "C"{
#endif 

void * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void * ); 

#ifndef __ISystemDebugRuntimeVariablesEnum_INTERFACE_DEFINED__
#define __ISystemDebugRuntimeVariablesEnum_INTERFACE_DEFINED__

/* interface ISystemDebugRuntimeVariablesEnum */
/* [object][uuid] */ 


EXTERN_C const IID IID_ISystemDebugRuntimeVariablesEnum;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d04-1222-11d3-BA1D-00105AA31A58")
    ISystemDebugRuntimeVariablesEnum : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Next( 
            /* [in] */ ULONG celt,
            /* [length_is][size_is][out] */ struct SystemDebugRuntimeVariable **prgpt,
            /* [out] */ ULONG *pceltFetched) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Skip( 
            /* [in] */ ULONG celt) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Reset( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Clone( 
            /* [out] */ ISystemDebugRuntimeVariablesEnum **ppEnum) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugRuntimeVariablesEnumVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugRuntimeVariablesEnum * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugRuntimeVariablesEnum * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugRuntimeVariablesEnum * This);
        
        HRESULT ( STDMETHODCALLTYPE *Next )( 
            ISystemDebugRuntimeVariablesEnum * This,
            /* [in] */ ULONG celt,
            /* [length_is][size_is][out] */ struct SystemDebugRuntimeVariable **prgpt,
            /* [out] */ ULONG *pceltFetched);
        
        HRESULT ( STDMETHODCALLTYPE *Skip )( 
            ISystemDebugRuntimeVariablesEnum * This,
            /* [in] */ ULONG celt);
        
        HRESULT ( STDMETHODCALLTYPE *Reset )( 
            ISystemDebugRuntimeVariablesEnum * This);
        
        HRESULT ( STDMETHODCALLTYPE *Clone )( 
            ISystemDebugRuntimeVariablesEnum * This,
            /* [out] */ ISystemDebugRuntimeVariablesEnum **ppEnum);
        
        END_INTERFACE
    } ISystemDebugRuntimeVariablesEnumVtbl;

    interface ISystemDebugRuntimeVariablesEnum
    {
        CONST_VTBL struct ISystemDebugRuntimeVariablesEnumVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugRuntimeVariablesEnum_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugRuntimeVariablesEnum_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugRuntimeVariablesEnum_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugRuntimeVariablesEnum_Next(This,celt,prgpt,pceltFetched)	\
    (This)->lpVtbl -> Next(This,celt,prgpt,pceltFetched)

#define ISystemDebugRuntimeVariablesEnum_Skip(This,celt)	\
    (This)->lpVtbl -> Skip(This,celt)

#define ISystemDebugRuntimeVariablesEnum_Reset(This)	\
    (This)->lpVtbl -> Reset(This)

#define ISystemDebugRuntimeVariablesEnum_Clone(This,ppEnum)	\
    (This)->lpVtbl -> Clone(This,ppEnum)

#endif /* COBJMACROS */


#endif 	/* C style interface */



HRESULT STDMETHODCALLTYPE ISystemDebugRuntimeVariablesEnum_Next_Proxy( 
    ISystemDebugRuntimeVariablesEnum * This,
    /* [in] */ ULONG celt,
    /* [length_is][size_is][out] */ struct SystemDebugRuntimeVariable **prgpt,
    /* [out] */ ULONG *pceltFetched);


void __RPC_STUB ISystemDebugRuntimeVariablesEnum_Next_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugRuntimeVariablesEnum_Skip_Proxy( 
    ISystemDebugRuntimeVariablesEnum * This,
    /* [in] */ ULONG celt);


void __RPC_STUB ISystemDebugRuntimeVariablesEnum_Skip_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugRuntimeVariablesEnum_Reset_Proxy( 
    ISystemDebugRuntimeVariablesEnum * This);


void __RPC_STUB ISystemDebugRuntimeVariablesEnum_Reset_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugRuntimeVariablesEnum_Clone_Proxy( 
    ISystemDebugRuntimeVariablesEnum * This,
    /* [out] */ ISystemDebugRuntimeVariablesEnum **ppEnum);


void __RPC_STUB ISystemDebugRuntimeVariablesEnum_Clone_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugRuntimeVariablesEnum_INTERFACE_DEFINED__ */


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


