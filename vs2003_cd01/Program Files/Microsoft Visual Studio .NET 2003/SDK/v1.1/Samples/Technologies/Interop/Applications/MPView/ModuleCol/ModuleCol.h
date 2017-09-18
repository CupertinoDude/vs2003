/* this ALWAYS GENERATED file contains the definitions for the interfaces */


/* File created by MIDL compiler version 5.01.0164 */
/* at Mon Oct 23 15:24:26 2000
 */
/* Compiler settings for D:\com99\Tst\TestSrc\Interop\RealWorld\MPView\ModuleCol\ModuleCol.idl:
    Oicf (OptLev=i2), W1, Zp8, env=Win32, ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
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

#ifndef __ModuleCol_h__
#define __ModuleCol_h__

#ifdef __cplusplus
extern "C"{
#endif 

/* Forward Declarations */ 

#ifndef __IDllCol_FWD_DEFINED__
#define __IDllCol_FWD_DEFINED__
typedef interface IDllCol IDllCol;
#endif 	/* __IDllCol_FWD_DEFINED__ */


#ifndef __IProcCollection_FWD_DEFINED__
#define __IProcCollection_FWD_DEFINED__
typedef interface IProcCollection IProcCollection;
#endif 	/* __IProcCollection_FWD_DEFINED__ */


#ifndef __ProcCollection_FWD_DEFINED__
#define __ProcCollection_FWD_DEFINED__

#ifdef __cplusplus
typedef class ProcCollection ProcCollection;
#else
typedef struct ProcCollection ProcCollection;
#endif /* __cplusplus */

#endif 	/* __ProcCollection_FWD_DEFINED__ */


#ifndef __DllCol_FWD_DEFINED__
#define __DllCol_FWD_DEFINED__

#ifdef __cplusplus
typedef class DllCol DllCol;
#else
typedef struct DllCol DllCol;
#endif /* __cplusplus */

#endif 	/* __DllCol_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * ); 

#ifndef __IDllCol_INTERFACE_DEFINED__
#define __IDllCol_INTERFACE_DEFINED__

