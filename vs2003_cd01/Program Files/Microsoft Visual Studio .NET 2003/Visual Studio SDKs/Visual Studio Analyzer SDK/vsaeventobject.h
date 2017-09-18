

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 6.00.0361 */
/* at Tue Mar 18 18:05:46 2003
 */
/* Compiler settings for vsaeventobject.idl:
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

#ifndef __vsaeventobject_h__
#define __vsaeventobject_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IVSAnalyzerEventInit_FWD_DEFINED__
#define __IVSAnalyzerEventInit_FWD_DEFINED__
typedef interface IVSAnalyzerEventInit IVSAnalyzerEventInit;
#endif 	/* __IVSAnalyzerEventInit_FWD_DEFINED__ */


#ifndef __IVSAnalyzerEventBuffer_FWD_DEFINED__
#define __IVSAnalyzerEventBuffer_FWD_DEFINED__
typedef interface IVSAnalyzerEventBuffer IVSAnalyzerEventBuffer;
#endif 	/* __IVSAnalyzerEventBuffer_FWD_DEFINED__ */


#ifndef __IEventFieldAuto_FWD_DEFINED__
#define __IEventFieldAuto_FWD_DEFINED__
typedef interface IEventFieldAuto IEventFieldAuto;
#endif 	/* __IEventFieldAuto_FWD_DEFINED__ */


#ifndef __IEventFieldsAuto_FWD_DEFINED__
#define __IEventFieldsAuto_FWD_DEFINED__
typedef interface IEventFieldsAuto IEventFieldsAuto;
#endif 	/* __IEventFieldsAuto_FWD_DEFINED__ */


#ifndef __IEventFieldsEnum_FWD_DEFINED__
#define __IEventFieldsEnum_FWD_DEFINED__
typedef interface IEventFieldsEnum IEventFieldsEnum;
#endif 	/* __IEventFieldsEnum_FWD_DEFINED__ */


#ifndef __IEventAuto_FWD_DEFINED__
#define __IEventAuto_FWD_DEFINED__
typedef interface IEventAuto IEventAuto;
#endif 	/* __IEventAuto_FWD_DEFINED__ */


#ifndef __IEventsAuto_FWD_DEFINED__
#define __IEventsAuto_FWD_DEFINED__
typedef interface IEventsAuto IEventsAuto;
#endif 	/* __IEventsAuto_FWD_DEFINED__ */


#ifndef __IEvent_FWD_DEFINED__
#define __IEvent_FWD_DEFINED__
typedef interface IEvent IEvent;
#endif 	/* __IEvent_FWD_DEFINED__ */


#ifndef __IEnumEvents_FWD_DEFINED__
#define __IEnumEvents_FWD_DEFINED__
typedef interface IEnumEvents IEnumEvents;
#endif 	/* __IEnumEvents_FWD_DEFINED__ */


#ifndef __VSAnalyzerEvents_FWD_DEFINED__
#define __VSAnalyzerEvents_FWD_DEFINED__

#ifdef __cplusplus
typedef class VSAnalyzerEvents VSAnalyzerEvents;
#else
typedef struct VSAnalyzerEvents VSAnalyzerEvents;
#endif /* __cplusplus */

#endif 	/* __VSAnalyzerEvents_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 

void * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void * ); 

/* interface __MIDL_itf_vsaeventobject_0000 */
/* [local] */ 

struct EventObjectComponent
    {
    LPOLESTR bstrSessionName;
    LPOLESTR bstrMachineName;
    LPOLESTR bstrProcessName;
    DWORD dwProcessId;
    LPOLESTR bstrThreadId;
    LPOLESTR bstrComponentGUID;
    LPOLESTR bstrHandle;
    } ;
struct EventObjectArguments
    {
    long nArgumentCount;
    LPDWORD ldwFieldNames;
    LPDWORD ldwFieldTypes;
    LPDWORD ldwFieldValues;
    } ;
struct EventObjectAlert
    {
    DWORD dwAlertType;
    LPOLESTR bstrAlertDescription;
    DWORD dwAlertSeverity;
    } ;


extern RPC_IF_HANDLE __MIDL_itf_vsaeventobject_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_vsaeventobject_0000_v0_0_s_ifspec;

#ifndef __IVSAnalyzerEventInit_INTERFACE_DEFINED__
#define __IVSAnalyzerEventInit_INTERFACE_DEFINED__

/* interface IVSAnalyzerEventInit */
/* [object][helpstring][hidden][uuid] */ 


