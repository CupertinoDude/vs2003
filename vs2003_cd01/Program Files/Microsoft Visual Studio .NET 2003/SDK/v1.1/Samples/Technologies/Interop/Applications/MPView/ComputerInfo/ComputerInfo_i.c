/* this file contains the actual definitions of */
/* the IIDs and CLSIDs */

/* link this file in with the server and any clients */


/* File created by MIDL compiler version 5.01.0164 */
/* at Thu Oct 26 18:00:48 2000
 */
/* Compiler settings for D:\com99\Tst\TestSrc\Interop\RealWorld\MPView\ComputerInfo\ComputerInfo.idl:
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

const IID IID_IMachineInfo = {0x4B2767D9,0x7F6A,0x4CCB,{0x80,0x1F,0x96,0x39,0x67,0x24,0x3C,0x3B}};


const IID IID_IFileInfo = {0x411140A9,0xA591,0x49C9,{0x8A,0x63,0xA5,0x5D,0x05,0x25,0xE5,0xF9}};


const IID LIBID_COMPUTERINFOLib = {0x72C4542B,0x1223,0x4076,{0xAF,0xCD,0x09,0x44,0xCD,0x07,0x20,0x34}};


const CLSID CLSID_MachineInfo = {0xB9645D48,0x7260,0x4092,{0xB0,0x58,0xF9,0x83,0x0C,0x3E,0x47,0x46}};


const CLSID CLSID_FileInfo = {0xA54E14E9,0x29BB,0x4AA5,{0xB4,0xFE,0x21,0x89,0xA9,0x00,0x22,0x13}};


#ifdef __cplusplus
}
#endif