/* interface IDllCol */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IDllCol;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("9CBCB913-67D6-4353-968A-98F26B22F7D8")
    IDllCol : public IDispatch
    {
    public:
        virtual /* [propget][id] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ IUnknown __RPC_FAR *__RPC_FAR *ppUnk) = 0;
        
        virtual /* [propget][id] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ long Index,
            /* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;
        
        virtual /* [propget][id] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ long __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ProcName( 
            /* [retval][out] */ BSTR __RPC_FAR *psName) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IDllColVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )( 
            IDllCol __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )( 
            IDllCol __RPC_FAR * This);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )( 
            IDllCol __RPC_FAR * This);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfoCount )( 
            IDllCol __RPC_FAR * This,
            /* [out] */ UINT __RPC_FAR *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfo )( 
            IDllCol __RPC_FAR * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo __RPC_FAR *__RPC_FAR *ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetIDsOfNames )( 
            IDllCol __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR __RPC_FAR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID __RPC_FAR *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Invoke )( 
            IDllCol __RPC_FAR * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS __RPC_FAR *pDispParams,
            /* [out] */ VARIANT __RPC_FAR *pVarResult,
            /* [out] */ EXCEPINFO __RPC_FAR *pExcepInfo,
            /* [out] */ UINT __RPC_FAR *puArgErr);
        
        /* [propget][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get__NewEnum )( 
            IDllCol __RPC_FAR * This,
            /* [retval][out] */ IUnknown __RPC_FAR *__RPC_FAR *ppUnk);
        
        /* [propget][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_Item )( 
            IDllCol __RPC_FAR * This,
            /* [in] */ long Index,
            /* [retval][out] */ BSTR __RPC_FAR *pVal);
        
        /* [propget][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_Count )( 
            IDllCol __RPC_FAR * This,
            /* [retval][out] */ long __RPC_FAR *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *ProcName )( 
            IDllCol __RPC_FAR * This,
            /* [retval][out] */ BSTR __RPC_FAR *psName);
        
        END_INTERFACE
    } IDllColVtbl;

    interface IDllCol
    {
        CONST_VTBL struct IDllColVtbl __RPC_FAR *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IDllCol_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IDllCol_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IDllCol_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IDllCol_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define IDllCol_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define IDllCol_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define IDllCol_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define IDllCol_get__NewEnum(This,ppUnk)	\
    (This)->lpVtbl -> get__NewEnum(This,ppUnk)

#define IDllCol_get_Item(This,Index,pVal)	\
    (This)->lpVtbl -> get_Item(This,Index,pVal)

#define IDllCol_get_Count(This,pVal)	\
    (This)->lpVtbl -> get_Count(This,pVal)

#define IDllCol_ProcName(This,psName)	\
    (This)->lpVtbl -> ProcName(This,psName)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [propget][id] */ HRESULT STDMETHODCALLTYPE IDllCol_get__NewEnum_Proxy( 
    IDllCol __RPC_FAR * This,
    /* [retval][out] */ IUnknown __RPC_FAR *__RPC_FAR *ppUnk);


void __RPC_STUB IDllCol_get__NewEnum_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [propget][id] */ HRESULT STDMETHODCALLTYPE IDllCol_get_Item_Proxy( 
    IDllCol __RPC_FAR * This,
    /* [in] */ long Index,
    /* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IDllCol_get_Item_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [propget][id] */ HRESULT STDMETHODCALLTYPE IDllCol_get_Count_Proxy( 
    IDllCol __RPC_FAR * This,
    /* [retval][out] */ long __RPC_FAR *pVal);


void __RPC_STUB IDllCol_get_Count_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDllCol_ProcName_Proxy( 
    IDllCol __RPC_FAR * This,
    /* [retval][out] */ BSTR __RPC_FAR *psName);


void __RPC_STUB IDllCol_ProcName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IDllCol_INTERFACE_DEFINED__ */


#ifndef __IProcCollection_INTERFACE_DEFINED__
#define __IProcCollection_INTERFACE_DEFINED__

/* interface IProcCollection */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IProcCollection;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("D710E490-48FF-43AB-89F0-3A1D7EAA87E1")
    IProcCollection : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetFirstProc( 
            /* [out] */ IDllCol __RPC_FAR *__RPC_FAR *pUnk,
            /* [retval][out] */ long __RPC_FAR *pHEnum) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetNextProc( 
            /* [in] */ long nIndex,
            /* [out] */ IDllCol __RPC_FAR *__RPC_FAR *DllsCol,
            /* [retval][out] */ long __RPC_FAR *lNext) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetCount( 
            /* [retval][out] */ long __RPC_FAR *pPCount) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EnumerateProc( 
            /* [retval][out] */ long __RPC_FAR *pSuccess) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IProcCollectionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )( 
            IProcCollection __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )( 
            IProcCollection __RPC_FAR * This);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )( 
            IProcCollection __RPC_FAR * This);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfoCount )( 
            IProcCollection __RPC_FAR * This,
            /* [out] */ UINT __RPC_FAR *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfo )( 
            IProcCollection __RPC_FAR * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo __RPC_FAR *__RPC_FAR *ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetIDsOfNames )( 
            IProcCollection __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR __RPC_FAR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID __RPC_FAR *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Invoke )( 
            IProcCollection __RPC_FAR * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS __RPC_FAR *pDispParams,
            /* [out] */ VARIANT __RPC_FAR *pVarResult,
            /* [out] */ EXCEPINFO __RPC_FAR *pExcepInfo,
            /* [out] */ UINT __RPC_FAR *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetFirstProc )( 
            IProcCollection __RPC_FAR * This,
            /* [out] */ IDllCol __RPC_FAR *__RPC_FAR *pUnk,
            /* [retval][out] */ long __RPC_FAR *pHEnum);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetNextProc )( 
            IProcCollection __RPC_FAR * This,
            /* [in] */ long nIndex,
            /* [out] */ IDllCol __RPC_FAR *__RPC_FAR *DllsCol,
            /* [retval][out] */ long __RPC_FAR *lNext);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetCount )( 
            IProcCollection __RPC_FAR * This,
            /* [retval][out] */ long __RPC_FAR *pPCount);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *EnumerateProc )( 
            IProcCollection __RPC_FAR * This,
            /* [retval][out] */ long __RPC_FAR *pSuccess);
        
        END_INTERFACE
    } IProcCollectionVtbl;

    interface IProcCollection
    {
        CONST_VTBL struct IProcCollectionVtbl __RPC_FAR *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IProcCollection_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IProcCollection_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IProcCollection_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IProcCollection_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define IProcCollection_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define IProcCollection_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define IProcCollection_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define IProcCollection_GetFirstProc(This,pUnk,pHEnum)	\
    (This)->lpVtbl -> GetFirstProc(This,pUnk,pHEnum)

#define IProcCollection_GetNextProc(This,nIndex,DllsCol,lNext)	\
    (This)->lpVtbl -> GetNextProc(This,nIndex,DllsCol,lNext)

#define IProcCollection_GetCount(This,pPCount)	\
    (This)->lpVtbl -> GetCount(This,pPCount)

#define IProcCollection_EnumerateProc(This,pSuccess)	\
    (This)->lpVtbl -> EnumerateProc(This,pSuccess)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IProcCollection_GetFirstProc_Proxy( 
    IProcCollection __RPC_FAR * This,
    /* [out] */ IDllCol __RPC_FAR *__RPC_FAR *pUnk,
    /* [retval][out] */ long __RPC_FAR *pHEnum);


void __RPC_STUB IProcCollection_GetFirstProc_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IProcCollection_GetNextProc_Proxy( 
    IProcCollection __RPC_FAR * This,
    /* [in] */ long nIndex,
    /* [out] */ IDllCol __RPC_FAR *__RPC_FAR *DllsCol,
    /* [retval][out] */ long __RPC_FAR *lNext);


void __RPC_STUB IProcCollection_GetNextProc_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IProcCollection_GetCount_Proxy( 
    IProcCollection __RPC_FAR * This,
    /* [retval][out] */ long __RPC_FAR *pPCount);


void __RPC_STUB IProcCollection_GetCount_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IProcCollection_EnumerateProc_Proxy( 
    IProcCollection __RPC_FAR * This,
    /* [retval][out] */ long __RPC_FAR *pSuccess);


void __RPC_STUB IProcCollection_EnumerateProc_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IProcCollection_INTERFACE_DEFINED__ */



#ifndef __MODULECOLLib_LIBRARY_DEFINED__
#define __MODULECOLLib_LIBRARY_DEFINED__

/* library MODULECOLLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_MODULECOLLib;

EXTERN_C const CLSID CLSID_ProcCollection;

#ifdef __cplusplus

class DECLSPEC_UUID("DB5B1C2F-1576-4491-9748-2F049D8BF287")
ProcCollection;
#endif

EXTERN_C const CLSID CLSID_DllCol;

#ifdef __cplusplus

class DECLSPEC_UUID("287ED1AC-B3FE-4B3E-863B-AEE8674B015C")
DllCol;
#endif
#endif /* __MODULECOLLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     unsigned long __RPC_FAR *, unsigned long            , BSTR __RPC_FAR * ); 
unsigned char __RPC_FAR * __RPC_USER  BSTR_UserMarshal(  unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, BSTR __RPC_FAR * ); 
unsigned char __RPC_FAR * __RPC_USER  BSTR_UserUnmarshal(unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, BSTR __RPC_FAR * ); 
void                      __RPC_USER  BSTR_UserFree(     unsigned long __RPC_FAR *, BSTR __RPC_FAR * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif
