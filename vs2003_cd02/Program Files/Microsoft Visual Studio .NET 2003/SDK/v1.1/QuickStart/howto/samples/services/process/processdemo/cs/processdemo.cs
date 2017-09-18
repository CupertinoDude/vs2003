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
using System.Diagnostics;
using System.Threading;

public class ProcessDemo
{
    public static void Main(String[] args) 
    {
        string appName = Environment.GetCommandLineArgs()[0];
        
        if(args.Length != 1)
        {
            Console.WriteLine("Usage: " + appName +" <executable>");
            return;
        }
        string executableFilename = args[0];
        
        Process process = new Process();
        process.StartInfo.FileName = executableFilename;
        process.Start();
        
        process.WaitForInputIdle();
        
        Thread.Sleep(1000);
        if(!process.CloseMainWindow())
        {
            process.Kill();
        }
    }
}

