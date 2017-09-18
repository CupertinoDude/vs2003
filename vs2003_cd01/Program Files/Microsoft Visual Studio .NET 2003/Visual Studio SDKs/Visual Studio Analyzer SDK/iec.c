

/* this ALWAYS GENERATED file contains the IIDs and CLSIDs */

/* link this file in with the server and any clients */


 /* File created by MIDL compiler version 6.00.0361 */
/* at Tue Mar 18 18:04:01 2003
 */
/* Compiler settings for iec.idl:
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

MIDL_DEFINE_GUID(IID, IID_ISystemDebugEventShutdown,0x6c736dcf,0xab0d,0x11D0,0xa2,0xad,0x00,0xA0,0xC9,0x0f,0x27,0xe8);


MIDL_DEFINE_GUID(IID, IID_ISystemDebugReadRuntimeVariablesSettings,0x6c736d02,0x1222,0x11d3,0xBA,0x1D,0x00,0x10,0x5A,0xA3,0x1A,0x58);


MIDL_DEFINE_GUID(IID, LIBID_IECLib,0x6c736d48,0xB50A,0x11D0,0xA2,0xAE,0x00,0xA0,0xC9,0x0F,0x27,0xE8);


MIDL_DEFINE_GUID(CLSID, CLSID_IECObj,0x6c736dB1,0xBD94,0x11D0,0x8A,0x23,0x00,0xAA,0x00,0xB5,0x8E,0x10);


MIDL_DEFINE_GUID(CLSID, CLSID_VSAnalyzerRuntimeVariablesObject,0x6c736dB5,0xBD94,0x11D0,0x8A,0x23,0x00,0xAA,0x00,0xB5,0x8E,0x10);

#undef MIDL_DEFINE_GUID

#ifdef __cplusplus
}
#endif



#endif /* !defined(_M_IA64) && !defined(_M_AMD64)*/