EXTERN_C const IID IID_IVSAnalyzerEventInit;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d8C-361F-11d3-B2C0-005004775988")
    IVSAnalyzerEventInit : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Initialize( 
            /* [in] */ int nIdLEC,
            /* [in] */ const SYSTEMTIME sysTimeBaseLocal,
            /* [in] */ const LARGE_INTEGER liTimeBaseRemote,
            /* [in] */ const LARGE_INTEGER liTimeBaseRemoteFreq,
            /* [in] */ int nByteSize,
            /* [size_is][in] */ BYTE eventsBuffer[  ]) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVSAnalyzerEventInitVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IVSAnalyzerEventInit * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IVSAnalyzerEventInit * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IVSAnalyzerEventInit * This);
        
        HRESULT ( STDMETHODCALLTYPE *Initialize )( 
            IVSAnalyzerEventInit * This,
            /* [in] */ int nIdLEC,
            /* [in] */ const SYSTEMTIME sysTimeBaseLocal,
            /* [in] */ const LARGE_INTEGER liTimeBaseRemote,
            /* [in] */ const LARGE_INTEGER liTimeBaseRemoteFreq,
            /* [in] */ int nByteSize,
            /* [size_is][in] */ BYTE eventsBuffer[  ]);
        
        END_INTERFACE
    } IVSAnalyzerEventInitVtbl;

    interface IVSAnalyzerEventInit
    {
        CONST_VTBL struct IVSAnalyzerEventInitVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVSAnalyzerEventInit_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IVSAnalyzerEventInit_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IVSAnalyzerEventInit_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IVSAnalyzerEventInit_Initialize(This,nIdLEC,sysTimeBaseLocal,liTimeBaseRemote,liTimeBaseRemoteFreq,nByteSize,eventsBuffer)	\
    (This)->lpVtbl -> Initialize(This,nIdLEC,sysTimeBaseLocal,liTimeBaseRemote,liTimeBaseRemoteFreq,nByteSize,eventsBuffer)

#endif /* COBJMACROS */


#endif 	/* C style interface */



HRESULT STDMETHODCALLTYPE IVSAnalyzerEventInit_Initialize_Proxy( 
    IVSAnalyzerEventInit * This,
    /* [in] */ int nIdLEC,
    /* [in] */ const SYSTEMTIME sysTimeBaseLocal,
    /* [in] */ const LARGE_INTEGER liTimeBaseRemote,
    /* [in] */ const LARGE_INTEGER liTimeBaseRemoteFreq,
    /* [in] */ int nByteSize,
    /* [size_is][in] */ BYTE eventsBuffer[  ]);


void __RPC_STUB IVSAnalyzerEventInit_Initialize_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IVSAnalyzerEventInit_INTERFACE_DEFINED__ */


#ifndef __IVSAnalyzerEventBuffer_INTERFACE_DEFINED__
#define __IVSAnalyzerEventBuffer_INTERFACE_DEFINED__

/* interface IVSAnalyzerEventBuffer */
/* [object][helpstring][hidden][uuid] */ 


EXTERN_C const IID IID_IVSAnalyzerEventBuffer;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dA6-30AF-11d3-B2BE-005004775988")
    IVSAnalyzerEventBuffer : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetEventInfo( 
            /* [out] */ int *pnIdLEC,
            /* [out] */ int *pnByteSize,
            /* [out][in] */ BYTE **pEventsBuffer) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVSAnalyzerEventBufferVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IVSAnalyzerEventBuffer * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IVSAnalyzerEventBuffer * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IVSAnalyzerEventBuffer * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetEventInfo )( 
            IVSAnalyzerEventBuffer * This,
            /* [out] */ int *pnIdLEC,
            /* [out] */ int *pnByteSize,
            /* [out][in] */ BYTE **pEventsBuffer);
        
        END_INTERFACE
    } IVSAnalyzerEventBufferVtbl;

    interface IVSAnalyzerEventBuffer
    {
        CONST_VTBL struct IVSAnalyzerEventBufferVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVSAnalyzerEventBuffer_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IVSAnalyzerEventBuffer_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IVSAnalyzerEventBuffer_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IVSAnalyzerEventBuffer_GetEventInfo(This,pnIdLEC,pnByteSize,pEventsBuffer)	\
    (This)->lpVtbl -> GetEventInfo(This,pnIdLEC,pnByteSize,pEventsBuffer)

#endif /* COBJMACROS */


#endif 	/* C style interface */



HRESULT STDMETHODCALLTYPE IVSAnalyzerEventBuffer_GetEventInfo_Proxy( 
    IVSAnalyzerEventBuffer * This,
    /* [out] */ int *pnIdLEC,
    /* [out] */ int *pnByteSize,
    /* [out][in] */ BYTE **pEventsBuffer);


void __RPC_STUB IVSAnalyzerEventBuffer_GetEventInfo_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IVSAnalyzerEventBuffer_INTERFACE_DEFINED__ */


#ifndef __IEventFieldAuto_INTERFACE_DEFINED__
#define __IEventFieldAuto_INTERFACE_DEFINED__

/* interface IEventFieldAuto */
/* [object][dual][helpstring][uuid] */ 


EXTERN_C const IID IID_IEventFieldAuto;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dA7-30AF-11d6-B2BE-005004775988")
    IEventFieldAuto : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_FieldName( 
            /* [retval][out] */ BSTR *pbstrFieldName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_FieldValue( 
            /* [retval][out] */ VARIANT *pvValue) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_FieldType( 
            /* [retval][out] */ int *pnFieldType) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IEventFieldAutoVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IEventFieldAuto * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IEventFieldAuto * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IEventFieldAuto * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IEventFieldAuto * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IEventFieldAuto * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IEventFieldAuto * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IEventFieldAuto * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_FieldName )( 
            IEventFieldAuto * This,
            /* [retval][out] */ BSTR *pbstrFieldName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_FieldValue )( 
            IEventFieldAuto * This,
            /* [retval][out] */ VARIANT *pvValue);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_FieldType )( 
            IEventFieldAuto * This,
            /* [retval][out] */ int *pnFieldType);
        
        END_INTERFACE
    } IEventFieldAutoVtbl;

    interface IEventFieldAuto
    {
        CONST_VTBL struct IEventFieldAutoVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IEventFieldAuto_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IEventFieldAuto_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IEventFieldAuto_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IEventFieldAuto_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define IEventFieldAuto_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define IEventFieldAuto_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define IEventFieldAuto_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define IEventFieldAuto_get_FieldName(This,pbstrFieldName)	\
    (This)->lpVtbl -> get_FieldName(This,pbstrFieldName)

#define IEventFieldAuto_get_FieldValue(This,pvValue)	\
    (This)->lpVtbl -> get_FieldValue(This,pvValue)

#define IEventFieldAuto_get_FieldType(This,pnFieldType)	\
    (This)->lpVtbl -> get_FieldType(This,pnFieldType)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventFieldAuto_get_FieldName_Proxy( 
    IEventFieldAuto * This,
    /* [retval][out] */ BSTR *pbstrFieldName);


void __RPC_STUB IEventFieldAuto_get_FieldName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventFieldAuto_get_FieldValue_Proxy( 
    IEventFieldAuto * This,
    /* [retval][out] */ VARIANT *pvValue);


void __RPC_STUB IEventFieldAuto_get_FieldValue_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventFieldAuto_get_FieldType_Proxy( 
    IEventFieldAuto * This,
    /* [retval][out] */ int *pnFieldType);


void __RPC_STUB IEventFieldAuto_get_FieldType_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IEventFieldAuto_INTERFACE_DEFINED__ */


#ifndef __IEventFieldsAuto_INTERFACE_DEFINED__
#define __IEventFieldsAuto_INTERFACE_DEFINED__

/* interface IEventFieldsAuto */
/* [object][dual][helpstring][uuid] */ 


EXTERN_C const IID IID_IEventFieldsAuto;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dA7-30AF-11d5-B2BE-005004775988")
    IEventFieldsAuto : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ long *pnCount) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Item( 
            /* [in] */ VARIANT vIndex,
            /* [retval][out] */ IEventFieldAuto **ppIEventFieldAuto) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ IUnknown **ppunk) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IEventFieldsAutoVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IEventFieldsAuto * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IEventFieldsAuto * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IEventFieldsAuto * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IEventFieldsAuto * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IEventFieldsAuto * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IEventFieldsAuto * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IEventFieldsAuto * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            IEventFieldsAuto * This,
            /* [retval][out] */ long *pnCount);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Item )( 
            IEventFieldsAuto * This,
            /* [in] */ VARIANT vIndex,
            /* [retval][out] */ IEventFieldAuto **ppIEventFieldAuto);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            IEventFieldsAuto * This,
            /* [retval][out] */ IUnknown **ppunk);
        
        END_INTERFACE
    } IEventFieldsAutoVtbl;

    interface IEventFieldsAuto
    {
        CONST_VTBL struct IEventFieldsAutoVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IEventFieldsAuto_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IEventFieldsAuto_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IEventFieldsAuto_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IEventFieldsAuto_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define IEventFieldsAuto_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define IEventFieldsAuto_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define IEventFieldsAuto_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define IEventFieldsAuto_get_Count(This,pnCount)	\
    (This)->lpVtbl -> get_Count(This,pnCount)

#define IEventFieldsAuto_Item(This,vIndex,ppIEventFieldAuto)	\
    (This)->lpVtbl -> Item(This,vIndex,ppIEventFieldAuto)

#define IEventFieldsAuto_get__NewEnum(This,ppunk)	\
    (This)->lpVtbl -> get__NewEnum(This,ppunk)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventFieldsAuto_get_Count_Proxy( 
    IEventFieldsAuto * This,
    /* [retval][out] */ long *pnCount);


void __RPC_STUB IEventFieldsAuto_get_Count_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IEventFieldsAuto_Item_Proxy( 
    IEventFieldsAuto * This,
    /* [in] */ VARIANT vIndex,
    /* [retval][out] */ IEventFieldAuto **ppIEventFieldAuto);


void __RPC_STUB IEventFieldsAuto_Item_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventFieldsAuto_get__NewEnum_Proxy( 
    IEventFieldsAuto * This,
    /* [retval][out] */ IUnknown **ppunk);


void __RPC_STUB IEventFieldsAuto_get__NewEnum_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IEventFieldsAuto_INTERFACE_DEFINED__ */


#ifndef __IEventFieldsEnum_INTERFACE_DEFINED__
#define __IEventFieldsEnum_INTERFACE_DEFINED__

/* interface IEventFieldsEnum */
/* [object][helpstring][uuid] */ 


EXTERN_C const IID IID_IEventFieldsEnum;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dA8-30AF-11d5-B2BE-005004775988")
    IEventFieldsEnum : public IUnknown
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Next( 
            /* [in] */ ULONG celt,
            /* [length_is][size_is][out] */ IEventFieldAuto **rgEventField,
            /* [out] */ ULONG *pceltFetched) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Skip( 
            /* [in] */ ULONG celt) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Reset( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Clone( 
            /* [retval][out] */ IEventFieldsEnum **ppEnum) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IEventFieldsEnumVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IEventFieldsEnum * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IEventFieldsEnum * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IEventFieldsEnum * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Next )( 
            IEventFieldsEnum * This,
            /* [in] */ ULONG celt,
            /* [length_is][size_is][out] */ IEventFieldAuto **rgEventField,
            /* [out] */ ULONG *pceltFetched);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Skip )( 
            IEventFieldsEnum * This,
            /* [in] */ ULONG celt);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Reset )( 
            IEventFieldsEnum * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Clone )( 
            IEventFieldsEnum * This,
            /* [retval][out] */ IEventFieldsEnum **ppEnum);
        
        END_INTERFACE
    } IEventFieldsEnumVtbl;

    interface IEventFieldsEnum
    {
        CONST_VTBL struct IEventFieldsEnumVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IEventFieldsEnum_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IEventFieldsEnum_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IEventFieldsEnum_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IEventFieldsEnum_Next(This,celt,rgEventField,pceltFetched)	\
    (This)->lpVtbl -> Next(This,celt,rgEventField,pceltFetched)

#define IEventFieldsEnum_Skip(This,celt)	\
    (This)->lpVtbl -> Skip(This,celt)

#define IEventFieldsEnum_Reset(This)	\
    (This)->lpVtbl -> Reset(This)

#define IEventFieldsEnum_Clone(This,ppEnum)	\
    (This)->lpVtbl -> Clone(This,ppEnum)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEventFieldsEnum_Next_Proxy( 
    IEventFieldsEnum * This,
    /* [in] */ ULONG celt,
    /* [length_is][size_is][out] */ IEventFieldAuto **rgEventField,
    /* [out] */ ULONG *pceltFetched);


void __RPC_STUB IEventFieldsEnum_Next_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEventFieldsEnum_Skip_Proxy( 
    IEventFieldsEnum * This,
    /* [in] */ ULONG celt);


void __RPC_STUB IEventFieldsEnum_Skip_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEventFieldsEnum_Reset_Proxy( 
    IEventFieldsEnum * This);


void __RPC_STUB IEventFieldsEnum_Reset_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEventFieldsEnum_Clone_Proxy( 
    IEventFieldsEnum * This,
    /* [retval][out] */ IEventFieldsEnum **ppEnum);


void __RPC_STUB IEventFieldsEnum_Clone_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IEventFieldsEnum_INTERFACE_DEFINED__ */


#ifndef __IEventAuto_INTERFACE_DEFINED__
#define __IEventAuto_INTERFACE_DEFINED__

/* interface IEventAuto */
/* [object][dual][helpstring][uuid] */ 


EXTERN_C const IID IID_IEventAuto;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dA7-30AF-11d4-B2BE-005004775988")
    IEventAuto : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_MachineId( 
            /* [retval][out] */ int *pnMachineId) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_EventGUID( 
            /* [retval][out] */ BSTR *pbstrEventType) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_SourceGUID( 
            /* [retval][out] */ BSTR *pbstrSourceId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EventTime( 
            /* [out] */ VARIANT *pvarTime,
            /* [out] */ int *pnNanoseconds) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_SourceComponent( 
            /* [retval][out] */ BSTR *pbstrComponentGUID) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_SourceSession( 
            /* [retval][out] */ BSTR *pbstrSourceSessionName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_SourceProcessName( 
            /* [retval][out] */ BSTR *pbstrSourceProcessName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_SourceProcessId( 
            /* [retval][out] */ int *pnProcessId) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_SourceMachineName( 
            /* [retval][out] */ BSTR *pbstrMachineName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_SourceThreadId( 
            /* [retval][out] */ int *pnThreadId) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_SourceHandle( 
            /* [retval][out] */ BSTR *pbstrThreadId) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetComponent( 
            /* [retval][out] */ BSTR *pbstrComponentGUID) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetSession( 
            /* [retval][out] */ BSTR *pbstrTargetSessionName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetProcessName( 
            /* [retval][out] */ BSTR *pbstrTargetProcessName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetProcessId( 
            /* [retval][out] */ int *pnProcessId) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetMachineName( 
            /* [retval][out] */ BSTR *pbstrMachineName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetThreadId( 
            /* [retval][out] */ int *pnThreadId) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetHandle( 
            /* [retval][out] */ BSTR *pbstrHandle) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_SecurityId( 
            /* [retval][out] */ BSTR *pbstrSecurityId) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_CausalityId( 
            /* [retval][out] */ BSTR *pbstrCausalityId) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Arguments( 
            /* [retval][out] */ BSTR *pbstrArguments) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ReturnValue( 
            /* [retval][out] */ BSTR *pbstrReturnValue) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Exception( 
            /* [retval][out] */ BSTR *pbstrException) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_CorrelationId( 
            /* [retval][out] */ BSTR *pbstrCorrelationId) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_EventFields( 
            /* [retval][out] */ IEventFieldsAuto **ppIEventFieldsAuto) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_DynamicEventData( 
            /* [retval][out] */ BSTR *pbstrDynamicEventData) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetDynamicEventDataRaw( 
            /* [out][in] */ int *pdwDataLow,
            /* [out][in] */ int *pdwDataHigh) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IEventAutoVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IEventAuto * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IEventAuto * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IEventAuto * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IEventAuto * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IEventAuto * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IEventAuto * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IEventAuto * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MachineId )( 
            IEventAuto * This,
            /* [retval][out] */ int *pnMachineId);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_EventGUID )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrEventType);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SourceGUID )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrSourceId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EventTime )( 
            IEventAuto * This,
            /* [out] */ VARIANT *pvarTime,
            /* [out] */ int *pnNanoseconds);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SourceComponent )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrComponentGUID);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SourceSession )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrSourceSessionName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SourceProcessName )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrSourceProcessName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SourceProcessId )( 
            IEventAuto * This,
            /* [retval][out] */ int *pnProcessId);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SourceMachineName )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrMachineName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SourceThreadId )( 
            IEventAuto * This,
            /* [retval][out] */ int *pnThreadId);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SourceHandle )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrThreadId);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TargetComponent )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrComponentGUID);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TargetSession )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrTargetSessionName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TargetProcessName )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrTargetProcessName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TargetProcessId )( 
            IEventAuto * This,
            /* [retval][out] */ int *pnProcessId);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TargetMachineName )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrMachineName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TargetThreadId )( 
            IEventAuto * This,
            /* [retval][out] */ int *pnThreadId);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TargetHandle )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrHandle);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SecurityId )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrSecurityId);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_CausalityId )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrCausalityId);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Arguments )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrArguments);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ReturnValue )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrReturnValue);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Exception )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrException);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_CorrelationId )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrCorrelationId);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_EventFields )( 
            IEventAuto * This,
            /* [retval][out] */ IEventFieldsAuto **ppIEventFieldsAuto);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DynamicEventData )( 
            IEventAuto * This,
            /* [retval][out] */ BSTR *pbstrDynamicEventData);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetDynamicEventDataRaw )( 
            IEventAuto * This,
            /* [out][in] */ int *pdwDataLow,
            /* [out][in] */ int *pdwDataHigh);
        
        END_INTERFACE
    } IEventAutoVtbl;

    interface IEventAuto
    {
        CONST_VTBL struct IEventAutoVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IEventAuto_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IEventAuto_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IEventAuto_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IEventAuto_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define IEventAuto_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define IEventAuto_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define IEventAuto_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define IEventAuto_get_MachineId(This,pnMachineId)	\
    (This)->lpVtbl -> get_MachineId(This,pnMachineId)

#define IEventAuto_get_EventGUID(This,pbstrEventType)	\
    (This)->lpVtbl -> get_EventGUID(This,pbstrEventType)

#define IEventAuto_get_SourceGUID(This,pbstrSourceId)	\
    (This)->lpVtbl -> get_SourceGUID(This,pbstrSourceId)

#define IEventAuto_EventTime(This,pvarTime,pnNanoseconds)	\
    (This)->lpVtbl -> EventTime(This,pvarTime,pnNanoseconds)

#define IEventAuto_get_SourceComponent(This,pbstrComponentGUID)	\
    (This)->lpVtbl -> get_SourceComponent(This,pbstrComponentGUID)

#define IEventAuto_get_SourceSession(This,pbstrSourceSessionName)	\
    (This)->lpVtbl -> get_SourceSession(This,pbstrSourceSessionName)

#define IEventAuto_get_SourceProcessName(This,pbstrSourceProcessName)	\
    (This)->lpVtbl -> get_SourceProcessName(This,pbstrSourceProcessName)

#define IEventAuto_get_SourceProcessId(This,pnProcessId)	\
    (This)->lpVtbl -> get_SourceProcessId(This,pnProcessId)

#define IEventAuto_get_SourceMachineName(This,pbstrMachineName)	\
    (This)->lpVtbl -> get_SourceMachineName(This,pbstrMachineName)

#define IEventAuto_get_SourceThreadId(This,pnThreadId)	\
    (This)->lpVtbl -> get_SourceThreadId(This,pnThreadId)

#define IEventAuto_get_SourceHandle(This,pbstrThreadId)	\
    (This)->lpVtbl -> get_SourceHandle(This,pbstrThreadId)

#define IEventAuto_get_TargetComponent(This,pbstrComponentGUID)	\
    (This)->lpVtbl -> get_TargetComponent(This,pbstrComponentGUID)

#define IEventAuto_get_TargetSession(This,pbstrTargetSessionName)	\
    (This)->lpVtbl -> get_TargetSession(This,pbstrTargetSessionName)

#define IEventAuto_get_TargetProcessName(This,pbstrTargetProcessName)	\
    (This)->lpVtbl -> get_TargetProcessName(This,pbstrTargetProcessName)

#define IEventAuto_get_TargetProcessId(This,pnProcessId)	\
    (This)->lpVtbl -> get_TargetProcessId(This,pnProcessId)

#define IEventAuto_get_TargetMachineName(This,pbstrMachineName)	\
    (This)->lpVtbl -> get_TargetMachineName(This,pbstrMachineName)

#define IEventAuto_get_TargetThreadId(This,pnThreadId)	\
    (This)->lpVtbl -> get_TargetThreadId(This,pnThreadId)

#define IEventAuto_get_TargetHandle(This,pbstrHandle)	\
    (This)->lpVtbl -> get_TargetHandle(This,pbstrHandle)

#define IEventAuto_get_SecurityId(This,pbstrSecurityId)	\
    (This)->lpVtbl -> get_SecurityId(This,pbstrSecurityId)

#define IEventAuto_get_CausalityId(This,pbstrCausalityId)	\
    (This)->lpVtbl -> get_CausalityId(This,pbstrCausalityId)

#define IEventAuto_get_Arguments(This,pbstrArguments)	\
    (This)->lpVtbl -> get_Arguments(This,pbstrArguments)

#define IEventAuto_get_ReturnValue(This,pbstrReturnValue)	\
    (This)->lpVtbl -> get_ReturnValue(This,pbstrReturnValue)

#define IEventAuto_get_Exception(This,pbstrException)	\
    (This)->lpVtbl -> get_Exception(This,pbstrException)

#define IEventAuto_get_CorrelationId(This,pbstrCorrelationId)	\
    (This)->lpVtbl -> get_CorrelationId(This,pbstrCorrelationId)

#define IEventAuto_get_EventFields(This,ppIEventFieldsAuto)	\
    (This)->lpVtbl -> get_EventFields(This,ppIEventFieldsAuto)

#define IEventAuto_get_DynamicEventData(This,pbstrDynamicEventData)	\
    (This)->lpVtbl -> get_DynamicEventData(This,pbstrDynamicEventData)

#define IEventAuto_GetDynamicEventDataRaw(This,pdwDataLow,pdwDataHigh)	\
    (This)->lpVtbl -> GetDynamicEventDataRaw(This,pdwDataLow,pdwDataHigh)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_MachineId_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ int *pnMachineId);


