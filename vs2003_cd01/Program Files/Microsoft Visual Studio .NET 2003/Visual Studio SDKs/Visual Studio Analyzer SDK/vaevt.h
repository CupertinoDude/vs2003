

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 6.00.0361 */
/* at Tue Mar 18 18:05:28 2003
 */
/* Compiler settings for vaevt.idl:
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

#ifndef __vaevt_h__
#define __vaevt_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __ISystemDebugEventFire_FWD_DEFINED__
#define __ISystemDebugEventFire_FWD_DEFINED__
typedef interface ISystemDebugEventFire ISystemDebugEventFire;
#endif 	/* __ISystemDebugEventFire_FWD_DEFINED__ */


#ifndef __ISystemDebugEventFireAuto_FWD_DEFINED__
#define __ISystemDebugEventFireAuto_FWD_DEFINED__
typedef interface ISystemDebugEventFireAuto ISystemDebugEventFireAuto;
#endif 	/* __ISystemDebugEventFireAuto_FWD_DEFINED__ */


#ifndef __ISystemDebugEventInstall_FWD_DEFINED__
#define __ISystemDebugEventInstall_FWD_DEFINED__
typedef interface ISystemDebugEventInstall ISystemDebugEventInstall;
#endif 	/* __ISystemDebugEventInstall_FWD_DEFINED__ */


#ifndef __ISystemDebugEventInstall2_FWD_DEFINED__
#define __ISystemDebugEventInstall2_FWD_DEFINED__
typedef interface ISystemDebugEventInstall2 ISystemDebugEventInstall2;
#endif 	/* __ISystemDebugEventInstall2_FWD_DEFINED__ */


#ifndef __ISystemDebugEventInstallAuto_FWD_DEFINED__
#define __ISystemDebugEventInstallAuto_FWD_DEFINED__
typedef interface ISystemDebugEventInstallAuto ISystemDebugEventInstallAuto;
#endif 	/* __ISystemDebugEventInstallAuto_FWD_DEFINED__ */


#ifndef __ISystemDebugEventInstallAuto2_FWD_DEFINED__
#define __ISystemDebugEventInstallAuto2_FWD_DEFINED__
typedef interface ISystemDebugEventInstallAuto2 ISystemDebugEventInstallAuto2;
#endif 	/* __ISystemDebugEventInstallAuto2_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 

void * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void * ); 

#ifndef __ISystemDebugEventFire_INTERFACE_DEFINED__
#define __ISystemDebugEventFire_INTERFACE_DEFINED__

/* interface ISystemDebugEventFire */
/* [object][uuid] */ 

typedef /* [v1_enum] */ 
enum VSAParameterType
    {	cVSAParameterKeyMask	= 0x80000000,
	cVSAParameterKeyString	= 0x80000000,
	cVSAParameterValueMask	= 0x7ffff,
	cVSAParameterValueTypeMask	= 0x70000,
	cVSAParameterValueUnicodeString	= 0,
	cVSAParameterValueANSIString	= 0x10000,
	cVSAParameterValueGUID	= 0x20000,
	cVSAParameterValueDWORD	= 0x30000,
	cVSAParameterValueBYTEArray	= 0x40000,
	cVSAParameterValueLengthMask	= 0xffff
    } 	VSAParameterFlags;

typedef /* [v1_enum] */ 
enum VSAStandardParameter
    {	cVSAStandardParameterDefaultFirst	= 0,
	cVSAStandardParameterSourceMachine	= 0,
	cVSAStandardParameterSourceProcess	= 1,
	cVSAStandardParameterSourceThread	= 2,
	cVSAStandardParameterSourceComponent	= 3,
	cVSAStandardParameterSourceSession	= 4,
	cVSAStandardParameterTargetMachine	= 5,
	cVSAStandardParameterTargetProcess	= 6,
	cVSAStandardParameterTargetThread	= 7,
	cVSAStandardParameterTargetComponent	= 8,
	cVSAStandardParameterTargetSession	= 9,
	cVSAStandardParameterSecurityIdentity	= 10,
	cVSAStandardParameterCausalityID	= 11,
	cVSAStandardParameterSourceProcessName	= 12,
	cVSAStandardParameterTargetProcessName	= 13,
	cVSAStandardParameterDefaultLast	= 13,
	cVSAStandardParameterNoDefault	= 0x4000,
	cVSAStandardParameterSourceHandle	= 0x4000,
	cVSAStandardParameterTargetHandle	= 0x4001,
	cVSAStandardParameterArguments	= 0x4002,
	cVSAStandardParameterReturnValue	= 0x4003,
	cVSAStandardParameterException	= 0x4004,
	cVSAStandardParameterCorrelationID	= 0x4005,
	cVSAStandardParameterDynamicEventData	= 0x4006,
	cVSAStandardParameterNoDefaultLast	= 0x4006
    } 	VSAStandardParameters;

typedef /* [helpstring][v1_enum] */ 
enum eVSAEventFlags
    {	cVSAEventStandard	= 0,
	cVSAEventDefaultSource	= 0x1,
	cVSAEventDefaultTarget	= 0x2,
	cVSAEventWouldFire	= 0x4,
	cVSAEventForceSend	= 0x8,
	cVSAEventBlockIfBufferFull	= 0x10
    } 	VSAEventFlags;

#if defined(__cplusplus)
extern "C++" {
inline VSAEventFlags operator | (const VSAEventFlags &left, const VSAEventFlags &right)
{
  return (VSAEventFlags)((int)left|(int)right);
}
inline VSAEventFlags operator + (const VSAEventFlags &left, const VSAEventFlags &right)
{
  return (VSAEventFlags)((int)left+(int)right);
}
} // extern C++
#endif

