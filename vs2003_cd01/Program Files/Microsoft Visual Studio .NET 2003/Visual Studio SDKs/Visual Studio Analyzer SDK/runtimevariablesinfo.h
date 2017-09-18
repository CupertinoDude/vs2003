

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 6.00.0361 */
/* at Tue Mar 18 18:05:03 2003
 */
/* Compiler settings for runtimevariablesinfo.idl:
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

#ifndef __runtimevariablesinfo_h__
#define __runtimevariablesinfo_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __I1471DA611ACD11d3BA2500105AA31A58_FWD_DEFINED__
#define __I1471DA611ACD11d3BA2500105AA31A58_FWD_DEFINED__
typedef interface I1471DA611ACD11d3BA2500105AA31A58 I1471DA611ACD11d3BA2500105AA31A58;
#endif 	/* __I1471DA611ACD11d3BA2500105AA31A58_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 

void * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void * ); 

/* interface __MIDL_itf_runtimevariablesinfo_0000 */
/* [local] */ 

struct SystemDebugRuntimeVariable
    {
    BSTR strVariableName;
    BSTR strVariableValue;
    } ;
struct SystemDebugRuntimeVariableValue
    {
    BSTR strVariableValue;
    BSTR strVariableTarget;
    } ;


extern RPC_IF_HANDLE __MIDL_itf_runtimevariablesinfo_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_runtimevariablesinfo_0000_v0_0_s_ifspec;

#ifndef __I1471DA611ACD11d3BA2500105AA31A58_INTERFACE_DEFINED__
#define __I1471DA611ACD11d3BA2500105AA31A58_INTERFACE_DEFINED__

/* interface I1471DA611ACD11d3BA2500105AA31A58 */
/* [object][unique][version][uuid] */ 


EXTERN_C const IID IID_I1471DA611ACD11d3BA2500105AA31A58;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("1471DA61-1ACD-11d3-BA25-00105AA31A58")
    I1471DA611ACD11d3BA2500105AA31A58 : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Reserved( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct I1471DA611ACD11d3BA2500105AA31A58Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            I1471DA611ACD11d3BA2500105AA31A58 * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            I1471DA611ACD11d3BA2500105AA31A58 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            I1471DA611ACD11d3BA2500105AA31A58 * This);
        
        HRESULT ( STDMETHODCALLTYPE *Reserved )( 
            I1471DA611ACD11d3BA2500105AA31A58 * This);
        
        END_INTERFACE
    } I1471DA611ACD11d3BA2500105AA31A58Vtbl;

    interface I1471DA611ACD11d3BA2500105AA31A58
    {
        CONST_VTBL struct I1471DA611ACD11d3BA2500105AA31A58Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define I1471DA611ACD11d3BA2500105AA31A58_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define I1471DA611ACD11d3BA2500105AA31A58_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define I1471DA611ACD11d3BA2500105AA31A58_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define I1471DA611ACD11d3BA2500105AA31A58_Reserved(This)	\
    (This)->lpVtbl -> Reserved(This)

#endif /* COBJMACROS */


#endif 	/* C style interface */



HRESULT STDMETHODCALLTYPE I1471DA611ACD11d3BA2500105AA31A58_Reserved_Proxy( 
    I1471DA611ACD11d3BA2500105AA31A58 * This);


void __RPC_STUB I1471DA611ACD11d3BA2500105AA31A58_Reserved_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __I1471DA611ACD11d3BA2500105AA31A58_INTERFACE_DEFINED__ */


/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


