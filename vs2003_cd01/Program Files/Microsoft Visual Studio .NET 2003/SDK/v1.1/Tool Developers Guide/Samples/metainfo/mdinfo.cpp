//*****************************************************************************
// File: mdinfo.cpp
//
// Copyright (c) Microsoft Corporation.  All Rights Reserved.
//*****************************************************************************
#define _DEFINE_META_DATA_META_CONSTANTS

#include <stdio.h>
#include <windows.h>
#include <objbase.h>
#include <crtdbg.h>
#include <assert.h>
#include <malloc.h>

#define INIT_GUID
#include <initguid.h>

#include <cor.h>
#include "assert.h"
#include "CorError.h"

#include <corhlpr.h>
#include "cahlpr.h"

#include "mdinfo.h"

#define ENUM_BUFFER_SIZE 10
#define TAB_SIZE 8

#define NumItems(s) (sizeof(s) / sizeof(s[0]))

#define ISFLAG(p,x) if (Is##p##x(flags)) strcat(sFlags, "["#x "] ");

HRESULT  _FillVariant(
    BYTE        bCPlusTypeFlag, 
    void const  *pValue,
    VARIANT     *pvar); 

LPCWSTR PrettyPrintSig(
	PCCOR_SIGNATURE typePtr,			// type to convert, 	
	unsigned	typeLen,				// length of type
	LPCWSTR 	name,					// can be L"", the name of the method for this sig	
	CQuickBytes *out,					// where to put the pretty printed string	
	IMetaDataImport *pIMDI);			// Import api to use.

// Validator declarations.
extern DWORD g_ValModuleType;
#include <ivehandler.h>

// Tables for mapping element type to text
char *g_szMapElementType[] = 
{
    "End",          // 0x0
    "Void",         // 0x1
    "Boolean",
    "Char", 
    "I1",
    "UI1",
    "I2",           // 0x6
    "UI2",
    "I4",
    "UI4",
    "I8",
    "UI8",
    "R4",
    "R8",
    "String",
    "Ptr",          // 0xf
    "ByRef",        // 0x10
    "ValueClass",
    "Class",
    "CopyCtor",
    "MDArray",      // 0x14
    "GENArray",
    "TypedByRef",
    "VALUEARRAY",
    "I",
    "U",
    "R",            // 0x1a
    "FNPTR",
    "Object",
    "SZArray",
    "GENERICArray",
    "CMOD_REQD",
    "CMOD_OPT",
    "INTERNAL",
};

char *g_szMapUndecorateType[] = 
{
    "",                 // 0x0
    "void",
    "boolean",
    "Char", 
    "byte",
    "unsigned byte",
    "short",
    "unsigned short",
    "int",
    "unsigned int",
    "long",
    "unsigned long",
    "float",
    "double",
    "String",
    "*",                // 0xf
    "ByRef",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "Function Pointer",
    "Object",
    "",
    "",
    "CMOD_REQD",
    "CMOD_OPT",
    "INTERNAL",
};

char *g_strCalling[] = 
{   
    "[DEFAULT]",
    "[C]",
    "[STDCALL]",
    "[THISCALL]",
    "[FASTCALL]",
    "[VARARG]",
    "[FIELD]",
    "[LOCALSIG]",
    "[PROPERTY]",
    "[UNMANAGED]",
};

char *g_szNativeType[] =
{
    "NATIVE_TYPE_END(DEPRECATED!)",  //         = 0x0,    //DEPRECATED
    "NATIVE_TYPE_VOID(DEPRECATED!)",  //        = 0x1,    //DEPRECATED
    "NATIVE_TYPE_BOOLEAN",  //     = 0x2,    // (4 byte boolean value: TRUE = non-zero, FALSE = 0)
    "NATIVE_TYPE_I1",  //          = 0x3,  
    "NATIVE_TYPE_U1",  //          = 0x4,  
    "NATIVE_TYPE_I2",  //          = 0x5,  
    "NATIVE_TYPE_U2",  //          = 0x6,  
    "NATIVE_TYPE_I4",  //          = 0x7,  
    "NATIVE_TYPE_U4",  //          = 0x8,  
    "NATIVE_TYPE_I8",  //          = 0x9,  
    "NATIVE_TYPE_U8",  //          = 0xa,  
    "NATIVE_TYPE_R4",  //          = 0xb,  
    "NATIVE_TYPE_R8",  //          = 0xc,  
    "NATIVE_TYPE_SYSCHAR(DEPRECATED!)",  //     = 0xd,    //DEPRECATED 
    "NATIVE_TYPE_VARIANT(DEPRECATED!)",  //     = 0xe,    //DEPRECATED
    "NATIVE_TYPE_CURRENCY",				  //    = 0xf,
    "NATIVE_TYPE_PTR(DEPRECATED!)",  //         = 0x10,   //DEPRECATED  

    "NATIVE_TYPE_DECIMAL(DEPRECATED!)",  //     = 0x11,   //DEPRECATED
    "NATIVE_TYPE_DATE(DEPRECATED!)",  //        = 0x12,   //DEPRECATED
    "NATIVE_TYPE_BSTR",  //        = 0x13, 
    "NATIVE_TYPE_LPSTR",  //       = 0x14, 
    "NATIVE_TYPE_LPWSTR",  //      = 0x15, 
    "NATIVE_TYPE_LPTSTR",  //      = 0x16, 
    "NATIVE_TYPE_FIXEDSYSSTRING",  //  = 0x17, 
    "NATIVE_TYPE_OBJECTREF(DEPRECATED!)",  //   = 0x18,   //DEPRECATED
    "NATIVE_TYPE_IUNKNOWN",  //    = 0x19,
    "NATIVE_TYPE_IDISPATCH",  //   = 0x1a,
    "NATIVE_TYPE_STRUCT",  //      = 0x1b, 
    "NATIVE_TYPE_INTF",  //        = 0x1c, 
    "NATIVE_TYPE_SAFEARRAY",  //   = 0x1d, 
    "NATIVE_TYPE_FIXEDARRAY",  //  = 0x1e, 
    "NATIVE_TYPE_INT",  //         = 0x1f, 
    "NATIVE_TYPE_UINT",  //        = 0x20, 

    //@todo: sync up the spec   
    "NATIVE_TYPE_NESTEDSTRUCT(DEPRECATED!)",  //  = 0x21, //DEPRECATED (use "NATIVE_TYPE_STRUCT)   

    "NATIVE_TYPE_BYVALSTR",  //    = 0x22,
                              
    "NATIVE_TYPE_ANSIBSTR",  //    = 0x23,

    "NATIVE_TYPE_TBSTR",  //       = 0x24, // select BSTR or ANSIBSTR depending on platform


    "NATIVE_TYPE_VARIANTBOOL",  // = 0x25, // (2-byte boolean value: TRUE = -1, FALSE = 0)
    "NATIVE_TYPE_FUNC",  //        = 0x26,
    "NATIVE_TYPE_LPVOID",  //      = 0x27, // blind pointer (no deep marshaling)

    "NATIVE_TYPE_ASANY",  //       = 0x28,
	"<UNDEFINED NATIVE TYPE 0x29>",
    "NATIVE_TYPE_ARRAY",  //       = 0x2a,
    "NATIVE_TYPE_LPSTRUCT",  //    = 0x2b,
    "NATIVE_TYPE_CUSTOMMARSHALER", //           = 0x2c, // Custom marshaler.
    "NATIVE_TYPE_ERROR", //        = 0x2d, // VT_HRESULT when exporting to a typelib.
};


size_t g_cbCoffNames = 0;

mdMethodDef g_tkEntryPoint = 0; // integration with ILDASM

template <class T> class CQuickArray : public CQuickBytes
{
public:
    ~CQuickArray<T>() { Destroy(); }
    T* Alloc(int iItems) 
        { return (T*)CQuickBytes::Alloc(iItems * sizeof(T)); }
    HRESULT ReSize(SIZE_T iItems) 
        { return CQuickBytes::ReSize(iItems * sizeof(T)); }
    T* Ptr() 
        { return (T*) CQuickBytes::Ptr(); }
    size_t Size()
        { return CQuickBytes::Size() / sizeof(T); }
    size_t MaxSize()
        { return CQuickBytes::cbTotal / sizeof(T); }
    void Maximize()
        { return CQuickBytes::Maximize(); }

    T& operator[] (size_t ix)
    { _ASSERTE(ix < static_cast<unsigned int>(Size()));
        return *(Ptr() + ix);
    }
    void Destroy() 
        { CQuickBytes::Destroy(); }
};


// helper to init signature buffer
void MDInfo::InitSigBuffer()
{
    strcpy((LPSTR)m_sigBuf.Ptr(), "");
} // void MDInfo::InitSigBuffer()

// helper to append a string into the signature buffer. If size of signature buffer is not big enough,
// we will grow it.
HRESULT MDInfo::AddToSigBuffer(char *string)
{
    HRESULT     hr;
    IfFailRet( m_sigBuf.ReSize(strlen((LPSTR)m_sigBuf.Ptr()) + strlen(string) + 1) );
    strcat((LPSTR)m_sigBuf.Ptr(), string);
    return NOERROR;
} // HRESULT MDInfo::AddToSigBuffer()

MDInfo::MDInfo(IMetaDataImport *pImport, IMetaDataAssemblyImport *pAssemblyImport, LPCWSTR szScope, strPassBackFn inPBFn, ULONG DumpFilter)
{   // This constructor is specific to ILDASM/MetaInfo integration

    _ASSERTE(pImport != NULL);
    _ASSERTE(NumItems(g_szMapElementType) == NumItems(g_szMapUndecorateType));
    _ASSERTE(NumItems(g_szMapElementType) == ELEMENT_TYPE_MAX);

    Init(inPBFn, (DUMP_FILTER)DumpFilter);
    
    m_pImport = pImport;
    m_pImport->AddRef();
    if (m_pAssemblyImport = pAssemblyImport) 
        m_pAssemblyImport->AddRef();
    else
    {
        HRESULT hr = m_pImport->QueryInterface(IID_IMetaDataAssemblyImport, (void**) &m_pAssemblyImport);
        if (FAILED(hr))
            Error("QueryInterface failed for IID_IMetaDataAssemblyImport.", hr);
    }

} // MDInfo::MDInfo()

MDInfo::MDInfo(IMetaDataDispenserEx *pDispenser, LPCWSTR szScope, strPassBackFn inPBFn, ULONG DumpFilter)
{
    HRESULT     hr = S_OK;
    VARIANT     value;

    _ASSERTE(pDispenser != NULL && inPBFn != NULL);
    _ASSERTE(NumItems(g_szMapElementType) == NumItems(g_szMapUndecorateType));
    _ASSERTE(NumItems(g_szMapElementType) == ELEMENT_TYPE_MAX);

    Init(inPBFn, (DUMP_FILTER)DumpFilter);

    // Attempt to open scope on given file
    hr = pDispenser->OpenScope(szScope, 0, IID_IMetaDataImport, (IUnknown**)&m_pImport);
    if (hr == CLDB_E_BADUPDATEMODE)
    {
        V_VT(&value) = VT_UI4;
        V_UI4(&value) = MDUpdateIncremental;
        if (FAILED(hr = pDispenser->SetOption(MetaDataSetUpdate, &value)))
            Error("SetOption failed.", hr);
        hr = pDispenser->OpenScope(szScope, 0, IID_IMetaDataImport, (IUnknown**)&m_pImport);
    }
    if (FAILED(hr))
        Error("OpenScope failed", hr);

    // Query for the IMetaDataAssemblyImport interface.
    hr = m_pImport->QueryInterface(IID_IMetaDataAssemblyImport, (void**) &m_pAssemblyImport);
    if (FAILED(hr))
        Error("QueryInterface failed for IID_IMetaDataAssemblyImport.", hr);

} // MDInfo::MDInfo()


MDInfo::MDInfo(IMetaDataDispenserEx *pDispenser, PBYTE pbMetaData, DWORD dwSize, strPassBackFn inPBFn, ULONG DumpFilter)
{
    _ASSERTE(pDispenser != NULL && inPBFn != NULL);
    _ASSERTE(NumItems(g_szMapElementType) == NumItems(g_szMapUndecorateType));
    _ASSERTE(NumItems(g_szMapElementType) == ELEMENT_TYPE_MAX);

    Init(inPBFn, (DUMP_FILTER)DumpFilter);

    // Attempt to open scope on manifest. It's valid for this to fail, because
    // the blob we open may just be the assembly resources (the space is
    // overloaded until we remove LM -a assemblies, at which point this
    // constructor should probably be removed too).
    HRESULT hr;
    if (SUCCEEDED(hr = pDispenser->OpenScopeOnMemory(pbMetaData, dwSize, 0,
                            IID_IMetaDataImport, (IUnknown**)&m_pImport)))
    {
        // Query for the IMetaDataAssemblyImport interface.
        hr = m_pImport->QueryInterface(IID_IMetaDataAssemblyImport, (void**) &m_pAssemblyImport);
        if (FAILED(hr))
            Error("QueryInterace failed for IID_IMetaDataAssemblyImport.", hr);
    }

} // MDInfo::MDInfo()

void MDInfo::Init(
    strPassBackFn inPBFn,               // Callback to write text.
    DUMP_FILTER DumpFilter)             // Flags to control the dump.
{
    m_VEHandlerReporterPtr = 0;
    m_pbFn = inPBFn;
    m_DumpFilter = DumpFilter;
    m_pTables = 0;
    m_pImport = NULL;
    m_pAssemblyImport = NULL;
} // void MDInfo::Init()

// Destructor
MDInfo::~MDInfo()
{
    if (m_pImport)
        m_pImport->Release();
    if (m_pAssemblyImport)
        m_pAssemblyImport->Release();
    if (m_pTables)
        m_pTables->Release();
} // MDInfo::~MDInfo()

//=====================================================================================================================
//#define EXTERNAL_VE_HANDLER_FOR_MD_VALIDATION
#ifndef EXTERNAL_VE_HANDLER_FOR_MD_VALIDATION

HINSTANCE GetModuleInst()
{
    return NULL;
} // HINSTANCE GetModuleInst()

typedef HRESULT (*REPORTFCTN)(LPCWSTR, VEContext, HRESULT);
HRESULT DefaultReporter( // Return status.
    LPCWSTR     szMsg,                  // Error message.
    VEContext   Context,                // Error context (offset,token)
    HRESULT     hrRpt)                      // Original HRESULT
{ 
    WCHAR* wzMsg;
    if(szMsg)
    {
        wzMsg = new WCHAR[lstrlenW(szMsg)+256];
        lstrcpyW(wzMsg,szMsg);
        // include token and offset from Context
        if(Context.Token) swprintf(&wzMsg[lstrlenW(wzMsg)],L" [token:0x%08X]",Context.Token);
        if(Context.uOffset) swprintf(&wzMsg[lstrlenW(wzMsg)],L" [at:0x%X]",Context.uOffset);
        swprintf(&wzMsg[lstrlenW(wzMsg)],L" [hr:0x%08X]",hrRpt);
        wprintf(L"%s\n", wzMsg);
    }
    return S_OK;
} // HRESULT DefaultReporter()

class MDVEHandlerClass : public IVEHandler
{
public: 
    SIZE_T      m_refCount;
    REPORTFCTN  m_fnReport;

    MDVEHandlerClass() { m_refCount=0; m_fnReport=DefaultReporter; };
    virtual ~MDVEHandlerClass() { };

    //-----------------------------------------------------------
    // IUnknown support
    //-----------------------------------------------------------
    HRESULT STDMETHODCALLTYPE    QueryInterface(REFIID id, void** pInterface) 
    {
        if (id == __uuidof(IVEHandler))
            *pInterface = (IVEHandler*)this;
        /*
        else if (id == IID_IUnknown)
            *pInterface = (IUnknown*)(IVEHandler*)this;
        */
        else
        {
            *pInterface = NULL;
            return E_NOINTERFACE;
        }

        AddRef();
        return S_OK;
    }
    ULONG STDMETHODCALLTYPE AddRef() 
    {
        return (InterlockedIncrement((long *) &m_refCount));
    }

    ULONG STDMETHODCALLTYPE Release() 
    {
        long        refCount = InterlockedDecrement((long *) &m_refCount);
        if (refCount == 0) delete this;
        return (refCount);
    }
    //-----------------------------------------------------------
    // IVEHandler support
    //-----------------------------------------------------------
    HRESULT STDMETHODCALLTYPE   SetReporterFtn(__int64 lFnPtr)
    {
        m_fnReport = lFnPtr ? reinterpret_cast<REPORTFCTN>(lFnPtr) 
                             : DefaultReporter;
        return S_OK;
    };

//*****************************************************************************
// The Verification Event Handler itself. Declared in VEHandler.h as virtual, may be overridden
//*****************************************************************************
    HRESULT STDMETHODCALLTYPE VEHandler(HRESULT hrRpt, VEContext Context, SAFEARRAY *psa)
    {
        WCHAR       rcBuf[1024];             // Resource string.
        WCHAR       rcMsg[1024];             // Error message.
        va_list     marker,pval;             // User text.
        HRESULT     hr;
        VARIANT     *pVar,Var;
        ULONG       nVars,i,lVar,j,l,k;
        WCHAR       *pWsz[1024], *pwsz; // is more than 1024 string arguments likely?

        // Return warnings without text.
        if (!FAILED(hrRpt))
            return (hrRpt);
        memset(pWsz,0,sizeof(pWsz));
        // Convert safearray of variants into va_list
        if(psa && (nVars = psa->rgsabound[0].cElements))
        {
            _ASSERTE(psa->fFeatures & FADF_VARIANT);
            _ASSERTE(psa->cDims == 1);
            marker = (va_list)(new char[nVars*sizeof(double)]); // double being the largest variant element
            for(i=0,pVar=(VARIANT *)(psa->pvData),pval=marker; i < nVars; pVar++,i++)
            {
                memcpy(&Var,pVar,sizeof(VARIANT));
                switch(Var.vt)
                {
                    case VT_I1:
                    case VT_UI1:    lVar = 1; break;

                    case VT_I2:
                    case VT_UI2:    lVar = 2; break;

                    case VT_R8:
                    case VT_CY:
                    case VT_DATE:   lVar = 8; break;

                    case VT_BYREF|VT_I1:
                    case VT_BYREF|VT_UI1: // it's ASCII string, convert it to UNICODE
                        lVar = 4;
                        l = strlen((char *)(Var.pbVal))+1;
                        pwsz = new WCHAR[l];
                        for(j=0; j<l; j++) pwsz[j] = Var.pbVal[j];
                        for(k=0; pWsz[k]; k++);
                        pWsz[k] = pwsz;
                        Var.piVal = (short *)pwsz;
                        break;

                    default:        lVar = 4; break;
                }
                memcpy(pval,&(Var.bVal),lVar);
                pval += (lVar + sizeof(int) - 1) & ~(sizeof(int) - 1); //From STDARG.H: #define _INTSIZEOF(n)
            }
        }
        else
            marker = NULL;

        // If this is one of our errors, then give the error code.
        if (HRESULT_FACILITY(hrRpt) == FACILITY_URT)
        {
            swprintf(rcMsg, L"Validator error: 0x%08x", hrRpt);
        }
        // Otherwise it isn't one of ours, so we need to see if the system can
        // find the text for it.
        else
        {
            if (FormatMessageW(FORMAT_MESSAGE_FROM_SYSTEM,
                    0, hrRpt, MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
                    rcMsg, NumItems(rcMsg), 0))
            {
                hr = S_OK;

                // System messages contain a trailing \r\n, which we don't want normally.
                int iLen = lstrlenW(rcMsg);
                if (iLen > 3 && rcMsg[iLen - 2] == '\r' && rcMsg[iLen - 1] == '\n')
                    rcMsg[iLen - 2] = '\0';
            }
            else
                hr = HRESULT_FROM_WIN32(GetLastError());
        }
        if(marker) delete marker;

        // If we failed to find the message anywhere, then issue a hard coded message.
        if (FAILED(hr))
        {
            swprintf(rcMsg, L".NET Framework Runtime Internal error: 0x%08x", hrRpt);
            //DEBUG_STMT(DbgWriteEx(rcMsg));
        }

        // delete WCHAR buffers allocated above (if any)
        for(k=0; pWsz[k]; k++) delete pWsz[k];

        return (m_fnReport(rcMsg, Context,hrRpt) == S_OK ? S_OK : E_FAIL);
    };