void __RPC_STUB IEventAuto_get_MachineId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_EventGUID_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrEventType);


void __RPC_STUB IEventAuto_get_EventGUID_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_SourceGUID_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrSourceId);


void __RPC_STUB IEventAuto_get_SourceGUID_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IEventAuto_EventTime_Proxy( 
    IEventAuto * This,
    /* [out] */ VARIANT *pvarTime,
    /* [out] */ int *pnNanoseconds);


void __RPC_STUB IEventAuto_EventTime_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_SourceComponent_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrComponentGUID);


void __RPC_STUB IEventAuto_get_SourceComponent_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_SourceSession_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrSourceSessionName);


void __RPC_STUB IEventAuto_get_SourceSession_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_SourceProcessName_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrSourceProcessName);


void __RPC_STUB IEventAuto_get_SourceProcessName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_SourceProcessId_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ int *pnProcessId);


void __RPC_STUB IEventAuto_get_SourceProcessId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_SourceMachineName_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrMachineName);


void __RPC_STUB IEventAuto_get_SourceMachineName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_SourceThreadId_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ int *pnThreadId);


void __RPC_STUB IEventAuto_get_SourceThreadId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_SourceHandle_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrThreadId);


void __RPC_STUB IEventAuto_get_SourceHandle_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_TargetComponent_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrComponentGUID);


