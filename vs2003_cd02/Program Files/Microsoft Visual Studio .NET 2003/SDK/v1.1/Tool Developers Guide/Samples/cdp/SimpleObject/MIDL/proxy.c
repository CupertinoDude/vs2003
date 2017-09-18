
#pragma warning( disable: 4049 )  /* more than 64k source lines */

/* this ALWAYS GENERATED file contains the proxy stub code */


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

#if !defined(_M_IA64) && !defined(_M_AMD64)

/* verify that the <rpcproxy.h> version is high enough to compile this file*/
#ifndef __REDQ_RPCPROXY_H_VERSION__
#define __REQUIRED_RPCPROXY_H_VERSION__ 440
#endif


#include "rpcproxy.h"
#ifndef __RPCPROXY_H_VERSION__
#error this stub requires an updated version of <rpcproxy.h>
#endif // __RPCPROXY_H_VERSION__


#include "iface.h"

#define TYPE_FORMAT_STRING_SIZE   7                                 
#define PROC_FORMAT_STRING_SIZE   13                                
#define TRANSMIT_AS_TABLE_SIZE    0            
#define WIRE_MARSHAL_TABLE_SIZE   0            

typedef struct _MIDL_TYPE_FORMAT_STRING
    {
    short          Pad;
    unsigned char  Format[ TYPE_FORMAT_STRING_SIZE ];
    } MIDL_TYPE_FORMAT_STRING;

typedef struct _MIDL_PROC_FORMAT_STRING
    {
    short          Pad;
    unsigned char  Format[ PROC_FORMAT_STRING_SIZE ];
    } MIDL_PROC_FORMAT_STRING;


static RPC_SYNTAX_IDENTIFIER  _RpcTransferSyntax = 
{{0x8A885D04,0x1CEB,0x11C9,{0x9F,0xE8,0x08,0x00,0x2B,0x10,0x48,0x60}},{2,0}};


extern const MIDL_TYPE_FORMAT_STRING __MIDL_TypeFormatString;
extern const MIDL_PROC_FORMAT_STRING __MIDL_ProcFormatString;


extern const MIDL_STUB_DESC Object_StubDesc;


extern const MIDL_SERVER_INFO ICDPTests_ServerInfo;
extern const MIDL_STUBLESS_PROXY_INFO ICDPTests_ProxyInfo;


