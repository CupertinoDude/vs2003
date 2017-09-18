//-----------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
// 
//THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//-----------------------------------------------------------------------



    using System;
    using System.Runtime.InteropServices;

    /// <summary>
    ///    Summary description for PlatformInvokeKernel32.
    /// </summary>
    // <doc>
    // <desc>
    //        Declare native function to determine drive type
    // </desc>
    // </doc>
    //
    public class PlatformInvokeKernel32 
    {   
        [DllImport("KERNEL32", CharSet=System.Runtime.InteropServices.CharSet.Auto)]
        public static extern int GetDriveType(string lpRootPathName);  

        public const int DRIVE_FIXED = 3;
    }