    static HRESULT STDMETHODCALLTYPE CreateObject(REFIID id, void **object)
    { return E_NOTIMPL; }
};

#endif
//=====================================================================================================================
// DisplayMD() function
//
// Displays the meta data content of a file

void MDInfo::DisplayMD()
{
    if (m_DumpFilter & dumpValidate)
    {
        IMetaDataValidate *pValidate = 0;
#ifndef EXTERNAL_VE_HANDLER_FOR_MD_VALIDATION
        MDVEHandlerClass    *pVEHandler = 0;
#else
        IVEHandler  *pVEHandler = 0;
#endif
        const char *szErrStr = 0;
        HRESULT     hr = S_OK;

        // Get a pointer to the Validator interface.
        hr = m_pImport->QueryInterface(IID_IMetaDataValidate, (void **) &pValidate);
        if (FAILED(hr))
        {
            szErrStr = "QueryInterface failed for IMetaDataValidate.";
            goto ErrExit;
        }

        // Get a pointer to the VEHandler interface.
#ifndef EXTERNAL_VE_HANDLER_FOR_MD_VALIDATION
        if(pVEHandler = new MDVEHandlerClass()) hr = S_OK;
        else hr = E_FAIL;
#else
        hr = CoCreateInstance(__uuidof(VEHandlerClass),
                           NULL,
                           CLSCTX_INPROC_SERVER,
                           __uuidof(IVEHandler),
                           (void **)&pVEHandler);
#endif
        if (FAILED(hr))
        {
#ifndef EXTERNAL_VE_HANDLER_FOR_MD_VALIDATION
            szErrStr = "Failed to create VEHandler.";
#else
            szErrStr = "CoCreateInstance(VEHandler) failed.";
#endif
            goto ErrExit;
        }

        if(m_VEHandlerReporterPtr) pVEHandler->SetReporterFtn((__int64)m_VEHandlerReporterPtr);

        hr = pValidate->ValidatorInit(g_ValModuleType, pVEHandler);
        if (FAILED(hr))
        {
            szErrStr = "ValidatorInit failed.";
            goto ErrExit;
        }

        hr = pValidate->ValidateMetaData();
        if (FAILED(hr))
        {
            szErrStr = "ValidateMetaData failed to run successfully.";
            goto ErrExit;
        }
        if (hr == S_OK)
            WriteLine("No warnings or errors found.");
        else if (hr == VLDTR_S_WRN)
            WriteLine("Warnings found.");
        else if (hr == VLDTR_S_ERR)
            WriteLine("Errors found.");
        else if (hr == VLDTR_S_WRNERR)
            WriteLine("Warnings and Errors found.");
        else
            VWriteLine("Validator returned unexpected success code, hr=0x%08x.", hr);
ErrExit:
        if (pValidate)
            pValidate->Release();
#ifdef EXTERNAL_VE_HANDLER_FOR_MD_VALIDATION
        if (pVEHandler)
            pVEHandler->Release();
#endif
        if (szErrStr)
            Error(szErrStr, hr);
    }
    else if (m_DumpFilter & (dumpSchema | dumpHeader | dumpCSV | dumpRaw | dumpStats | dumpRawHeaps))
        DisplayRaw();
    else if ((m_DumpFilter & dumpAssem) && m_pAssemblyImport)
        DisplayAssemblyInfo();
    else
    {
        DisplayVersionInfo();
        DisplayScopeInfo();
        WriteLine("===========================================================");
        DisplayGlobalFunctions();
        DisplayGlobalFields();
        DisplayGlobalMemberRefs();
        DisplayTypeDefs();
        DisplayTypeRefs();
        DisplayTypeSpecs();
        DisplayModuleRefs();
        DisplaySignatures();
        DisplayAssembly();
        DisplayUserStrings();

        // WriteLine("============================================================");
        // WriteLine("Unresolved MemberRefs");
        // DisplayMemberRefs(0x00000001, "\t");

        if (m_DumpFilter & dumpUnsat)
            DisplayUnsatInfo();
    
    
        VWrite("\n\nCoff symbol name overhead:  %d\n", g_cbCoffNames);
    }
} // MDVEHandlerClass()

int MDInfo::WriteLine(char *str)
{
    int count = strlen(str);

    m_pbFn(str);
    m_pbFn("\n");
    return count;
} // int MDInfo::WriteLine()

int MDInfo::Write(char *str)
{
    int count = strlen(str);

    m_pbFn(str);
    return count;
} // int MDInfo::Write()

int MDInfo::VWriteLine(char *str, ...)
{
    va_list marker;
    int     count;

    va_start(marker, str);
    count = VWrite(str, marker);
    m_pbFn("\n");
    va_end(marker);
    return count;
} // int MDInfo::VWriteLine()

int MDInfo::VWrite(char *str, ...)
{
    va_list marker;
    int     count;

    va_start(marker, str);
    count = VWrite(str, marker);
    va_end(marker);
    return count;
} // int MDInfo::VWrite()

int MDInfo::VWrite(char *str, va_list marker)
{
    int     count = -1;
    int     i = 1;
    HRESULT hr;

    while (count < 0)
    {
        if (FAILED(hr = m_output.ReSize(STRING_BUFFER_LEN * i)))
            Error("ReSize failed.", hr);
        count = _vsnprintf((char *)m_output.Ptr(), STRING_BUFFER_LEN * i, str, marker);
        i *= 2;
    }
    m_pbFn((char *)m_output.Ptr());
    return count;
} // int MDInfo::VWriteToBuffer()

// Error() function -- prints an error and returns
void MDInfo::Error(const char* szError, HRESULT hr)
{
    printf("\n%s\n",szError);
    if (hr != S_OK)
    {
        IErrorInfo  *pIErr = NULL;          // Error interface.
        BSTR        bstrDesc = NULL;        // Description text.

        printf("Failed return code: 0x%08x\n", hr);

        // Try to get an error info object and display the message.
        if (GetErrorInfo(0, &pIErr) == S_OK &&
            pIErr->GetDescription(&bstrDesc) == S_OK)
        {
            printf("%ls ", bstrDesc);
            SysFreeString(bstrDesc);
        }

        // Free the error interface.
        if (pIErr)
            pIErr->Release();
    }
    CoUninitialize();
    exit(hr);
} // void MDInfo::Error()

// Print out the optional version info included in the MetaData.

void MDInfo::DisplayVersionInfo()
{
    if (!(m_DumpFilter & MDInfo::dumpNoLogo))
    {
        LPCUTF8 pVersionStr;
        HRESULT hr = S_OK;

        if (m_pTables == 0)
        {
            if (m_pImport)
                hr = m_pImport->QueryInterface(IID_IMetaDataTables, (void**)&m_pTables);
            else if (m_pAssemblyImport)
                hr = m_pAssemblyImport->QueryInterface(IID_IMetaDataTables, (void**)&m_pTables);
            else
                return;
            if (FAILED(hr))
                Error("QueryInterace failed for IID_IMetaDataTables.", hr);
        }

        hr = m_pTables->GetString(1, &pVersionStr);
        if (FAILED(hr))
            Error("GetString() failed.", hr);
        if (strstr(pVersionStr, "Version of runtime against which the binary is built : ")
                    == pVersionStr)
        {
            WriteLine(const_cast<char *>(pVersionStr));
        }
    }
} // void MDInfo::DisplayVersionInfo()

// Prints out information about the scope

void MDInfo::DisplayScopeInfo()
{
    HRESULT hr;
    mdModule mdm;
    GUID mvid;
    WCHAR scopeName[STRING_BUFFER_LEN];
    WCHAR guidString[STRING_BUFFER_LEN];

    hr = m_pImport->GetScopeProps( scopeName, STRING_BUFFER_LEN, 0, &mvid);
    if (FAILED(hr)) Error("GetScopeProps failed.", hr);

    VWriteLine("ScopeName : %ls",scopeName);

    if (!(m_DumpFilter & MDInfo::dumpNoLogo))
        VWriteLine("MVID      : %ls",GUIDAsString(mvid, guidString, STRING_BUFFER_LEN));

    hr = m_pImport->GetModuleFromScope(&mdm);
    if (FAILED(hr)) Error("GetModuleFromScope failed.", hr);
    DisplayPermissions(mdm, "");
    DisplayCustomAttributes(mdm, "\t");
} // void MDInfo::DisplayScopeInfo()

void MDInfo::DisplayRaw()
{
    int         iDump;                  // Level of info to dump.

    if (m_pTables == 0)
        m_pImport->QueryInterface(IID_IMetaDataTables, (void**)&m_pTables);
    if (m_pTables == 0)
        Error("Can't get table info.");

    if (m_DumpFilter & dumpCSV)
        DumpRawCSV();
    else
    {
        if (m_DumpFilter & dumpRaw)
            iDump = 3;
        else
        if (m_DumpFilter & dumpSchema)
            iDump = 2;
        else
            iDump = 1;
        
        DumpRaw(iDump, (m_DumpFilter & dumpStats) != 0);
    }
} // void MDInfo::DisplayRaw()

// return the name of the type of token passed in

char *MDInfo::TokenTypeName(mdToken inToken)
{
    switch(TypeFromToken(inToken))
    {
    case mdtTypeDef:        return "TypeDef";
    case mdtInterfaceImpl:  return "InterfaceImpl";
    case mdtMethodDef:      return "MethodDef";
    case mdtFieldDef:       return "FieldDef";
    case mdtTypeRef:        return "TypeRef";
    case mdtMemberRef:      return "MemberRef";
    case mdtCustomAttribute:return "CustomAttribute";
    case mdtParamDef:       return "ParamDef";
    case mdtProperty:       return "Property";
    case mdtEvent:          return "Event";
    default:                return "[UnknownTokenType]";
    }
} // char *MDInfo::TokenTypeName()

// Prints out name of the given memberref
//

LPCWSTR MDInfo::MemberRefName(mdMemberRef inMemRef, LPWSTR buffer, ULONG bufLen)
{
    HRESULT hr;
    

    hr = m_pImport->GetMemberRefProps( inMemRef, NULL, buffer, bufLen,
                                    NULL, NULL, NULL);
    if (FAILED(hr)) Error("GetMemberRefProps failed.", hr);
    
    return buffer;
} // LPCWSTR MDInfo::MemberRefName()


// Prints out information about the given memberref
//

void MDInfo::DisplayMemberRefInfo(mdMemberRef inMemRef, const char *preFix)
{
    HRESULT hr;
    WCHAR memRefName[STRING_BUFFER_LEN];
    ULONG nameLen;
    mdToken token;
    PCCOR_SIGNATURE pbSigBlob;
    ULONG ulSigBlob;
    char newPreFix[STRING_BUFFER_LEN];


    hr = m_pImport->GetMemberRefProps( inMemRef, &token, memRefName, STRING_BUFFER_LEN,
                                    &nameLen, &pbSigBlob, &ulSigBlob);
    if (FAILED(hr)) Error("GetMemberRefProps failed.", hr);
    
    VWriteLine("%s\t\tMember: (%8.8x) %ls: ", preFix, inMemRef, memRefName);

    if (ulSigBlob)
        DisplaySignature(pbSigBlob, ulSigBlob, preFix);
	else
		VWriteLine("%s\t\tERROR: no valid signature ", preFix);

    sprintf (newPreFix, "\t\t%s", preFix);
    DisplayCustomAttributes(inMemRef, newPreFix);
} // void MDInfo::DisplayMemberRefInfo()

// Prints out information about all memberrefs of the given typeref
//

void MDInfo::DisplayMemberRefs(mdToken tkParent, const char *preFix)
{
    HCORENUM memRefEnum = NULL;
    HRESULT hr;
    mdMemberRef memRefs[ENUM_BUFFER_SIZE];
    ULONG count, totalCount = 1;


    while (SUCCEEDED(hr = m_pImport->EnumMemberRefs( &memRefEnum, tkParent,
                             memRefs, NumItems(memRefs), &count)) && 
            count > 0)
    {
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            VWriteLine("%s\tMemberRef #%d", preFix, totalCount);
            VWriteLine("%s\t-------------------------------------------------------", preFix);
            DisplayMemberRefInfo(memRefs[i], preFix);
        }
    }
    m_pImport->CloseEnum( memRefEnum);
} // void MDInfo::DisplayMemberRefs()

// Prints out information about all resources in the com object
//

// Iterates through each typeref and prints out the information of each
//

void MDInfo::DisplayTypeRefs()
{
    HCORENUM typeRefEnum = NULL;
    mdTypeRef typeRefs[ENUM_BUFFER_SIZE];
    ULONG count, totalCount=1;
    HRESULT hr;
    
    while (SUCCEEDED(hr = m_pImport->EnumTypeRefs( &typeRefEnum,
                             typeRefs, NumItems(typeRefs), &count)) &&
            count > 0)
    {
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            VWriteLine("TypeRef #%d (%08x)", totalCount, typeRefs[i]);
            WriteLine("-------------------------------------------------------");
            DisplayTypeRefInfo(typeRefs[i]);
            DisplayMemberRefs(typeRefs[i], "");
            WriteLine("");
        }
    }
    m_pImport->CloseEnum( typeRefEnum);
} // void MDInfo::DisplayTypeRefs()

void MDInfo::DisplayTypeSpecs()
{
    HCORENUM typespecEnum = NULL;
    mdTypeSpec typespecs[ENUM_BUFFER_SIZE];
    ULONG count, totalCount=1;
    HRESULT hr;
    
    while (SUCCEEDED(hr = m_pImport->EnumTypeSpecs( &typespecEnum,
                             typespecs, NumItems(typespecs), &count)) &&
            count > 0)
    {
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            VWriteLine("TypeSpec #%d", totalCount);
            WriteLine("-------------------------------------------------------");
            DisplayTypeSpecInfo(typespecs[i], "");
            DisplayMemberRefs(typespecs[i], "");
            WriteLine("");
        }
    }
    m_pImport->CloseEnum( typespecEnum);
} // void MDInfo::DisplayTypeSpecs()



// Called to display the information about all typedefs in the object.
//

void MDInfo::DisplayTypeDefs()
{
    HCORENUM typeDefEnum = NULL;
    mdTypeDef typeDefs[ENUM_BUFFER_SIZE];
    ULONG count, totalCount = 1;
    HRESULT hr;
    
    while (SUCCEEDED(hr = m_pImport->EnumTypeDefs( &typeDefEnum,
                             typeDefs, NumItems(typeDefs), &count)) &&
            count > 0)
    {
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            VWriteLine("TypeDef #%d", totalCount);
            WriteLine("-------------------------------------------------------");
            DisplayTypeDefInfo(typeDefs[i]);
            WriteLine("");
        }
    }
    m_pImport->CloseEnum( typeDefEnum);
} // void MDInfo::DisplayTypeDefs()

// Called to display the information about all modulerefs in the object.
//

void MDInfo::DisplayModuleRefs()
{
    HCORENUM moduleRefEnum = NULL;
    mdModuleRef moduleRefs[ENUM_BUFFER_SIZE];
    ULONG count, totalCount = 1;
    HRESULT hr;
    
    while (SUCCEEDED(hr = m_pImport->EnumModuleRefs( &moduleRefEnum,
                             moduleRefs, NumItems(moduleRefs), &count)) &&
            count > 0)
    {
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            VWriteLine("ModuleRef #%d", totalCount);
            WriteLine("-------------------------------------------------------");
            DisplayModuleRefInfo(moduleRefs[i]);
            DisplayMemberRefs(moduleRefs[i], "");
            WriteLine("");
        }
    }
    m_pImport->CloseEnum( moduleRefEnum);
} // void MDInfo::DisplayModuleRefs()

// Prints out information about the given moduleref
//

void MDInfo::DisplayModuleRefInfo(mdModuleRef inModuleRef)
{
    HRESULT hr;
    WCHAR moduleRefName[STRING_BUFFER_LEN];
    ULONG nameLen;


    hr = m_pImport->GetModuleRefProps( inModuleRef, moduleRefName, STRING_BUFFER_LEN,
                                    &nameLen);
    if (FAILED(hr)) Error("GetModuleRefProps failed.", hr);
    
    VWriteLine("\t\tModuleRef: (%8.8x) %ls: ", inModuleRef, moduleRefName);
    DisplayCustomAttributes(inModuleRef, "\t\t");
} // void MDInfo::DisplayModuleRefInfo()


// Called to display the information about all signatures in the object.
//

void MDInfo::DisplaySignatures()
{
    HCORENUM signatureEnum = NULL;
    mdSignature signatures[ENUM_BUFFER_SIZE];
    ULONG count, totalCount = 1;
    HRESULT hr;
    
    while (SUCCEEDED(hr = m_pImport->EnumSignatures( &signatureEnum,
                             signatures, NumItems(signatures), &count)) &&
            count > 0)
    {
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            VWriteLine("Signature #%d", totalCount);
            WriteLine("-------------------------------------------------------");
            DisplaySignatureInfo(signatures[i]);
            WriteLine("");
        }
    }
    m_pImport->CloseEnum( signatureEnum);
} // void MDInfo::DisplaySignatures()


// Prints out information about the given signature
//

void MDInfo::DisplaySignatureInfo(mdSignature inSignature)
{
    HRESULT hr;
    PCCOR_SIGNATURE pbSigBlob;
    ULONG   ulSigBlob;


    hr = m_pImport->GetSigFromToken( inSignature, &pbSigBlob, &ulSigBlob );
    if (FAILED(hr)) Error("GetSigFromToken failed.", hr);
    if(ulSigBlob)
		DisplaySignature(pbSigBlob, ulSigBlob, "");
	else
		VWriteLine("\t\tERROR: no valid signature ");
} // void MDInfo::DisplaySignatureInfo()


// returns the passed-in buffer which is filled with the name of the given 
// member in wide characters
//

