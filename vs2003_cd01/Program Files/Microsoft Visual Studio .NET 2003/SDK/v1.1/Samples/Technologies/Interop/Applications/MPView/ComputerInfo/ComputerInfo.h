/* this ALWAYS GENERATED file contains the definitions for the interfaces */


/* File created by MIDL compiler version 5.01.0164 */
/* at Thu Oct 26 18:00:48 2000
 */
/* Compiler settings for D:\com99\Tst\TestSrc\Interop\RealWorld\MPView\ComputerInfo\ComputerInfo.idl:
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

#ifndef __ComputerInfo_h__
#define __ComputerInfo_h__

#ifdef __cplusplus
extern "C"{
#endif 

/* Forward Declarations */ 

#ifndef __IMachineInfo_FWD_DEFINED__
#define __IMachineInfo_FWD_DEFINED__
typedef interface IMachineInfo IMachineInfo;
#endif 	/* __IMachineInfo_FWD_DEFINED__ */


#ifndef __IFileInfo_FWD_DEFINED__
#define __IFileInfo_FWD_DEFINED__
typedef interface IFileInfo IFileInfo;
#endif 	/* __IFileInfo_FWD_DEFINED__ */


#ifndef __MachineInfo_FWD_DEFINED__
#define __MachineInfo_FWD_DEFINED__

#ifdef __cplusplus
typedef class MachineInfo MachineInfo;
#else
typedef struct MachineInfo MachineInfo;
#endif /* __cplusplus */

#endif 	/* __MachineInfo_FWD_DEFINED__ */


#ifndef __FileInfo_FWD_DEFINED__
#define __FileInfo_FWD_DEFINED__

#ifdef __cplusplus
typedef class FileInfo FileInfo;
#else
typedef struct FileInfo FileInfo;
#endif /* __cplusplus */

#endif 	/* __FileInfo_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * ); 

#ifndef __IMachineInfo_INTERFACE_DEFINED__
#define __IMachineInfo_INTERFACE_DEFINED__

