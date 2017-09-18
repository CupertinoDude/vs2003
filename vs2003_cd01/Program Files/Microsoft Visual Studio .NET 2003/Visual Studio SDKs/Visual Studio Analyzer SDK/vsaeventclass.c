

/* this ALWAYS GENERATED file contains the IIDs and CLSIDs */

/* link this file in with the server and any clients */


 /* File created by MIDL compiler version 6.00.0361 */
/* at Tue Mar 18 18:05:43 2003
 */
/* Compiler settings for vsaeventclass.idl:
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

MIDL_DEFINE_GUID(IID, IID_IVSAnalyzerEventClass,0x6c736dFA,0x0A13,0x11d3,0x96,0x67,0x00,0x10,0x5A,0xA3,0x16,0xF7);


MIDL_DEFINE_GUID(IID, IID_ISystemDebugRuntimeVariableChangeNotify,0x6c736dD2,0x1E87,0x11d3,0x96,0x6A,0x00,0x10,0x5A,0xA3,0x16,0xF7);


MIDL_DEFINE_GUID(IID, IID_ISystemDebugFilterChangeNotify,0x6c736dD4,0x1E87,0x11d3,0x96,0x6A,0x00,0x10,0x5A,0xA3,0x16,0xF7);


MIDL_DEFINE_GUID(IID, LIBID_AnalyzerEventSystemLib,0x6c736dA8,0x0A20,0x11d3,0x96,0x67,0x00,0x10,0x5A,0xA3,0x16,0xF7);


MIDL_DEFINE_GUID(CLSID, CLSID_CAnalyzerEventSystem,0x6c736d22,0x0A20,0x11d3,0x96,0x67,0x00,0x10,0x5A,0xA3,0x16,0xF7);

#undef MIDL_DEFINE_GUID

#ifdef __cplusplus
}
#endif



#endif /* !defined(_M_IA64) && !defined(_M_AMD64)*/

