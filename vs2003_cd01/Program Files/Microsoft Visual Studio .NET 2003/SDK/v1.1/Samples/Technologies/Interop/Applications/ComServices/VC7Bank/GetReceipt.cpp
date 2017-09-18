// ==============================================================================
// Filename: GetReceipt.h
//
// Summary:  managed cpp definition of the GetReceipt class for the bank sample
// Classes:  GetReceipt.cs
//
// This file is part of the Microsoft COM+ Samples
//
// Copyright (C) Microsoft Corporation. All rights reserved
//
// This source code is intended only as a supplement to Microsoft
// Development Tools and/or on-line documentation.  See these other
// materials for detailed information reagrding Microsoft code samples.
//
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
// KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
// PARTICULAR PURPOSE.
//


// import mscorlib definitions
#using "mscorlib.dll"
using namespace System;

// import definitions for EnterpriseServices support
#using "System.EnterpriseServices.dll"
using namespace System::EnterpriseServices;
using namespace System::Runtime::InteropServices;


//import definitions for ADO
#using "adodb.dll"
using namespace ADODB;

// import definition for account typelibrary
#using "AccountComLib.dll"
using namespace AccountComLib;

#define null 0

#include "getreceipt.h"
#include "updatereceipt.h"

namespace VC7Bank
{
    int GetReceipt::GetNextReceipt ()
    {

        bool bSuccess = false;
        int result;

        // First of all, get the object context
        try
        {
            // Call the true function
            result = trueGetNextReceipt ();
            bSuccess = true;
            return result;
        }

        // Upon exit, always call SetComplete if happy, or SetAbort if unhappy.
        // We do this because we never save state across method calls.
        __finally
        {
            if (bSuccess)
                ContextUtil::SetComplete();
            else
                ContextUtil::SetAbort();
        }
    }


    // F+F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++
    //
    // Function: trueGetNextReceipt
    //
    // trueGetNextReceipt() is the function that performs the actual work for the Account class.
    // If an error occurs during execution, it will throw a COMException for GetNextReceipt()
    // to handle.
    //
    // Args:     None
    // Returns:  Long -  next receipt value
    //
    // F-F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---


    // trueGetNextReceipt using COM+ Shared Properties:
    int GetReceipt::trueGetNextReceipt ()
    {
        SharedPropertyGroupManager* spmMgr = null;
        SharedPropertyGroup* spmGroup = null;
        SharedProperty* spmPropNextReceipt = null;
        SharedProperty* spmPropMaxNum = null;
        IUpdateReceipt* objReceiptUpdate = null;

        try
        {
            // Create SPM group manager
            spmMgr = new SharedPropertyGroupManager();

            bool bExists = false;
            PropertyLockMode iLockMode;  //= new int [1];
            PropertyReleaseMode iReleaseMode;//  = new int [1];

            //iLockMode [0] = ISharedPropertyGroupManager.LOCKMODE_METHOD;
            iLockMode  = PropertyLockMode::Method;
            //iReleaseMode [0] = ISharedPropertyGroupManager.RELEASEMODE_PROCESS;
            iReleaseMode  = PropertyReleaseMode::Process;

            // Create the shared property group
            spmGroup = spmMgr->CreatePropertyGroup (S"Receipt", &iLockMode, &iReleaseMode, &bExists);

            // Create the properties
            spmPropNextReceipt = spmGroup->CreateProperty(S"Next", &bExists);
            spmPropMaxNum = spmGroup->CreateProperty(S"MaxNum", &bExists);

            // Call GetNextReceipt() if necessary
            int iPropNextReceipt = *dynamic_cast<Int32*>(spmPropNextReceipt->Value);
            int iPropMaxNum = *dynamic_cast<Int32*>(spmPropMaxNum->Value); 
            if( iPropNextReceipt >= iPropMaxNum)
            {

				objReceiptUpdate = dynamic_cast<IUpdateReceipt __gc *>(new UpdateReceipt());
                int iRet = objReceiptUpdate->Update ();
                spmPropNextReceipt->Value = __box(iRet);
                spmPropMaxNum->Value = __box(iRet + 100);
            }

            int vfoo = *dynamic_cast<Int32*>(spmPropNextReceipt->Value) + 1;
            spmPropNextReceipt->Value = __box(vfoo);

            // We are finished and happy
            return (int)*dynamic_cast<Int32*>(spmPropNextReceipt->Value);
        }

        __finally
        {
        }
    }
}