LPCWSTR MDInfo::MemberName(mdToken inToken, LPWSTR buffer, ULONG bufLen)
{
    HRESULT hr;
    

    hr = m_pImport->GetMemberProps( inToken, NULL, buffer, bufLen,
                            NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
    if (FAILED(hr)) Error("GetMemberProps failed.", hr);

    return (buffer);
} // LPCWSTR MDInfo::MemberName()


// displays information for the given method
//

void MDInfo::DisplayMethodInfo(mdMethodDef inMethod, DWORD *pflags)
{
    HRESULT hr;
    mdTypeDef memTypeDef;
    WCHAR memberName[STRING_BUFFER_LEN];
    ULONG nameLen;
    DWORD flags;
    PCCOR_SIGNATURE pbSigBlob;
    ULONG ulSigBlob;
    ULONG ulCodeRVA;
    ULONG ulImplFlags;


    hr = m_pImport->GetMethodProps( inMethod, &memTypeDef, memberName, STRING_BUFFER_LEN,
                            &nameLen, &flags, &pbSigBlob, &ulSigBlob, &ulCodeRVA, &ulImplFlags);
    if (FAILED(hr)) Error("GetMethodProps failed.", hr);
    if (pflags)
        *pflags = flags;

    VWriteLine("\t\tMethodName: %ls (%8.8X)", memberName, inMethod);

    char sFlags[STRING_BUFFER_LEN];

    strcpy(sFlags, "");
    ISFLAG(Md, Public);     
    ISFLAG(Md, Private);        
    ISFLAG(Md, Family);     
    ISFLAG(Md, Assem);      
    ISFLAG(Md, FamANDAssem);    
    ISFLAG(Md, FamORAssem); 
    ISFLAG(Md, PrivateScope);   
    ISFLAG(Md, Static);     
    ISFLAG(Md, Final);      
    ISFLAG(Md, Virtual);        
    ISFLAG(Md, HideBySig);  
    ISFLAG(Md, ReuseSlot);  
    ISFLAG(Md, NewSlot);        
    ISFLAG(Md, Abstract);       
    ISFLAG(Md, SpecialName);    
    ISFLAG(Md, RTSpecialName);
    ISFLAG(Md, PinvokeImpl);
    ISFLAG(Md, UnmanagedExport);
    if (!*sFlags)
        strcpy(sFlags, "[none]");

    if (IsMdInstanceInitializerW(flags, memberName)) strcat(sFlags, "[.ctor] ");
    if (IsMdClassConstructorW(flags, memberName)) strcat(sFlags, "[.cctor] ");
    // "Reserved" flags
    ISFLAG(Md, HasSecurity);
    ISFLAG(Md, RequireSecObject);

    VWriteLine("\t\tFlags     : %s (%08x)", sFlags, flags);
    VWriteLine("\t\tRVA       : 0x%08x", ulCodeRVA);

    flags = ulImplFlags;
    strcpy(sFlags, "");
    ISFLAG(Mi, Native);     
    ISFLAG(Mi, IL);         
    ISFLAG(Mi, OPTIL);      
    ISFLAG(Mi, Runtime);        
    ISFLAG(Mi, Unmanaged);  
    ISFLAG(Mi, Managed);        
    ISFLAG(Mi, ForwardRef);
    ISFLAG(Mi, PreserveSig);            
    ISFLAG(Mi, InternalCall);
    ISFLAG(Mi, Synchronized);
    ISFLAG(Mi, NoInlining);    
    if (!*sFlags)
        strcpy(sFlags, "[none]");

    VWriteLine("\t\tImplFlags : %s (%08x)", sFlags, flags);

    if (ulSigBlob)
        DisplaySignature(pbSigBlob, ulSigBlob, "");
	else
		VWriteLine("\t\tERROR: no valid signature ");

} // void MDInfo::DisplayMethodInfo()

// displays the member information for the given field
//

void MDInfo::DisplayFieldInfo(mdFieldDef inField, DWORD *pdwFlags)
{
    HRESULT hr;
    mdTypeDef memTypeDef;
    WCHAR memberName[STRING_BUFFER_LEN];
    ULONG nameLen;
    DWORD flags;
    PCCOR_SIGNATURE pbSigBlob;
    ULONG ulSigBlob;
    DWORD dwCPlusTypeFlag;
    void const *pValue;
    ULONG cbValue;
    VARIANT defaultValue;


    ::VariantInit(&defaultValue);
    hr = m_pImport->GetFieldProps( inField, &memTypeDef, memberName, STRING_BUFFER_LEN,
                            &nameLen, &flags, &pbSigBlob, &ulSigBlob, &dwCPlusTypeFlag,
                            &pValue, &cbValue);
    if (FAILED(hr)) Error("GetFieldProps failed.", hr);

    if (pdwFlags)
        *pdwFlags = flags;

    _FillVariant((BYTE)dwCPlusTypeFlag, pValue, &defaultValue);

    char sFlags[STRING_BUFFER_LEN];

    strcpy(sFlags, "");
    ISFLAG(Fd, Public);     
    ISFLAG(Fd, Private);        
    ISFLAG(Fd, Family);     
    ISFLAG(Fd, Assembly);       
    ISFLAG(Fd, FamANDAssem);    
    ISFLAG(Fd, FamORAssem); 
    ISFLAG(Fd, PrivateScope);   
    ISFLAG(Fd, Static);     
    ISFLAG(Fd, InitOnly);       
    ISFLAG(Fd, Literal);        
    ISFLAG(Fd, NotSerialized);
    ISFLAG(Fd, SpecialName);
    ISFLAG(Fd, RTSpecialName);
    ISFLAG(Fd, PinvokeImpl);    
    // "Reserved" flags
    ISFLAG(Fd, HasDefault);
    if (!*sFlags)
        strcpy(sFlags, "[none]");

    VWriteLine("\t\tField Name: %ls (%8.8X)", memberName, inField);
    VWriteLine("\t\tFlags     : %s (%08x)", sFlags, flags);
    VWriteLine("\t\tDefltValue: %ls",VariantAsString(&defaultValue));
    if (!ulSigBlob) // Signature size should be non-zero for fields
		VWriteLine("\t\tERROR: no valid signature ");
	else
		DisplaySignature(pbSigBlob, ulSigBlob, "");
} // void MDInfo::DisplayFieldInfo()

// displays the RVA for the given global field.
void MDInfo::DisplayFieldRVA(mdFieldDef inFieldDef)
{
    HRESULT hr;
    ULONG   ulRVA;

    hr = m_pImport->GetRVA(inFieldDef, &ulRVA, 0);
    if (FAILED(hr) && hr != CLDB_E_RECORD_NOTFOUND) Error("GetRVA failed.", hr);

    VWriteLine("\t\tRVA       : 0x%08x", ulRVA);
} // void MDInfo::DisplayFieldRVA()

// displays information about every global function.
void MDInfo::DisplayGlobalFunctions()
{
    WriteLine("Global functions");
    WriteLine("-------------------------------------------------------");
    DisplayMethods(mdTokenNil);
    WriteLine("");
} // void MDInfo::DisplayGlobalFunctions()

// displays information about every global field.
void MDInfo::DisplayGlobalFields()
{
    WriteLine("Global fields");
    WriteLine("-------------------------------------------------------");
    DisplayFields(mdTokenNil, NULL, 0);
    WriteLine("");
} // void MDInfo::DisplayGlobalFields()

// displays information about every global memberref.
void MDInfo::DisplayGlobalMemberRefs()
{
    WriteLine("Global MemberRefs");
    WriteLine("-------------------------------------------------------");
    DisplayMemberRefs(mdTokenNil, "");
    WriteLine("");
} // void MDInfo::DisplayGlobalMemberRefs()

// displays information about every method in a given typedef
//

void MDInfo::DisplayMethods(mdTypeDef inTypeDef)
{
    HCORENUM methodEnum = NULL;
    mdToken methods[ENUM_BUFFER_SIZE];
    DWORD flags;
    ULONG count, totalCount = 1;
    HRESULT hr;
    

    while (SUCCEEDED(hr = m_pImport->EnumMethods( &methodEnum, inTypeDef,
                             methods, NumItems(methods), &count)) &&
            count > 0)
    {
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            VWriteLine("\tMethod #%d %s", totalCount,(methods[i] == g_tkEntryPoint) ? "[ENTRYPOINT]" : "");
            WriteLine("\t-------------------------------------------------------");
            DisplayMethodInfo(methods[i], &flags);
            DisplayParams(methods[i]);
            DisplayCustomAttributes(methods[i], "\t\t");
            DisplayPermissions(methods[i], "\t");
            DisplayMemberRefs(methods[i], "\t");

            // P-invoke data if present.
            if (IsMdPinvokeImpl(flags))
                DisplayPinvokeInfo(methods[i]);

            WriteLine("");
        }
    }
    m_pImport->CloseEnum( methodEnum);
} // void MDInfo::DisplayMethods()


// displays information about every field in a given typedef
//

void MDInfo::DisplayFields(mdTypeDef inTypeDef, COR_FIELD_OFFSET *rFieldOffset, ULONG cFieldOffset)
{
    HCORENUM fieldEnum = NULL;
    mdToken fields[ENUM_BUFFER_SIZE];
    ULONG count, totalCount = 1;
    DWORD flags;
    HRESULT hr;
    

    while (SUCCEEDED(hr = m_pImport->EnumFields( &fieldEnum, inTypeDef,
                             fields, NumItems(fields), &count)) &&
            count > 0)
    {
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            VWriteLine("\tField #%d",totalCount);
            WriteLine("\t-------------------------------------------------------");
            DisplayFieldInfo(fields[i], &flags);
            DisplayCustomAttributes(fields[i], "\t\t");
            DisplayPermissions(fields[i], "\t");
            DisplayFieldMarshal(fields[i]);

            // RVA if its a global field.
            if (inTypeDef == mdTokenNil)
                DisplayFieldRVA(fields[i]);

            // P-invoke data if present.
            if (IsFdPinvokeImpl(flags))
                DisplayPinvokeInfo(fields[i]);

            // Display offset if present.
            if (cFieldOffset)
            {
                bool found = false;
                for (ULONG iLayout = 0; i < cFieldOffset; ++iLayout)
                {
                    if (RidFromToken(rFieldOffset[iLayout].ridOfField) == RidFromToken(fields[i]))
                    {
                        found = true;
                        VWriteLine("\t\tOffset : 0x%08x", rFieldOffset[iLayout].ulOffset);
                        break;
                    }
                }
                _ASSERTE(found);
            }
            WriteLine("");
        }
    }
    m_pImport->CloseEnum( fieldEnum);
} // void MDInfo::DisplayFields()


// displays information about every methodImpl in a given typedef
//

void MDInfo::DisplayMethodImpls(mdTypeDef inTypeDef)
{
    HCORENUM methodImplEnum = NULL;
    mdMethodDef rtkMethodBody[ENUM_BUFFER_SIZE];
    mdMethodDef rtkMethodDecl[ENUM_BUFFER_SIZE];

    ULONG count, totalCount=1;
    HRESULT hr;


    while (SUCCEEDED(hr = m_pImport->EnumMethodImpls( &methodImplEnum, inTypeDef,
                             rtkMethodBody, rtkMethodDecl, NumItems(rtkMethodBody), &count)) &&
            count > 0)
    {
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            VWriteLine("\n\tMethodImpl #%d", totalCount);
            WriteLine("\t-------------------------------------------------------");
            VWriteLine("\t\tMethod Body Token : 0x%08x", rtkMethodBody[i]);
            VWriteLine("\t\tMethod Declaration Token : 0x%08x", rtkMethodDecl[i]);
            WriteLine("");
        }
    }
    m_pImport->CloseEnum( methodImplEnum);
} // void MDInfo::DisplayMethodImpls()

// displays information about the given parameter
//

void MDInfo::DisplayParamInfo(mdParamDef inParamDef)
{
    mdMethodDef md;
    ULONG num;
    WCHAR paramName[STRING_BUFFER_LEN];
    ULONG nameLen;
    DWORD flags;
    VARIANT defValue;
    DWORD dwCPlusFlags;
    void const *pValue;
    ULONG cbValue;


    ::VariantInit(&defValue);
    HRESULT hr = m_pImport->GetParamProps( inParamDef, &md, &num, paramName, NumItems(paramName),
                            &nameLen, &flags, &dwCPlusFlags, &pValue, &cbValue);
    if (FAILED(hr)) Error("GetParamProps failed.", hr);
    
    _FillVariant((BYTE)dwCPlusFlags, pValue, &defValue);
    
    char sFlags[STRING_BUFFER_LEN];
    strcpy(sFlags, "");
    ISFLAG(Pd, In);     
    ISFLAG(Pd, Out);        
    ISFLAG(Pd, Optional);
    // "Reserved" flags.
    ISFLAG(Pd, HasDefault); 
    ISFLAG(Pd, HasFieldMarshal);    
    if (!*sFlags)
        strcpy(sFlags, "[none]");

    VWriteLine("\t\t\t(%ld) ParamToken : (%08x) Name : %ls flags: %s (%08x) default: %ls", num, inParamDef, paramName, sFlags, flags, VariantAsString(&defValue));
    DisplayCustomAttributes(inParamDef, "\t\t\t");
} // void MDInfo::DisplayParamInfo()


// displays all parameters for a given memberdef
//

void MDInfo::DisplayParams(mdMethodDef inMethodDef)
{
    HCORENUM paramEnum = NULL;
    mdParamDef params[ENUM_BUFFER_SIZE];
    ULONG count, paramCount;
    bool first = true;
    HRESULT hr;

  
    while (SUCCEEDED(hr = m_pImport->EnumParams( &paramEnum, inMethodDef,
                             params, NumItems(params), &count)) &&
            count > 0)
    {
        if (first)
        {
            m_pImport->CountEnum( paramEnum, &paramCount);
            VWriteLine("\t\t%d Parameters", paramCount);
        }
        for (ULONG i = 0; i < count; i++)
        {
            DisplayParamInfo(params[i]);
            DisplayFieldMarshal(params[i]);
        }
        first = false;
    }
    m_pImport->CloseEnum( paramEnum);
} // void MDInfo::DisplayParams()


LPCWSTR MDInfo::TokenName(mdToken inToken, LPWSTR buffer, ULONG bufLen)
{
    LPCUTF8     pName;                  // Token name in UTF8.

    if (IsNilToken(inToken))
        return L"";

    m_pImport->GetNameFromToken(inToken, &pName);

    MultiByteToWideChar(CP_UTF8,0, pName,-1, buffer,bufLen);

    return buffer;
} // LPCWSTR MDInfo::TokenName()

// prints out name of typeref or typedef
//

LPCWSTR MDInfo::TypeDeforRefName(mdToken inToken, LPWSTR buffer, ULONG bufLen)
{
    if (RidFromToken(inToken))
    {
        if (TypeFromToken(inToken) == mdtTypeDef)
            return (TypeDefName((mdTypeDef) inToken, buffer, bufLen));
        else if (TypeFromToken(inToken) == mdtTypeRef)
            return (TypeRefName((mdTypeRef) inToken, buffer, bufLen));
        else
            return (L"[InvalidReference]");
    }
    else
        return (L"");
} // LPCWSTR MDInfo::TypeDeforRefName()

LPCWSTR MDInfo::MemberDeforRefName(mdToken inToken, LPWSTR buffer, ULONG bufLen)
{
    if (RidFromToken(inToken))
    {
        if (TypeFromToken(inToken) == mdtMethodDef || TypeFromToken(inToken) == mdtFieldDef)
            return (MemberName(inToken, buffer, bufLen));
        else if (TypeFromToken(inToken) == mdtMemberRef)
            return (MemberRefName((mdMemberRef) inToken, buffer, bufLen));
        else
            return (L"[InvalidReference]");
    }
    else
        return (L"");
} // LPCWSTR MDInfo::MemberDeforRefName()

// prints out only the name of the given typedef
//
// available 98 and 99

LPCWSTR MDInfo::TypeDefName(mdTypeDef inTypeDef, LPWSTR buffer, ULONG bufLen)
{
    HRESULT hr;

    hr = m_pImport->GetTypeDefProps(
                            // [IN] The import scope.
        inTypeDef,              // [IN] TypeDef token for inquiry.
        buffer,                 // [OUT] Put name here.
        bufLen,                 // [IN] size of name buffer in wide chars.
        NULL,                   // [OUT] put size of name (wide chars) here.
        NULL,                   // [OUT] Put flags here.
        NULL);                  // [OUT] Put base class TypeDef/TypeRef here.
    if (FAILED(hr)) Error("GetTypeDefProps failed.", hr);

    return buffer;
} // LPCWSTR MDInfo::TypeDefName()

// prints out all the properties of a given typedef
//

void MDInfo::DisplayTypeDefProps(mdTypeDef inTypeDef)
{
    HRESULT hr;
    WCHAR typeDefName[STRING_BUFFER_LEN];
    ULONG nameLen;
    DWORD flags;
    mdToken extends;
    ULONG       dwPacking;              // Packing size of class, if specified.
    ULONG       dwSize;                 // Total size of class, if specified.

    hr = m_pImport->GetTypeDefProps(
        inTypeDef,              // [IN] TypeDef token for inquiry.
        typeDefName,            // [OUT] Put name here.
        STRING_BUFFER_LEN,      // [IN] size of name buffer in wide chars.
        &nameLen,               // [OUT] put size of name (wide chars) here.
        &flags,                 // [OUT] Put flags here.
        &extends);              // [OUT] Put base class TypeDef/TypeRef here.
    if (FAILED(hr)) Error("GetTypeDefProps failed.", hr);

    char sFlags[STRING_BUFFER_LEN];
    WCHAR szTempBuf[STRING_BUFFER_LEN];

    VWriteLine("\tTypDefName: %ls  (%8.8X)",typeDefName,inTypeDef);
    VWriteLine("\tFlags     : %s (%08x)",ClassFlags(flags, sFlags), flags);
    VWriteLine("\tExtends   : %8.8X [%s] %ls",extends,TokenTypeName(extends),
                                 TypeDeforRefName(extends, szTempBuf, NumItems(szTempBuf)));

    hr = m_pImport->GetClassLayout(inTypeDef, &dwPacking, 0,0,0, &dwSize);
    if (hr == S_OK)
        VWriteLine("\tLayout    : Packing:%d, Size:%d", dwPacking, dwSize);

    if (IsTdNested(flags))
    {
        mdTypeDef   tkEnclosingClass;

        hr = m_pImport->GetNestedClassProps(inTypeDef, &tkEnclosingClass);
        if (hr == S_OK)
        {
            VWriteLine("\tEnclosingClass : %ls (%8.8X)", TypeDeforRefName(tkEnclosingClass,
                                            szTempBuf, NumItems(szTempBuf)), tkEnclosingClass);
        }
        else if (hr == CLDB_E_RECORD_NOTFOUND)
            WriteLine("ERROR: EnclosingClass not found for NestedClass");
        else
            Error("GetNestedClassProps failed.", hr);
    }
} // void MDInfo::DisplayTypeDefProps()

//  Prints out the name of the given TypeRef
//

LPCWSTR MDInfo::TypeRefName(mdTypeRef tr, LPWSTR buffer, ULONG bufLen)
{
    HRESULT hr;
    
    hr = m_pImport->GetTypeRefProps(           
        tr,                 // The class ref token.
        NULL,               // Resolution scope.
        buffer,             // Put the name here.
        bufLen,             // Size of the name buffer, wide chars.
        NULL);              // Put actual size of name here.
    if (FAILED(hr)) Error("GetTypeRefProps failed.", hr);

    return (buffer);
} // LPCWSTR MDInfo::TypeRefName()

// Prints out all the info of the given TypeRef
//

void MDInfo::DisplayTypeRefInfo(mdTypeRef tr)
{
    HRESULT hr;
    mdToken tkResolutionScope;
    WCHAR typeRefName[STRING_BUFFER_LEN];
    ULONG nameLen;

    hr = m_pImport->GetTypeRefProps(           
        tr,                 // The class ref token.
        &tkResolutionScope, // ResolutionScope.
        typeRefName,        // Put the name here.
        STRING_BUFFER_LEN,  // Size of the name buffer, wide chars.
        &nameLen);          // Put actual size of name here.

    if (FAILED(hr)) Error("GetTypeRefProps failed.", hr);

    VWriteLine("Token:             0x%08x", tr);
    VWriteLine("ResolutionScope:   0x%08x", tkResolutionScope);
    VWriteLine("TypeRefName:       %ls",typeRefName);

    DisplayCustomAttributes(tr, "\t");
} // void MDInfo::DisplayTypeRefInfo()


void MDInfo::DisplayTypeSpecInfo(mdTypeSpec ts, const char *preFix)
{
    HRESULT hr;
    PCCOR_SIGNATURE pvSig;
    ULONG           cbSig;
    ULONG           cb;

    InitSigBuffer();

    hr = m_pImport->GetTypeSpecFromToken(           
        ts,             // The class ref token.
        &pvSig,
        &cbSig);

    if (FAILED(hr)) Error("GetTypeSpecFromToken failed.", hr);

    if (FAILED(hr = GetOneElementType(pvSig, cbSig, &cb)))
        goto ErrExit;

    VWriteLine("%s\t\tTypeSpec : %s", preFix, (LPSTR)m_sigBuf.Ptr());
ErrExit:
    return;
} // void MDInfo::DisplayTypeSpecInfo()

// Return the passed-in buffer filled with a string detailing the class flags 
// associated with the class.
//

