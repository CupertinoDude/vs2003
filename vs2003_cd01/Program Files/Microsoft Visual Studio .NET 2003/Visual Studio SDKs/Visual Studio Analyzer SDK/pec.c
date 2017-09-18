

/* this ALWAYS GENERATED file contains the IIDs and CLSIDs */

/* link this file in with the server and any clients */


 /* File created by MIDL compiler version 6.00.0361 */
/* at Tue Mar 18 18:04:57 2003
 */
/* Compiler settings for pec.idl:
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

MIDL_DEFINE_GUID(IID, IID_ISystemDebugEventCategory,0x6c736dB8,0x75F5,0x43f9,0x92,0x04,0xDE,0x2F,0x40,0x5B,0x24,0xFF);


MIDL_DEFINE_GUID(IID, IID_ISystemDebugComponent,0x6c736dB9,0x75F5,0x43f9,0x92,0x04,0xDE,0x2F,0x40,0x5B,0x24,0xFF);


MIDL_DEFINE_GUID(IID, IID_ISystemDebugProcess,0x6c736dBB,0x75F5,0x43f9,0x92,0x04,0xDE,0x2F,0x40,0x5B,0x24,0xFF);


MIDL_DEFINE_GUID(IID, IID_ISystemDebugMachine,0x6c736dBC,0x75F5,0x43f9,0x92,0x04,0xDE,0x2F,0x40,0x5B,0x24,0xFF);


MIDL_DEFINE_GUID(IID, IID_ISystemDebugEventsEnumComponents,0x6c736dFA,0xC552,0x11d2,0x96,0x48,0x00,0x10,0x5A,0xA3,0x16,0xF7);


MIDL_DEFINE_GUID(IID, IID_ISystemDebugEventsEnumEvents,0x6c736dFB,0xC552,0x11d2,0x96,0x48,0x00,0x10,0x5A,0xA3,0x16,0xF7);


MIDL_DEFINE_GUID(IID, IID_ISystemDebugEventsEnumConnectedMachines,0x6c736dFC,0xC552,0x11d2,0x96,0x48,0x00,0x10,0x5A,0xA3,0x16,0xF7);


MIDL_DEFINE_GUID(IID, IID_ISystemDebugEventsEnumProcesses,0x6c736d26,0xC5CE,0x11d2,0x96,0x48,0x00,0x10,0x5A,0xA3,0x16,0xF7);


MIDL_DEFINE_GUID(IID, IID_ISystemDebugControlPEC,0x6c736d9A,0xC533,0x11d2,0x96,0x48,0x00,0x10,0x5A,0xA3,0x16,0xF7);


MIDL_DEFINE_GUID(IID, IID_ISystemDebugRuntimeVariablesSettings,0x6c736d00,0x1222,0x11d3,0xBA,0x1D,0x00,0x10,0x5A,0xA3,0x1A,0x58);


MIDL_DEFINE_GUID(IID, IID_ISystemDebugControlPECPrivate,0x6c736dB2,0x6801,0x4d56,0xA8,0x1F,0x93,0x99,0x83,0xCA,0xCE,0xD9);


MIDL_DEFINE_GUID(IID, LIBID_MSVSAnalyzerPECLibrary,0x6c736dF2,0xC501,0x11d2,0x96,0x48,0x00,0x10,0x5A,0xA3,0x16,0xF7);


MIDL_DEFINE_GUID(CLSID, CLSID_MSVSAnalyzerPECObj,0x6c736dBA,0xC500,0x11D2,0x96,0x48,0x00,0x10,0x5A,0xA3,0x16,0xF7);

#undef MIDL_DEFINE_GUID

#ifdef __cplusplus
}
#endif



#endif /* !defined(_M_IA64) && !defined(_M_AMD64)*/

