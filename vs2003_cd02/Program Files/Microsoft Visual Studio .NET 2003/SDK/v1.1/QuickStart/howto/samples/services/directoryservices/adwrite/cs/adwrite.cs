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
using System.DirectoryServices;

public class ADWrite {
    public static void Main(String[] args) {
        if ( args.Length!=3 ) {
            Console.WriteLine("Usage: " + Environment.GetCommandLineArgs()[0] + " <ad_path> <property> <value>");
            Console.WriteLine ();
            Console.WriteLine ("Press Enter to continue...");
            Console.ReadLine();
            return;
        }

        DirectoryEntry objDirEnt = new DirectoryEntry(args[0]);
        Console.WriteLine("Name            = " + objDirEnt.Name);
        Console.WriteLine("Path            = " + objDirEnt.Path);
        Console.WriteLine("SchemaClassName = " + objDirEnt.SchemaClassName);
        Console.WriteLine(args[1] + " = " + (objDirEnt.Properties[args[1]][0]).ToString());
        Console.WriteLine("... changing to ");
        (objDirEnt.Properties[args[1]])[0] = args[2];
        objDirEnt.CommitChanges();
        Console.WriteLine(args[1] + " = " + (objDirEnt.Properties[args[1]][0]).ToString());
    }
}