char *MDInfo::ClassFlags(DWORD flags, char *sFlags)
{
    strcpy(sFlags, "");
    ISFLAG(Td, NotPublic);
    ISFLAG(Td, Public);
    ISFLAG(Td, NestedPublic);
    ISFLAG(Td, NestedPrivate);
    ISFLAG(Td, NestedFamily);
    ISFLAG(Td, NestedAssembly);
    ISFLAG(Td, NestedFamANDAssem);
    ISFLAG(Td, NestedFamORAssem);
    ISFLAG(Td, AutoLayout);     
    ISFLAG(Td, SequentialLayout);   
    ISFLAG(Td, ExplicitLayout); 
    ISFLAG(Td, Class);          
    ISFLAG(Td, Interface);      
    ISFLAG(Td, Abstract);           
    ISFLAG(Td, Sealed);         
    ISFLAG(Td, SpecialName);
    ISFLAG(Td, RTSpecialName);
    ISFLAG(Td, Import);         
    ISFLAG(Td, Serializable);                  
    ISFLAG(Td, AnsiClass);      
    ISFLAG(Td, UnicodeClass);
    ISFLAG(Td, AutoClass);      
    // "Reserved" flags
    ISFLAG(Td, HasSecurity);        
    if (!*sFlags)
        strcpy(sFlags, "[none]");

    return sFlags;
} // char *MDInfo::ClassFlags()

// prints out all info on the given typeDef, including all information that
// is specific to a given typedef
//

void MDInfo::DisplayTypeDefInfo(mdTypeDef inTypeDef)
{
    // available under 98 and 99
    DisplayTypeDefProps(inTypeDef);

    // only available under 99, but they'll figure it out

    // Get field layout information.
    HRESULT             hr = NOERROR;
    COR_FIELD_OFFSET    *rFieldOffset = NULL;
    ULONG               cFieldOffset = 0;
    hr = m_pImport->GetClassLayout(inTypeDef, NULL, rFieldOffset, 0, &cFieldOffset, NULL);
    if (SUCCEEDED(hr) && cFieldOffset)
    {
        if (!(rFieldOffset = (COR_FIELD_OFFSET *)_alloca(sizeof(COR_FIELD_OFFSET) * cFieldOffset)))
            Error("_calloc failed.", E_OUTOFMEMORY);
        hr = m_pImport->GetClassLayout(inTypeDef, NULL, rFieldOffset, cFieldOffset, &cFieldOffset, NULL);
        if (FAILED(hr)) Error("GetClassLayout() failed.", hr);
    }

    //No reason to display members if we're displaying fields and methods separately
    DisplayFields(inTypeDef, rFieldOffset, cFieldOffset);
    DisplayMethods(inTypeDef);
    DisplayProperties(inTypeDef);
    DisplayEvents(inTypeDef);
    DisplayMethodImpls(inTypeDef);
    DisplayPermissions(inTypeDef, "");
    
    // available under 98 and 99
    DisplayInterfaceImpls(inTypeDef);
    DisplayCustomAttributes(inTypeDef, "\t");
} // void MDInfo::DisplayTypeDefInfo()

// print out information about every the given typeDef's interaceImpls
//

void MDInfo::DisplayInterfaceImpls(mdTypeDef inTypeDef)
{
    HCORENUM interfaceImplEnum = NULL;
    mdTypeRef interfaceImpls[ENUM_BUFFER_SIZE];
    ULONG count, totalCount = 1;
    HRESULT hr;
    
    while(SUCCEEDED(hr = m_pImport->EnumInterfaceImpls( &interfaceImplEnum,
                             inTypeDef,interfaceImpls,NumItems(interfaceImpls), &count)) &&
            count > 0)
    {
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            VWriteLine("\tInterfaceImpl #%d", totalCount);
            WriteLine("\t-------------------------------------------------------");
            DisplayInterfaceImplInfo(interfaceImpls[i]);
            DisplayPermissions(interfaceImpls[i], "\t");
            WriteLine("");
        }
    }
    m_pImport->CloseEnum( interfaceImplEnum);
} // void MDInfo::DisplayInterfaceImpls()

// print the information for the given interface implementation
//

void MDInfo::DisplayInterfaceImplInfo(mdInterfaceImpl inImpl)
{
    mdTypeDef typeDef;
    mdToken token;
    HRESULT hr;

    WCHAR szTempBuf[STRING_BUFFER_LEN];

    hr = m_pImport->GetInterfaceImplProps( inImpl, &typeDef, &token);
    if (FAILED(hr)) Error("GetInterfaceImplProps failed.", hr);

    VWriteLine("\t\tClass     : %ls",TypeDeforRefName(typeDef, szTempBuf, NumItems(szTempBuf)));
    VWriteLine("\t\tToken     : %8.8X [%s] %ls",token,TokenTypeName(token), TypeDeforRefName(token, szTempBuf, NumItems(szTempBuf)));

    DisplayCustomAttributes(inImpl, "\t\t");
} // void MDInfo::DisplayInterfaceImplInfo()

// displays the information for a particular property
//

void MDInfo::DisplayPropertyInfo(mdProperty inProp)
{
    HRESULT     hr;
    mdTypeDef   typeDef;
    WCHAR       propName[STRING_BUFFER_LEN];
    DWORD       flags;
    VARIANT     defaultValue;
    void const  *pValue;
    ULONG       cbValue;
    DWORD       dwCPlusTypeFlag;
    mdMethodDef setter, getter, otherMethod[ENUM_BUFFER_SIZE];
    ULONG       others;
    PCCOR_SIGNATURE pbSigBlob;
    ULONG       ulSigBlob;


    ::VariantInit(&defaultValue);

    hr = m_pImport->GetPropertyProps(
        inProp,                 // [IN] property token
        &typeDef,               // [OUT] typedef containing the property declarion.
        
        propName,               // [OUT] Property name
        STRING_BUFFER_LEN,      // [IN] the count of wchar of szProperty
        NULL,                   // [OUT] actual count of wchar for property name
        
        &flags,                 // [OUT] property flags.

        &pbSigBlob,             // [OUT] Signature Blob. 
        &ulSigBlob,             // [OUT] Number of bytes in the signature blob.

        &dwCPlusTypeFlag,       // [OUT] default value
        &pValue,
        &cbValue,

        &setter,                // [OUT] setter method of the property
        &getter,                // [OUT] getter method of the property
        
        otherMethod,            // [OUT] other methods of the property
        ENUM_BUFFER_SIZE,       // [IN] size of rmdOtherMethod
        &others);               // [OUT] total number of other method of this property

    if (FAILED(hr)) Error("GetPropertyProps failed.", hr);

    VWriteLine("\t\tProp.Name : %ls (%8.8X)",propName,inProp);

    char sFlags[STRING_BUFFER_LEN];
    
    strcpy(sFlags, "");
    ISFLAG(Pr, SpecialName);
    ISFLAG(Pr, RTSpecialName);
    ISFLAG(Pr, HasDefault);         
    if (!*sFlags)
        strcpy(sFlags, "[none]");

    VWriteLine("\t\tFlags     : %s (%08x)", sFlags, flags);

    if (ulSigBlob)
        DisplaySignature(pbSigBlob, ulSigBlob, "");
	else
		VWriteLine("\t\tERROR: no valid signature ");

    WCHAR szTempBuf[STRING_BUFFER_LEN];

    _FillVariant((BYTE)dwCPlusTypeFlag, pValue, &defaultValue);
    VWriteLine("\t\tDefltValue: %ls",VariantAsString(&defaultValue));

    VWriteLine("\t\tSetter    : (%08x) %ls",setter,MemberDeforRefName(setter, szTempBuf, NumItems(szTempBuf)));
    VWriteLine("\t\tGetter    : (%08x) %ls",getter,MemberDeforRefName(getter, szTempBuf, NumItems(szTempBuf))); 

    // do something with others?
    VWriteLine("\t\t%ld Others",others);
    DisplayCustomAttributes(inProp, "\t\t");
} // void MDInfo::DisplayPropertyInfo()

// displays info for each property
//

void MDInfo::DisplayProperties(mdTypeDef inTypeDef)
{
    HCORENUM propEnum = NULL;
    mdProperty props[ENUM_BUFFER_SIZE];
    ULONG count, totalCount = 1;
    HRESULT hr;

    
    while(SUCCEEDED(hr = m_pImport->EnumProperties( &propEnum,
                             inTypeDef,props,NumItems(props), &count)) &&
            count > 0)
    {
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            VWriteLine("\tProperty #%d", totalCount);
            WriteLine("\t-------------------------------------------------------");
            DisplayPropertyInfo(props[i]);
            DisplayPermissions(props[i], "\t");
            WriteLine("");
        }
    }
    m_pImport->CloseEnum( propEnum);
} // void MDInfo::DisplayProperties()

// Display all information about a particular event
//

void MDInfo::DisplayEventInfo(mdEvent inEvent)
{
    HRESULT hr;
    mdTypeDef typeDef;
    WCHAR eventName[STRING_BUFFER_LEN];
    DWORD flags;
    mdToken eventType;
    mdMethodDef addOn, removeOn, fire, otherMethod[ENUM_BUFFER_SIZE];
    ULONG totalOther;


    hr = m_pImport->GetEventProps(
                            // [IN] The scope.
        inEvent,                // [IN] event token
        &typeDef,               // [OUT] typedef containing the event declarion.
        
        eventName,              // [OUT] Event name
        STRING_BUFFER_LEN,      // [IN] the count of wchar of szEvent
        NULL,                   // [OUT] actual count of wchar for event's name

        &flags,                 // [OUT] Event flags.
        &eventType,             // [OUT] EventType class

        &addOn,                 // [OUT] AddOn method of the event
        &removeOn,              // [OUT] RemoveOn method of the event
        &fire,                  // [OUT] Fire method of the event

        otherMethod,            // [OUT] other method of the event
        NumItems(otherMethod),  // [IN] size of rmdOtherMethod
        &totalOther);           // [OUT] total number of other method of this event
    if (FAILED(hr)) Error("GetEventProps failed.", hr);

    VWriteLine("\t\tName      : %ls (%8.8X)",eventName,inEvent);
    
    char sFlags[STRING_BUFFER_LEN];

    strcpy(sFlags, "");
    ISFLAG(Ev, SpecialName); 
    ISFLAG(Ev, RTSpecialName);    
    if (!*sFlags)
        strcpy(sFlags, "[none]");

    VWriteLine("\t\tFlags     : %s (%08x)", sFlags, flags);

    WCHAR szTempBuf[STRING_BUFFER_LEN];

    VWriteLine("\t\tEventType : %8.8X [%s]",eventType,TokenTypeName(eventType));
    VWriteLine("\t\tAddOnMethd: (%08x) %ls",addOn,MemberDeforRefName(addOn, szTempBuf, NumItems(szTempBuf)));
    VWriteLine("\t\tRmvOnMethd: (%08x) %ls",removeOn,MemberDeforRefName(removeOn, szTempBuf, NumItems(szTempBuf)));
    VWriteLine("\t\tFireMethod: (%08x) %ls",fire,MemberDeforRefName(fire, szTempBuf, NumItems(szTempBuf)));
    
    // todo: do something with these
    VWriteLine("\t\t%ld OtherMethods",totalOther);
    
    DisplayCustomAttributes(inEvent, "\t\t");
} // void MDInfo::DisplayEventInfo()

// Display information about all events in a typedef
// 
void MDInfo::DisplayEvents(mdTypeDef inTypeDef)
{
    HCORENUM eventEnum = NULL;
    mdProperty events[ENUM_BUFFER_SIZE];
    ULONG count, totalCount = 1;
    HRESULT hr;

    
    while(SUCCEEDED(hr = m_pImport->EnumEvents( &eventEnum,
                             inTypeDef,events,NumItems(events), &count)) &&
            count > 0)
    {
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            VWriteLine("\tEvent #%d", totalCount);
            WriteLine("\t-------------------------------------------------------");
            DisplayEventInfo(events[i]);
            DisplayPermissions(events[i], "\t");
            WriteLine("");
        }
    }
    m_pImport->CloseEnum( eventEnum);
} // void MDInfo::DisplayEvents()

// returns a string represtenting the name of the type of the custom attribute passed
// in.  Client should sent allocated array into szAttr arg. where the attributes
// of the custom attribute will be placed.
//

char *MDInfo::VariantTypeName(ULONG valueType, char *sAttr)
{
    strcpy(sAttr,"");

    if (valueType & VT_BSTR_BLOB)   strcat(sAttr,"[BSTR_BLOB] ");
    if (valueType & VT_VECTOR)      strcat(sAttr,"[VECTOR] ");
    if (valueType & VT_ARRAY)       strcat(sAttr,"[ARRAY] ");
    if (valueType & VT_BYREF)       strcat(sAttr,"[BYREF] ");
    if (valueType & VT_RESERVED)    strcat(sAttr,"[RESERVED] ");
        
    switch(valueType & VT_TYPEMASK)
    {
    case VT_EMPTY:          strcat(sAttr,"VT_EMPTY"); break;
    case VT_NULL:           strcat(sAttr,"VT_NULL"); break;
    case VT_I2:             strcat(sAttr,"VT_I2"); break;
    case VT_I4:             strcat(sAttr,"VT_I4"); break;
    case VT_R4:             strcat(sAttr,"VT_EMPTY"); break;
    case VT_R8:             strcat(sAttr,"VT_EMPTY"); break;
    case VT_CY:             strcat(sAttr,"VT_R4"); break;
    case VT_DATE:           strcat(sAttr,"VT_DATE"); break;
    case VT_BSTR:           strcat(sAttr,"VT_BSTR"); break;
    case VT_DISPATCH:       strcat(sAttr,"VT_DISPATCH"); break;
    case VT_ERROR:          strcat(sAttr,"VT_ERROR"); break;
    case VT_BOOL:           strcat(sAttr,"VT_BOOL"); break;
    case VT_VARIANT:        strcat(sAttr,"VT_VARIANT"); break;
    case VT_UNKNOWN:        strcat(sAttr,"VT_UNKNOWN"); break;
    case VT_DECIMAL:        strcat(sAttr,"VT_DECIMAL"); break;
    case VT_I1:             strcat(sAttr,"VT_I1"); break;
    case VT_UI1:            strcat(sAttr,"VT_UI1"); break;
    case VT_UI2:            strcat(sAttr,"VT_UI2"); break;
    case VT_UI4:            strcat(sAttr,"VT_UI4"); break;
    case VT_I8:             strcat(sAttr,"VT_I8"); break;
    case VT_UI8:            strcat(sAttr,"VT_UI8"); break;
    case VT_INT:            strcat(sAttr,"VT_INT"); break;
    case VT_UINT:           strcat(sAttr,"VT_UINT"); break;
    case VT_VOID:           strcat(sAttr,"VT_VOID"); break;
    case VT_HRESULT:        strcat(sAttr,"VT_HRESULT"); break;
    case VT_PTR:            strcat(sAttr,"VT_PTR"); break;
    case VT_SAFEARRAY:      strcat(sAttr,"VT_SAFEARRAY"); break;
    case VT_CARRAY:         strcat(sAttr,"VT_CARRAY"); break;
    case VT_USERDEFINED:    strcat(sAttr,"VT_USERDEFINED"); break;
    case VT_LPSTR:          strcat(sAttr,"VT_LPSTR"); break;
    case VT_LPWSTR:         strcat(sAttr,"VT_LPWSTR"); break;
    case VT_RECORD:         strcat(sAttr,"VT_RECORD"); break;
    case VT_FILETIME:       strcat(sAttr,"VT_FILETIME"); break;
    case VT_BLOB:           strcat(sAttr,"VT_BLOB"); break;
    case VT_STREAM:         strcat(sAttr,"VT_STREAM"); break;
    case VT_STORAGE:        strcat(sAttr,"VT_STORAGE"); break;
    case VT_STREAMED_OBJECT:strcat(sAttr,"VT_STREAMED_OBJECT"); break;
    case VT_STORED_OBJECT:  strcat(sAttr,"VT_STORED_OBJECT"); break;
    case VT_BLOB_OBJECT:    strcat(sAttr,"VT_BLOB_OBJECT"); break;
    case VT_CF:             strcat(sAttr,"VT_CF"); break;
    case VT_CLSID:          strcat(sAttr,"VT_CLSID"); break;
    default:                strcat(sAttr,"[Unknown type]");
    }
    return sAttr;
} // char *MDInfo::VariantTypeName()

// print info for the passed-in custom attribute
// This function is used to print the custom attribute information for both TypeDefs and
// MethodDefs which need slightly different formatting.  preFix helps fix it up.
//

