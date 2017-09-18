
#pragma warning( disable: 4049 )  /* more than 64k source lines */

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 6.00.0347 */
/* at Wed Aug 28 15:16:22 2002
 */
/* Compiler settings for .\CMPNT.idl:
    Os, W1, Zp8, env=Win32 (32b run)
    protocol : dce , ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
//@@MIDL_FILE_HEADING(  )


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

#ifndef __iface_h__
#define __iface_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __ICDPTests_FWD_DEFINED__
#define __ICDPTests_FWD_DEFINED__
typedef interface ICDPTests ICDPTests;
#endif 	/* __ICDPTests_FWD_DEFINED__ */


#ifndef __IFoo_FWD_DEFINED__
#define __IFoo_FWD_DEFINED__
typedef interface IFoo IFoo;
#endif 	/* __IFoo_FWD_DEFINED__ */


#ifndef __IUniversalMarshaler_FWD_DEFINED__
#define __IUniversalMarshaler_FWD_DEFINED__
typedef interface IUniversalMarshaler IUniversalMarshaler;
#endif 	/* __IUniversalMarshaler_FWD_DEFINED__ */


#ifndef __CDPObject_FWD_DEFINED__
#define __CDPObject_FWD_DEFINED__

#ifdef __cplusplus
typedef class CDPObject CDPObject;
#else
typedef struct CDPObject CDPObject;
#endif /* __cplusplus */

#endif 	/* __CDPObject_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 

void * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void * ); 

#ifndef __ICDPTests_INTERFACE_DEFINED__
#define __ICDPTests_INTERFACE_DEFINED__

