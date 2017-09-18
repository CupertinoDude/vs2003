

/* this ALWAYS GENERATED file contains the IIDs and CLSIDs */

/* link this file in with the server and any clients */


 /* File created by MIDL compiler version 6.00.0361 */
/* at Tue Mar 18 18:03:38 2003
 */
/* Compiler settings for appprofeventservice.idl:
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

MIDL_DEFINE_GUID(IID, IID_IMSFTAppProfEventService,0x6c736dC2,0x5B33,0x452c,0xB2,0x83,0x4A,0x07,0x3D,0x65,0x6A,0x7A);


MIDL_DEFINE_GUID(IID, LIBID_MSFTAppProfEventServiceLib,0x6c736dC1,0x5B33,0x452c,0xB2,0x83,0x4A,0x07,0x3D,0x65,0x6A,0x7A);


MIDL_DEFINE_GUID(CLSID, CLSID_MSFTAppProfEventService,0x6c736dC3,0x5B33,0x452c,0xB2,0x83,0x4A,0x07,0x3D,0x65,0x6A,0x7A);


MIDL_DEFINE_GUID(CLSID, CLSID_VSAWMIEventSourceProvider,0x745FE21D,0x2E74,0x4f8b,0xBE,0x22,0x89,0x44,0x46,0xA9,0xF1,0xCD);

#undef MIDL_DEFINE_GUID

#ifdef __cplusplus
}
#endif



#endif /* !defined(_M_IA64) && !defined(_M_AMD64)*/