/* [propget] */ HRESULT STDMETHODCALLTYPE ICDPTests_get_AllowQIOfBrokenIMarshal_Proxy( 
    ICDPTests * This,
    /* [retval][out] */ BOOL *pRetVal)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      3);
        
        
        
        if(!pRetVal)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 0;
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrProxySendReceive(This, &_StubMsg);
            
            _StubMsg.BufferStart = (unsigned char *) _RpcMessage.Buffer; 
            _StubMsg.BufferEnd   = _StubMsg.BufferStart + _RpcMessage.BufferLength;
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[0] );
            
            _StubMsg.Buffer = (unsigned char *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
            *pRetVal = *(( BOOL * )_StubMsg.Buffer)++;
            
            _StubMsg.Buffer = (unsigned char *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
            
            if(_StubMsg.Buffer + 4 > _StubMsg.BufferEnd)
                {
                RpcRaiseException(RPC_X_BAD_STUB_DATA);
                }
            _RetVal = *(( HRESULT * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[2],
                         ( void * )pRetVal);
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB ICDPTests_get_AllowQIOfBrokenIMarshal_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    BOOL _M0	=	0;
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    BOOL *pRetVal;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    ( BOOL * )pRetVal = 0;
    RpcTryFinally
        {
        pRetVal = &_M0;
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((ICDPTests*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> get_AllowQIOfBrokenIMarshal((ICDPTests *) ((CStdStubBuffer *)This)->pvServerObject,pRetVal);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 36;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        _StubMsg.Buffer = (unsigned char *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
        *(( BOOL * )_StubMsg.Buffer)++ = *pRetVal;
        
        _StubMsg.Buffer = (unsigned char *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
        *(( HRESULT * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char *)_pRpcMessage->Buffer);
    
}


/* [propput] */ HRESULT STDMETHODCALLTYPE ICDPTests_put_AllowQIOfBrokenIMarshal_Proxy( 
    ICDPTests * This,
    /* [in] */ BOOL NewVal)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      4);
        
        
        
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 8;
            NdrProxyGetBuffer(This, &_StubMsg);
            _StubMsg.Buffer = (unsigned char *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
            *(( BOOL * )_StubMsg.Buffer)++ = NewVal;
            
            NdrProxySendReceive(This, &_StubMsg);
            
            _StubMsg.BufferStart = (unsigned char *) _RpcMessage.Buffer; 
            _StubMsg.BufferEnd   = _StubMsg.BufferStart + _RpcMessage.BufferLength;
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[6] );
            
            _StubMsg.Buffer = (unsigned char *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
            
            if(_StubMsg.Buffer + 4 > _StubMsg.BufferEnd)
                {
                RpcRaiseException(RPC_X_BAD_STUB_DATA);
                }
            _RetVal = *(( HRESULT * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB ICDPTests_put_AllowQIOfBrokenIMarshal_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    BOOL NewVal;
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    NewVal = 0;
    RpcTryFinally
        {
        if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[6] );
        
        _StubMsg.Buffer = (unsigned char *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
        
        if(_StubMsg.Buffer + 4 > _StubMsg.BufferEnd)
            {
            RpcRaiseException(RPC_X_BAD_STUB_DATA);
            }
        NewVal = *(( BOOL * )_StubMsg.Buffer)++;
        
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((ICDPTests*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> put_AllowQIOfBrokenIMarshal((ICDPTests *) ((CStdStubBuffer *)This)->pvServerObject,NewVal);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 8;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        _StubMsg.Buffer = (unsigned char *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
        *(( HRESULT * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char *)_pRpcMessage->Buffer);
    
}


/* [propget] */ HRESULT STDMETHODCALLTYPE ICDPTests_get_FailAllQIs_Proxy( 
    ICDPTests * This,
    /* [retval][out] */ BOOL *pRetVal)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      5);
        
        
        
        if(!pRetVal)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 0;
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrProxySendReceive(This, &_StubMsg);
            
            _StubMsg.BufferStart = (unsigned char *) _RpcMessage.Buffer; 
            _StubMsg.BufferEnd   = _StubMsg.BufferStart + _RpcMessage.BufferLength;
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[0] );
            
            _StubMsg.Buffer = (unsigned char *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
            *pRetVal = *(( BOOL * )_StubMsg.Buffer)++;
            
            _StubMsg.Buffer = (unsigned char *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
            
            if(_StubMsg.Buffer + 4 > _StubMsg.BufferEnd)
                {
                RpcRaiseException(RPC_X_BAD_STUB_DATA);
                }
            _RetVal = *(( HRESULT * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[2],
                         ( void * )pRetVal);
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB ICDPTests_get_FailAllQIs_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    BOOL _M1	=	0;
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    BOOL *pRetVal;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    ( BOOL * )pRetVal = 0;
    RpcTryFinally
        {
        pRetVal = &_M1;
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((ICDPTests*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> get_FailAllQIs((ICDPTests *) ((CStdStubBuffer *)This)->pvServerObject,pRetVal);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 36;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        _StubMsg.Buffer = (unsigned char *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
        *(( BOOL * )_StubMsg.Buffer)++ = *pRetVal;
        
        _StubMsg.Buffer = (unsigned char *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
        *(( HRESULT * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char *)_pRpcMessage->Buffer);
    
}


/* [propput] */ HRESULT STDMETHODCALLTYPE ICDPTests_put_FailAllQIs_Proxy( 
    ICDPTests * This,
    /* [in] */ BOOL NewVal)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      6);
        
        
        
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 8;
            NdrProxyGetBuffer(This, &_StubMsg);
            _StubMsg.Buffer = (unsigned char *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
            *(( BOOL * )_StubMsg.Buffer)++ = NewVal;
            
            NdrProxySendReceive(This, &_StubMsg);
            
            _StubMsg.BufferStart = (unsigned char *) _RpcMessage.Buffer; 
            _StubMsg.BufferEnd   = _StubMsg.BufferStart + _RpcMessage.BufferLength;
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[6] );
            
            _StubMsg.Buffer = (unsigned char *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
            
            if(_StubMsg.Buffer + 4 > _StubMsg.BufferEnd)
                {
                RpcRaiseException(RPC_X_BAD_STUB_DATA);
                }
            _RetVal = *(( HRESULT * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB ICDPTests_put_FailAllQIs_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    BOOL NewVal;
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    NewVal = 0;
    RpcTryFinally
        {
        if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[6] );
        
        _StubMsg.Buffer = (unsigned char *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
        
        if(_StubMsg.Buffer + 4 > _StubMsg.BufferEnd)
            {
            RpcRaiseException(RPC_X_BAD_STUB_DATA);
            }
        NewVal = *(( BOOL * )_StubMsg.Buffer)++;
        
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((ICDPTests*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> put_FailAllQIs((ICDPTests *) ((CStdStubBuffer *)This)->pvServerObject,NewVal);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 8;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        _StubMsg.Buffer = (unsigned char *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
        *(( HRESULT * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char *)_pRpcMessage->Buffer);
    
}


extern const MIDL_STUB_DESC Object_StubDesc;


extern const MIDL_SERVER_INFO IFoo_ServerInfo;
extern const MIDL_STUBLESS_PROXY_INFO IFoo_ProxyInfo;


HRESULT STDMETHODCALLTYPE IFoo_Foo_Proxy( 
    IFoo * This)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      3);
        
        
        
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 0;
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrProxySendReceive(This, &_StubMsg);
            
            _StubMsg.BufferStart = (unsigned char *) _RpcMessage.Buffer; 
            _StubMsg.BufferEnd   = _StubMsg.BufferStart + _RpcMessage.BufferLength;
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[10] );
            
            _StubMsg.Buffer = (unsigned char *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
            
            if(_StubMsg.Buffer + 4 > _StubMsg.BufferEnd)
                {
                RpcRaiseException(RPC_X_BAD_STUB_DATA);
                }
            _RetVal = *(( HRESULT * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB IFoo_Foo_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    RpcTryFinally
        {
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((IFoo*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> Foo((IFoo *) ((CStdStubBuffer *)This)->pvServerObject);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 8;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        _StubMsg.Buffer = (unsigned char *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
        *(( HRESULT * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char *)_pRpcMessage->Buffer);
    
}


extern const MIDL_STUB_DESC Object_StubDesc;


extern const MIDL_SERVER_INFO IUniversalMarshaler_ServerInfo;
extern const MIDL_STUBLESS_PROXY_INFO IUniversalMarshaler_ProxyInfo;



#if !defined(__RPC_WIN32__)
#error  Invalid build platform for this stub.
#endif

static const MIDL_PROC_FORMAT_STRING __MIDL_ProcFormatString =
    {
        0,
        {
			
			0x51,		/* FC_OUT_PARAM */
			0x1,		/* x86 stack size = 1 */
/*  2 */	NdrFcShort( 0x2 ),	/* Type Offset=2 */
/*  4 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/*  6 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/*  8 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 10 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */

			0x0
        }
    };

static const MIDL_TYPE_FORMAT_STRING __MIDL_TypeFormatString =
    {
        0,
        {
			NdrFcShort( 0x0 ),	/* 0 */
/*  2 */	
			0x11, 0xc,	/* FC_RP [alloced_on_stack] [simple_pointer] */
/*  4 */	0x8,		/* FC_LONG */
			0x5c,		/* FC_PAD */

			0x0
        }
    };


/* Object interface: IUnknown, ver. 0.0,
   GUID={0x00000000,0x0000,0x0000,{0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46}} */


/* Object interface: ICDPTests, ver. 0.0,
   GUID={0x00000abc,0xb41b,0x11cf,{0xa6,0xbb,0x00,0x80,0xc7,0xb2,0xd6,0x82}} */

#pragma code_seg(".orpc")
static const unsigned short ICDPTests_FormatStringOffsetTable[] =
    {
    0,
    6,
    0,
    6
    };

static const MIDL_STUBLESS_PROXY_INFO ICDPTests_ProxyInfo =
    {
    &Object_StubDesc,
    __MIDL_ProcFormatString.Format,
    &ICDPTests_FormatStringOffsetTable[-3],
    0,
    0,
    0
    };


static const MIDL_SERVER_INFO ICDPTests_ServerInfo = 
    {
    &Object_StubDesc,
    0,
    __MIDL_ProcFormatString.Format,
    &ICDPTests_FormatStringOffsetTable[-3],
    0,
    0,
    0,
    0};
const CINTERFACE_PROXY_VTABLE(7) _ICDPTestsProxyVtbl = 
{
    &IID_ICDPTests,
    IUnknown_QueryInterface_Proxy,
    IUnknown_AddRef_Proxy,
    IUnknown_Release_Proxy ,
    ICDPTests_get_AllowQIOfBrokenIMarshal_Proxy ,
    ICDPTests_put_AllowQIOfBrokenIMarshal_Proxy ,
    ICDPTests_get_FailAllQIs_Proxy ,
    ICDPTests_put_FailAllQIs_Proxy
};


static const PRPC_STUB_FUNCTION ICDPTests_table[] =
{
    ICDPTests_get_AllowQIOfBrokenIMarshal_Stub,
    ICDPTests_put_AllowQIOfBrokenIMarshal_Stub,
    ICDPTests_get_FailAllQIs_Stub,
    ICDPTests_put_FailAllQIs_Stub
};

const CInterfaceStubVtbl _ICDPTestsStubVtbl =
{
    &IID_ICDPTests,
    &ICDPTests_ServerInfo,
    7,
    &ICDPTests_table[-3],
    CStdStubBuffer_METHODS
};


/* Object interface: IFoo, ver. 0.0,
   GUID={0x000F00F0,0x0F00,0x11cf,{0xa6,0xbb,0x00,0x80,0xc7,0xb2,0xd6,0x84}} */

#pragma code_seg(".orpc")
static const unsigned short IFoo_FormatStringOffsetTable[] =
    {
    10
    };

static const MIDL_STUBLESS_PROXY_INFO IFoo_ProxyInfo =
    {
    &Object_StubDesc,
    __MIDL_ProcFormatString.Format,
    &IFoo_FormatStringOffsetTable[-3],
    0,
    0,
    0
    };


static const MIDL_SERVER_INFO IFoo_ServerInfo = 
    {
    &Object_StubDesc,
    0,
    __MIDL_ProcFormatString.Format,
    &IFoo_FormatStringOffsetTable[-3],
    0,
    0,
    0,
    0};
const CINTERFACE_PROXY_VTABLE(4) _IFooProxyVtbl = 
{
    &IID_IFoo,
    IUnknown_QueryInterface_Proxy,
    IUnknown_AddRef_Proxy,
    IUnknown_Release_Proxy ,
    IFoo_Foo_Proxy
};


static const PRPC_STUB_FUNCTION IFoo_table[] =
{
    IFoo_Foo_Stub
};

const CInterfaceStubVtbl _IFooStubVtbl =
{
    &IID_IFoo,
    &IFoo_ServerInfo,
    4,
    &IFoo_table[-3],
    CStdStubBuffer_METHODS
};


/* Object interface: IUniversalMarshaler, ver. 0.0,
   GUID={0x56823962,0x6326,0x3651,{0xa6,0x32,0x62,0x66,0x90,0x87,0x32,0x84}} */

#pragma code_seg(".orpc")
static const unsigned short IUniversalMarshaler_FormatStringOffsetTable[] =
    {
    0
    };

static const MIDL_STUBLESS_PROXY_INFO IUniversalMarshaler_ProxyInfo =
    {
    &Object_StubDesc,
    __MIDL_ProcFormatString.Format,
    &IUniversalMarshaler_FormatStringOffsetTable[-3],
    0,
    0,
    0
    };


static const MIDL_SERVER_INFO IUniversalMarshaler_ServerInfo = 
    {
    &Object_StubDesc,
    0,
    __MIDL_ProcFormatString.Format,
    &IUniversalMarshaler_FormatStringOffsetTable[-3],
    0,
    0,
    0,
    0};
const CINTERFACE_PROXY_VTABLE(3) _IUniversalMarshalerProxyVtbl = 
{
    &IID_IUniversalMarshaler,
    IUnknown_QueryInterface_Proxy,
    IUnknown_AddRef_Proxy,
    IUnknown_Release_Proxy
};


static const PRPC_STUB_FUNCTION IUniversalMarshaler_table[] =
{
    0    /* a dummy for an empty interface */
};

const CInterfaceStubVtbl _IUniversalMarshalerStubVtbl =
{
    &IID_IUniversalMarshaler,
    &IUniversalMarshaler_ServerInfo,
    3,
    &IUniversalMarshaler_table[-3],
    CStdStubBuffer_METHODS
};

static const MIDL_STUB_DESC Object_StubDesc = 
    {
    0,
    NdrOleAllocate,
    NdrOleFree,
    0,
    0,
    0,
    0,
    0,
    __MIDL_TypeFormatString.Format,
    1, /* -error bounds_check flag */
    0x10001, /* Ndr library version */
    0,
    0x600015b, /* MIDL Version 6.0.347 */
    0,
    0,
    0,  /* notify & notify_flag routine table */
    0x1, /* MIDL flag */
    0, /* cs routines */
    0,   /* proxy/server info */
    0   /* Reserved5 */
    };

const CInterfaceProxyVtbl * _CMPNT_ProxyVtblList[] = 
{
    ( CInterfaceProxyVtbl *) &_IUniversalMarshalerProxyVtbl,
    ( CInterfaceProxyVtbl *) &_ICDPTestsProxyVtbl,
    ( CInterfaceProxyVtbl *) &_IFooProxyVtbl,
    0
};

const CInterfaceStubVtbl * _CMPNT_StubVtblList[] = 
{
    ( CInterfaceStubVtbl *) &_IUniversalMarshalerStubVtbl,
    ( CInterfaceStubVtbl *) &_ICDPTestsStubVtbl,
    ( CInterfaceStubVtbl *) &_IFooStubVtbl,
    0
};

PCInterfaceName const _CMPNT_InterfaceNamesList[] = 
{
    "IUniversalMarshaler",
    "ICDPTests",
    "IFoo",
    0
};


#define _CMPNT_CHECK_IID(n)	IID_GENERIC_CHECK_IID( _CMPNT, pIID, n)

int __stdcall _CMPNT_IID_Lookup( const IID * pIID, int * pIndex )
{
    IID_BS_LOOKUP_SETUP

    IID_BS_LOOKUP_INITIAL_TEST( _CMPNT, 3, 2 )
    IID_BS_LOOKUP_NEXT_TEST( _CMPNT, 1 )
    IID_BS_LOOKUP_RETURN_RESULT( _CMPNT, 3, *pIndex )
    
}

const ExtendedProxyFileInfo CMPNT_ProxyFileInfo = 
{
    (PCInterfaceProxyVtblList *) & _CMPNT_ProxyVtblList,
    (PCInterfaceStubVtblList *) & _CMPNT_StubVtblList,
    (const PCInterfaceName * ) & _CMPNT_InterfaceNamesList,
    0, // no delegation
    & _CMPNT_IID_Lookup, 
    3,
    1,
    0, /* table of [async_uuid] interfaces */
    0, /* Filler1 */
    0, /* Filler2 */
    0  /* Filler3 */
};


#endif /* !defined(_M_IA64) && !defined(_M_AMD64)*/