/* interface IMachineInfo */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IMachineInfo;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("4B2767D9-7F6A-4CCB-801F-963967243C3B")
    IMachineInfo : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ComputerName( 
            /* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ProcessorArchitecture( 
            /* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_PageSize( 
            /* [retval][out] */ long __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_MinAppAddress( 
            /* [retval][out] */ long __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ProcessorMask( 
            /* [retval][out] */ long __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_NumberOfProcessors( 
            /* [retval][out] */ long __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_AllocationGranularity( 
            /* [retval][out] */ long __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ProcessorLevel( 
            /* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_MachineType( 
            /* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_PlatForm( 
            /* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ServicePack( 
            /* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_MaxAppAddress( 
            /* [retval][out] */ long __RPC_FAR *pVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IMachineInfoVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )( 
            IMachineInfo __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )( 
            IMachineInfo __RPC_FAR * This);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )( 
            IMachineInfo __RPC_FAR * This);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfoCount )( 
            IMachineInfo __RPC_FAR * This,
            /* [out] */ UINT __RPC_FAR *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfo )( 
            IMachineInfo __RPC_FAR * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo __RPC_FAR *__RPC_FAR *ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetIDsOfNames )( 
            IMachineInfo __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR __RPC_FAR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID __RPC_FAR *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Invoke )( 
            IMachineInfo __RPC_FAR * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS __RPC_FAR *pDispParams,
            /* [out] */ VARIANT __RPC_FAR *pVarResult,
            /* [out] */ EXCEPINFO __RPC_FAR *pExcepInfo,
            /* [out] */ UINT __RPC_FAR *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_ComputerName )( 
            IMachineInfo __RPC_FAR * This,
            /* [retval][out] */ BSTR __RPC_FAR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_ProcessorArchitecture )( 
            IMachineInfo __RPC_FAR * This,
            /* [retval][out] */ BSTR __RPC_FAR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_PageSize )( 
            IMachineInfo __RPC_FAR * This,
            /* [retval][out] */ long __RPC_FAR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_MinAppAddress )( 
            IMachineInfo __RPC_FAR * This,
            /* [retval][out] */ long __RPC_FAR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_ProcessorMask )( 
            IMachineInfo __RPC_FAR * This,
            /* [retval][out] */ long __RPC_FAR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_NumberOfProcessors )( 
            IMachineInfo __RPC_FAR * This,
            /* [retval][out] */ long __RPC_FAR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_AllocationGranularity )( 
            IMachineInfo __RPC_FAR * This,
            /* [retval][out] */ long __RPC_FAR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_ProcessorLevel )( 
            IMachineInfo __RPC_FAR * This,
            /* [retval][out] */ BSTR __RPC_FAR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_MachineType )( 
            IMachineInfo __RPC_FAR * This,
            /* [retval][out] */ BSTR __RPC_FAR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_PlatForm )( 
            IMachineInfo __RPC_FAR * This,
            /* [retval][out] */ BSTR __RPC_FAR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_ServicePack )( 
            IMachineInfo __RPC_FAR * This,
            /* [retval][out] */ BSTR __RPC_FAR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_MaxAppAddress )( 
            IMachineInfo __RPC_FAR * This,
            /* [retval][out] */ long __RPC_FAR *pVal);
        
        END_INTERFACE
    } IMachineInfoVtbl;

    interface IMachineInfo
    {
        CONST_VTBL struct IMachineInfoVtbl __RPC_FAR *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IMachineInfo_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IMachineInfo_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IMachineInfo_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IMachineInfo_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define IMachineInfo_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define IMachineInfo_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define IMachineInfo_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define IMachineInfo_get_ComputerName(This,pVal)	\
    (This)->lpVtbl -> get_ComputerName(This,pVal)

#define IMachineInfo_get_ProcessorArchitecture(This,pVal)	\
    (This)->lpVtbl -> get_ProcessorArchitecture(This,pVal)

#define IMachineInfo_get_PageSize(This,pVal)	\
    (This)->lpVtbl -> get_PageSize(This,pVal)

#define IMachineInfo_get_MinAppAddress(This,pVal)	\
    (This)->lpVtbl -> get_MinAppAddress(This,pVal)

#define IMachineInfo_get_ProcessorMask(This,pVal)	\
    (This)->lpVtbl -> get_ProcessorMask(This,pVal)

#define IMachineInfo_get_NumberOfProcessors(This,pVal)	\
    (This)->lpVtbl -> get_NumberOfProcessors(This,pVal)

#define IMachineInfo_get_AllocationGranularity(This,pVal)	\
    (This)->lpVtbl -> get_AllocationGranularity(This,pVal)

#define IMachineInfo_get_ProcessorLevel(This,pVal)	\
    (This)->lpVtbl -> get_ProcessorLevel(This,pVal)

#define IMachineInfo_get_MachineType(This,pVal)	\
    (This)->lpVtbl -> get_MachineType(This,pVal)

#define IMachineInfo_get_PlatForm(This,pVal)	\
    (This)->lpVtbl -> get_PlatForm(This,pVal)

#define IMachineInfo_get_ServicePack(This,pVal)	\
    (This)->lpVtbl -> get_ServicePack(This,pVal)

#define IMachineInfo_get_MaxAppAddress(This,pVal)	\
    (This)->lpVtbl -> get_MaxAppAddress(This,pVal)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IMachineInfo_get_ComputerName_Proxy( 
    IMachineInfo __RPC_FAR * This,
    /* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IMachineInfo_get_ComputerName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IMachineInfo_get_ProcessorArchitecture_Proxy( 
    IMachineInfo __RPC_FAR * This,
    /* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IMachineInfo_get_ProcessorArchitecture_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IMachineInfo_get_PageSize_Proxy( 
    IMachineInfo __RPC_FAR * This,
    /* [retval][out] */ long __RPC_FAR *pVal);


void __RPC_STUB IMachineInfo_get_PageSize_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IMachineInfo_get_MinAppAddress_Proxy( 
    IMachineInfo __RPC_FAR * This,
    /* [retval][out] */ long __RPC_FAR *pVal);


void __RPC_STUB IMachineInfo_get_MinAppAddress_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IMachineInfo_get_ProcessorMask_Proxy( 
    IMachineInfo __RPC_FAR * This,
    /* [retval][out] */ long __RPC_FAR *pVal);


void __RPC_STUB IMachineInfo_get_ProcessorMask_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IMachineInfo_get_NumberOfProcessors_Proxy( 
    IMachineInfo __RPC_FAR * This,
    /* [retval][out] */ long __RPC_FAR *pVal);


void __RPC_STUB IMachineInfo_get_NumberOfProcessors_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IMachineInfo_get_AllocationGranularity_Proxy( 
    IMachineInfo __RPC_FAR * This,
    /* [retval][out] */ long __RPC_FAR *pVal);


void __RPC_STUB IMachineInfo_get_AllocationGranularity_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IMachineInfo_get_ProcessorLevel_Proxy( 
    IMachineInfo __RPC_FAR * This,
    /* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IMachineInfo_get_ProcessorLevel_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IMachineInfo_get_MachineType_Proxy( 
    IMachineInfo __RPC_FAR * This,
    /* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IMachineInfo_get_MachineType_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IMachineInfo_get_PlatForm_Proxy( 
    IMachineInfo __RPC_FAR * This,
    /* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IMachineInfo_get_PlatForm_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IMachineInfo_get_ServicePack_Proxy( 
    IMachineInfo __RPC_FAR * This,
    /* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IMachineInfo_get_ServicePack_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IMachineInfo_get_MaxAppAddress_Proxy( 
    IMachineInfo __RPC_FAR * This,
    /* [retval][out] */ long __RPC_FAR *pVal);


void __RPC_STUB IMachineInfo_get_MaxAppAddress_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IMachineInfo_INTERFACE_DEFINED__ */


#ifndef __IFileInfo_INTERFACE_DEFINED__
#define __IFileInfo_INTERFACE_DEFINED__

/* interface IFileInfo */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IFileInfo;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("411140A9-A591-49C9-8A63-A55D0525E5F9")
    IFileInfo : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_FileSize( 
            /* [retval][out] */ long __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_CreationTime( 
            /* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_AccessTime( 
            /* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ModifyTime( 
            /* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE QueryFileInfo( 
            /* [in] */ BSTR sFileName,
            /* [out][in] */ VARIANT_BOOL __RPC_FAR *bSuccess) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IFileInfoVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )( 
            IFileInfo __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )( 
            IFileInfo __RPC_FAR * This);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )( 
            IFileInfo __RPC_FAR * This);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfoCount )( 
            IFileInfo __RPC_FAR * This,
            /* [out] */ UINT __RPC_FAR *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfo )( 
            IFileInfo __RPC_FAR * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo __RPC_FAR *__RPC_FAR *ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetIDsOfNames )( 
            IFileInfo __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR __RPC_FAR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID __RPC_FAR *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Invoke )( 
            IFileInfo __RPC_FAR * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS __RPC_FAR *pDispParams,
            /* [out] */ VARIANT __RPC_FAR *pVarResult,
            /* [out] */ EXCEPINFO __RPC_FAR *pExcepInfo,
            /* [out] */ UINT __RPC_FAR *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_FileSize )( 
            IFileInfo __RPC_FAR * This,
            /* [retval][out] */ long __RPC_FAR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_CreationTime )( 
            IFileInfo __RPC_FAR * This,
            /* [retval][out] */ BSTR __RPC_FAR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_AccessTime )( 
            IFileInfo __RPC_FAR * This,
            /* [retval][out] */ BSTR __RPC_FAR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_ModifyTime )( 
            IFileInfo __RPC_FAR * This,
            /* [retval][out] */ BSTR __RPC_FAR *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryFileInfo )( 
            IFileInfo __RPC_FAR * This,
            /* [in] */ BSTR sFileName,
            /* [out][in] */ VARIANT_BOOL __RPC_FAR *bSuccess);
        
        END_INTERFACE
    } IFileInfoVtbl;

    interface IFileInfo
    {
        CONST_VTBL struct IFileInfoVtbl __RPC_FAR *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IFileInfo_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IFileInfo_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IFileInfo_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IFileInfo_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define IFileInfo_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define IFileInfo_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define IFileInfo_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define IFileInfo_get_FileSize(This,pVal)	\
    (This)->lpVtbl -> get_FileSize(This,pVal)

#define IFileInfo_get_CreationTime(This,pVal)	\
    (This)->lpVtbl -> get_CreationTime(This,pVal)

#define IFileInfo_get_AccessTime(This,pVal)	\
    (This)->lpVtbl -> get_AccessTime(This,pVal)

#define IFileInfo_get_ModifyTime(This,pVal)	\
    (This)->lpVtbl -> get_ModifyTime(This,pVal)

#define IFileInfo_QueryFileInfo(This,sFileName,bSuccess)	\
    (This)->lpVtbl -> QueryFileInfo(This,sFileName,bSuccess)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IFileInfo_get_FileSize_Proxy( 
    IFileInfo __RPC_FAR * This,
    /* [retval][out] */ long __RPC_FAR *pVal);


void __RPC_STUB IFileInfo_get_FileSize_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IFileInfo_get_CreationTime_Proxy( 
    IFileInfo __RPC_FAR * This,
    /* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IFileInfo_get_CreationTime_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IFileInfo_get_AccessTime_Proxy( 
    IFileInfo __RPC_FAR * This,
    /* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IFileInfo_get_AccessTime_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IFileInfo_get_ModifyTime_Proxy( 
    IFileInfo __RPC_FAR * This,
    /* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IFileInfo_get_ModifyTime_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IFileInfo_QueryFileInfo_Proxy( 
    IFileInfo __RPC_FAR * This,
    /* [in] */ BSTR sFileName,
    /* [out][in] */ VARIANT_BOOL __RPC_FAR *bSuccess);


void __RPC_STUB IFileInfo_QueryFileInfo_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IFileInfo_INTERFACE_DEFINED__ */



#ifndef __COMPUTERINFOLib_LIBRARY_DEFINED__
#define __COMPUTERINFOLib_LIBRARY_DEFINED__

/* library COMPUTERINFOLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_COMPUTERINFOLib;

EXTERN_C const CLSID CLSID_MachineInfo;

#ifdef __cplusplus

class DECLSPEC_UUID("B9645D48-7260-4092-B058-F9830C3E4746")
MachineInfo;
#endif

EXTERN_C const CLSID CLSID_FileInfo;

#ifdef __cplusplus

class DECLSPEC_UUID("A54E14E9-29BB-4AA5-B4FE-2189A9002213")
FileInfo;
#endif
#endif /* __COMPUTERINFOLib_LIBRARY_DEFINED__ */

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