/* interface ICDPTests */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ICDPTests;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("00000abc-b41b-11cf-a6bb-0080c7b2d682")
    ICDPTests : public IUnknown
    {
    public:
        virtual /* [propget] */ HRESULT STDMETHODCALLTYPE get_AllowQIOfBrokenIMarshal( 
            /* [retval][out] */ BOOL *pRetVal) = 0;
        
        virtual /* [propput] */ HRESULT STDMETHODCALLTYPE put_AllowQIOfBrokenIMarshal( 
            /* [in] */ BOOL NewVal) = 0;
        
        virtual /* [propget] */ HRESULT STDMETHODCALLTYPE get_FailAllQIs( 
            /* [retval][out] */ BOOL *pRetVal) = 0;
        
        virtual /* [propput] */ HRESULT STDMETHODCALLTYPE put_FailAllQIs( 
            /* [in] */ BOOL NewVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ICDPTestsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ICDPTests * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ICDPTests * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ICDPTests * This);
        
        /* [propget] */ HRESULT ( STDMETHODCALLTYPE *get_AllowQIOfBrokenIMarshal )( 
            ICDPTests * This,
            /* [retval][out] */ BOOL *pRetVal);
        
        /* [propput] */ HRESULT ( STDMETHODCALLTYPE *put_AllowQIOfBrokenIMarshal )( 
            ICDPTests * This,
            /* [in] */ BOOL NewVal);
        
        /* [propget] */ HRESULT ( STDMETHODCALLTYPE *get_FailAllQIs )( 
            ICDPTests * This,
            /* [retval][out] */ BOOL *pRetVal);
        
        /* [propput] */ HRESULT ( STDMETHODCALLTYPE *put_FailAllQIs )( 
            ICDPTests * This,
            /* [in] */ BOOL NewVal);
        
        END_INTERFACE
    } ICDPTestsVtbl;

    interface ICDPTests
    {
        CONST_VTBL struct ICDPTestsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ICDPTests_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ICDPTests_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ICDPTests_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ICDPTests_get_AllowQIOfBrokenIMarshal(This,pRetVal)	\
    (This)->lpVtbl -> get_AllowQIOfBrokenIMarshal(This,pRetVal)

#define ICDPTests_put_AllowQIOfBrokenIMarshal(This,NewVal)	\
    (This)->lpVtbl -> put_AllowQIOfBrokenIMarshal(This,NewVal)

#define ICDPTests_get_FailAllQIs(This,pRetVal)	\
    (This)->lpVtbl -> get_FailAllQIs(This,pRetVal)

#define ICDPTests_put_FailAllQIs(This,NewVal)	\
    (This)->lpVtbl -> put_FailAllQIs(This,NewVal)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [propget] */ HRESULT STDMETHODCALLTYPE ICDPTests_get_AllowQIOfBrokenIMarshal_Proxy( 
    ICDPTests * This,
    /* [retval][out] */ BOOL *pRetVal);


void __RPC_STUB ICDPTests_get_AllowQIOfBrokenIMarshal_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [propput] */ HRESULT STDMETHODCALLTYPE ICDPTests_put_AllowQIOfBrokenIMarshal_Proxy( 
    ICDPTests * This,
    /* [in] */ BOOL NewVal);


void __RPC_STUB ICDPTests_put_AllowQIOfBrokenIMarshal_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [propget] */ HRESULT STDMETHODCALLTYPE ICDPTests_get_FailAllQIs_Proxy( 
    ICDPTests * This,
    /* [retval][out] */ BOOL *pRetVal);


void __RPC_STUB ICDPTests_get_FailAllQIs_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [propput] */ HRESULT STDMETHODCALLTYPE ICDPTests_put_FailAllQIs_Proxy( 
    ICDPTests * This,
    /* [in] */ BOOL NewVal);


void __RPC_STUB ICDPTests_put_FailAllQIs_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ICDPTests_INTERFACE_DEFINED__ */


#ifndef __IFoo_INTERFACE_DEFINED__
#define __IFoo_INTERFACE_DEFINED__

/* interface IFoo */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_IFoo;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("000F00F0-0F00-11cf-a6bb-0080c7b2d684")
    IFoo : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Foo( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IFooVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IFoo * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IFoo * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IFoo * This);
        
        HRESULT ( STDMETHODCALLTYPE *Foo )( 
            IFoo * This);
        
        END_INTERFACE
    } IFooVtbl;

    interface IFoo
    {
        CONST_VTBL struct IFooVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IFoo_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IFoo_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IFoo_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IFoo_Foo(This)	\
    (This)->lpVtbl -> Foo(This)

#endif /* COBJMACROS */


#endif 	/* C style interface */



HRESULT STDMETHODCALLTYPE IFoo_Foo_Proxy( 
    IFoo * This);


void __RPC_STUB IFoo_Foo_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IFoo_INTERFACE_DEFINED__ */


#ifndef __IUniversalMarshaler_INTERFACE_DEFINED__
#define __IUniversalMarshaler_INTERFACE_DEFINED__

/* interface IUniversalMarshaler */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_IUniversalMarshaler;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("56823962-6326-3651-a632-626690873284")
    IUniversalMarshaler : public IUnknown
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct IUniversalMarshalerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IUniversalMarshaler * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IUniversalMarshaler * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IUniversalMarshaler * This);
        
        END_INTERFACE
    } IUniversalMarshalerVtbl;

    interface IUniversalMarshaler
    {
        CONST_VTBL struct IUniversalMarshalerVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IUniversalMarshaler_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IUniversalMarshaler_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IUniversalMarshaler_Release(This)	\
    (This)->lpVtbl -> Release(This)


#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IUniversalMarshaler_INTERFACE_DEFINED__ */



#ifndef __ServerLib_LIBRARY_DEFINED__
#define __ServerLib_LIBRARY_DEFINED__

/* library ServerLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_ServerLib;

EXTERN_C const CLSID CLSID_CDPObject;

#ifdef __cplusplus

class DECLSPEC_UUID("00000abc-882c-11cf-a6bb-0080c7b2d684")
CDPObject;
#endif
#endif /* __ServerLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