void MDInfo::DisplayCustomAttributeInfo(mdCustomAttribute inValue, const char *preFix)
{
    const BYTE  *pValue;                // The custom value.
    ULONG       cbValue;                // Length of the custom value.
    HRESULT     hr;                     // A result.
    mdToken     tkObj;                  // Attributed object.
    mdToken     tkType;                 // Type of the custom attribute.
    mdToken     tk;                     // For name lookup.
    LPCUTF8     pMethName=0;            // Name of custom attribute ctor, if any.
    CQuickBytes qSigName;               // Buffer to pretty-print signature.
    PCCOR_SIGNATURE pSig=0;             // Signature of ctor.
    ULONG       cbSig;                  // Size of the signature.
    BOOL        bCoffSymbol = false;    // true for coff symbol CA's.
    WCHAR       rcName[MAX_CLASS_NAME]; // Name of the type.

    hr = m_pImport->GetCustomAttributeProps( // S_OK or error.
        inValue,                    // The attribute.
        &tkObj,                     // The attributed object
        &tkType,                    // The attributes type.
        (const void**)&pValue,      // Put pointer to data here.
        &cbValue);                  // Put size here.
    if (FAILED(hr)) Error("GetCustomAttributeProps failed.", hr);

    VWriteLine("%s\tCustomAttribute Type: %08x", preFix, tkType);
    
    // Get the name of the memberref or methoddef.
    tk = tkType;
    rcName[0] = L'\0';
    // Get the member name, and the parent token.
    switch (TypeFromToken(tk))
    {
    case mdtMemberRef:
        hr = m_pImport->GetNameFromToken(tk, &pMethName);
        if (FAILED(hr)) Error("GetNameFromToken failed.", hr);
        hr = m_pImport->GetMemberRefProps( tk, &tk, 0, 0, 0, &pSig, &cbSig);
        if (FAILED(hr)) Error("GetMemberRefProps failed.", hr);
        break;
    case mdtMethodDef:
        hr = m_pImport->GetNameFromToken(tk, &pMethName);
        if (FAILED(hr)) Error("GetNameFromToken failed.", hr);
        hr = m_pImport->GetMethodProps(tk, &tk, 0, 0, 0, 0, &pSig, &cbSig, 0, 0);
        if (FAILED(hr)) Error("GetMethodProps failed.", hr);
        break;
    } // switch
    
    // Get the type name.
    switch (TypeFromToken(tk))
    {
    case mdtTypeDef:
        hr = m_pImport->GetTypeDefProps(tk, rcName,MAX_CLASS_NAME,0, 0,0);
        if (FAILED(hr)) Error("GetTypeDefProps failed.", hr);
        break;
    case mdtTypeRef:
        hr = m_pImport->GetTypeRefProps(tk, 0, rcName,MAX_CLASS_NAME,0);
        if (FAILED(hr)) Error("GetTypeRefProps failed.", hr);
        break;
    } // switch
        
    
    if (pSig && pMethName)
    {
        int iLen;
        LPWSTR pwzName = (LPWSTR)_alloca(sizeof(WCHAR)*(iLen=1+strlen(pMethName)));
        MultiByteToWideChar(CP_UTF8,0, pMethName,-1, pwzName,iLen);
        PrettyPrintSig(pSig, cbSig, pwzName, &qSigName, m_pImport);
    }

    VWrite("%s\tCustomAttributeName: %ls", preFix, rcName);
    if (pSig && pMethName)
        VWrite(" :: %S", qSigName.Ptr());

    // Keep track of coff overhead.
    if (!wcscmp(L"__DecoratedName", rcName))
    {
        bCoffSymbol = true;
        g_cbCoffNames += cbValue + 6;
    }
    WriteLine("");

    VWriteLine("%s\tLength: %ld", preFix, cbValue);
    char newPreFix[40];
    sprintf(newPreFix, "%s\tValue ", preFix);
    DumpHex(newPreFix, pValue, cbValue);
    if (bCoffSymbol)
        VWriteLine("%s\t            %s", preFix, pValue);

    // Try to decode the constructor blob.  This is incomplete, but covers the most popular cases.
    if (pSig)
    {   // Interpret the signature.
        //@todo: all sig elements
        PCCOR_SIGNATURE ps = pSig;
        ULONG cb;
        ULONG ulData;
        ULONG cParams;
        ULONG ulVal;
        unsigned __int64 uI64;
        double dblVal;
        ULONG cbVal;
        LPCUTF8 pStr;
        CustomAttributeParser CA(pValue, cbValue);
        CA.GetProlog();

        // Get the calling convention.
        cb = CorSigUncompressData(ps, &ulData);
        ps += cb;
        // Get the count of params.
        cb = CorSigUncompressData(ps, &cParams);
        ps += cb;
        // Get the return value.
        cb = CorSigUncompressData(ps, &ulData);
        ps += cb;
        if (ulData == ELEMENT_TYPE_VOID)
        {   
            VWrite("%s\tctor args: (", preFix);
            // For each param...
            for (ULONG i=0; i<cParams; ++i)
            {   // Get the next param type.
                cb = CorSigUncompressData(ps, &ulData);
                ps += cb;
                if (i) Write(", ");
            DoObject:                
                switch (ulData)
                {
                // For ET_OBJECT, the next byte in the blob is the ET of the actual data.
                case ELEMENT_TYPE_OBJECT:
                    ulData = CA.GetU1();
                    goto DoObject;
                case ELEMENT_TYPE_I1:
                case ELEMENT_TYPE_U1:
                    ulVal = CA.GetU1();
                    goto PrintVal;
                case ELEMENT_TYPE_I2:
                case ELEMENT_TYPE_U2:
                    ulVal = CA.GetU2();
                    goto PrintVal;
                case ELEMENT_TYPE_I4:
                case ELEMENT_TYPE_U4:
                    ulVal = CA.GetU4();
                PrintVal:
                VWrite("%d", ulVal);
                    break;
                case ELEMENT_TYPE_STRING:
                    pStr = CA.GetString(&cbVal);
                    VWrite("\"%s\"", pStr);
                    break;
                // The only class type that we accept is Type, which is stored as a string.
                case ELEMENT_TYPE_CLASS:
                    // Eat the class type.
                    cb = CorSigUncompressData(ps, &ulData);
                    ps += cb;
                    // Get the name of the type.
                    pStr = CA.GetString(&cbVal);
                    VWrite("typeof(%s)", pStr);
                    break;
                case SERIALIZATION_TYPE_TYPE:
                    pStr = CA.GetString(&cbVal);
                    VWrite("typeof(%s)", pStr);
                    break;
                case ELEMENT_TYPE_I8:
                case ELEMENT_TYPE_U8:
                    uI64 = CA.GetU8();
                    VWrite("%#lx", uI64);
                    break;
                case ELEMENT_TYPE_R4:
                    dblVal = CA.GetR4();
                    VWrite("%f", dblVal);
                    break;
                case ELEMENT_TYPE_R8:
                    dblVal = CA.GetR8();
                    VWrite("%f", dblVal);
                    break;
                default:
                    // bail...
                    i = cParams;
                    Write(" <can not decode> ");
                    break;
                }
            }
            WriteLine(")");
        }

    }
    WriteLine("");
} // void MDInfo::DisplayCustomAttributeInfo()

// Print all custom values for the given token
// This function is used to print the custom value information for all tokens.
// which need slightly different formatting.  preFix helps fix it up.
//

void MDInfo::DisplayCustomAttributes(mdToken inToken, const char *preFix)
{
    HCORENUM customAttributeEnum = NULL;
    mdTypeRef customAttributes[ENUM_BUFFER_SIZE];
    ULONG count, totalCount = 1;
    HRESULT hr;
    
    while(SUCCEEDED(hr = m_pImport->EnumCustomAttributes( &customAttributeEnum, inToken, 0,
                             customAttributes, NumItems(customAttributes), &count)) &&
          count > 0)
    {
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            VWriteLine("%sCustomAttribute #%d (%08x)", preFix, totalCount, customAttributes[i]);
            VWriteLine("%s-------------------------------------------------------", preFix);
            DisplayCustomAttributeInfo(customAttributes[i], preFix);
        }
    }
    m_pImport->CloseEnum( customAttributeEnum);
} // void MDInfo::DisplayCustomAttributes()

//  Show the passed-in token's permissions
//
// avail: 99 only

void MDInfo::DisplayPermissions(mdToken tk, const char *preFix)
{
    HCORENUM permissionEnum = NULL;
    mdPermission permissions[ENUM_BUFFER_SIZE];
    ULONG count, totalCount = 1;
    HRESULT hr;

    
    while (SUCCEEDED(hr = m_pImport->EnumPermissionSets( &permissionEnum,
                     tk, 0, permissions, NumItems(permissions), &count)) &&
            count > 0)
    {
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            VWriteLine("%s\tPermission #%d", preFix, totalCount);
            VWriteLine("%s\t-------------------------------------------------------", preFix);
            DisplayPermissionInfo(permissions[i], preFix);
            WriteLine("");
        }
    }
    m_pImport->CloseEnum( permissionEnum);
} // void MDInfo::DisplayPermissions()

// print properties of given rolecheck
//
// avail 98 and 99

void MDInfo::DisplayPermissionInfo(mdPermission inPermission, const char *preFix)
{
    DWORD dwAction;
    const BYTE *pvPermission;
    ULONG cbPermission;
    char *flagDesc;
    char newPreFix[STRING_BUFFER_LEN];
    HRESULT hr;


    hr = m_pImport->GetPermissionSetProps( inPermission, &dwAction,
                                        (const void**)&pvPermission, &cbPermission);
    if (FAILED(hr)) Error("GetPermissionSetProps failed.", hr);

    switch(dwAction)
    {
    case dclActionNil:          flagDesc = "ActionNil"; break;
    case dclRequest:            flagDesc = "Request"; break;
    case dclDemand:             flagDesc = "Demand"; break;
    case dclAssert:             flagDesc = "Assert"; break;
    case dclDeny:               flagDesc = "Deny"; break;
    case dclPermitOnly:         flagDesc = "PermitOnly"; break;
    case dclLinktimeCheck:      flagDesc = "LinktimeCheck"; break;
    case dclInheritanceCheck:   flagDesc = "InheritanceCheck"; break;
    case dclRequestMinimum:     flagDesc = "RequestMinimum"; break;
    case dclRequestOptional:    flagDesc = "RequestOptional"; break;
    case dclRequestRefuse:      flagDesc = "RequestRefuse"; break;
    case dclPrejitGrant:        flagDesc = "PrejitGrant"; break;
    case dclPrejitDenied:       flagDesc = "PrejitDenied"; break;
    case dclNonCasDemand:       flagDesc = "NonCasDemand"; break;
    case dclNonCasLinkDemand:   flagDesc = "NonCasLinkDemand"; break;
    case dclNonCasInheritance:  flagDesc = "NonCasInheritance"; break;

    }
    VWriteLine("%s\t\tAction    : %s", preFix, flagDesc);
    VWriteLine("%s\t\tBlobLen   : %d", preFix, cbPermission);
    if (cbPermission)
    {
        sprintf(newPreFix, "%s\tBlob", preFix);
        DumpHex(newPreFix, pvPermission, cbPermission, false, 24);
    }

    sprintf (newPreFix, "\t\t%s", preFix);
    DisplayCustomAttributes(inPermission, newPreFix);
} // void MDInfo::DisplayPermissionInfo()


// simply prints out the given GUID in standard form

LPWSTR MDInfo::GUIDAsString(GUID inGuid, LPWSTR guidString, ULONG bufLen)
{
    StringFromGUID2(inGuid, guidString, bufLen);
    return guidString;
} // LPWSTR MDInfo::GUIDAsString()

LPWSTR MDInfo::VariantAsString(VARIANT *pVariant)
{
    HRESULT hr = S_OK;
    if (pVariant->vt == VT_UNKNOWN)
    {
        _ASSERTE(pVariant->punkVal == NULL);
        return (L"NULL");
    }
    else if (SUCCEEDED(hr = ::VariantChangeType(pVariant, pVariant, 0, VT_BSTR)))
        return (LPWSTR) pVariant->pbstrVal;
    else if (hr == DISP_E_BADVARTYPE && pVariant->vt == VT_I8)
    {
        // allocate the bstr.
        char    szStr[32];
        WCHAR   wszStr[32];
        // Set variant type to bstr.
        pVariant->vt = VT_BSTR;
        // Create the ansi string.
        sprintf(szStr, "%I64d", pVariant->cyVal.int64);
        // Convert to unicode.
        MultiByteToWideChar(CP_ACP, 0, szStr, -1, wszStr, 32);
        // convert to bstr and set variant value.
        pVariant->bstrVal = ::SysAllocString(wszStr);
        if (pVariant->bstrVal == NULL)
            Error("SysAllocString() failed.", E_OUTOFMEMORY);
        return (LPWSTR) pVariant->pbstrVal;
    }
    else
        return (L"ERROR");
    
} // LPWSTR MDInfo::VariantAsString()

void MDInfo::DisplayFieldMarshal(mdToken inToken)
{
    PCCOR_SIGNATURE pvNativeType;     // [OUT] native type of this field
    ULONG       cbNativeType;         // [OUT] the count of bytes of *ppvNativeType
    HRESULT hr;


    hr = m_pImport->GetFieldMarshal( inToken, &pvNativeType, &cbNativeType);
    if (FAILED(hr) && hr != CLDB_E_RECORD_NOTFOUND) Error("GetFieldMarshal failed.", hr);
    if (hr != CLDB_E_RECORD_NOTFOUND)
    {
        ULONG cbCur = 0;
        ULONG ulData;
        ULONG ulStrLoc;

        char szNTDesc[STRING_BUFFER_LEN];

        while (cbCur < cbNativeType)
        {
            ulStrLoc = 0;

            ulData = NATIVE_TYPE_MAX;
            cbCur += CorSigUncompressData(&pvNativeType[cbCur], &ulData);
            ulStrLoc += sprintf(szNTDesc + ulStrLoc, "%s ", (ulData < sizeof(g_szNativeType)/sizeof(*g_szNativeType)) ? g_szNativeType[ulData] : "*OUTOFRANGE*");
            switch (ulData)
            {
            case NATIVE_TYPE_FIXEDSYSSTRING:
                {
                    if (cbCur < cbNativeType)
                    {
                        cbCur += CorSigUncompressData(&pvNativeType[cbCur], &ulData);
                        ulStrLoc += sprintf(szNTDesc + ulStrLoc, "{StringElementCount: %d} ",ulData);
                    }
                }
                break;
            case NATIVE_TYPE_FIXEDARRAY:
                {
                    if (cbCur < cbNativeType)
                    {
                        cbCur += CorSigUncompressData(&pvNativeType[cbCur], &ulData);
                        ulStrLoc += sprintf(szNTDesc + ulStrLoc, "{ArrayElementCount: %d",ulData);

                        if (cbCur < cbNativeType)
                        {
                            cbCur += CorSigUncompressData(&pvNativeType[cbCur], &ulData);
                            ulStrLoc += sprintf(szNTDesc + ulStrLoc, ", ArrayElementType(NT): %d",ulData);
                        }

                        ulStrLoc += sprintf(szNTDesc + ulStrLoc, "}");
                    }
                }
                break;
            case NATIVE_TYPE_ARRAY:
                {
                    if (cbCur < cbNativeType)
                    {
                        BOOL bElemTypeSpecified;

                        cbCur += CorSigUncompressData(&pvNativeType[cbCur], &ulData);
                        if (ulData != NATIVE_TYPE_MAX)
                        {
                            ulStrLoc += sprintf(szNTDesc + ulStrLoc, "{ArrayElementType(NT): %d", ulData);
                            bElemTypeSpecified = TRUE;
                        }
                        else
                        {
                            ulStrLoc += sprintf(szNTDesc + ulStrLoc, "{");
                            bElemTypeSpecified = FALSE;
                        }

                        if (cbCur < cbNativeType)
                        {
                            if (bElemTypeSpecified)
                                ulStrLoc += sprintf(szNTDesc + ulStrLoc, ", ",ulData);

                            cbCur += CorSigUncompressData(&pvNativeType[cbCur], &ulData);
                            ulStrLoc += sprintf(szNTDesc + ulStrLoc, "SizeParamIndex: %d",ulData);

                            if (cbCur < cbNativeType)
                            {
                                cbCur += CorSigUncompressData(&pvNativeType[cbCur], &ulData);
                                ulStrLoc += sprintf(szNTDesc + ulStrLoc, ", SizeParamMultiplier: %d",ulData);

                                if (cbCur < cbNativeType)
                                {
                                    cbCur += CorSigUncompressData(&pvNativeType[cbCur], &ulData);
                                    ulStrLoc += sprintf(szNTDesc + ulStrLoc, ", SizeConst: %d",ulData);
                                }
                            }
                        }

                        ulStrLoc += sprintf(szNTDesc + ulStrLoc, "}");
                    }
                }
                break;
            case NATIVE_TYPE_SAFEARRAY:
                {
                    if (cbCur < cbNativeType)
                    {
                        cbCur += CorSigUncompressData(&pvNativeType[cbCur], &ulData);
                        ulStrLoc += sprintf(szNTDesc + ulStrLoc, "{SafeArraySubType(VT): %d} ",ulData);
                    }
                }
                break;
            case NATIVE_TYPE_CUSTOMMARSHALER:
                {
                    LPUTF8 strTemp = NULL;
                    ULONG strLen = 0;

                    // Extract the typelib GUID.
                    cbCur += CorSigUncompressData(&pvNativeType[cbCur], &strLen);
                    strTemp = (LPUTF8)_alloca(strLen + 1);
                    memcpy(strTemp, (LPUTF8)&pvNativeType[cbCur], strLen);
                    strTemp[strLen] = 0;
                    ulStrLoc += sprintf(szNTDesc + ulStrLoc, "{Typelib: %s, ", strTemp);
                    cbCur += strLen;
                    _ASSERTE(cbCur < cbNativeType);

                    // Extract the name of the native type.
                    cbCur += CorSigUncompressData(&pvNativeType[cbCur], &strLen);
                    strTemp = (LPUTF8)_alloca(strLen + 1);
                    memcpy(strTemp, (LPUTF8)&pvNativeType[cbCur], strLen);
                    strTemp[strLen] = 0;
                    ulStrLoc += sprintf(szNTDesc + ulStrLoc, "Native: %s, ", strTemp);
                    cbCur += strLen;
                    _ASSERTE(cbCur < cbNativeType);

                    // Extract the name of the custom marshaler.
                    cbCur += CorSigUncompressData(&pvNativeType[cbCur], &strLen);
                    strTemp = (LPUTF8)_alloca(strLen + 1);
                    memcpy(strTemp, (LPUTF8)&pvNativeType[cbCur], strLen);
                    strTemp[strLen] = 0;
                    ulStrLoc += sprintf(szNTDesc + ulStrLoc, "Marshaler: %s, ", strTemp);
                    cbCur += strLen;
                    _ASSERTE(cbCur < cbNativeType);

                    // Extract the cookie string.
                    cbCur += CorSigUncompressData(&pvNativeType[cbCur], &strLen);
                    if (strLen > 0)
                    {
                        strTemp = (LPUTF8)_alloca(strLen + 1);
                        memcpy(strTemp, (LPUTF8)&pvNativeType[cbCur], strLen);
                        strTemp[strLen] = 0;
                        ulStrLoc += sprintf(szNTDesc + ulStrLoc, "Cookie: ");

                        // Copy the cookie string and transform the embedded nulls into \0's.
                        for (int i = 0; i < strLen - 1; i++, cbCur++)
                        {
                            if (strTemp[i] == 0)
                                ulStrLoc += sprintf(szNTDesc + ulStrLoc, "\\0");
                            else
                                szNTDesc[ulStrLoc++] = strTemp[i];
                        }
                        szNTDesc[ulStrLoc++] = strTemp[strLen - 1];
                        cbCur++;
                    }
                    else
                    {
                        ulStrLoc += sprintf(szNTDesc + ulStrLoc, "Cookie: ");
                    }

                    // Finish the custom marshaler native type description.
                    ulStrLoc += sprintf(szNTDesc + ulStrLoc, "}");
                    _ASSERTE(cbCur <= cbNativeType);
                    break;
                }           
                break;
            default:
                {
                    // normal nativetype element: do nothing
                }
            }
            VWriteLine("\t\t\t\t%s",szNTDesc);
            if (ulData >= NATIVE_TYPE_MAX)
                break;
        }
    }
} // void MDInfo::DisplayFieldMarshal()

void MDInfo::DisplayPinvokeInfo(mdToken inToken)
{
    HRESULT hr = NOERROR;
    DWORD flags;
    WCHAR rcImport[512];
    mdModuleRef tkModuleRef;
            
    char sFlags[STRING_BUFFER_LEN];

    hr = m_pImport->GetPinvokeMap(inToken, &flags, rcImport,
                                  NumItems(rcImport), 0, &tkModuleRef);
    if (FAILED(hr))
    {
        if (hr != CLDB_E_RECORD_NOTFOUND)
            VWriteLine("ERROR: GetPinvokeMap failed.", hr);
        return;
    }
                
    WriteLine("\t\tPinvoke Map Data:");
    VWriteLine("\t\tEntry point:      %S", rcImport);
    VWriteLine("\t\tModule ref:       %08x", tkModuleRef);
            
    strcpy(sFlags, "");
    ISFLAG(Pm, NoMangle);           
    ISFLAG(Pm, CharSetNotSpec);
    ISFLAG(Pm, CharSetAnsi);        
    ISFLAG(Pm, CharSetUnicode); 
    ISFLAG(Pm, CharSetAuto);
    ISFLAG(Pm, SupportsLastError);  
    ISFLAG(Pm, CallConvWinapi); 
    ISFLAG(Pm, CallConvCdecl);  
    ISFLAG(Pm, CallConvStdcall);
    ISFLAG(Pm, CallConvThiscall);   
    ISFLAG(Pm, CallConvFastcall);   
    if (!*sFlags)
        strcpy(sFlags, "[none]");
        
    VWriteLine("\t\tMapping flags:    %s (%08x)", sFlags, flags);
}   // void MDInfo::DisplayPinvokeInfo()


