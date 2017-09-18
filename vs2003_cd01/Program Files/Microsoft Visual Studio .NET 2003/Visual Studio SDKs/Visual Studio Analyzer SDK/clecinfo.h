

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 6.00.0361 */
/* at Tue Mar 18 18:03:43 2003
 */
/* Compiler settings for clecinfo.idl:
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

#ifndef __clecinfo_h__
#define __clecinfo_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __I820b927fcafd11d08a4b00a0c91e2acd_FWD_DEFINED__
#define __I820b927fcafd11d08a4b00a0c91e2acd_FWD_DEFINED__
typedef interface I820b927fcafd11d08a4b00a0c91e2acd I820b927fcafd11d08a4b00a0c91e2acd;
#endif 	/* __I820b927fcafd11d08a4b00a0c91e2acd_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 

void * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void * ); 

/* interface __MIDL_itf_clecinfo_0000 */
/* [local] */ 

struct SystemDebugEventConnectionInfo
    {
    BSTR strMachineName;
    BSTR strUserName;
    BSTR strIPAddress;
    } ;
typedef /* [v1_enum] */ 
enum VSAOsInfo
    {	cVSA_WinNt	= 0x1,
	cVSA_Win9x	= 0x2
    } 	VSAOsInfo;

typedef /* [v1_enum] */ 
enum VSACapabilitiesInfo
    {	cVSA_VsaComEnabled	= 0x1
    } 	VSACapabilitiesInfo;

struct SystemDebugEventPlatformInfo
    {
    DWORD dwOsInfo;
    DWORD dwCapabilities;
    } ;
struct SystemDebugEventCategory
    {
    GUID guidSourceID;
    GUID guidCategoryID;
    GUID guidParentID;
    BSTR strVisibleName;
    BSTR strDescription;
    BSTR strDisplayName;
    int nSizeIconData;
    /* [size_is] */ BYTE *pIconData;
    } ;
struct SystemDebugEventType
    {
    GUID guidSourceID;
    GUID guidEventID;
    BSTR strVisibleName;
    BSTR strDescription;
    BSTR strDisplayName;
    long nEventType;
    GUID guidCategoryID;
    int nSizeIconData;
    /* [size_is] */ BYTE *pIconData;
    } ;
struct SystemDebugEventSource
    {
    BSTR strVisibleName;
    GUID guidSourceID;
    int iSourceStatus;
    } ;
struct SystemDebugProcess
    {
    BSTR strVisibleName;
    int pid;
    } ;
struct SystemDebugThread
    {
    BSTR strVisibleName;
    int pid;
    int tid;
    int nStartOrder;
    } ;


extern RPC_IF_HANDLE __MIDL_itf_clecinfo_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_clecinfo_0000_v0_0_s_ifspec;

#ifndef __I820b927fcafd11d08a4b00a0c91e2acd_INTERFACE_DEFINED__
#define __I820b927fcafd11d08a4b00a0c91e2acd_INTERFACE_DEFINED__

/* interface I820b927fcafd11d08a4b00a0c91e2acd */
/* [object][unique][version][uuid] */ 


EXTERN_C const IID IID_I820b927fcafd11d08a4b00a0c91e2acd;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("820b927f-cafd-11d0-8a4b-00a0c91e2acd")
    I820b927fcafd11d08a4b00a0c91e2acd : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Reserved( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct I820b927fcafd11d08a4b00a0c91e2acdVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            I820b927fcafd11d08a4b00a0c91e2acd * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            I820b927fcafd11d08a4b00a0c91e2acd * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            I820b927fcafd11d08a4b00a0c91e2acd * This);
        
        HRESULT ( STDMETHODCALLTYPE *Reserved )( 
            I820b927fcafd11d08a4b00a0c91e2acd * This);
        
        END_INTERFACE
    } I820b927fcafd11d08a4b00a0c91e2acdVtbl;

    interface I820b927fcafd11d08a4b00a0c91e2acd
    {
        CONST_VTBL struct I820b927fcafd11d08a4b00a0c91e2acdVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define I820b927fcafd11d08a4b00a0c91e2acd_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define I820b927fcafd11d08a4b00a0c91e2acd_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define I820b927fcafd11d08a4b00a0c91e2acd_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define I820b927fcafd11d08a4b00a0c91e2acd_Reserved(This)	\
    (This)->lpVtbl -> Reserved(This)

#endif /* COBJMACROS */


#endif 	/* C style interface */



HRESULT STDMETHODCALLTYPE I820b927fcafd11d08a4b00a0c91e2acd_Reserved_Proxy( 
    I820b927fcafd11d08a4b00a0c91e2acd * This);


void __RPC_STUB I820b927fcafd11d08a4b00a0c91e2acd_Reserved_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __I820b927fcafd11d08a4b00a0c91e2acd_INTERFACE_DEFINED__ */


/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


