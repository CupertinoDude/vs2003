

/* this ALWAYS GENERATED file contains the IIDs and CLSIDs */

/* link this file in with the server and any clients */


 /* File created by MIDL compiler version 6.00.0361 */
/* at Tue Mar 18 18:05:28 2003
 */
/* Compiler settings for vaevt.idl:
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

MIDL_DEFINE_GUID(IID, IID_ISystemDebugEventFire,0x6c736dC1,0xAB0D,0x11d0,0xA2,0xAD,0x00,0xA0,0xC9,0x0F,0x27,0xE8);


MIDL_DEFINE_GUID(IID, IID_ISystemDebugEventFireAuto,0x6c736dee,0xAB0e,0x11d0,0xA2,0xAD,0x00,0xA0,0xC9,0x0F,0x27,0xE8);


MIDL_DEFINE_GUID(IID, IID_ISystemDebugEventInstall,0x6c736dC0,0xAB0D,0x11d0,0xA2,0xAD,0x00,0xA0,0xC9,0x0F,0x27,0xE8);


MIDL_DEFINE_GUID(IID, IID_ISystemDebugEventInstall2,0x94B963ED,0xE6D6,0x4042,0xAD,0x16,0x6E,0xF5,0x2B,0x08,0x7E,0x5B);


MIDL_DEFINE_GUID(IID, IID_ISystemDebugEventInstallAuto,0x6c736ded,0xAB0D,0x11d0,0xA2,0xAD,0x00,0xA0,0xC9,0x0F,0x27,0xE8);


MIDL_DEFINE_GUID(IID, IID_ISystemDebugEventInstallAuto2,0x74896186,0x7904,0x482e,0x9F,0xA5,0x91,0x18,0xB1,0xD8,0x9F,0x45);

#undef MIDL_DEFINE_GUID

#ifdef __cplusplus
}
#endif



#endif /* !defined(_M_IA64) && !defined(_M_AMD64)*/

