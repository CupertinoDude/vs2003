

/* this ALWAYS GENERATED file contains the IIDs and CLSIDs */

/* link this file in with the server and any clients */


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

#if !defined(_M_IA64) && !defined(_M_AMD64)


#pragma warning( disable: 4049 )  /* more than 64k source lines */


#ifdef __cplusplus
extern "C"{
#endif 


#include <rpc.h>
#include <rpcndr.h>

#ifdef _MIDL_USE_GUIDDEF_

#ifndef INITGUID
#define INITGUID
#include <guiddef.h>
#undef INITGUID
#else
#include <guiddef.h>
#endif

#define MIDL_DEFINE_GUID(type,name,l,w1,w2,b1,b2,b3,b4,b5,b6,b7,b8) \
        DEFINE_GUID(name,l,w1,w2,b1,b2,b3,b4,b5,b6,b7,b8)

#else // !_MIDL_USE_GUIDDEF_

#ifndef __IID_DEFINED__
#define __IID_DEFINED__

typedef struct _IID
{
    unsigned long x;
    unsigned short s1;
    unsigned short s2;
    unsigned char  c[8];
} IID;

#endif // __IID_DEFINED__

#ifndef CLSID_DEFINED
#define CLSID_DEFINED
typedef IID CLSID;
#endif // CLSID_DEFINED

#define MIDL_DEFINE_GUID(type,name,l,w1,w2,b1,b2,b3,b4,b5,b6,b7,b8) \
        const type name = {l,w1,w2,{b1,b2,b3,b4,b5,b6,b7,b8}}

#endif !_MIDL_USE_GUIDDEF_

MIDL_DEFINE_GUID(IID, IID_IVSAnalyzerEventInit,0x6c736d8C,0x361F,0x11d3,0xB2,0xC0,0x00,0x50,0x04,0x77,0x59,0x88);


MIDL_DEFINE_GUID(IID, IID_IVSAnalyzerEventBuffer,0x6c736dA6,0x30AF,0x11d3,0xB2,0xBE,0x00,0x50,0x04,0x77,0x59,0x88);


MIDL_DEFINE_GUID(IID, IID_IEventFieldAuto,0x6c736dA7,0x30AF,0x11d6,0xB2,0xBE,0x00,0x50,0x04,0x77,0x59,0x88);


MIDL_DEFINE_GUID(IID, IID_IEventFieldsAuto,0x6c736dA7,0x30AF,0x11d5,0xB2,0xBE,0x00,0x50,0x04,0x77,0x59,0x88);


MIDL_DEFINE_GUID(IID, IID_IEventFieldsEnum,0x6c736dA8,0x30AF,0x11d5,0xB2,0xBE,0x00,0x50,0x04,0x77,0x59,0x88);


MIDL_DEFINE_GUID(IID, IID_IEventAuto,0x6c736dA7,0x30AF,0x11d4,0xB2,0xBE,0x00,0x50,0x04,0x77,0x59,0x88);


MIDL_DEFINE_GUID(IID, IID_IEventsAuto,0x6c736dA7,0x30AF,0x11d3,0xB2,0xBE,0x00,0x50,0x04,0x77,0x59,0x88);


MIDL_DEFINE_GUID(IID, IID_IEvent,0x6c736d31,0x4944,0x11d3,0x81,0xC6,0x00,0x00,0xF8,0x02,0x73,0xC0);


MIDL_DEFINE_GUID(IID, IID_IEnumEvents,0x6c736d24,0x3647,0x11d3,0xB2,0xC0,0x00,0x50,0x04,0x77,0x59,0x88);


MIDL_DEFINE_GUID(IID, LIBID_VSAnalyzerEventsLib,0x6c736dA4,0x30AF,0x11d3,0xB2,0xBE,0x00,0x50,0x04,0x77,0x59,0x88);


MIDL_DEFINE_GUID(CLSID, CLSID_VSAnalyzerEvents,0x6c736dA5,0x30AF,0x11d3,0xB2,0xBE,0x00,0x50,0x04,0x77,0x59,0x88);

#undef MIDL_DEFINE_GUID

#ifdef __cplusplus
}
#endif



#endif /* !defined(_M_IA64) && !defined(_M_AMD64)*/