/////////////////////////////////////////////////////////////////////////
// void DisplaySignature(PCCOR_SIGNATURE pbSigBlob, ULONG ulSigBlob);
//
// Display Common Language Runtime signature
/////////////////////////////////////////////////////////////////////////
void MDInfo::DisplaySignature(PCCOR_SIGNATURE pbSigBlob, ULONG ulSigBlob, const char *preFix)
{
    ULONG       cbCur = 0;
    ULONG       cb;
    ULONG       ulData;
    ULONG       ulArgs;
    HRESULT     hr = NOERROR;
    ULONG       ulSigBlobStart = ulSigBlob;

    // initialize sigBuf
    InitSigBuffer();

    cb = CorSigUncompressData(pbSigBlob, &ulData);
    VWriteLine("%s\t\tCallCnvntn: %s", preFix, (g_strCalling[ulData & IMAGE_CEE_CS_CALLCONV_MASK]));
    if (cb>ulSigBlob) 
        goto ErrExit;
    cbCur += cb;
    ulSigBlob -= cb;

    if (ulData & IMAGE_CEE_CS_CALLCONV_HASTHIS)
        VWriteLine("%s\t\thasThis ", preFix);
    if (ulData & IMAGE_CEE_CS_CALLCONV_EXPLICITTHIS)
        VWriteLine("%s\t\texplicit ", preFix);

    // initialize sigBuf
    InitSigBuffer();
    if ( isCallConv(ulData,IMAGE_CEE_CS_CALLCONV_FIELD) )
    {

        // display field type
        if (FAILED(hr = GetOneElementType(&pbSigBlob[cbCur], ulSigBlob, &cb)))
            goto ErrExit;
        VWriteLine("%s\t\tField type: %s", preFix, (LPSTR)m_sigBuf.Ptr());
        if (cb>ulSigBlob) 
            goto ErrExit;
        cbCur += cb;
        ulSigBlob -= cb;
    }
    else 
    {
        cb = CorSigUncompressData(&pbSigBlob[cbCur], &ulArgs);
        if (cb>ulSigBlob) 
            goto ErrExit;
        cbCur += cb;
        ulSigBlob -= cb;

        if (ulData != IMAGE_CEE_CS_CALLCONV_LOCAL_SIG)
        {
            // display return type when it is not a local varsig
            if (FAILED(hr = GetOneElementType(&pbSigBlob[cbCur], ulSigBlob, &cb)))
                goto ErrExit;
            VWriteLine("%s\t\tReturnType:%s", preFix, (LPSTR)m_sigBuf.Ptr());
            if (cb>ulSigBlob) 
                goto ErrExit;
            cbCur += cb;
            ulSigBlob -= cb;
        }

        // display count of argument
        // display arguments
        if (ulSigBlob)
            VWriteLine("%s\t\t%ld Arguments", preFix, ulArgs);
        else
            VWriteLine("%s\t\tNo arguments.", preFix);

        ULONG       i = 0;
        while (i < ulArgs && ulSigBlob > 0)
        {
            ULONG       ulData;

            // Handle the sentinal for varargs because it isn't counted in the args.
            CorSigUncompressData(&pbSigBlob[cbCur], &ulData);
            ++i;

            // initialize sigBuf
            InitSigBuffer();

            if (FAILED(hr = GetOneElementType(&pbSigBlob[cbCur], ulSigBlob, &cb)))
                goto ErrExit;

            VWriteLine("%s\t\t\tArgument #%ld: %s",preFix, i, (LPSTR)m_sigBuf.Ptr());
    
            if (cb>ulSigBlob) 
                goto ErrExit;

            cbCur += cb;
            ulSigBlob -= cb;
        }
    }

    // Nothing consumed but not yet counted.
    cb = 0;

ErrExit:
    // We should have consumed all signature blob.  If not, dump the sig in hex.
    //  Also dump in hex if so requested.
    if (m_DumpFilter & dumpMoreHex || ulSigBlob != 0)
    {
        // Did we not consume enough, or try to consume too much?
        if (cb > ulSigBlob)
            WriteLine("\tERROR IN SIGNATURE:  Signature should be larger.");
        else
        if (cb < ulSigBlob)
        {
            VWrite("\tERROR IN SIGNATURE:  Not all of signature blob was consumed.  %d byte(s) remain", ulSigBlob);
            // If it is short, just append it to the end.
            if (ulSigBlob < 4)
            {
                Write(": ");
                for (; ulSigBlob; ++cbCur, --ulSigBlob)
                    VWrite("%02x ", pbSigBlob[cbCur]);
                WriteLine("");
                goto ErrExit2;
            }
            WriteLine("");
        }

        // Any appropriate error message has been issued.  Dump sig in hex, as determined
        //  by error or command line switch.
        cbCur = 0;
        ulSigBlob = ulSigBlobStart;
        char rcNewPrefix[80];
        sprintf(rcNewPrefix, "%s\t\tSignature ", preFix);
        DumpHex(rcNewPrefix, pbSigBlob, ulSigBlob, false, 24);
    }
ErrExit2:
    if (FAILED(hr))
        Error("ERROR!! Bad signature blob value!");
    return;
} // void MDInfo::DisplaySignature()


/////////////////////////////////////////////////////////////////////////
// HRESULT GetOneElementType(mdScope tkScope, BYTE *pbSigBlob, ULONG ulSigBlob, ULONG *pcb)
//
// Adds description of element type to the end of buffer -- caller must ensure
// buffer is large enough.
/////////////////////////////////////////////////////////////////////////
HRESULT MDInfo::GetOneElementType(PCCOR_SIGNATURE pbSigBlob, ULONG ulSigBlob, ULONG *pcb)
{
    HRESULT     hr = S_OK;              // A result.
    ULONG       cbCur = 0;
    ULONG       cb;
    ULONG       ulData;
    ULONG       ulTemp;
    int         iTemp;
    mdToken     tk;

    cb = CorSigUncompressData(pbSigBlob, &ulData);
    cbCur += cb;

    // Handle the modifiers.
    if (ulData & ELEMENT_TYPE_MODIFIER)
    {
        if (ulData == ELEMENT_TYPE_SENTINEL)
            IfFailGo(AddToSigBuffer("<ELEMENT_TYPE_SENTINEL>"));
        else if (ulData == ELEMENT_TYPE_PINNED)
            IfFailGo(AddToSigBuffer("PINNED"));
        else
        {
            hr = E_FAIL;
            goto ErrExit;
        }
        if (FAILED(GetOneElementType(&pbSigBlob[cbCur], ulSigBlob-cbCur, &cb)))
            goto ErrExit;
        cbCur += cb;
        goto ErrExit;
    }

    // Handle the underlying element types.
    if (ulData >= ELEMENT_TYPE_MAX) 
    {
        hr = E_FAIL;
        goto ErrExit;
    }
    while (ulData == ELEMENT_TYPE_PTR || ulData == ELEMENT_TYPE_BYREF)
    {
        IfFailGo(AddToSigBuffer(" "));
        IfFailGo(AddToSigBuffer(g_szMapElementType[ulData]));
        cb = CorSigUncompressData(&pbSigBlob[cbCur], &ulData);
        cbCur += cb;
    }
    IfFailGo(AddToSigBuffer(" "));
    IfFailGo(AddToSigBuffer(g_szMapElementType[ulData]));
    if (CorIsPrimitiveType((CorElementType)ulData) || 
        ulData == ELEMENT_TYPE_TYPEDBYREF ||
        ulData == ELEMENT_TYPE_OBJECT ||
        ulData == ELEMENT_TYPE_I ||
        ulData == ELEMENT_TYPE_U)
    {
        // If this is a primitive type, we are done
        goto ErrExit;
    }
    if (ulData == ELEMENT_TYPE_VALUETYPE || 
        ulData == ELEMENT_TYPE_CLASS || 
        ulData == ELEMENT_TYPE_CMOD_REQD ||
        ulData == ELEMENT_TYPE_CMOD_OPT)
    {
        cb = CorSigUncompressToken(&pbSigBlob[cbCur], &tk);
        cbCur += cb;

        // get the name of type ref. Don't care if truncated
        if (TypeFromToken(tk) == mdtTypeDef || TypeFromToken(tk) == mdtTypeRef)
        {
            sprintf(m_tempFormatBuffer, " %ls",TypeDeforRefName(tk, m_szTempBuf, NumItems(m_szTempBuf)));
            IfFailGo(AddToSigBuffer(m_tempFormatBuffer));
        }
        else
        {
            _ASSERTE(TypeFromToken(tk) == mdtTypeSpec);
            sprintf(m_tempFormatBuffer, " %8x", tk);
            IfFailGo(AddToSigBuffer(m_tempFormatBuffer));
        }
        if (ulData == ELEMENT_TYPE_CMOD_REQD ||
            ulData == ELEMENT_TYPE_CMOD_OPT)
        {
            if (FAILED(GetOneElementType(&pbSigBlob[cbCur], ulSigBlob-cbCur, &cb)))
                goto ErrExit;
            cbCur += cb;
        }

        goto ErrExit;
    }
    if (ulData == ELEMENT_TYPE_SZARRAY)
    {
        // display the base type of SZARRAY or GENERICARRAY
        if (FAILED(GetOneElementType(&pbSigBlob[cbCur], ulSigBlob-cbCur, &cb)))
            goto ErrExit;
        cbCur += cb;
        goto ErrExit;
    }
    if (ulData == ELEMENT_TYPE_FNPTR) 
    {
        cb = CorSigUncompressData(&pbSigBlob[cbCur], &ulData);
        cbCur += cb;
        if (ulData & IMAGE_CEE_CS_CALLCONV_EXPLICITTHIS)
            IfFailGo(AddToSigBuffer(" explicit"));
        if (ulData & IMAGE_CEE_CS_CALLCONV_HASTHIS)
            IfFailGo(AddToSigBuffer(" hasThis"));

        IfFailGo(AddToSigBuffer(" "));
        IfFailGo(AddToSigBuffer(g_strCalling[ulData & IMAGE_CEE_CS_CALLCONV_MASK]));

            // Get number of args
        ULONG numArgs;
        cb = CorSigUncompressData(&pbSigBlob[cbCur], &numArgs);
        cbCur += cb;

            // do return type
        if (FAILED(GetOneElementType(&pbSigBlob[cbCur], ulSigBlob-cbCur, &cb)))
            goto ErrExit;
        cbCur += cb;

        IfFailGo(AddToSigBuffer("("));
        while (numArgs > 0) 
        {
            if (cbCur > ulSigBlob)
                goto ErrExit;
            if (FAILED(GetOneElementType(&pbSigBlob[cbCur], ulSigBlob-cbCur, &cb)))
                goto ErrExit;
            cbCur += cb;
            --numArgs;
            if (numArgs > 0) 
                IfFailGo(AddToSigBuffer(","));
        }
        IfFailGo(AddToSigBuffer(" )"));
        goto ErrExit;
    }

    _ASSERTE(ulData == ELEMENT_TYPE_ARRAY);

    // display the base type of SDARRAY
    if (FAILED(GetOneElementType(&pbSigBlob[cbCur], ulSigBlob-cbCur, &cb)))
        goto ErrExit;
    cbCur += cb;

    // display the rank of MDARRAY
    cb = CorSigUncompressData(&pbSigBlob[cbCur], &ulData);
    cbCur += cb;
    sprintf(m_tempFormatBuffer, " %d", ulData);
    IfFailGo(AddToSigBuffer(m_tempFormatBuffer));
    if (ulData == 0)
        // we are done if no rank specified
        goto ErrExit;

    // how many dimensions have size specified?
    cb = CorSigUncompressData(&pbSigBlob[cbCur], &ulData);
    cbCur += cb;
    sprintf(m_tempFormatBuffer, " %d", ulData);
    IfFailGo(AddToSigBuffer(m_tempFormatBuffer));
    while (ulData)
    {

        cb = CorSigUncompressData(&pbSigBlob[cbCur], &ulTemp);
        sprintf(m_tempFormatBuffer, " %d", ulTemp);
        IfFailGo(AddToSigBuffer(m_tempFormatBuffer));
        cbCur += cb;
        ulData--;
    }
    // how many dimensions have lower bounds specified?
    cb = CorSigUncompressData(&pbSigBlob[cbCur], &ulData);
    cbCur += cb;
    sprintf(m_tempFormatBuffer, " %d", ulData);
    IfFailGo(AddToSigBuffer(m_tempFormatBuffer));
    while (ulData)
    {

        cb = CorSigUncompressSignedInt(&pbSigBlob[cbCur], &iTemp);
        sprintf(m_tempFormatBuffer, " %d", iTemp);
        IfFailGo(AddToSigBuffer(m_tempFormatBuffer));
        cbCur += cb;
        ulData--;
    }
    
ErrExit:
    if (cbCur > ulSigBlob)
        hr = E_FAIL;
    *pcb = cbCur;
    return hr;
} // HRESULT MDInfo::GetOneElementType()

// Display the fields of the N/Direct custom value structure.

void MDInfo::DisplayCorNativeLink(COR_NATIVE_LINK *pCorNLnk, const char *preFix)
{
    // Print the LinkType.
    char *curField = "\tLink Type : ";
    switch(pCorNLnk->m_linkType)
    {
    case nltNone:
        VWriteLine("%s%s%s(%02x)", preFix, curField, "nltNone", pCorNLnk->m_linkType);
        break;
    case nltAnsi:
        VWriteLine("%s%s%s(%02x)", preFix, curField, "nltAnsi", pCorNLnk->m_linkType);
        break;
    case nltUnicode:
        VWriteLine("%s%s%s(%02x)", preFix, curField, "nltUnicode", pCorNLnk->m_linkType);
        break;
    case nltAuto:
        VWriteLine("%s%s%s(%02x)", preFix, curField, "nltAuto", pCorNLnk->m_linkType);
        break;
    default:
        _ASSERTE(!"Invalid Native Link Type!");
    }

    // Print the link flags
    curField = "\tLink Flags : ";
    switch(pCorNLnk->m_flags)
    {
    case nlfNone:
        VWriteLine("%s%s%s(%02x)", preFix, curField, "nlfNone", pCorNLnk->m_flags);
        break;
    case nlfLastError:
        VWriteLine("%s%s%s(%02x)", preFix, curField, "nlfLastError", pCorNLnk->m_flags);
            break;
    default:
        _ASSERTE(!"Invalid Native Link Flags!");
    }

    // Print the entry point.
    WCHAR memRefName[STRING_BUFFER_LEN];
    HRESULT hr;
    hr = m_pImport->GetMemberRefProps( pCorNLnk->m_entryPoint, NULL, memRefName,
                                    STRING_BUFFER_LEN, NULL, NULL, NULL);
    if (FAILED(hr)) Error("GetMemberRefProps failed.", hr);
    VWriteLine("%s\tEntry Point : %ls (0x%08x)", preFix, memRefName, pCorNLnk->m_entryPoint);
} // void MDInfo::DisplayCorNativeLink()

// Fills given varaint with value given in pValue and of type in bCPlusTypeFlag
//
// Taken from MetaInternal.cpp

HRESULT _FillVariant(
    BYTE        bCPlusTypeFlag, 
    const void  *pValue,
    VARIANT     *pvar) 
{
    HRESULT     hr = NOERROR;
    switch (bCPlusTypeFlag)
    {
    case ELEMENT_TYPE_BOOLEAN:
        pvar->vt = VT_BOOL;
        pvar->boolVal = *((BYTE*)pValue); //*((VARIANT_BOOL *)pValue);
        break;
    case ELEMENT_TYPE_I1:
        pvar->vt = VT_I1;
        pvar->cVal = *((CHAR*)pValue);
        break;  
    case ELEMENT_TYPE_U1:
        pvar->vt = VT_UI1;
        pvar->bVal = *((BYTE*)pValue);
        break;  
    case ELEMENT_TYPE_I2:
        pvar->vt = VT_I2;
        pvar->iVal = *((SHORT*)pValue);
        break;  
    case ELEMENT_TYPE_U2:
    case ELEMENT_TYPE_CHAR:
        pvar->vt = VT_UI2;
        pvar->uiVal = *((USHORT*)pValue);
        break;  
    case ELEMENT_TYPE_I4:
        pvar->vt = VT_I4;
        pvar->lVal = *((LONG*)pValue);
        break;  
    case ELEMENT_TYPE_U4:
        pvar->vt = VT_UI4;
        pvar->ulVal = *((ULONG*)pValue);
        break;  
    case ELEMENT_TYPE_R4:
        pvar->vt = VT_R4;
        pvar->fltVal = *((FLOAT*)pValue);
        break;  
    case ELEMENT_TYPE_R8:
        pvar->vt = VT_R8;
        pvar->dblVal = *((DOUBLE*)pValue);
        break;  
    case ELEMENT_TYPE_STRING:
        pvar->vt = VT_BSTR;

        // allocated bstr here
        pvar->bstrVal = ::SysAllocString((LPWSTR)pValue);
        if (pvar->bstrVal == NULL)
            hr = E_OUTOFMEMORY;
        break;  
    case ELEMENT_TYPE_CLASS:
        pvar->punkVal = NULL;
        pvar->vt = VT_UNKNOWN;
        _ASSERTE( *((IUnknown **)pValue) == NULL );
        break;  
    case ELEMENT_TYPE_I8:
        pvar->vt = VT_I8;
        pvar->cyVal.int64 = *((LONGLONG*)pValue);
        break;
    case ELEMENT_TYPE_U8:
        pvar->vt = VT_UI8;
        pvar->cyVal.int64 = *((LONGLONG*)pValue);
        break;
    case ELEMENT_TYPE_VOID:
        pvar->vt = VT_EMPTY;
        break;
    default:
        _ASSERTE(!"bad constant value type!");
    }

    return hr;
} // HRESULT _FillVariant()

void MDInfo::DisplayAssembly()
{
    if (m_pAssemblyImport) 
    {
        DisplayAssemblyInfo();
        DisplayAssemblyRefs();
        DisplayFiles();
        DisplayExportedTypes();
        DisplayManifestResources();
    }
} // void MDInfo::DisplayAssembly()

void MDInfo::DisplayAssemblyInfo()
{
    HRESULT         hr;
    mdAssembly      mda;
    const BYTE      *pbPublicKey;
    ULONG           cbPublicKey;
    ULONG           ulHashAlgId;
    WCHAR           szName[STRING_BUFFER_LEN];
    ASSEMBLYMETADATA MetaData;
    DWORD           dwFlags;

    hr = m_pAssemblyImport->GetAssemblyFromScope(&mda);
    if (hr == CLDB_E_RECORD_NOTFOUND)
        return;
    else if (FAILED(hr)) Error("GetAssemblyFromScope() failed.", hr);

    // Get the required sizes for the arrays of locales, processors etc.
    ZeroMemory(&MetaData, sizeof(ASSEMBLYMETADATA));
    hr = m_pAssemblyImport->GetAssemblyProps(mda, 
                                             NULL, NULL,    // Public Key.
                                             NULL,          // Hash Algorithm.
                                             NULL, 0, NULL, // Name.
                                             &MetaData,
                                             NULL);         // Flags.
    if (FAILED(hr)) Error("GetAssemblyProps() failed.", hr);

    // Allocate space for the arrays in the ASSEMBLYMETADATA structure.
    if (MetaData.cbLocale)
        MetaData.szLocale = (WCHAR *)_alloca(sizeof(WCHAR) * MetaData.cbLocale);
    if (MetaData.ulProcessor)
        MetaData.rProcessor = (DWORD *)_alloca(sizeof(DWORD) * MetaData.ulProcessor);
    if (MetaData.ulOS)
        MetaData.rOS = (OSINFO *)_alloca(sizeof(OSINFO) * MetaData.ulOS);

    hr = m_pAssemblyImport->GetAssemblyProps(mda, 
                                             (const void **)&pbPublicKey, &cbPublicKey,
                                             &ulHashAlgId,
                                             szName, STRING_BUFFER_LEN, NULL,
                                             &MetaData,
                                             &dwFlags);
    if (FAILED(hr)) Error("GetAssemblyProps() failed.", hr);
    WriteLine("Assembly");
    WriteLine("-------------------------------------------------------");
    VWriteLine("\tToken: 0x%08x", mda);
    VWriteLine("\tName : %ls", szName);
    DumpHex("\tPublic Key    ", pbPublicKey, cbPublicKey, false, 24);
    VWriteLine("\tHash Algorithm : 0x%08x", ulHashAlgId);
    DisplayASSEMBLYMETADATA(&MetaData);

    char sFlags[STRING_BUFFER_LEN];
    DWORD flags = dwFlags;

    strcpy(sFlags, "");
    ISFLAG(Af, SideBySideCompatible);
    ISFLAG(Af, NonSideBySideAppDomain);
    ISFLAG(Af, NonSideBySideProcess);
    ISFLAG(Af, NonSideBySideMachine);
    ISFLAG(Af, PublicKey);
    ISFLAG(Af, EnableJITcompileTracking);
    ISFLAG(Af, DisableJITcompileOptimizer);
    if (!*sFlags)
        strcpy(sFlags, "[none]");

    VWriteLine("\tFlags : %s (%08x)", sFlags, dwFlags);
    DisplayCustomAttributes(mda, "\t");
    DisplayPermissions(mda, "\t");
    WriteLine("");
}   // void MDInfo::DisplayAssemblyInfo()