void __RPC_STUB IEventAuto_get_TargetComponent_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_TargetSession_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrTargetSessionName);


void __RPC_STUB IEventAuto_get_TargetSession_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_TargetProcessName_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrTargetProcessName);


void __RPC_STUB IEventAuto_get_TargetProcessName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_TargetProcessId_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ int *pnProcessId);


void __RPC_STUB IEventAuto_get_TargetProcessId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_TargetMachineName_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrMachineName);


void __RPC_STUB IEventAuto_get_TargetMachineName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_TargetThreadId_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ int *pnThreadId);


void __RPC_STUB IEventAuto_get_TargetThreadId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_TargetHandle_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrHandle);


void __RPC_STUB IEventAuto_get_TargetHandle_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_SecurityId_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrSecurityId);


void __RPC_STUB IEventAuto_get_SecurityId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_CausalityId_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrCausalityId);


void __RPC_STUB IEventAuto_get_CausalityId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_Arguments_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrArguments);


void __RPC_STUB IEventAuto_get_Arguments_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_ReturnValue_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrReturnValue);


void __RPC_STUB IEventAuto_get_ReturnValue_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_Exception_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrException);


void __RPC_STUB IEventAuto_get_Exception_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_CorrelationId_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrCorrelationId);


void __RPC_STUB IEventAuto_get_CorrelationId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_EventFields_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ IEventFieldsAuto **ppIEventFieldsAuto);


