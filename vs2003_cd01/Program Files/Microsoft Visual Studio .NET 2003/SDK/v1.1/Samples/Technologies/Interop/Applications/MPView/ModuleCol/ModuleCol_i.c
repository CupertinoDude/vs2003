/* this file contains the actual definitions of */
/* the IIDs and CLSIDs */

/* link this file in with the server and any clients */


/* File created by MIDL compiler version 5.01.0164 */
/* at Mon Oct 23 15:24:26 2000
 */
/* Compiler settings for D:\com99\Tst\TestSrc\Interop\RealWorld\MPView\ModuleCol\ModuleCol.idl:
    Oicf (OptLev=i2), W1, Zp8, env=Win32, ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
*/
//@@MIDL_FILE_HEADING(  )
#ifdef __cplusplus
extern "C"{
#endif 


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

const IID IID_IDllCol = {0x9CBCB913,0x67D6,0x4353,{0x96,0x8A,0x98,0xF2,0x6B,0x22,0xF7,0xD8}};


const IID IID_IProcCollection = {0xD710E490,0x48FF,0x43AB,{0x89,0xF0,0x3A,0x1D,0x7E,0xAA,0x87,0xE1}};


const IID LIBID_MODULECOLLib = {0xA6C5C541,0x0624,0x4897,{0x9D,0xED,0x03,0x93,0x83,0xBC,0x2D,0xF4}};


const CLSID CLSID_ProcCollection = {0xDB5B1C2F,0x1576,0x4491,{0x97,0x48,0x2F,0x04,0x9D,0x8B,0xF2,0x87}};


const CLSID CLSID_DllCol = {0x287ED1AC,0xB3FE,0x4B3E,{0x86,0x3B,0xAE,0xE8,0x67,0x4B,0x01,0x5C}};


#ifdef __cplusplus
}
#endif