void MDInfo::DisplayAssemblyRefs()
{
    HCORENUM        assemblyRefEnum = NULL;
    mdAssemblyRef   AssemblyRefs[ENUM_BUFFER_SIZE];
    ULONG           count;
    ULONG           totalCount = 1;
    HRESULT         hr;

    while (SUCCEEDED(hr = m_pAssemblyImport->EnumAssemblyRefs( &assemblyRefEnum,
                             AssemblyRefs, NumItems(AssemblyRefs), &count)) &&
            count > 0)
    {
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            VWriteLine("AssemblyRef #%d", totalCount);
            WriteLine("-------------------------------------------------------");
            DisplayAssemblyRefInfo(AssemblyRefs[i]);
            WriteLine("");
        }
    }
    m_pAssemblyImport->CloseEnum(assemblyRefEnum);
}   // void MDInfo::DisplayAssemblyRefs()

void MDInfo::DisplayAssemblyRefInfo(mdAssemblyRef inAssemblyRef)
{
    HRESULT         hr;
    const BYTE      *pbPublicKeyOrToken;
    ULONG           cbPublicKeyOrToken;
    WCHAR           szName[STRING_BUFFER_LEN];
    ASSEMBLYMETADATA MetaData;
    const BYTE      *pbHashValue;
    ULONG           cbHashValue;
    DWORD           dwFlags;
    
    VWriteLine("\tToken: 0x%08x", inAssemblyRef);

    // Get sizes for the arrays in the ASSEMBLYMETADATA structure.
    ZeroMemory(&MetaData, sizeof(ASSEMBLYMETADATA));
    hr = m_pAssemblyImport->GetAssemblyRefProps(inAssemblyRef,
                                             NULL, NULL,    // Public Key or Token.
                                             NULL, 0, NULL, // Name.
                                             &MetaData,
                                             NULL, NULL,    // HashValue.
                                             NULL);         // Flags.
    if (FAILED(hr)) Error("GetAssemblyRefProps() failed.", hr);
    
    // Allocate space for the arrays in the ASSEMBLYMETADATA structure.
    if (MetaData.cbLocale)
        MetaData.szLocale = (WCHAR *)_alloca(sizeof(WCHAR) * MetaData.cbLocale);
    if (MetaData.ulProcessor)
        MetaData.rProcessor = (DWORD *)_alloca(sizeof(DWORD) * MetaData.ulProcessor);
    if (MetaData.ulOS)
        MetaData.rOS = (OSINFO *)_alloca(sizeof(OSINFO) * MetaData.ulOS);

    hr = m_pAssemblyImport->GetAssemblyRefProps(inAssemblyRef,
                                             (const void **)&pbPublicKeyOrToken, &cbPublicKeyOrToken,
                                             szName, STRING_BUFFER_LEN, NULL,
                                             &MetaData,
                                             (const void **)&pbHashValue, &cbHashValue,
                                             &dwFlags);
    if (FAILED(hr)) Error("GetAssemblyRefProps() failed.", hr);

    DumpHex("\tPublic Key or Token", pbPublicKeyOrToken, cbPublicKeyOrToken, false, 24);
    VWriteLine("\tName: %ls", szName);
    DisplayASSEMBLYMETADATA(&MetaData);
    DumpHex("\tHashValue Blob", pbHashValue, cbHashValue, false, 24);

    char sFlags[STRING_BUFFER_LEN];
    DWORD flags = dwFlags;

    strcpy(sFlags, "");
    ISFLAG(Af, PublicKey);     
    if (!*sFlags)
        strcpy(sFlags, "[none]");

    VWriteLine("\tFlags: %s (%08x)", sFlags, dwFlags);
    DisplayCustomAttributes(inAssemblyRef, "\t");
    WriteLine("");
}   // void MDInfo::DisplayAssemblyRefInfo()

void MDInfo::DisplayFiles()
{
    HCORENUM        fileEnum = NULL;
    mdFile          Files[ENUM_BUFFER_SIZE];
    ULONG           count;
    ULONG           totalCount = 1;
    HRESULT         hr;

    while (SUCCEEDED(hr = m_pAssemblyImport->EnumFiles( &fileEnum,
                             Files, NumItems(Files), &count)) &&
            count > 0)
    {
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            VWriteLine("File #%d", totalCount);
            WriteLine("-------------------------------------------------------");
            DisplayFileInfo(Files[i]);
            WriteLine("");
        }
    }
    m_pAssemblyImport->CloseEnum(fileEnum);
}   // void MDInfo::DisplayFiles()

void MDInfo::DisplayFileInfo(mdFile inFile)
{
    HRESULT         hr;
    WCHAR           szName[STRING_BUFFER_LEN];
    const BYTE      *pbHashValue;
    ULONG           cbHashValue;
    DWORD           dwFlags;

    VWriteLine("\tToken: 0x%08x", inFile);

    hr = m_pAssemblyImport->GetFileProps(inFile,
                                         szName, STRING_BUFFER_LEN, NULL,
                                         (const void **)&pbHashValue, &cbHashValue,
                                         &dwFlags);
    if (FAILED(hr)) Error("GetFileProps() failed.", hr);
    VWriteLine("\tName : %ls", szName);
    DumpHex("\tHashValue Blob ", pbHashValue, cbHashValue, false, 24);

    char sFlags[STRING_BUFFER_LEN];
    DWORD flags = dwFlags;

    strcpy(sFlags, "");
    ISFLAG(Ff, ContainsMetaData);      
    ISFLAG(Ff, ContainsNoMetaData);      
    if (!*sFlags)
        strcpy(sFlags, "[none]");

    VWriteLine("\tFlags : %s (%08x)", sFlags, dwFlags);
    DisplayCustomAttributes(inFile, "\t");
    WriteLine("");

}   // MDInfo::DisplayFileInfo()

void MDInfo::DisplayExportedTypes()
{
    HCORENUM        comTypeEnum = NULL;
    mdExportedType       ExportedTypes[ENUM_BUFFER_SIZE];
    ULONG           count;
    ULONG           totalCount = 1;
    HRESULT         hr;

    while (SUCCEEDED(hr = m_pAssemblyImport->EnumExportedTypes( &comTypeEnum,
                             ExportedTypes, NumItems(ExportedTypes), &count)) &&
            count > 0)
    {
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            VWriteLine("ExportedType #%d", totalCount);
            WriteLine("-------------------------------------------------------");
            DisplayExportedTypeInfo(ExportedTypes[i]);
            WriteLine("");
        }
    }
    m_pAssemblyImport->CloseEnum(comTypeEnum);
}   // void MDInfo::DisplayExportedTypes()

void MDInfo::DisplayExportedTypeInfo(mdExportedType inExportedType)
{
    HRESULT         hr;
    WCHAR           szName[STRING_BUFFER_LEN];
    mdToken         tkImplementation;
    mdTypeDef       tkTypeDef;
    DWORD           dwFlags;
    char            sFlags[STRING_BUFFER_LEN];

    VWriteLine("\tToken: 0x%08x", inExportedType);

    hr = m_pAssemblyImport->GetExportedTypeProps(inExportedType,
                                            szName, STRING_BUFFER_LEN, NULL,
                                            &tkImplementation,
                                            &tkTypeDef,
                                            &dwFlags);
    if (FAILED(hr)) Error("GetExportedTypeProps() failed.", hr);
    VWriteLine("\tName: %ls", szName);
    VWriteLine("\tImplementation token: 0x%08x", tkImplementation);
    VWriteLine("\tTypeDef token: 0x%08x", tkTypeDef);
    VWriteLine("\tFlags     : %s (%08x)",ClassFlags(dwFlags, sFlags), dwFlags);
    DisplayCustomAttributes(inExportedType, "\t");
    WriteLine("");
}   // void MDInfo::DisplayExportedTypeInfo()

void MDInfo::DisplayManifestResources()
{
    HCORENUM        manifestResourceEnum = NULL;
    mdManifestResource ManifestResources[ENUM_BUFFER_SIZE];
    ULONG           count;
    ULONG           totalCount = 1;
    HRESULT         hr;

    while (SUCCEEDED(hr = m_pAssemblyImport->EnumManifestResources( &manifestResourceEnum,
                             ManifestResources, NumItems(ManifestResources), &count)) &&
            count > 0)
    {
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            VWriteLine("ManifestResource #%d", totalCount);
            WriteLine("-------------------------------------------------------");
            DisplayManifestResourceInfo(ManifestResources[i]);
            WriteLine("");
        }
    }
    m_pAssemblyImport->CloseEnum(manifestResourceEnum);
}   // void MDInfo::DisplayManifestResources()

void MDInfo::DisplayManifestResourceInfo(mdManifestResource inManifestResource)
{
    HRESULT         hr;
    WCHAR           szName[STRING_BUFFER_LEN];
    mdToken         tkImplementation;
    DWORD           dwOffset;
    DWORD           dwFlags;

    VWriteLine("\tToken: 0x%08x", inManifestResource);

    hr = m_pAssemblyImport->GetManifestResourceProps(inManifestResource,
                                                     szName, STRING_BUFFER_LEN, NULL,
                                                     &tkImplementation,
                                                     &dwOffset,
                                                     &dwFlags);
    if (FAILED(hr)) Error("GetManifestResourceProps() failed.", hr);
    VWriteLine("Name: %ls", szName);
    VWriteLine("Implementation token: 0x%08x", tkImplementation);
    VWriteLine("Offset: 0x%08x", dwOffset);

    char sFlags[STRING_BUFFER_LEN];
    DWORD flags = dwFlags;

    strcpy(sFlags, "");
    ISFLAG(Mr, Public);     
    ISFLAG(Mr, Private);            
    if (!*sFlags)
        strcpy(sFlags, "[none]");

    VWriteLine("\tFlags: %s (%08x)", sFlags, dwFlags);
    DisplayCustomAttributes(inManifestResource, "\t");
    WriteLine("");
}   // void MDInfo::DisplayManifestResourceInfo()

void MDInfo::DisplayASSEMBLYMETADATA(ASSEMBLYMETADATA *pMetaData)
{
    ULONG           i;

    VWriteLine("\tMajor Version: 0x%08x", pMetaData->usMajorVersion);
    VWriteLine("\tMinor Version: 0x%08x", pMetaData->usMinorVersion);
    VWriteLine("\tBuild Number: 0x%08x", pMetaData->usBuildNumber);
    VWriteLine("\tRevision Number: 0x%08x", pMetaData->usRevisionNumber);
    VWriteLine("\tLocale: %ls", pMetaData->cbLocale ? pMetaData->szLocale : L"<null>");
    for (i = 0; i < pMetaData->ulProcessor; i++)
        VWriteLine("\tProcessor #%ld: 0x%08x", i+1, pMetaData->rProcessor[i]);
    for (i = 0; i < pMetaData->ulOS; i++)
    {
        VWriteLine("\tOS #%ld:", i+1);
        VWriteLine("\t\tOS Platform ID: 0x%08x", pMetaData->rOS[i].dwOSPlatformId);
        VWriteLine("\t\tOS Major Version: 0x%08x", pMetaData->rOS[i].dwOSMajorVersion);
        VWriteLine("\t\tOS Minor Version: 0x%08x", pMetaData->rOS[i].dwOSMinorVersion);
    }
}   // void MDInfo::DisplayASSEMBLYMETADATA()

void MDInfo::DisplayUserStrings()
{
    HCORENUM    stringEnum = NULL;      // string enumerator.
    mdString    Strings[ENUM_BUFFER_SIZE]; // String tokens from enumerator.
    CQuickArray<WCHAR> rUserString;     // Buffer to receive string.
    WCHAR       *szUserString;          // Working pointer into buffer.
    ULONG       chUserString;           // Size of user string.
    CQuickArray<char> rcBuf;            // Buffer to hold the BLOB version of the string.
    char        *szBuf;                 // Working pointer into buffer.
    ULONG       chBuf;                  // Saved size of the user string.
    ULONG       count;                  // Items returned from enumerator.
    ULONG       totalCount = 1;         // Running count of strings.
    bool        bUnprint = false;       // Is an unprintable character found?
    HRESULT     hr;                     // A result.

    while (SUCCEEDED(hr = m_pImport->EnumUserStrings( &stringEnum,
                             Strings, NumItems(Strings), &count)) &&
            count > 0)
    {
        if (totalCount == 1)
        {   // If only one, it is the NULL string, so don't print it.
            WriteLine("User Strings");
            WriteLine("-------------------------------------------------------");
        }
        for (ULONG i = 0; i < count; i++, totalCount++)
        {
            do { // Try to get the string into the existing buffer.
                hr = m_pImport->GetUserString( Strings[i], rUserString.Ptr(),rUserString.MaxSize(), &chUserString);
                if (hr == CLDB_S_TRUNCATION)
                {   // Buffer wasn't big enough, try to enlarge it.
                    if (FAILED(rUserString.ReSize(chUserString)))
                        Error("malloc failed.", E_OUTOFMEMORY);
                    continue;
                }
            } while (0);
            if (FAILED(hr)) Error("GetUserString failed.", hr);

            szUserString = rUserString.Ptr();
            chBuf = chUserString;

            VWrite("%08x : (%2d) L\"", Strings[i], chUserString);
            while (chUserString)
            {   
                switch (*szUserString)
                {
                case 0:
                    Write("\\0"); break;
                case L'\r':
                    Write("\\r"); break;
                case L'\n':
                    Write("\\n"); break;
                case L'\t':
                    Write("\\t"); break;
                default:
                    if (iswprint(*szUserString))
                        VWrite("%lc", *szUserString);
                    else 
                    {
                        bUnprint = true;
                        Write(".");
                    }
                    break;
                }
                ++szUserString;
                --chUserString;
            }
            WriteLine("\"");

            // Print the user string as a blob if an unprintable character is found.
            if (bUnprint)
            {
                bUnprint = false;
                szUserString = rUserString.Ptr();
                rcBuf.ReSize(chBuf * 5 + 1);
                szBuf = rcBuf.Ptr();
                ULONG j;
                for (j = 0; j < chBuf; j++)
                    sprintf (&szBuf[j*5], "%04x ", szUserString[j]);
                szBuf[j*5] = '\0';
                WriteLine("\t\tUser string has unprintables, hex format below:");
                VWriteLine("\t\t%s", szBuf);
            }
        }
    }
    if (stringEnum)
        m_pImport->CloseEnum(stringEnum);
}   // void MDInfo::DisplayUserStrings()

void MDInfo::DisplayUnsatInfo()
{
    HRESULT     hr = S_OK;

    HCORENUM henum = 0;
    mdToken  tk;
    ULONG cMethods;

    Write("\nUnresolved Externals\n");
    Write("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");

    while ( (hr = m_pImport->EnumUnresolvedMethods(
        &henum, 
        &tk, 
        1, 
        &cMethods)) == S_OK && cMethods )
    {
        if ( TypeFromToken(tk) == mdtMethodDef )
        {
            // a method definition without implementation
            DisplayMethodInfo( tk );
        }
        else if ( TypeFromToken(tk) == mdtMemberRef )
        {
            // an unresolved MemberRef to a global function 
            DisplayMemberRefInfo( tk, "" );
        }
        else
        { 
            _ASSERTE(!"Unknown token kind!");
        }
    }
    m_pImport->CloseEnum(henum);
} // void MDInfo::DisplayUnsatInfo()

//*******************************************************************************
// This code is used for debugging purposes only.  This will just print out the
// entire database.
//*******************************************************************************
const char *MDInfo::DumpRawNameOfType(ULONG iType)
{
    if (iType <= iRidMax)
    {
        const char *pNameTable;
        m_pTables->GetTableInfo(iType, 0,0,0,0, &pNameTable);
        return pNameTable;
    }
    else
    // Is the field a coded token?
    if (iType <= iCodedTokenMax)
    {
        int iCdTkn = iType - iCodedToken;
        const char *pNameCdTkn;
        m_pTables->GetCodedTokenInfo(iCdTkn, 0,0, &pNameCdTkn);
        return pNameCdTkn;
    }

    // Fixed type.
    switch (iType)
    {
    case iBYTE:
        return "BYTE";
    case iSHORT:
        return "short";
    case iUSHORT:
        return "USHORT";
    case iLONG:
        return "long";
    case iULONG:
        return "ULONG";
    case iSTRING:
        return "string";
    case iGUID:
        return "GUID";
    case iBLOB:
        return "blob";
    }
    // default:
    static char buf[30];
    sprintf(buf, "unknown type 0x%02x", iType);
    return buf;
} // const char *MDInfo::DumpRawNameOfType()

void MDInfo::DumpRawCol(ULONG ixTbl, ULONG ixCol, ULONG rid, bool bStats)
{
    ULONG       ulType;                 // Type of a column.
    ULONG       ulVal;                  // Value of a column.
    LPCUTF8     pString;                // Pointer to a string.
    const void  *pBlob;                 // Pointer to a blob.
    ULONG       cb;                     // Size of something.

    m_pTables->GetColumn(ixTbl, ixCol, rid, &ulVal);
    m_pTables->GetColumnInfo(ixTbl, ixCol, 0, 0, &ulType, 0);

    if (ulType <= iRidMax)
    {
        const char *pNameTable;
        m_pTables->GetTableInfo(ulType, 0,0,0,0, &pNameTable);
        VWrite("%s[%x]", pNameTable, ulVal);
    }
    else
    // Is the field a coded token?
    if (ulType <= iCodedTokenMax)
    {
        int iCdTkn = ulType - iCodedToken; 
        const char *pNameCdTkn;
        m_pTables->GetCodedTokenInfo(iCdTkn, 0,0, &pNameCdTkn);
        VWrite("%s[%08x]", pNameCdTkn, ulVal);
    }
    else
    {
        // Fixed type.
        switch (ulType)
        {
        case iBYTE:
            VWrite("%02x", ulVal);
            break;
        case iSHORT:
        case iUSHORT:
            VWrite("%04x", ulVal);
            break;
        case iLONG:
        case iULONG:
            VWrite("%08x", ulVal);
            break;
        case iSTRING:
            VWrite("string#%x", ulVal);
            if (bStats && ulVal)
            {
                m_pTables->GetString(ulVal, &pString);
                cb = strlen(pString) + 1;
                VWrite("(%d)", cb);
            }
            break;
        case iGUID:
            VWrite("guid#%x", ulVal);
            if (bStats && ulVal)
            {
                VWrite("(16)");
            }
            break;
        case iBLOB:
            VWrite("blob#%x", ulVal);
            if (bStats && ulVal)
            {
                m_pTables->GetBlob(ulVal, &cb, &pBlob);
                cb += 1;
                if (cb > 128)
                    cb += 1;
                if (cb > 16535)
                    cb += 1;
                VWrite("(%d)", cb);
            }
            break;
        default:
            VWrite("unknown type 0x%04x", ulVal);
            break;
        }
    }
} // void MDInfo::DumpRawCol()

