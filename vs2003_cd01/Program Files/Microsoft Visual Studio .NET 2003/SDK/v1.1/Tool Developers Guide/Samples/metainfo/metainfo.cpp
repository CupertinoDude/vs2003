//*****************************************************************************
// File: metainfo.cpp
//
// Copyright (c) Microsoft Corporation.  All Rights Reserved.
//*****************************************************************************
#include <stdio.h>
#include <ctype.h>
#include <crtdbg.h>
#include "mdinfo.h"

#include "corver.h"

// Global variables
bool g_bSchema = false; 
bool g_bRaw = false;
bool g_bDebug = false;
bool g_bHeader = false;

// Validator module type.
DWORD g_ValModuleType = ValidatorModuleTypeInvalid;

IMetaDataImport *g_pImport = NULL;
IMetaDataDispenserEx *g_pDisp = NULL;

void DisplayFile(wchar_t* szFile, BOOL isFile, ULONG DumpFilter, wchar_t* szObjFile, strPassBackFn pDisplayString);
void DisplayArchive(wchar_t* szFile, ULONG DumpFilter, wchar_t* szObjName, strPassBackFn pDisplayString);

void PrintLogo()
{
    printf("Microsoft (R) Common Language Runtime Meta Data Dump Utility   Version 1.0\n");
    wprintf(VER_LEGALCOPYRIGHT_DOS_STR);
    printf("\n");
}// PrintLogo

void Usage()
{
    printf("\n");
    printf("metainfo [-? | -header | -schema | -raw | -validate] [-nologo] [-obj <obj file name>] [<filname> | <file pattern>]\n");
    printf("    -?       Displays this text.\n");
    printf("    -hex     Prints more things in hex as well as words.\n");
    printf("    -header  Prints MetaData header information and sizes.\n");
    printf("    -csv     Prints the header sizes in Comma Separated format.\n");
    printf("    -unsat   Prints unresolved externals.\n");
    printf("    -assem   Prints only the Assembly information.\n");
    printf("    -schema  Prints the MetaData schema information.\n");
    printf("    -raw     Prints the raw MetaData tables.\n");
    printf("    -heaps   Prints the raw heaps (only if -raw).\n");
    printf("    -validate Validate the consistency of the metadata.\n");
    printf("    -nologo  Do not display the logo and MVID.\n");
    printf("    -obj <objFileName>\n");
    printf("             Prints the MetaData for the specified obj file in the given \n");
    printf("             archive(.lib) - e.g metainfo libc.lib -obj wMSILWinCRTStartup.obj\n");

    MDInfo::Error("");
}

void DisplayString(char *str)
{
    printf("%s", str);
}

extern "C" int _cdecl wmain(int argc, WCHAR *argv[])
{
    wchar_t *pArg = NULL;
    wchar_t *szObjName = NULL;
    ULONG DumpFilter = MDInfo::dumpDefault;
    HRESULT hr = 0;
    BOOL    fWantHelp=FALSE;
    
    // Validate incoming arguments
    for (int i=1;  i<argc;  i++)
    {
        const wchar_t *szArg = argv[i];
        if (*szArg == L'-' || *szArg == L'/')
        {
            if (_wcsicmp(szArg + 1, L"?") == 0)
                fWantHelp=TRUE;

            else if (_wcsicmp(szArg + 1, L"nologo") == 0)
                DumpFilter |= MDInfo::dumpNoLogo;

            else if (_wcsicmp(szArg + 1, L"Hex") == 0)
                DumpFilter |= MDInfo::dumpMoreHex;

            else if (_wcsicmp(szArg + 1, L"header") == 0)
                DumpFilter |= MDInfo::dumpHeader;

            else if (_wcsicmp(szArg + 1, L"csv") == 0)
                DumpFilter |= MDInfo::dumpCSV;

            else if (_wcsicmp(szArg + 1, L"raw") == 0)
                DumpFilter |= MDInfo::dumpRaw;

            else if (_wcsicmp(szArg + 1, L"heaps") == 0)
                DumpFilter |= MDInfo::dumpRawHeaps;

            else if (_wcsicmp(szArg + 1, L"schema") == 0)
                DumpFilter |= MDInfo::dumpSchema;

            else if (_wcsicmp(szArg + 1, L"unsat") == 0)
                DumpFilter |= MDInfo::dumpUnsat;

            else if (_wcsicmp(szArg + 1, L"stats") == 0)
                DumpFilter |= MDInfo::dumpStats;

            else if (_wcsicmp(szArg + 1, L"assem") == 0)
                DumpFilter |= MDInfo::dumpAssem;

            else if (_wcsicmp(szArg + 1, L"validate") == 0)
                DumpFilter |= MDInfo::dumpValidate;

            else if (_wcsicmp(szArg + 1, L"obj") == 0)
            {
                if (++i == argc)
                    Usage();
                else
                    szObjName = argv[i];
            }
        }
        else
            pArg = argv[i];
    }

    // Print banner.
    if (!(DumpFilter & MDInfo::dumpNoLogo))
        PrintLogo();


    if (!pArg || fWantHelp)
        Usage();

    
    // Init and run.
    CoInitialize(0);    

    hr = CoCreateInstance(CLSID_CorMetaDataDispenser, NULL, CLSCTX_INPROC_SERVER, 
                  IID_IMetaDataDispenserEx, (void **) &g_pDisp);
    if(FAILED(hr)) MDInfo::Error("Unable to CoCreate Meta-data Dispenser", hr);

    // Loop through all files in the file pattern passed
    WIN32_FIND_DATA fdFiles;
    HANDLE hFind;
    wchar_t szSpec[_MAX_PATH];
    wchar_t szDrive[_MAX_DRIVE];
    wchar_t szDir[_MAX_DIR];

    hFind = FindFirstFileW(pArg, &fdFiles);

    if (hFind == INVALID_HANDLE_VALUE)
    {
        DisplayFile(pArg, false, DumpFilter, szObjName, DisplayString);
    }
    else
    {
        // Convert relative paths to full paths.
        LPWSTR szFname;
        GetFullPathNameW(pArg, _MAX_PATH, szSpec, &szFname);
        _wsplitpath(szSpec, szDrive, szDir, NULL, NULL);
        do
        {
            _wmakepath(szSpec, szDrive, szDir, fdFiles.cFileName, NULL);
            // display the meta data of the file
            DisplayFile(szSpec, true, DumpFilter, szObjName, DisplayString);
        } while (FindNextFileW(hFind, &fdFiles)) ;
        FindClose(hFind);
    }
    g_pDisp->Release();
    CoUninitialize();
    return 0;
}