void __RPC_STUB IEventAuto_get_EventFields_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventAuto_get_DynamicEventData_Proxy( 
    IEventAuto * This,
    /* [retval][out] */ BSTR *pbstrDynamicEventData);


void __RPC_STUB IEventAuto_get_DynamicEventData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IEventAuto_GetDynamicEventDataRaw_Proxy( 
    IEventAuto * This,
    /* [out][in] */ int *pdwDataLow,
    /* [out][in] */ int *pdwDataHigh);


void __RPC_STUB IEventAuto_GetDynamicEventDataRaw_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IEventAuto_INTERFACE_DEFINED__ */


#ifndef __IEventsAuto_INTERFACE_DEFINED__
#define __IEventsAuto_INTERFACE_DEFINED__

/* interface IEventsAuto */
/* [object][dual][helpstring][uuid] */ 


EXTERN_C const IID IID_IEventsAuto;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736dA7-30AF-11d3-B2BE-005004775988")
    IEventsAuto : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ long *nElements) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Item( 
            /* [in] */ VARIANT varIndex,
            /* [retval][out] */ IEventAuto **ppIEventAuto) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ IUnknown **punk) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IEventsAutoVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IEventsAuto * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IEventsAuto * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IEventsAuto * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IEventsAuto * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IEventsAuto * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IEventsAuto * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IEventsAuto * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            IEventsAuto * This,
            /* [retval][out] */ long *nElements);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Item )( 
            IEventsAuto * This,
            /* [in] */ VARIANT varIndex,
            /* [retval][out] */ IEventAuto **ppIEventAuto);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            IEventsAuto * This,
            /* [retval][out] */ IUnknown **punk);
        
        END_INTERFACE
    } IEventsAutoVtbl;

    interface IEventsAuto
    {
        CONST_VTBL struct IEventsAutoVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IEventsAuto_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IEventsAuto_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IEventsAuto_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IEventsAuto_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define IEventsAuto_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define IEventsAuto_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define IEventsAuto_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define IEventsAuto_get_Count(This,nElements)	\
    (This)->lpVtbl -> get_Count(This,nElements)

#define IEventsAuto_Item(This,varIndex,ppIEventAuto)	\
    (This)->lpVtbl -> Item(This,varIndex,ppIEventAuto)

#define IEventsAuto_get__NewEnum(This,punk)	\
    (This)->lpVtbl -> get__NewEnum(This,punk)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventsAuto_get_Count_Proxy( 
    IEventsAuto * This,
    /* [retval][out] */ long *nElements);


void __RPC_STUB IEventsAuto_get_Count_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IEventsAuto_Item_Proxy( 
    IEventsAuto * This,
    /* [in] */ VARIANT varIndex,
    /* [retval][out] */ IEventAuto **ppIEventAuto);


void __RPC_STUB IEventsAuto_Item_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IEventsAuto_get__NewEnum_Proxy( 
    IEventsAuto * This,
    /* [retval][out] */ IUnknown **punk);


void __RPC_STUB IEventsAuto_get__NewEnum_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IEventsAuto_INTERFACE_DEFINED__ */


#ifndef __IEvent_INTERFACE_DEFINED__
#define __IEvent_INTERFACE_DEFINED__

/* interface IEvent */
/* [helpstring][uuid][object] */ 


EXTERN_C const IID IID_IEvent;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d31-4944-11d3-81C6-0000F80273C0")
    IEvent : public IUnknown
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetMachineId( 
            /* [retval][out] */ int *pnMachineId) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetEventGUID( 
            /* [retval][out] */ GUID *pguidEventGUID) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetSourceGUID( 
            /* [retval][out] */ GUID *pguidSourceGUID) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetEventTime( 
            /* [out] */ SYSTEMTIME *pSysTime,
            /* [out] */ int *pnNanoseconds) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetEventTimeRaw( 
            /* [out] */ LARGE_INTEGER *pliEventTimeRaw) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetSourceComponent( 
            /* [retval][out] */ LPOLESTR *pszComponent) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetSourceSession( 
            /* [retval][out] */ LPOLESTR *pszSessionName) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetSourceProcessName( 
            /* [retval][out] */ LPOLESTR *pszProcessName) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetSourceProcessId( 
            /* [retval][out] */ DWORD *pdwProcessId) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetSourceMachineName( 
            /* [retval][out] */ LPOLESTR *pszMachineName) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetSourceThreadId( 
            /* [retval][out] */ DWORD *pdwThreadId) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetSourceHandle( 
            /* [retval][out] */ LPOLESTR *pszHandle) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetTargetComponent( 
            /* [retval][out] */ LPOLESTR *pszComponent) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetTargetSession( 
            /* [retval][out] */ LPOLESTR *pszSessionName) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetTargetProcessName( 
            /* [retval][out] */ LPOLESTR *pszProcessName) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetTargetProcessId( 
            /* [retval][out] */ DWORD *pdwProcessId) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetTargetMachineName( 
            /* [retval][out] */ LPOLESTR *pszMachineName) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetTargetThreadId( 
            /* [retval][out] */ DWORD *pdwThreadId) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetTargetHandle( 
            /* [retval][out] */ LPOLESTR *pszHandle) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetSecurityId( 
            /* [retval][out] */ LPOLESTR *pszSecurityId) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetCausalityId( 
            /* [retval][out] */ LPOLESTR *pszCausalityId) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetArguments( 
            /* [retval][out] */ LPOLESTR *pszArguments) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetReturnValue( 
            /* [retval][out] */ LPOLESTR *pszReturnValue) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetException( 
            /* [retval][out] */ LPOLESTR *pszException) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetCorrelationId( 
            /* [retval][out] */ LPOLESTR *pszCorrelationId) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetEventFieldsEnum( 
            /* [retval][out] */ IEventFieldsEnum **ppIEventFieldsEnum) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetDynamicEventData( 
            /* [retval][out] */ LPOLESTR *pszDynamicEventData) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetDynamicEventDataRaw( 
            /* [retval][out] */ LARGE_INTEGER *pliDynamicEventData) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IEventVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IEvent * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IEvent * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IEvent * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetMachineId )( 
            IEvent * This,
            /* [retval][out] */ int *pnMachineId);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetEventGUID )( 
            IEvent * This,
            /* [retval][out] */ GUID *pguidEventGUID);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetSourceGUID )( 
            IEvent * This,
            /* [retval][out] */ GUID *pguidSourceGUID);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetEventTime )( 
            IEvent * This,
            /* [out] */ SYSTEMTIME *pSysTime,
            /* [out] */ int *pnNanoseconds);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetEventTimeRaw )( 
            IEvent * This,
            /* [out] */ LARGE_INTEGER *pliEventTimeRaw);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetSourceComponent )( 
            IEvent * This,
            /* [retval][out] */ LPOLESTR *pszComponent);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetSourceSession )( 
            IEvent * This,
            /* [retval][out] */ LPOLESTR *pszSessionName);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetSourceProcessName )( 
            IEvent * This,
            /* [retval][out] */ LPOLESTR *pszProcessName);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetSourceProcessId )( 
            IEvent * This,
            /* [retval][out] */ DWORD *pdwProcessId);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetSourceMachineName )( 
            IEvent * This,
            /* [retval][out] */ LPOLESTR *pszMachineName);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetSourceThreadId )( 
            IEvent * This,
            /* [retval][out] */ DWORD *pdwThreadId);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetSourceHandle )( 
            IEvent * This,
            /* [retval][out] */ LPOLESTR *pszHandle);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetTargetComponent )( 
            IEvent * This,
            /* [retval][out] */ LPOLESTR *pszComponent);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetTargetSession )( 
            IEvent * This,
            /* [retval][out] */ LPOLESTR *pszSessionName);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetTargetProcessName )( 
            IEvent * This,
            /* [retval][out] */ LPOLESTR *pszProcessName);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetTargetProcessId )( 
            IEvent * This,
            /* [retval][out] */ DWORD *pdwProcessId);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetTargetMachineName )( 
            IEvent * This,
            /* [retval][out] */ LPOLESTR *pszMachineName);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetTargetThreadId )( 
            IEvent * This,
            /* [retval][out] */ DWORD *pdwThreadId);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetTargetHandle )( 
            IEvent * This,
            /* [retval][out] */ LPOLESTR *pszHandle);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetSecurityId )( 
            IEvent * This,
            /* [retval][out] */ LPOLESTR *pszSecurityId);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetCausalityId )( 
            IEvent * This,
            /* [retval][out] */ LPOLESTR *pszCausalityId);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetArguments )( 
            IEvent * This,
            /* [retval][out] */ LPOLESTR *pszArguments);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetReturnValue )( 
            IEvent * This,
            /* [retval][out] */ LPOLESTR *pszReturnValue);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetException )( 
            IEvent * This,
            /* [retval][out] */ LPOLESTR *pszException);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetCorrelationId )( 
            IEvent * This,
            /* [retval][out] */ LPOLESTR *pszCorrelationId);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetEventFieldsEnum )( 
            IEvent * This,
            /* [retval][out] */ IEventFieldsEnum **ppIEventFieldsEnum);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetDynamicEventData )( 
            IEvent * This,
            /* [retval][out] */ LPOLESTR *pszDynamicEventData);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetDynamicEventDataRaw )( 
            IEvent * This,
            /* [retval][out] */ LARGE_INTEGER *pliDynamicEventData);
        
        END_INTERFACE
    } IEventVtbl;

    interface IEvent
    {
        CONST_VTBL struct IEventVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IEvent_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IEvent_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IEvent_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IEvent_GetMachineId(This,pnMachineId)	\
    (This)->lpVtbl -> GetMachineId(This,pnMachineId)

#define IEvent_GetEventGUID(This,pguidEventGUID)	\
    (This)->lpVtbl -> GetEventGUID(This,pguidEventGUID)

#define IEvent_GetSourceGUID(This,pguidSourceGUID)	\
    (This)->lpVtbl -> GetSourceGUID(This,pguidSourceGUID)

#define IEvent_GetEventTime(This,pSysTime,pnNanoseconds)	\
    (This)->lpVtbl -> GetEventTime(This,pSysTime,pnNanoseconds)

#define IEvent_GetEventTimeRaw(This,pliEventTimeRaw)	\
    (This)->lpVtbl -> GetEventTimeRaw(This,pliEventTimeRaw)

#define IEvent_GetSourceComponent(This,pszComponent)	\
    (This)->lpVtbl -> GetSourceComponent(This,pszComponent)

#define IEvent_GetSourceSession(This,pszSessionName)	\
    (This)->lpVtbl -> GetSourceSession(This,pszSessionName)

#define IEvent_GetSourceProcessName(This,pszProcessName)	\
    (This)->lpVtbl -> GetSourceProcessName(This,pszProcessName)

#define IEvent_GetSourceProcessId(This,pdwProcessId)	\
    (This)->lpVtbl -> GetSourceProcessId(This,pdwProcessId)

#define IEvent_GetSourceMachineName(This,pszMachineName)	\
    (This)->lpVtbl -> GetSourceMachineName(This,pszMachineName)

#define IEvent_GetSourceThreadId(This,pdwThreadId)	\
    (This)->lpVtbl -> GetSourceThreadId(This,pdwThreadId)

#define IEvent_GetSourceHandle(This,pszHandle)	\
    (This)->lpVtbl -> GetSourceHandle(This,pszHandle)

#define IEvent_GetTargetComponent(This,pszComponent)	\
    (This)->lpVtbl -> GetTargetComponent(This,pszComponent)

#define IEvent_GetTargetSession(This,pszSessionName)	\
    (This)->lpVtbl -> GetTargetSession(This,pszSessionName)

#define IEvent_GetTargetProcessName(This,pszProcessName)	\
    (This)->lpVtbl -> GetTargetProcessName(This,pszProcessName)

#define IEvent_GetTargetProcessId(This,pdwProcessId)	\
    (This)->lpVtbl -> GetTargetProcessId(This,pdwProcessId)

#define IEvent_GetTargetMachineName(This,pszMachineName)	\
    (This)->lpVtbl -> GetTargetMachineName(This,pszMachineName)

#define IEvent_GetTargetThreadId(This,pdwThreadId)	\
    (This)->lpVtbl -> GetTargetThreadId(This,pdwThreadId)

#define IEvent_GetTargetHandle(This,pszHandle)	\
    (This)->lpVtbl -> GetTargetHandle(This,pszHandle)

#define IEvent_GetSecurityId(This,pszSecurityId)	\
    (This)->lpVtbl -> GetSecurityId(This,pszSecurityId)

#define IEvent_GetCausalityId(This,pszCausalityId)	\
    (This)->lpVtbl -> GetCausalityId(This,pszCausalityId)

#define IEvent_GetArguments(This,pszArguments)	\
    (This)->lpVtbl -> GetArguments(This,pszArguments)

#define IEvent_GetReturnValue(This,pszReturnValue)	\
    (This)->lpVtbl -> GetReturnValue(This,pszReturnValue)

#define IEvent_GetException(This,pszException)	\
    (This)->lpVtbl -> GetException(This,pszException)

#define IEvent_GetCorrelationId(This,pszCorrelationId)	\
    (This)->lpVtbl -> GetCorrelationId(This,pszCorrelationId)

#define IEvent_GetEventFieldsEnum(This,ppIEventFieldsEnum)	\
    (This)->lpVtbl -> GetEventFieldsEnum(This,ppIEventFieldsEnum)

#define IEvent_GetDynamicEventData(This,pszDynamicEventData)	\
    (This)->lpVtbl -> GetDynamicEventData(This,pszDynamicEventData)

#define IEvent_GetDynamicEventDataRaw(This,pliDynamicEventData)	\
    (This)->lpVtbl -> GetDynamicEventDataRaw(This,pliDynamicEventData)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetMachineId_Proxy( 
    IEvent * This,
    /* [retval][out] */ int *pnMachineId);


void __RPC_STUB IEvent_GetMachineId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetEventGUID_Proxy( 
    IEvent * This,
    /* [retval][out] */ GUID *pguidEventGUID);


void __RPC_STUB IEvent_GetEventGUID_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetSourceGUID_Proxy( 
    IEvent * This,
    /* [retval][out] */ GUID *pguidSourceGUID);


void __RPC_STUB IEvent_GetSourceGUID_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetEventTime_Proxy( 
    IEvent * This,
    /* [out] */ SYSTEMTIME *pSysTime,
    /* [out] */ int *pnNanoseconds);


void __RPC_STUB IEvent_GetEventTime_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetEventTimeRaw_Proxy( 
    IEvent * This,
    /* [out] */ LARGE_INTEGER *pliEventTimeRaw);


void __RPC_STUB IEvent_GetEventTimeRaw_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetSourceComponent_Proxy( 
    IEvent * This,
    /* [retval][out] */ LPOLESTR *pszComponent);


void __RPC_STUB IEvent_GetSourceComponent_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetSourceSession_Proxy( 
    IEvent * This,
    /* [retval][out] */ LPOLESTR *pszSessionName);


void __RPC_STUB IEvent_GetSourceSession_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetSourceProcessName_Proxy( 
    IEvent * This,
    /* [retval][out] */ LPOLESTR *pszProcessName);


void __RPC_STUB IEvent_GetSourceProcessName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetSourceProcessId_Proxy( 
    IEvent * This,
    /* [retval][out] */ DWORD *pdwProcessId);


void __RPC_STUB IEvent_GetSourceProcessId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetSourceMachineName_Proxy( 
    IEvent * This,
    /* [retval][out] */ LPOLESTR *pszMachineName);


void __RPC_STUB IEvent_GetSourceMachineName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetSourceThreadId_Proxy( 
    IEvent * This,
    /* [retval][out] */ DWORD *pdwThreadId);


void __RPC_STUB IEvent_GetSourceThreadId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetSourceHandle_Proxy( 
    IEvent * This,
    /* [retval][out] */ LPOLESTR *pszHandle);


void __RPC_STUB IEvent_GetSourceHandle_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetTargetComponent_Proxy( 
    IEvent * This,
    /* [retval][out] */ LPOLESTR *pszComponent);


void __RPC_STUB IEvent_GetTargetComponent_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetTargetSession_Proxy( 
    IEvent * This,
    /* [retval][out] */ LPOLESTR *pszSessionName);


void __RPC_STUB IEvent_GetTargetSession_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetTargetProcessName_Proxy( 
    IEvent * This,
    /* [retval][out] */ LPOLESTR *pszProcessName);


void __RPC_STUB IEvent_GetTargetProcessName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetTargetProcessId_Proxy( 
    IEvent * This,
    /* [retval][out] */ DWORD *pdwProcessId);


void __RPC_STUB IEvent_GetTargetProcessId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetTargetMachineName_Proxy( 
    IEvent * This,
    /* [retval][out] */ LPOLESTR *pszMachineName);


void __RPC_STUB IEvent_GetTargetMachineName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetTargetThreadId_Proxy( 
    IEvent * This,
    /* [retval][out] */ DWORD *pdwThreadId);


void __RPC_STUB IEvent_GetTargetThreadId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetTargetHandle_Proxy( 
    IEvent * This,
    /* [retval][out] */ LPOLESTR *pszHandle);


void __RPC_STUB IEvent_GetTargetHandle_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetSecurityId_Proxy( 
    IEvent * This,
    /* [retval][out] */ LPOLESTR *pszSecurityId);


void __RPC_STUB IEvent_GetSecurityId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetCausalityId_Proxy( 
    IEvent * This,
    /* [retval][out] */ LPOLESTR *pszCausalityId);


void __RPC_STUB IEvent_GetCausalityId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetArguments_Proxy( 
    IEvent * This,
    /* [retval][out] */ LPOLESTR *pszArguments);


void __RPC_STUB IEvent_GetArguments_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetReturnValue_Proxy( 
    IEvent * This,
    /* [retval][out] */ LPOLESTR *pszReturnValue);


void __RPC_STUB IEvent_GetReturnValue_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetException_Proxy( 
    IEvent * This,
    /* [retval][out] */ LPOLESTR *pszException);


void __RPC_STUB IEvent_GetException_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetCorrelationId_Proxy( 
    IEvent * This,
    /* [retval][out] */ LPOLESTR *pszCorrelationId);


void __RPC_STUB IEvent_GetCorrelationId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetEventFieldsEnum_Proxy( 
    IEvent * This,
    /* [retval][out] */ IEventFieldsEnum **ppIEventFieldsEnum);


void __RPC_STUB IEvent_GetEventFieldsEnum_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetDynamicEventData_Proxy( 
    IEvent * This,
    /* [retval][out] */ LPOLESTR *pszDynamicEventData);


void __RPC_STUB IEvent_GetDynamicEventData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEvent_GetDynamicEventDataRaw_Proxy( 
    IEvent * This,
    /* [retval][out] */ LARGE_INTEGER *pliDynamicEventData);


void __RPC_STUB IEvent_GetDynamicEventDataRaw_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IEvent_INTERFACE_DEFINED__ */


#ifndef __IEnumEvents_INTERFACE_DEFINED__
#define __IEnumEvents_INTERFACE_DEFINED__

/* interface IEnumEvents */
/* [object][helpstring][uuid] */ 


EXTERN_C const IID IID_IEnumEvents;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6c736d24-3647-11d3-B2C0-005004775988")
    IEnumEvents : public IUnknown
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Next( 
            /* [in] */ ULONG celt,
            /* [length_is][size_is][out] */ IEvent **rgEvent,
            /* [out] */ ULONG *pceltFetched) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Skip( 
            /* [in] */ ULONG celt) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Reset( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Clone( 
            /* [retval][out] */ IEnumEvents **ppEnum) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IEnumEventsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IEnumEvents * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IEnumEvents * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IEnumEvents * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Next )( 
            IEnumEvents * This,
            /* [in] */ ULONG celt,
            /* [length_is][size_is][out] */ IEvent **rgEvent,
            /* [out] */ ULONG *pceltFetched);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Skip )( 
            IEnumEvents * This,
            /* [in] */ ULONG celt);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Reset )( 
            IEnumEvents * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Clone )( 
            IEnumEvents * This,
            /* [retval][out] */ IEnumEvents **ppEnum);
        
        END_INTERFACE
    } IEnumEventsVtbl;

    interface IEnumEvents
    {
        CONST_VTBL struct IEnumEventsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IEnumEvents_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IEnumEvents_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IEnumEvents_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IEnumEvents_Next(This,celt,rgEvent,pceltFetched)	\
    (This)->lpVtbl -> Next(This,celt,rgEvent,pceltFetched)

#define IEnumEvents_Skip(This,celt)	\
    (This)->lpVtbl -> Skip(This,celt)

#define IEnumEvents_Reset(This)	\
    (This)->lpVtbl -> Reset(This)

#define IEnumEvents_Clone(This,ppEnum)	\
    (This)->lpVtbl -> Clone(This,ppEnum)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEnumEvents_Next_Proxy( 
    IEnumEvents * This,
    /* [in] */ ULONG celt,
    /* [length_is][size_is][out] */ IEvent **rgEvent,
    /* [out] */ ULONG *pceltFetched);


void __RPC_STUB IEnumEvents_Next_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEnumEvents_Skip_Proxy( 
    IEnumEvents * This,
    /* [in] */ ULONG celt);


void __RPC_STUB IEnumEvents_Skip_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEnumEvents_Reset_Proxy( 
    IEnumEvents * This);


void __RPC_STUB IEnumEvents_Reset_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring] */ HRESULT STDMETHODCALLTYPE IEnumEvents_Clone_Proxy( 
    IEnumEvents * This,
    /* [retval][out] */ IEnumEvents **ppEnum);


void __RPC_STUB IEnumEvents_Clone_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IEnumEvents_INTERFACE_DEFINED__ */



#ifndef __VSAnalyzerEventsLib_LIBRARY_DEFINED__
#define __VSAnalyzerEventsLib_LIBRARY_DEFINED__

/* library VSAnalyzerEventsLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_VSAnalyzerEventsLib;

EXTERN_C const CLSID CLSID_VSAnalyzerEvents;

#ifdef __cplusplus

class DECLSPEC_UUID("6c736dA5-30AF-11d3-B2BE-005004775988")
VSAnalyzerEvents;
#endif
#endif /* __VSAnalyzerEventsLib_LIBRARY_DEFINED__ */

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