ULONG MDInfo::DumpRawColStats(ULONG ixTbl, ULONG ixCol, ULONG cRows)
{
    ULONG rslt = 0;
    ULONG       ulType;                 // Type of a column.
    ULONG       ulVal;                  // Value of a column.
    LPCUTF8     pString;                // Pointer to a string.
    const void  *pBlob;                 // Pointer to a blob.
    ULONG       cb;                     // Size of something.

    m_pTables->GetColumnInfo(ixTbl, ixCol, 0, 0, &ulType, 0);

    if (IsHeapType(ulType))
    {
        for (ULONG rid=1; rid<=cRows; ++rid)
        {
            m_pTables->GetColumn(ixTbl, ixCol, rid, &ulVal);
            // Fixed type.
            switch (ulType)
            {
            case iSTRING:
                if (ulVal)
                {
                    m_pTables->GetString(ulVal, &pString);
                    cb = strlen(pString);
                    rslt += cb + 1;
                }
                break;
            case iGUID:
                if (ulVal)
                    rslt += 16;
                break;
            case iBLOB:
                if (ulVal)
                {
                    m_pTables->GetBlob(ulVal, &cb, &pBlob);
                    rslt += cb + 1;
                    if (cb > 128)
                        rslt += 1;
                    if (cb > 16535)
                        rslt += 1;
                }
                break;
            default:
                break;
            }
        }
    }
    return rslt;
} // ULONG MDInfo::DumpRawColStats()

int MDInfo::DumpHex(
    const char  *szPrefix,              // String prefix for first line.
    const void  *pvData,                // The data to print.
    ULONG       cbData,                 // Bytes of data to print.
    int         bText,                  // If true, also dump text.
    ULONG       nLine)                  // Bytes per line to print.
{
    const BYTE  *pbData = static_cast<const BYTE*>(pvData);
    ULONG       i;                      // Loop control.
    ULONG       nPrint;                 // Number to print in an iteration.
    ULONG       nSpace;                 // Spacing calculations.
    ULONG       nPrefix;                // Size of the prefix.
    ULONG       nLines=0;               // Number of lines printed.
    const char  *pPrefix;               // For counting spaces in the prefix.

    // Round down to 8 characters.
    nLine = nLine & ~0x7;

    for (nPrefix=0, pPrefix=szPrefix; *pPrefix; ++pPrefix)
    {
        if (*pPrefix == '\t')
            nPrefix = (nPrefix + 8) & ~7;
        else
            ++nPrefix;
    }
    //nPrefix = strlen(szPrefix);
    do 
    {   // Write the line prefix.
        if (szPrefix)
            VWrite("%s:", szPrefix);
        else
            VWrite("%*s:", nPrefix, "");
        szPrefix = 0;
        ++nLines;

        // Calculate spacing.
        nPrint = min(cbData, nLine);
        nSpace = nLine - nPrint;

            // dump in hex.
        for(i=0; i<nPrint; i++)
            {
            if ((i&7) == 0)
                    Write(" ");
            VWrite("%02x ", pbData[i]);
            }
        if (bText)
        {
            // Space out to the text spot.
            if (nSpace)
                VWrite("%*s", nSpace*3+nSpace/8, "");
            // Dump in text.
            Write(">");
            for(i=0; i<nPrint; i++)
                VWrite("%c", (isprint(pbData[i])) ? pbData[i] : ' ');
            // Space out the text, and finish the line.
            VWrite("%*s<", nSpace, "");
        }
        VWriteLine("");

        // Next data to print.
        cbData -= nPrint;
        pbData += nPrint;
        }
    while (cbData > 0);

    return nLines;
} // int MDInfo::DumpHex()

void MDInfo::DumpRawHeaps()
{
    HRESULT     hr;                     // A result.
    ULONG       ulSize;                 // Bytes in a heap.
    const BYTE  *pData;                 // Pointer to a blob.
    ULONG       cbData;                 // Size of a blob.
    ULONG       oData;                  // Offset of current blob.
    char        rcPrefix[30];           // To format line prefix.

    m_pTables->GetBlobHeapSize(&ulSize);
    VWriteLine("");
    VWriteLine("Blob Heap:  %d(%#x) bytes", ulSize,ulSize);
    oData = 0;
    do 
    {
        m_pTables->GetBlob(oData, &cbData, (const void**)&pData);
        sprintf(rcPrefix, "%5x,%-2x", oData, cbData);
        DumpHex(rcPrefix, pData, cbData);
        hr = m_pTables->GetNextBlob(oData, &oData);
    }
    while (hr == S_OK);

    m_pTables->GetStringHeapSize(&ulSize);
    VWriteLine("");
    VWriteLine("String Heap:  %d(%#x) bytes", ulSize,ulSize);
    oData = 0;
    const char *pString;
    do 
    {
        m_pTables->GetString(oData, &pString);
        if (m_DumpFilter & dumpMoreHex)
        {
            sprintf(rcPrefix, "%08x", oData);
            DumpHex(rcPrefix, pString, strlen(pString)+1);
        }
        else
        if (*pString != 0)
            VWrite("%08x: %s\n", oData, pString);
        hr = m_pTables->GetNextString(oData, &oData);
    }
    while (hr == S_OK);
    VWriteLine("");
    
    DisplayUserStrings();

} // void MDInfo::DumpRawHeaps()


void MDInfo::DumpRaw(int iDump, bool bStats)
{
    ULONG       cTables;                // Tables in the database.
    ULONG       cCols;                  // Columns in a table.
    ULONG       cRows;                  // Rows in a table.
    ULONG       cbRow;                  // Bytes in a row of a table.
    ULONG       iKey;                   // Key column of a table.
    const char  *pNameTable;            // Name of a table.
    ULONG       oCol;                   // Offset of a column.
    ULONG       cbCol;                  // Size of a column.
    ULONG       ulType;                 // Type of a column.
    const char  *pNameColumn;           // Name of a column.
    ULONG       ulSize;

    m_pTables->GetNumTables(&cTables);

    m_pTables->GetStringHeapSize(&ulSize);
    VWrite("Strings: %d(%#x)", ulSize, ulSize);
    m_pTables->GetBlobHeapSize(&ulSize);
    VWrite(", Blobs: %d(%#x)", ulSize, ulSize);
    m_pTables->GetGuidHeapSize(&ulSize);
    VWrite(", Guids: %d(%#x)", ulSize, ulSize);
    m_pTables->GetUserStringHeapSize(&ulSize);
    VWriteLine(", User strings: %d(%#x)", ulSize, ulSize);

    for (ULONG ixTbl = 0; ixTbl < cTables; ++ixTbl)
    {
        m_pTables->GetTableInfo(ixTbl, &cbRow, &cRows, &cCols, &iKey, &pNameTable);

        if (cRows == 0 && iDump < 3)
            continue;

        if (iDump >= 2)
            VWriteLine("=================================================");
        VWriteLine("%2d: %-20s cRecs:%5d(%#x), cbRec:%3d(%#x), cbTable:%6d(%#x)",
            ixTbl, pNameTable, cRows, cRows, cbRow, cbRow, cbRow * cRows, cbRow * cRows);

        if (iDump < 2)
            continue;

        // Dump column definitions for the table.
        for (ULONG ixCol=0; ixCol<cCols; ++ixCol)
        {
            m_pTables->GetColumnInfo(ixTbl, ixCol, &oCol, &cbCol, &ulType, &pNameColumn);

            VWrite("  col %2x:%c %-12s oCol:%2x, cbCol:%x, %-7s",
                ixCol, ((ixCol==iKey)?'*':' '), pNameColumn, oCol, cbCol, DumpRawNameOfType(ulType));

            if (bStats)
            {
                ulSize = DumpRawColStats(ixTbl, ixCol, cRows);
                if (ulSize)
                    VWrite("(%d)", ulSize);
            }
            VWriteLine("");
        }

        if (iDump < 3) 
            continue;

        // Dump the rows.
        for (ULONG rid = 1; rid <= cRows; ++rid)
        {
            if (rid == 1)
                VWriteLine("-------------------------------------------------");
            VWrite(" %3x == ", rid);
            for (ixCol=0; ixCol < cCols; ++ixCol)
            {
                if (ixCol) VWrite(", ");
                VWrite("%d:", ixCol);
                DumpRawCol(ixTbl, ixCol, rid, bStats);
            }
            VWriteLine("");
        }
    }

    if (m_DumpFilter & dumpRawHeaps)
        DumpRawHeaps();

} // void MDInfo::DumpRaw()

void MDInfo::DumpRawCSV()
{
    ULONG       cTables;                // Tables in the database.
    ULONG       cCols;                  // Columns in a table.
    ULONG       cRows;                  // Rows in a table.
    ULONG       cbRow;                  // Bytes in a row of a table.
    const char  *pNameTable;            // Name of a table.
    ULONG       ulSize;

    m_pTables->GetNumTables(&cTables);

    VWriteLine("Name,Size,cRecs,cbRec");

    m_pTables->GetStringHeapSize(&ulSize);
    VWriteLine("Strings,%d", ulSize);

    m_pTables->GetBlobHeapSize(&ulSize);
    VWriteLine("Blobs,%d", ulSize);

    m_pTables->GetGuidHeapSize(&ulSize);
    VWriteLine("Guids,%d", ulSize);

    for (ULONG ixTbl = 0; ixTbl < cTables; ++ixTbl)
    {
        m_pTables->GetTableInfo(ixTbl, &cbRow, &cRows, &cCols, NULL, &pNameTable);
        VWriteLine("%s,%d,%d,%d", pNameTable, cbRow*cRows, cRows, cbRow);
    }

} // void MDInfo::DumpRawCSV()

/***********************************************************************/
static WCHAR* asStringW(CQuickBytes *out) 
{
	SIZE_T oldSize = out->Size();
	if (FAILED(out->ReSize(oldSize + 1)))
        return 0;
	WCHAR * cur = (WCHAR *) ((BYTE *) out->Ptr() + oldSize);
	*cur = 0;	
	return((WCHAR*) out->Ptr()); 
} // static WCHAR* asStringW()

static HRESULT appendStrW(CQuickBytes *out, const WCHAR* str) 
{
	SIZE_T len = wcslen(str) * sizeof(WCHAR); 
	SIZE_T oldSize = out->Size();
	if (FAILED(out->ReSize(oldSize + len)))
        return E_OUTOFMEMORY;
	WCHAR * cur = (WCHAR *) ((BYTE *) out->Ptr() + oldSize);
	memcpy(cur, str, len);	
		// Note no trailing null!	
    return S_OK;
} // static HRESULT appendStrW()

static HRESULT appendStrNumW(CQuickBytes *out, int num) 
{
	WCHAR buff[16];	
	swprintf(buff, L"%d", num);	
	return appendStrW(out, buff);	
} // static HRESULT appendStrNumW()

//*****************************************************************************
//*****************************************************************************
// pretty prints 'type' to the buffer 'out' returns a poitner to the next type, 
// or 0 on a format failure 

static PCCOR_SIGNATURE PrettyPrintType(
	PCCOR_SIGNATURE typePtr,			// type to convert, 	
	CQuickBytes *out,					// where to put the pretty printed string	
	IMetaDataImport *pIMDI)				// ptr to IMDInternal class with ComSig
{
	mdToken		tk;	
	const WCHAR	*str;	
	WCHAR rcname[MAX_CLASS_NAME];
	bool		isValueArray;
	HRESULT		hr;

	switch(*typePtr++) 
	{	
		case ELEMENT_TYPE_VOID			:	
			str = L"void"; goto APPEND;	
		case ELEMENT_TYPE_BOOLEAN		:	
			str = L"bool"; goto APPEND;	
		case ELEMENT_TYPE_CHAR			:	
			str = L"wchar"; goto APPEND; 
		case ELEMENT_TYPE_I1			:	
			str = L"int8"; goto APPEND;	
		case ELEMENT_TYPE_U1			:	
			str = L"unsigned int8"; goto APPEND; 
		case ELEMENT_TYPE_I2			:	
			str = L"int16"; goto APPEND; 
		case ELEMENT_TYPE_U2			:	
			str = L"unsigned int16"; goto APPEND;	
		case ELEMENT_TYPE_I4			:	
			str = L"int32"; goto APPEND; 
		case ELEMENT_TYPE_U4			:	
			str = L"unsigned int32"; goto APPEND;	
		case ELEMENT_TYPE_I8			:	
			str = L"int64"; goto APPEND; 
		case ELEMENT_TYPE_U8			:	
			str = L"unsigned int64"; goto APPEND;	
		case ELEMENT_TYPE_R4			:	
			str = L"float32"; goto APPEND;	
		case ELEMENT_TYPE_R8			:	
			str = L"float64"; goto APPEND;	
		case ELEMENT_TYPE_U 			:	
			str = L"unsigned int"; goto APPEND;	 
		case ELEMENT_TYPE_I 			:	
			str = L"int"; goto APPEND;	 
		case 0x1a /* obsolete */    	:	
			str = L"float"; goto APPEND;  
		case ELEMENT_TYPE_OBJECT		:	
			str = L"class System.Object"; goto APPEND;	 
		case ELEMENT_TYPE_STRING		:	
			str = L"class System.String"; goto APPEND;	 
		case ELEMENT_TYPE_TYPEDBYREF		:	
			str = L"refany"; goto APPEND;	
		APPEND: 
			appendStrW(out, str);	
			break;	

		case ELEMENT_TYPE_VALUETYPE	:	
			str = L"value class ";	
			goto DO_CLASS;	
		case ELEMENT_TYPE_CLASS 		:	
			str = L"class "; 
			goto DO_CLASS;	

		DO_CLASS:
			typePtr += CorSigUncompressToken(typePtr, &tk);
			appendStrW(out, str);	
			rcname[0] = 0;
			str = rcname;

			if (TypeFromToken(tk) == mdtTypeRef)
				hr = pIMDI->GetTypeRefProps(tk, 0, rcname, NumItems(rcname), 0);
			else if (TypeFromToken(tk) == mdtTypeDef)
			{
				hr = pIMDI->GetTypeDefProps(tk, rcname, NumItems(rcname), 0,
						0, 0);
			}
			else
			{
				_ASSERTE(!"Unknown token type encountered in signature.");
				str = L"<UNKNOWN>";
			}

			appendStrW(out, str);	
			break;	

		case ELEMENT_TYPE_SZARRAY	 :	 
			typePtr = PrettyPrintType(typePtr, out, pIMDI); 
			appendStrW(out, L"[]");
			break;
		case 0x17 /* obsolete */	:	
			isValueArray = true; goto DO_ARRAY;
		DO_ARRAY:
			{	
			typePtr = PrettyPrintType(typePtr, out, pIMDI); 
			unsigned bound = CorSigUncompressData(typePtr); 

			if (isValueArray)
				appendStrW(out, L" value");
				
			WCHAR buff[32];	
			swprintf(buff, L"[%d]", bound);	
			appendStrW(out, buff);	
			} break;	
		case 0x1e /* obsolete */		:
			typePtr = PrettyPrintType(typePtr, out, pIMDI); 
			appendStrW(out, L"[?]");
			break;
		case ELEMENT_TYPE_ARRAY		:	
			{	
			typePtr = PrettyPrintType(typePtr, out, pIMDI); 
			unsigned rank = CorSigUncompressData(typePtr);	
				// TODO what is the syntax for the rank 0 case? 
			if (rank == 0) 
			{
				appendStrW(out, L"[??]");
			}
			else 
			{
				_ASSERTE(rank != 0);	
				int* lowerBounds = (int*) _alloca(sizeof(int)*2*rank);	
				int* sizes		 = &lowerBounds[rank];	
				memset(lowerBounds, 0, sizeof(int)*2*rank); 
				
				unsigned numSizes = CorSigUncompressData(typePtr);	
				_ASSERTE(numSizes <= rank); 
				for(unsigned i =0; i < numSizes; i++)	
					sizes[i] = CorSigUncompressData(typePtr);	
				
				unsigned numLowBounds = CorSigUncompressData(typePtr);	
				_ASSERTE(numLowBounds <= rank); 
				for(i = 0; i < numLowBounds; i++)	
					lowerBounds[i] = CorSigUncompressData(typePtr); 
				
				appendStrW(out, L"[");	
				for(i = 0; i < rank; i++)	
				{	
					if (sizes[i] != 0 && lowerBounds[i] != 0)	
					{	
						if (lowerBounds[i] == 0)	
							appendStrNumW(out, sizes[i]);	
						else	
						{	
							appendStrNumW(out, lowerBounds[i]);	
							appendStrW(out, L"...");	
							if (sizes[i] != 0)	
								appendStrNumW(out, lowerBounds[i] + sizes[i] + 1);	
						}	
					}	
					if (i < rank-1) 
						appendStrW(out, L",");	
				}	
				appendStrW(out, L"]");  
			}
			} break;	

        case 0x13 /* obsolete */        :   
			appendStrW(out, L"!");  
			appendStrNumW(out, CorSigUncompressData(typePtr));
			break;
            // Modifiers or depedant types  
		case ELEMENT_TYPE_PINNED	:
			str = L" pinned"; goto MODIFIER;	
            str = L"*"; goto MODIFIER;   
        case ELEMENT_TYPE_BYREF         :   
            str = L"&"; goto MODIFIER;   
		MODIFIER:
			typePtr = PrettyPrintType(typePtr, out, pIMDI); 
			appendStrW(out, str);	
			break;	

		default:	
		case ELEMENT_TYPE_SENTINEL		:	
		case ELEMENT_TYPE_END			:	
			_ASSERTE(!"Unknown Type");	
			return(typePtr);	
			break;	
	}	
	return(typePtr);	
} // static PCCOR_SIGNATURE PrettyPrintType()

//*****************************************************************************
// Converts a com signature to a text signature.
//
// Note that this function DOES NULL terminate the result signature string.
//*****************************************************************************
LPCWSTR PrettyPrintSig(
	PCCOR_SIGNATURE typePtr,			// type to convert, 	
	unsigned	typeLen,				// length of type
	const WCHAR	*name,					// can be "", the name of the method for this sig	
	CQuickBytes *out,					// where to put the pretty printed string	
	IMetaDataImport *pIMDI) 			// Import api to use.
{
	out->ReSize(0); 
	unsigned numArgs;	
	PCCOR_SIGNATURE typeEnd = typePtr + typeLen;

	if (name != 0)						// 0 means a local var sig	
	{
			// get the calling convention out	
		unsigned callConv = CorSigUncompressData(typePtr);	

		if (isCallConv(callConv, IMAGE_CEE_CS_CALLCONV_FIELD))
		{
			PrettyPrintType(typePtr, out, pIMDI);	
			if (name != 0 && *name != 0)	
			{	
				appendStrW(out, L" ");	
				appendStrW(out, name);	
			}	
			return(asStringW(out));	
		}

		if (callConv & IMAGE_CEE_CS_CALLCONV_HASTHIS)	
			appendStrW(out, L"instance ");	

		static WCHAR* callConvNames[8] = 
		{	
			L"", 
			L"unmanaged cdecl ", 
			L"unmanaged stdcall ",	
			L"unmanaged thiscall ",	
			L"unmanaged fastcall ",	
			L"vararg ",	 
			L"<error> "	 
			L"<error> "	 
		};	
		appendStrW(out, callConvNames[callConv & 7]);	

		numArgs = CorSigUncompressData(typePtr);	
			// do return type	
		typePtr = PrettyPrintType(typePtr, out, pIMDI); 

	}
	else	
		numArgs = CorSigUncompressData(typePtr);	

	if (name != 0 && *name != 0)	
	{	
		appendStrW(out, L" ");	
		appendStrW(out, name);	
	}	
	appendStrW(out, L"(");	

	bool needComma = false;
	while(typePtr < typeEnd) 
	{
		if (*typePtr == ELEMENT_TYPE_SENTINEL) 
		{
			if (needComma)
				appendStrW(out, L",");	
			appendStrW(out, L"...");	  
			typePtr++;
		}
		else 
		{
			if (numArgs <= 0)
				break;
			if (needComma)
				appendStrW(out, L",");	
			typePtr = PrettyPrintType(typePtr, out, pIMDI); 
			--numArgs;	
		}
		needComma = true;
	}
	appendStrW(out, L")");	
	return (asStringW(out));	
} // LPCWSTR PrettyPrintSig()