EXTERN_C const IID IID_ISystemDebugEventFire;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dC1-AB0D-11d0-A2AD-00A0C90F27E8")
    ISystemDebugEventFire : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE BeginSession( 
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ LPCOLESTR strSessionName) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE EndSession( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE IsActive( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE FireEvent( 
            /* [in] */ REFGUID guidEvent,
            /* [in] */ int nEntries,
            /* [size_is][in] */ PDWORD_PTR rgKeys,
            /* [size_is][in] */ PDWORD_PTR rgValues,
            /* [size_is][in] */ LPDWORD rgTypes,
            /* [in] */ DWORD dwTimeLow,
            /* [in] */ LONG dwTimeHigh,
            /* [in] */ VSAEventFlags dwFlags) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugEventFireVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugEventFire * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugEventFire * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugEventFire * This);
        
        HRESULT ( STDMETHODCALLTYPE *BeginSession )( 
            ISystemDebugEventFire * This,
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ LPCOLESTR strSessionName);
        
        HRESULT ( STDMETHODCALLTYPE *EndSession )( 
            ISystemDebugEventFire * This);
        
        HRESULT ( STDMETHODCALLTYPE *IsActive )( 
            ISystemDebugEventFire * This);
        
        HRESULT ( STDMETHODCALLTYPE *FireEvent )( 
            ISystemDebugEventFire * This,
            /* [in] */ REFGUID guidEvent,
            /* [in] */ int nEntries,
            /* [size_is][in] */ PDWORD_PTR rgKeys,
            /* [size_is][in] */ PDWORD_PTR rgValues,
            /* [size_is][in] */ LPDWORD rgTypes,
            /* [in] */ DWORD dwTimeLow,
            /* [in] */ LONG dwTimeHigh,
            /* [in] */ VSAEventFlags dwFlags);
        
        END_INTERFACE
    } ISystemDebugEventFireVtbl;

    interface ISystemDebugEventFire
    {
        CONST_VTBL struct ISystemDebugEventFireVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugEventFire_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugEventFire_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugEventFire_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugEventFire_BeginSession(This,guidSourceID,strSessionName)	\
    (This)->lpVtbl -> BeginSession(This,guidSourceID,strSessionName)

#define ISystemDebugEventFire_EndSession(This)	\
    (This)->lpVtbl -> EndSession(This)

#define ISystemDebugEventFire_IsActive(This)	\
    (This)->lpVtbl -> IsActive(This)

#define ISystemDebugEventFire_FireEvent(This,guidEvent,nEntries,rgKeys,rgValues,rgTypes,dwTimeLow,dwTimeHigh,dwFlags)	\
    (This)->lpVtbl -> FireEvent(This,guidEvent,nEntries,rgKeys,rgValues,rgTypes,dwTimeLow,dwTimeHigh,dwFlags)

#endif /* COBJMACROS */


#endif 	/* C style interface */



HRESULT STDMETHODCALLTYPE ISystemDebugEventFire_BeginSession_Proxy( 
    ISystemDebugEventFire * This,
    /* [in] */ REFGUID guidSourceID,
    /* [in] */ LPCOLESTR strSessionName);


void __RPC_STUB ISystemDebugEventFire_BeginSession_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugEventFire_EndSession_Proxy( 
    ISystemDebugEventFire * This);


void __RPC_STUB ISystemDebugEventFire_EndSession_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugEventFire_IsActive_Proxy( 
    ISystemDebugEventFire * This);


void __RPC_STUB ISystemDebugEventFire_IsActive_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugEventFire_FireEvent_Proxy( 
    ISystemDebugEventFire * This,
    /* [in] */ REFGUID guidEvent,
    /* [in] */ int nEntries,
    /* [size_is][in] */ PDWORD_PTR rgKeys,
    /* [size_is][in] */ PDWORD_PTR rgValues,
    /* [size_is][in] */ LPDWORD rgTypes,
    /* [in] */ DWORD dwTimeLow,
    /* [in] */ LONG dwTimeHigh,
    /* [in] */ VSAEventFlags dwFlags);


void __RPC_STUB ISystemDebugEventFire_FireEvent_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugEventFire_INTERFACE_DEFINED__ */


#ifndef __ISystemDebugEventFireAuto_INTERFACE_DEFINED__
#define __ISystemDebugEventFireAuto_INTERFACE_DEFINED__

/* interface ISystemDebugEventFireAuto */
/* [object][helpstring][uuid] */ 


EXTERN_C const IID IID_ISystemDebugEventFireAuto;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dee-AB0e-11d0-A2AD-00A0C90F27E8")
    ISystemDebugEventFireAuto : public IUnknown
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE BeginSession( 
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR strSessionName) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE EndSession( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE IsActive( 
            /* [out] */ VARIANT_BOOL *pbIsActive) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE FireEvent( 
            /* [in] */ BSTR guidEvent,
            /* [in] */ VARIANT rgKeys,
            /* [in] */ VARIANT rgValues,
            /* [in] */ long rgCount,
            /* [in] */ VSAEventFlags dwFlags) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugEventFireAutoVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugEventFireAuto * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugEventFireAuto * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugEventFireAuto * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *BeginSession )( 
            ISystemDebugEventFireAuto * This,
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR strSessionName);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EndSession )( 
            ISystemDebugEventFireAuto * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *IsActive )( 
            ISystemDebugEventFireAuto * This,
            /* [out] */ VARIANT_BOOL *pbIsActive);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *FireEvent )( 
            ISystemDebugEventFireAuto * This,
            /* [in] */ BSTR guidEvent,
            /* [in] */ VARIANT rgKeys,
            /* [in] */ VARIANT rgValues,
            /* [in] */ long rgCount,
            /* [in] */ VSAEventFlags dwFlags);
        
        END_INTERFACE
    } ISystemDebugEventFireAutoVtbl;

    interface ISystemDebugEventFireAuto
    {
        CONST_VTBL struct ISystemDebugEventFireAutoVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugEventFireAuto_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugEventFireAuto_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugEventFireAuto_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugEventFireAuto_BeginSession(This,guidSourceID,strSessionName)	\
    (This)->lpVtbl -> BeginSession(This,guidSourceID,strSessionName)

#define ISystemDebugEventFireAuto_EndSession(This)	\
    (This)->lpVtbl -> EndSession(This)

#define ISystemDebugEventFireAuto_IsActive(This,pbIsActive)	\
    (This)->lpVtbl -> IsActive(This,pbIsActive)

#define ISystemDebugEventFireAuto_FireEvent(This,guidEvent,rgKeys,rgValues,rgCount,dwFlags)	\
    (This)->lpVtbl -> FireEvent(This,guidEvent,rgKeys,rgValues,rgCount,dwFlags)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventFireAuto_BeginSession_Proxy( 
    ISystemDebugEventFireAuto * This,
    /* [in] */ BSTR guidSourceID,
    /* [in] */ BSTR strSessionName);


void __RPC_STUB ISystemDebugEventFireAuto_BeginSession_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventFireAuto_EndSession_Proxy( 
    ISystemDebugEventFireAuto * This);


void __RPC_STUB ISystemDebugEventFireAuto_EndSession_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventFireAuto_IsActive_Proxy( 
    ISystemDebugEventFireAuto * This,
    /* [out] */ VARIANT_BOOL *pbIsActive);


void __RPC_STUB ISystemDebugEventFireAuto_IsActive_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventFireAuto_FireEvent_Proxy( 
    ISystemDebugEventFireAuto * This,
    /* [in] */ BSTR guidEvent,
    /* [in] */ VARIANT rgKeys,
    /* [in] */ VARIANT rgValues,
    /* [in] */ long rgCount,
    /* [in] */ VSAEventFlags dwFlags);


void __RPC_STUB ISystemDebugEventFireAuto_FireEvent_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugEventFireAuto_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_vaevt_0258 */
/* [local] */ 


enum __MIDL___MIDL_itf_vaevt_0258_0001
    {	DEBUG_EVENT_TYPE_FIRST	= 0,
	DEBUG_EVENT_TYPE_OUTBOUND	= 0,
	DEBUG_EVENT_TYPE_INBOUND	= 1,
	DEBUG_EVENT_TYPE_GENERIC	= 2,
	DEBUG_EVENT_TYPE_DEFAULT	= 2,
	DEBUG_EVENT_TYPE_MEASURED	= 3,
	DEBUG_EVENT_TYPE_BEGIN	= 4,
	DEBUG_EVENT_TYPE_END	= 5,
	DEBUG_EVENT_TYPE_LAST	= 5
    } ;


extern RPC_IF_HANDLE __MIDL_itf_vaevt_0258_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_vaevt_0258_v0_0_s_ifspec;

#ifndef __ISystemDebugEventInstall_INTERFACE_DEFINED__
#define __ISystemDebugEventInstall_INTERFACE_DEFINED__

/* interface ISystemDebugEventInstall */
/* [object][uuid] */ 


EXTERN_C const IID IID_ISystemDebugEventInstall;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dC0-AB0D-11d0-A2AD-00A0C90F27E8")
    ISystemDebugEventInstall : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE RegisterSource( 
            /* [in] */ LPCOLESTR strVisibleName,
            /* [in] */ REFGUID guidSourceID) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE IsSourceRegistered( 
            /* [in] */ REFGUID guidSourceID) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE RegisterStockEvent( 
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ REFGUID guidEventID) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE RegisterCustomEvent( 
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ REFGUID guidEventID,
            /* [in] */ LPCOLESTR strVisibleName,
            /* [in] */ LPCOLESTR strDescription,
            /* [in] */ long nEventType,
            /* [in] */ REFGUID guidCategory,
            /* [in] */ LPCOLESTR strIconFile,
            /* [in] */ long nIcon) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE RegisterEventCategory( 
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ REFGUID guidCategoryID,
            /* [in] */ REFGUID guidParentID,
            /* [in] */ LPCOLESTR strVisibleName,
            /* [in] */ LPCOLESTR strDescription,
            /* [in] */ LPCOLESTR strIconFile,
            /* [in] */ long nIcon) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE UnRegisterSource( 
            /* [in] */ REFGUID guidSourceID) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE RegisterDynamicSource( 
            /* [in] */ LPCOLESTR strVisibleName,
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ LPCOLESTR strDescription,
            /* [in] */ REFGUID guidClsid,
            /* [in] */ long inproc) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE UnRegisterDynamicSource( 
            /* [in] */ REFGUID guidSourceID) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE IsDynamicSourceRegistered( 
            /* [in] */ REFGUID guidSourceID) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugEventInstallVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugEventInstall * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugEventInstall * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugEventInstall * This);
        
        HRESULT ( STDMETHODCALLTYPE *RegisterSource )( 
            ISystemDebugEventInstall * This,
            /* [in] */ LPCOLESTR strVisibleName,
            /* [in] */ REFGUID guidSourceID);
        
        HRESULT ( STDMETHODCALLTYPE *IsSourceRegistered )( 
            ISystemDebugEventInstall * This,
            /* [in] */ REFGUID guidSourceID);
        
        HRESULT ( STDMETHODCALLTYPE *RegisterStockEvent )( 
            ISystemDebugEventInstall * This,
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ REFGUID guidEventID);
        
        HRESULT ( STDMETHODCALLTYPE *RegisterCustomEvent )( 
            ISystemDebugEventInstall * This,
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ REFGUID guidEventID,
            /* [in] */ LPCOLESTR strVisibleName,
            /* [in] */ LPCOLESTR strDescription,
            /* [in] */ long nEventType,
            /* [in] */ REFGUID guidCategory,
            /* [in] */ LPCOLESTR strIconFile,
            /* [in] */ long nIcon);
        
        HRESULT ( STDMETHODCALLTYPE *RegisterEventCategory )( 
            ISystemDebugEventInstall * This,
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ REFGUID guidCategoryID,
            /* [in] */ REFGUID guidParentID,
            /* [in] */ LPCOLESTR strVisibleName,
            /* [in] */ LPCOLESTR strDescription,
            /* [in] */ LPCOLESTR strIconFile,
            /* [in] */ long nIcon);
        
        HRESULT ( STDMETHODCALLTYPE *UnRegisterSource )( 
            ISystemDebugEventInstall * This,
            /* [in] */ REFGUID guidSourceID);
        
        HRESULT ( STDMETHODCALLTYPE *RegisterDynamicSource )( 
            ISystemDebugEventInstall * This,
            /* [in] */ LPCOLESTR strVisibleName,
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ LPCOLESTR strDescription,
            /* [in] */ REFGUID guidClsid,
            /* [in] */ long inproc);
        
        HRESULT ( STDMETHODCALLTYPE *UnRegisterDynamicSource )( 
            ISystemDebugEventInstall * This,
            /* [in] */ REFGUID guidSourceID);
        
        HRESULT ( STDMETHODCALLTYPE *IsDynamicSourceRegistered )( 
            ISystemDebugEventInstall * This,
            /* [in] */ REFGUID guidSourceID);
        
        END_INTERFACE
    } ISystemDebugEventInstallVtbl;

    interface ISystemDebugEventInstall
    {
        CONST_VTBL struct ISystemDebugEventInstallVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugEventInstall_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugEventInstall_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugEventInstall_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugEventInstall_RegisterSource(This,strVisibleName,guidSourceID)	\
    (This)->lpVtbl -> RegisterSource(This,strVisibleName,guidSourceID)

#define ISystemDebugEventInstall_IsSourceRegistered(This,guidSourceID)	\
    (This)->lpVtbl -> IsSourceRegistered(This,guidSourceID)

#define ISystemDebugEventInstall_RegisterStockEvent(This,guidSourceID,guidEventID)	\
    (This)->lpVtbl -> RegisterStockEvent(This,guidSourceID,guidEventID)

#define ISystemDebugEventInstall_RegisterCustomEvent(This,guidSourceID,guidEventID,strVisibleName,strDescription,nEventType,guidCategory,strIconFile,nIcon)	\
    (This)->lpVtbl -> RegisterCustomEvent(This,guidSourceID,guidEventID,strVisibleName,strDescription,nEventType,guidCategory,strIconFile,nIcon)

#define ISystemDebugEventInstall_RegisterEventCategory(This,guidSourceID,guidCategoryID,guidParentID,strVisibleName,strDescription,strIconFile,nIcon)	\
    (This)->lpVtbl -> RegisterEventCategory(This,guidSourceID,guidCategoryID,guidParentID,strVisibleName,strDescription,strIconFile,nIcon)

#define ISystemDebugEventInstall_UnRegisterSource(This,guidSourceID)	\
    (This)->lpVtbl -> UnRegisterSource(This,guidSourceID)

#define ISystemDebugEventInstall_RegisterDynamicSource(This,strVisibleName,guidSourceID,strDescription,guidClsid,inproc)	\
    (This)->lpVtbl -> RegisterDynamicSource(This,strVisibleName,guidSourceID,strDescription,guidClsid,inproc)

#define ISystemDebugEventInstall_UnRegisterDynamicSource(This,guidSourceID)	\
    (This)->lpVtbl -> UnRegisterDynamicSource(This,guidSourceID)

#define ISystemDebugEventInstall_IsDynamicSourceRegistered(This,guidSourceID)	\
    (This)->lpVtbl -> IsDynamicSourceRegistered(This,guidSourceID)

#endif /* COBJMACROS */


#endif 	/* C style interface */



HRESULT STDMETHODCALLTYPE ISystemDebugEventInstall_RegisterSource_Proxy( 
    ISystemDebugEventInstall * This,
    /* [in] */ LPCOLESTR strVisibleName,
    /* [in] */ REFGUID guidSourceID);


void __RPC_STUB ISystemDebugEventInstall_RegisterSource_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugEventInstall_IsSourceRegistered_Proxy( 
    ISystemDebugEventInstall * This,
    /* [in] */ REFGUID guidSourceID);


void __RPC_STUB ISystemDebugEventInstall_IsSourceRegistered_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugEventInstall_RegisterStockEvent_Proxy( 
    ISystemDebugEventInstall * This,
    /* [in] */ REFGUID guidSourceID,
    /* [in] */ REFGUID guidEventID);


void __RPC_STUB ISystemDebugEventInstall_RegisterStockEvent_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugEventInstall_RegisterCustomEvent_Proxy( 
    ISystemDebugEventInstall * This,
    /* [in] */ REFGUID guidSourceID,
    /* [in] */ REFGUID guidEventID,
    /* [in] */ LPCOLESTR strVisibleName,
    /* [in] */ LPCOLESTR strDescription,
    /* [in] */ long nEventType,
    /* [in] */ REFGUID guidCategory,
    /* [in] */ LPCOLESTR strIconFile,
    /* [in] */ long nIcon);


void __RPC_STUB ISystemDebugEventInstall_RegisterCustomEvent_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugEventInstall_RegisterEventCategory_Proxy( 
    ISystemDebugEventInstall * This,
    /* [in] */ REFGUID guidSourceID,
    /* [in] */ REFGUID guidCategoryID,
    /* [in] */ REFGUID guidParentID,
    /* [in] */ LPCOLESTR strVisibleName,
    /* [in] */ LPCOLESTR strDescription,
    /* [in] */ LPCOLESTR strIconFile,
    /* [in] */ long nIcon);


void __RPC_STUB ISystemDebugEventInstall_RegisterEventCategory_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugEventInstall_UnRegisterSource_Proxy( 
    ISystemDebugEventInstall * This,
    /* [in] */ REFGUID guidSourceID);


void __RPC_STUB ISystemDebugEventInstall_UnRegisterSource_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugEventInstall_RegisterDynamicSource_Proxy( 
    ISystemDebugEventInstall * This,
    /* [in] */ LPCOLESTR strVisibleName,
    /* [in] */ REFGUID guidSourceID,
    /* [in] */ LPCOLESTR strDescription,
    /* [in] */ REFGUID guidClsid,
    /* [in] */ long inproc);


void __RPC_STUB ISystemDebugEventInstall_RegisterDynamicSource_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugEventInstall_UnRegisterDynamicSource_Proxy( 
    ISystemDebugEventInstall * This,
    /* [in] */ REFGUID guidSourceID);


void __RPC_STUB ISystemDebugEventInstall_UnRegisterDynamicSource_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugEventInstall_IsDynamicSourceRegistered_Proxy( 
    ISystemDebugEventInstall * This,
    /* [in] */ REFGUID guidSourceID);


void __RPC_STUB ISystemDebugEventInstall_IsDynamicSourceRegistered_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugEventInstall_INTERFACE_DEFINED__ */


#ifndef __ISystemDebugEventInstall2_INTERFACE_DEFINED__
#define __ISystemDebugEventInstall2_INTERFACE_DEFINED__

/* interface ISystemDebugEventInstall2 */
/* [object][uuid] */ 


EXTERN_C const IID IID_ISystemDebugEventInstall2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("94B963ED-E6D6-4042-AD16-6EF52B087E5B")
    ISystemDebugEventInstall2 : public ISystemDebugEventInstall
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE RegisterCustomEvent2( 
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ REFGUID guidEventID,
            /* [in] */ LPCOLESTR strVisibleName,
            /* [in] */ LPCOLESTR strDescription,
            /* [in] */ long nEventType,
            /* [in] */ REFGUID guidCategory,
            /* [in] */ LPCOLESTR strIconFile,
            /* [in] */ long nIcon,
            /* [in] */ LPCOLESTR strWMIClassName) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE RegisterEventCategory2( 
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ REFGUID guidCategoryID,
            /* [in] */ REFGUID guidParentID,
            /* [in] */ LPCOLESTR strVisibleName,
            /* [in] */ LPCOLESTR strDescription,
            /* [in] */ LPCOLESTR strIconFile,
            /* [in] */ long nIcon,
            /* [in] */ LPCOLESTR strWMIClassName) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugEventInstall2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugEventInstall2 * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugEventInstall2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugEventInstall2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *RegisterSource )( 
            ISystemDebugEventInstall2 * This,
            /* [in] */ LPCOLESTR strVisibleName,
            /* [in] */ REFGUID guidSourceID);
        
        HRESULT ( STDMETHODCALLTYPE *IsSourceRegistered )( 
            ISystemDebugEventInstall2 * This,
            /* [in] */ REFGUID guidSourceID);
        
        HRESULT ( STDMETHODCALLTYPE *RegisterStockEvent )( 
            ISystemDebugEventInstall2 * This,
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ REFGUID guidEventID);
        
        HRESULT ( STDMETHODCALLTYPE *RegisterCustomEvent )( 
            ISystemDebugEventInstall2 * This,
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ REFGUID guidEventID,
            /* [in] */ LPCOLESTR strVisibleName,
            /* [in] */ LPCOLESTR strDescription,
            /* [in] */ long nEventType,
            /* [in] */ REFGUID guidCategory,
            /* [in] */ LPCOLESTR strIconFile,
            /* [in] */ long nIcon);
        
        HRESULT ( STDMETHODCALLTYPE *RegisterEventCategory )( 
            ISystemDebugEventInstall2 * This,
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ REFGUID guidCategoryID,
            /* [in] */ REFGUID guidParentID,
            /* [in] */ LPCOLESTR strVisibleName,
            /* [in] */ LPCOLESTR strDescription,
            /* [in] */ LPCOLESTR strIconFile,
            /* [in] */ long nIcon);
        
        HRESULT ( STDMETHODCALLTYPE *UnRegisterSource )( 
            ISystemDebugEventInstall2 * This,
            /* [in] */ REFGUID guidSourceID);
        
        HRESULT ( STDMETHODCALLTYPE *RegisterDynamicSource )( 
            ISystemDebugEventInstall2 * This,
            /* [in] */ LPCOLESTR strVisibleName,
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ LPCOLESTR strDescription,
            /* [in] */ REFGUID guidClsid,
            /* [in] */ long inproc);
        
        HRESULT ( STDMETHODCALLTYPE *UnRegisterDynamicSource )( 
            ISystemDebugEventInstall2 * This,
            /* [in] */ REFGUID guidSourceID);
        
        HRESULT ( STDMETHODCALLTYPE *IsDynamicSourceRegistered )( 
            ISystemDebugEventInstall2 * This,
            /* [in] */ REFGUID guidSourceID);
        
        HRESULT ( STDMETHODCALLTYPE *RegisterCustomEvent2 )( 
            ISystemDebugEventInstall2 * This,
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ REFGUID guidEventID,
            /* [in] */ LPCOLESTR strVisibleName,
            /* [in] */ LPCOLESTR strDescription,
            /* [in] */ long nEventType,
            /* [in] */ REFGUID guidCategory,
            /* [in] */ LPCOLESTR strIconFile,
            /* [in] */ long nIcon,
            /* [in] */ LPCOLESTR strWMIClassName);
        
        HRESULT ( STDMETHODCALLTYPE *RegisterEventCategory2 )( 
            ISystemDebugEventInstall2 * This,
            /* [in] */ REFGUID guidSourceID,
            /* [in] */ REFGUID guidCategoryID,
            /* [in] */ REFGUID guidParentID,
            /* [in] */ LPCOLESTR strVisibleName,
            /* [in] */ LPCOLESTR strDescription,
            /* [in] */ LPCOLESTR strIconFile,
            /* [in] */ long nIcon,
            /* [in] */ LPCOLESTR strWMIClassName);
        
        END_INTERFACE
    } ISystemDebugEventInstall2Vtbl;

    interface ISystemDebugEventInstall2
    {
        CONST_VTBL struct ISystemDebugEventInstall2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugEventInstall2_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugEventInstall2_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugEventInstall2_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugEventInstall2_RegisterSource(This,strVisibleName,guidSourceID)	\
    (This)->lpVtbl -> RegisterSource(This,strVisibleName,guidSourceID)

#define ISystemDebugEventInstall2_IsSourceRegistered(This,guidSourceID)	\
    (This)->lpVtbl -> IsSourceRegistered(This,guidSourceID)

#define ISystemDebugEventInstall2_RegisterStockEvent(This,guidSourceID,guidEventID)	\
    (This)->lpVtbl -> RegisterStockEvent(This,guidSourceID,guidEventID)

#define ISystemDebugEventInstall2_RegisterCustomEvent(This,guidSourceID,guidEventID,strVisibleName,strDescription,nEventType,guidCategory,strIconFile,nIcon)	\
    (This)->lpVtbl -> RegisterCustomEvent(This,guidSourceID,guidEventID,strVisibleName,strDescription,nEventType,guidCategory,strIconFile,nIcon)

#define ISystemDebugEventInstall2_RegisterEventCategory(This,guidSourceID,guidCategoryID,guidParentID,strVisibleName,strDescription,strIconFile,nIcon)	\
    (This)->lpVtbl -> RegisterEventCategory(This,guidSourceID,guidCategoryID,guidParentID,strVisibleName,strDescription,strIconFile,nIcon)

#define ISystemDebugEventInstall2_UnRegisterSource(This,guidSourceID)	\
    (This)->lpVtbl -> UnRegisterSource(This,guidSourceID)

#define ISystemDebugEventInstall2_RegisterDynamicSource(This,strVisibleName,guidSourceID,strDescription,guidClsid,inproc)	\
    (This)->lpVtbl -> RegisterDynamicSource(This,strVisibleName,guidSourceID,strDescription,guidClsid,inproc)

#define ISystemDebugEventInstall2_UnRegisterDynamicSource(This,guidSourceID)	\
    (This)->lpVtbl -> UnRegisterDynamicSource(This,guidSourceID)

#define ISystemDebugEventInstall2_IsDynamicSourceRegistered(This,guidSourceID)	\
    (This)->lpVtbl -> IsDynamicSourceRegistered(This,guidSourceID)


#define ISystemDebugEventInstall2_RegisterCustomEvent2(This,guidSourceID,guidEventID,strVisibleName,strDescription,nEventType,guidCategory,strIconFile,nIcon,strWMIClassName)	\
    (This)->lpVtbl -> RegisterCustomEvent2(This,guidSourceID,guidEventID,strVisibleName,strDescription,nEventType,guidCategory,strIconFile,nIcon,strWMIClassName)

#define ISystemDebugEventInstall2_RegisterEventCategory2(This,guidSourceID,guidCategoryID,guidParentID,strVisibleName,strDescription,strIconFile,nIcon,strWMIClassName)	\
    (This)->lpVtbl -> RegisterEventCategory2(This,guidSourceID,guidCategoryID,guidParentID,strVisibleName,strDescription,strIconFile,nIcon,strWMIClassName)

#endif /* COBJMACROS */


#endif 	/* C style interface */



HRESULT STDMETHODCALLTYPE ISystemDebugEventInstall2_RegisterCustomEvent2_Proxy( 
    ISystemDebugEventInstall2 * This,
    /* [in] */ REFGUID guidSourceID,
    /* [in] */ REFGUID guidEventID,
    /* [in] */ LPCOLESTR strVisibleName,
    /* [in] */ LPCOLESTR strDescription,
    /* [in] */ long nEventType,
    /* [in] */ REFGUID guidCategory,
    /* [in] */ LPCOLESTR strIconFile,
    /* [in] */ long nIcon,
    /* [in] */ LPCOLESTR strWMIClassName);


void __RPC_STUB ISystemDebugEventInstall2_RegisterCustomEvent2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE ISystemDebugEventInstall2_RegisterEventCategory2_Proxy( 
    ISystemDebugEventInstall2 * This,
    /* [in] */ REFGUID guidSourceID,
    /* [in] */ REFGUID guidCategoryID,
    /* [in] */ REFGUID guidParentID,
    /* [in] */ LPCOLESTR strVisibleName,
    /* [in] */ LPCOLESTR strDescription,
    /* [in] */ LPCOLESTR strIconFile,
    /* [in] */ long nIcon,
    /* [in] */ LPCOLESTR strWMIClassName);


void __RPC_STUB ISystemDebugEventInstall2_RegisterEventCategory2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugEventInstall2_INTERFACE_DEFINED__ */


#ifndef __ISystemDebugEventInstallAuto_INTERFACE_DEFINED__
#define __ISystemDebugEventInstallAuto_INTERFACE_DEFINED__

/* interface ISystemDebugEventInstallAuto */
/* [object][helpstring][uuid] */ 


EXTERN_C const IID IID_ISystemDebugEventInstallAuto;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736ded-AB0D-11d0-A2AD-00A0C90F27E8")
    ISystemDebugEventInstallAuto : public IUnknown
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RegisterSource( 
            /* [in] */ BSTR strVisibleName,
            /* [in] */ BSTR guidSourceID) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE IsSourceRegistered( 
            /* [in] */ BSTR guidSourceID,
            /* [out] */ VARIANT_BOOL *pbIsRegistered) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RegisterStockEvent( 
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR guidEventID) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RegisterCustomEvent( 
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR guidEventID,
            /* [in] */ BSTR strVisibleName,
            /* [in] */ BSTR strDescription,
            /* [in] */ long nEventType,
            /* [in] */ BSTR guidCategory,
            /* [in] */ BSTR strIconFile,
            /* [in] */ long nIcon) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RegisterEventCategory( 
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR guidCategoryID,
            /* [in] */ BSTR guidParentID,
            /* [in] */ BSTR strVisibleName,
            /* [in] */ BSTR strDescription,
            /* [in] */ BSTR strIconFile,
            /* [in] */ long nIcon) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE UnRegisterSource( 
            /* [in] */ BSTR guidSourceID) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RegisterDynamicSource( 
            /* [in] */ BSTR strVisibleName,
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR strDescription,
            /* [in] */ BSTR guidClsid,
            /* [in] */ long inproc) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE UnRegisterDynamicSource( 
            /* [in] */ BSTR guidSourceID) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE IsDynamicSourceRegistered( 
            /* [in] */ BSTR guidSourceID,
            /* [out] */ VARIANT_BOOL *boolRegistered) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugEventInstallAutoVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugEventInstallAuto * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugEventInstallAuto * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugEventInstallAuto * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RegisterSource )( 
            ISystemDebugEventInstallAuto * This,
            /* [in] */ BSTR strVisibleName,
            /* [in] */ BSTR guidSourceID);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *IsSourceRegistered )( 
            ISystemDebugEventInstallAuto * This,
            /* [in] */ BSTR guidSourceID,
            /* [out] */ VARIANT_BOOL *pbIsRegistered);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RegisterStockEvent )( 
            ISystemDebugEventInstallAuto * This,
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR guidEventID);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RegisterCustomEvent )( 
            ISystemDebugEventInstallAuto * This,
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR guidEventID,
            /* [in] */ BSTR strVisibleName,
            /* [in] */ BSTR strDescription,
            /* [in] */ long nEventType,
            /* [in] */ BSTR guidCategory,
            /* [in] */ BSTR strIconFile,
            /* [in] */ long nIcon);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RegisterEventCategory )( 
            ISystemDebugEventInstallAuto * This,
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR guidCategoryID,
            /* [in] */ BSTR guidParentID,
            /* [in] */ BSTR strVisibleName,
            /* [in] */ BSTR strDescription,
            /* [in] */ BSTR strIconFile,
            /* [in] */ long nIcon);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *UnRegisterSource )( 
            ISystemDebugEventInstallAuto * This,
            /* [in] */ BSTR guidSourceID);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RegisterDynamicSource )( 
            ISystemDebugEventInstallAuto * This,
            /* [in] */ BSTR strVisibleName,
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR strDescription,
            /* [in] */ BSTR guidClsid,
            /* [in] */ long inproc);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *UnRegisterDynamicSource )( 
            ISystemDebugEventInstallAuto * This,
            /* [in] */ BSTR guidSourceID);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *IsDynamicSourceRegistered )( 
            ISystemDebugEventInstallAuto * This,
            /* [in] */ BSTR guidSourceID,
            /* [out] */ VARIANT_BOOL *boolRegistered);
        
        END_INTERFACE
    } ISystemDebugEventInstallAutoVtbl;

    interface ISystemDebugEventInstallAuto
    {
        CONST_VTBL struct ISystemDebugEventInstallAutoVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugEventInstallAuto_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugEventInstallAuto_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugEventInstallAuto_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugEventInstallAuto_RegisterSource(This,strVisibleName,guidSourceID)	\
    (This)->lpVtbl -> RegisterSource(This,strVisibleName,guidSourceID)

#define ISystemDebugEventInstallAuto_IsSourceRegistered(This,guidSourceID,pbIsRegistered)	\
    (This)->lpVtbl -> IsSourceRegistered(This,guidSourceID,pbIsRegistered)

#define ISystemDebugEventInstallAuto_RegisterStockEvent(This,guidSourceID,guidEventID)	\
    (This)->lpVtbl -> RegisterStockEvent(This,guidSourceID,guidEventID)

#define ISystemDebugEventInstallAuto_RegisterCustomEvent(This,guidSourceID,guidEventID,strVisibleName,strDescription,nEventType,guidCategory,strIconFile,nIcon)	\
    (This)->lpVtbl -> RegisterCustomEvent(This,guidSourceID,guidEventID,strVisibleName,strDescription,nEventType,guidCategory,strIconFile,nIcon)

#define ISystemDebugEventInstallAuto_RegisterEventCategory(This,guidSourceID,guidCategoryID,guidParentID,strVisibleName,strDescription,strIconFile,nIcon)	\
    (This)->lpVtbl -> RegisterEventCategory(This,guidSourceID,guidCategoryID,guidParentID,strVisibleName,strDescription,strIconFile,nIcon)

#define ISystemDebugEventInstallAuto_UnRegisterSource(This,guidSourceID)	\
    (This)->lpVtbl -> UnRegisterSource(This,guidSourceID)

#define ISystemDebugEventInstallAuto_RegisterDynamicSource(This,strVisibleName,guidSourceID,strDescription,guidClsid,inproc)	\
    (This)->lpVtbl -> RegisterDynamicSource(This,strVisibleName,guidSourceID,strDescription,guidClsid,inproc)

#define ISystemDebugEventInstallAuto_UnRegisterDynamicSource(This,guidSourceID)	\
    (This)->lpVtbl -> UnRegisterDynamicSource(This,guidSourceID)

#define ISystemDebugEventInstallAuto_IsDynamicSourceRegistered(This,guidSourceID,boolRegistered)	\
    (This)->lpVtbl -> IsDynamicSourceRegistered(This,guidSourceID,boolRegistered)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventInstallAuto_RegisterSource_Proxy( 
    ISystemDebugEventInstallAuto * This,
    /* [in] */ BSTR strVisibleName,
    /* [in] */ BSTR guidSourceID);


void __RPC_STUB ISystemDebugEventInstallAuto_RegisterSource_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventInstallAuto_IsSourceRegistered_Proxy( 
    ISystemDebugEventInstallAuto * This,
    /* [in] */ BSTR guidSourceID,
    /* [out] */ VARIANT_BOOL *pbIsRegistered);


void __RPC_STUB ISystemDebugEventInstallAuto_IsSourceRegistered_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventInstallAuto_RegisterStockEvent_Proxy( 
    ISystemDebugEventInstallAuto * This,
    /* [in] */ BSTR guidSourceID,
    /* [in] */ BSTR guidEventID);


void __RPC_STUB ISystemDebugEventInstallAuto_RegisterStockEvent_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventInstallAuto_RegisterCustomEvent_Proxy( 
    ISystemDebugEventInstallAuto * This,
    /* [in] */ BSTR guidSourceID,
    /* [in] */ BSTR guidEventID,
    /* [in] */ BSTR strVisibleName,
    /* [in] */ BSTR strDescription,
    /* [in] */ long nEventType,
    /* [in] */ BSTR guidCategory,
    /* [in] */ BSTR strIconFile,
    /* [in] */ long nIcon);


void __RPC_STUB ISystemDebugEventInstallAuto_RegisterCustomEvent_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventInstallAuto_RegisterEventCategory_Proxy( 
    ISystemDebugEventInstallAuto * This,
    /* [in] */ BSTR guidSourceID,
    /* [in] */ BSTR guidCategoryID,
    /* [in] */ BSTR guidParentID,
    /* [in] */ BSTR strVisibleName,
    /* [in] */ BSTR strDescription,
    /* [in] */ BSTR strIconFile,
    /* [in] */ long nIcon);


void __RPC_STUB ISystemDebugEventInstallAuto_RegisterEventCategory_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventInstallAuto_UnRegisterSource_Proxy( 
    ISystemDebugEventInstallAuto * This,
    /* [in] */ BSTR guidSourceID);


void __RPC_STUB ISystemDebugEventInstallAuto_UnRegisterSource_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventInstallAuto_RegisterDynamicSource_Proxy( 
    ISystemDebugEventInstallAuto * This,
    /* [in] */ BSTR strVisibleName,
    /* [in] */ BSTR guidSourceID,
    /* [in] */ BSTR strDescription,
    /* [in] */ BSTR guidClsid,
    /* [in] */ long inproc);


void __RPC_STUB ISystemDebugEventInstallAuto_RegisterDynamicSource_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventInstallAuto_UnRegisterDynamicSource_Proxy( 
    ISystemDebugEventInstallAuto * This,
    /* [in] */ BSTR guidSourceID);


void __RPC_STUB ISystemDebugEventInstallAuto_UnRegisterDynamicSource_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventInstallAuto_IsDynamicSourceRegistered_Proxy( 
    ISystemDebugEventInstallAuto * This,
    /* [in] */ BSTR guidSourceID,
    /* [out] */ VARIANT_BOOL *boolRegistered);


void __RPC_STUB ISystemDebugEventInstallAuto_IsDynamicSourceRegistered_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugEventInstallAuto_INTERFACE_DEFINED__ */


#ifndef __ISystemDebugEventInstallAuto2_INTERFACE_DEFINED__
#define __ISystemDebugEventInstallAuto2_INTERFACE_DEFINED__

/* interface ISystemDebugEventInstallAuto2 */
/* [object][helpstring][uuid] */ 


EXTERN_C const IID IID_ISystemDebugEventInstallAuto2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("74896186-7904-482e-9FA5-9118B1D89F45")
    ISystemDebugEventInstallAuto2 : public ISystemDebugEventInstallAuto
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RegisterCustomEvent2( 
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR guidEventID,
            /* [in] */ BSTR strVisibleName,
            /* [in] */ BSTR strDescription,
            /* [in] */ long nEventType,
            /* [in] */ BSTR guidCategory,
            /* [in] */ BSTR strIconFile,
            /* [in] */ long nIcon,
            /* [in] */ BSTR strWMIClassName) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RegisterEventCategory2( 
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR guidCategoryID,
            /* [in] */ BSTR guidParentID,
            /* [in] */ BSTR strVisibleName,
            /* [in] */ BSTR strDescription,
            /* [in] */ BSTR strIconFile,
            /* [in] */ long nIcon,
            /* [in] */ BSTR strWMIClassName) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDebugEventInstallAuto2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISystemDebugEventInstallAuto2 * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISystemDebugEventInstallAuto2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISystemDebugEventInstallAuto2 * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RegisterSource )( 
            ISystemDebugEventInstallAuto2 * This,
            /* [in] */ BSTR strVisibleName,
            /* [in] */ BSTR guidSourceID);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *IsSourceRegistered )( 
            ISystemDebugEventInstallAuto2 * This,
            /* [in] */ BSTR guidSourceID,
            /* [out] */ VARIANT_BOOL *pbIsRegistered);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RegisterStockEvent )( 
            ISystemDebugEventInstallAuto2 * This,
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR guidEventID);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RegisterCustomEvent )( 
            ISystemDebugEventInstallAuto2 * This,
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR guidEventID,
            /* [in] */ BSTR strVisibleName,
            /* [in] */ BSTR strDescription,
            /* [in] */ long nEventType,
            /* [in] */ BSTR guidCategory,
            /* [in] */ BSTR strIconFile,
            /* [in] */ long nIcon);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RegisterEventCategory )( 
            ISystemDebugEventInstallAuto2 * This,
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR guidCategoryID,
            /* [in] */ BSTR guidParentID,
            /* [in] */ BSTR strVisibleName,
            /* [in] */ BSTR strDescription,
            /* [in] */ BSTR strIconFile,
            /* [in] */ long nIcon);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *UnRegisterSource )( 
            ISystemDebugEventInstallAuto2 * This,
            /* [in] */ BSTR guidSourceID);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RegisterDynamicSource )( 
            ISystemDebugEventInstallAuto2 * This,
            /* [in] */ BSTR strVisibleName,
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR strDescription,
            /* [in] */ BSTR guidClsid,
            /* [in] */ long inproc);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *UnRegisterDynamicSource )( 
            ISystemDebugEventInstallAuto2 * This,
            /* [in] */ BSTR guidSourceID);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *IsDynamicSourceRegistered )( 
            ISystemDebugEventInstallAuto2 * This,
            /* [in] */ BSTR guidSourceID,
            /* [out] */ VARIANT_BOOL *boolRegistered);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RegisterCustomEvent2 )( 
            ISystemDebugEventInstallAuto2 * This,
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR guidEventID,
            /* [in] */ BSTR strVisibleName,
            /* [in] */ BSTR strDescription,
            /* [in] */ long nEventType,
            /* [in] */ BSTR guidCategory,
            /* [in] */ BSTR strIconFile,
            /* [in] */ long nIcon,
            /* [in] */ BSTR strWMIClassName);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RegisterEventCategory2 )( 
            ISystemDebugEventInstallAuto2 * This,
            /* [in] */ BSTR guidSourceID,
            /* [in] */ BSTR guidCategoryID,
            /* [in] */ BSTR guidParentID,
            /* [in] */ BSTR strVisibleName,
            /* [in] */ BSTR strDescription,
            /* [in] */ BSTR strIconFile,
            /* [in] */ long nIcon,
            /* [in] */ BSTR strWMIClassName);
        
        END_INTERFACE
    } ISystemDebugEventInstallAuto2Vtbl;

    interface ISystemDebugEventInstallAuto2
    {
        CONST_VTBL struct ISystemDebugEventInstallAuto2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDebugEventInstallAuto2_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ISystemDebugEventInstallAuto2_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ISystemDebugEventInstallAuto2_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ISystemDebugEventInstallAuto2_RegisterSource(This,strVisibleName,guidSourceID)	\
    (This)->lpVtbl -> RegisterSource(This,strVisibleName,guidSourceID)

#define ISystemDebugEventInstallAuto2_IsSourceRegistered(This,guidSourceID,pbIsRegistered)	\
    (This)->lpVtbl -> IsSourceRegistered(This,guidSourceID,pbIsRegistered)

#define ISystemDebugEventInstallAuto2_RegisterStockEvent(This,guidSourceID,guidEventID)	\
    (This)->lpVtbl -> RegisterStockEvent(This,guidSourceID,guidEventID)

#define ISystemDebugEventInstallAuto2_RegisterCustomEvent(This,guidSourceID,guidEventID,strVisibleName,strDescription,nEventType,guidCategory,strIconFile,nIcon)	\
    (This)->lpVtbl -> RegisterCustomEvent(This,guidSourceID,guidEventID,strVisibleName,strDescription,nEventType,guidCategory,strIconFile,nIcon)

#define ISystemDebugEventInstallAuto2_RegisterEventCategory(This,guidSourceID,guidCategoryID,guidParentID,strVisibleName,strDescription,strIconFile,nIcon)	\
    (This)->lpVtbl -> RegisterEventCategory(This,guidSourceID,guidCategoryID,guidParentID,strVisibleName,strDescription,strIconFile,nIcon)

#define ISystemDebugEventInstallAuto2_UnRegisterSource(This,guidSourceID)	\
    (This)->lpVtbl -> UnRegisterSource(This,guidSourceID)

#define ISystemDebugEventInstallAuto2_RegisterDynamicSource(This,strVisibleName,guidSourceID,strDescription,guidClsid,inproc)	\
    (This)->lpVtbl -> RegisterDynamicSource(This,strVisibleName,guidSourceID,strDescription,guidClsid,inproc)

#define ISystemDebugEventInstallAuto2_UnRegisterDynamicSource(This,guidSourceID)	\
    (This)->lpVtbl -> UnRegisterDynamicSource(This,guidSourceID)

#define ISystemDebugEventInstallAuto2_IsDynamicSourceRegistered(This,guidSourceID,boolRegistered)	\
    (This)->lpVtbl -> IsDynamicSourceRegistered(This,guidSourceID,boolRegistered)


#define ISystemDebugEventInstallAuto2_RegisterCustomEvent2(This,guidSourceID,guidEventID,strVisibleName,strDescription,nEventType,guidCategory,strIconFile,nIcon,strWMIClassName)	\
    (This)->lpVtbl -> RegisterCustomEvent2(This,guidSourceID,guidEventID,strVisibleName,strDescription,nEventType,guidCategory,strIconFile,nIcon,strWMIClassName)

#define ISystemDebugEventInstallAuto2_RegisterEventCategory2(This,guidSourceID,guidCategoryID,guidParentID,strVisibleName,strDescription,strIconFile,nIcon,strWMIClassName)	\
    (This)->lpVtbl -> RegisterEventCategory2(This,guidSourceID,guidCategoryID,guidParentID,strVisibleName,strDescription,strIconFile,nIcon,strWMIClassName)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventInstallAuto2_RegisterCustomEvent2_Proxy( 
    ISystemDebugEventInstallAuto2 * This,
    /* [in] */ BSTR guidSourceID,
    /* [in] */ BSTR guidEventID,
    /* [in] */ BSTR strVisibleName,
    /* [in] */ BSTR strDescription,
    /* [in] */ long nEventType,
    /* [in] */ BSTR guidCategory,
    /* [in] */ BSTR strIconFile,
    /* [in] */ long nIcon,
    /* [in] */ BSTR strWMIClassName);


void __RPC_STUB ISystemDebugEventInstallAuto2_RegisterCustomEvent2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE ISystemDebugEventInstallAuto2_RegisterEventCategory2_Proxy( 
    ISystemDebugEventInstallAuto2 * This,
    /* [in] */ BSTR guidSourceID,
    /* [in] */ BSTR guidCategoryID,
    /* [in] */ BSTR guidParentID,
    /* [in] */ BSTR strVisibleName,
    /* [in] */ BSTR strDescription,
    /* [in] */ BSTR strIconFile,
    /* [in] */ long nIcon,
    /* [in] */ BSTR strWMIClassName);


void __RPC_STUB ISystemDebugEventInstallAuto2_RegisterEventCategory2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ISystemDebugEventInstallAuto2_INTERFACE_DEFINED__ */


/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     unsigned long *, unsigned long            , BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserMarshal(  unsigned long *, unsigned char *, BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserUnmarshal(unsigned long *, unsigned char *, BSTR * ); 
void                      __RPC_USER  BSTR_UserFree(     unsigned long *, BSTR * ); 

unsigned long             __RPC_USER  VARIANT_UserSize(     unsigned long *, unsigned long            , VARIANT * ); 
unsigned char * __RPC_USER  VARIANT_UserMarshal(  unsigned long *, unsigned char *, VARIANT * ); 
unsigned char * __RPC_USER  VARIANT_UserUnmarshal(unsigned long *, unsigned char *, VARIANT * ); 
void                      __RPC_USER  VARIANT_UserFree(     unsigned long *, VARIANT * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


