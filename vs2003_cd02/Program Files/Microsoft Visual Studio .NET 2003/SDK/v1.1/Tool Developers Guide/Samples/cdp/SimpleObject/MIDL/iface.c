
#pragma warning( disable: 4049 )  /* more than 64k source lines */

/* this ALWAYS GENERATED file contains the IIDs and CLSIDs */

/* link this file in with the server and any clients */


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

MIDL_DEFINE_GUID(IID, IID_ICDPTests,0x00000abc,0xb41b,0x11cf,0xa6,0xbb,0x00,0x80,0xc7,0xb2,0xd6,0x82);


MIDL_DEFINE_GUID(IID, IID_IFoo,0x000F00F0,0x0F00,0x11cf,0xa6,0xbb,0x00,0x80,0xc7,0xb2,0xd6,0x84);


MIDL_DEFINE_GUID(IID, IID_IUniversalMarshaler,0x56823962,0x6326,0x3651,0xa6,0x32,0x62,0x66,0x90,0x87,0x32,0x84);


MIDL_DEFINE_GUID(IID, LIBID_ServerLib,0x00000abc,0xb997,0x11cf,0xa6,0xbb,0x00,0x80,0xc7,0xb2,0xd6,0x82);


MIDL_DEFINE_GUID(CLSID, CLSID_CDPObject,0x00000abc,0x882c,0x11cf,0xa6,0xbb,0x00,0x80,0xc7,0xb2,0xd6,0x84);

#undef MIDL_DEFINE_GUID

#ifdef __cplusplus
}
#endif



#endif /* !defined(_M_IA64) && !defined(_M_AMD64)*/

