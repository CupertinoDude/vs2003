/*=====================================================================

  File:      FooHost.cs

---------------------------------------------------------------------
This file is part of the Microsoft .NET Framework SDK Code Samples.

  Copyright (C) Microsoft Corporation.  All rights reserved.

This source code is intended only as a supplement to Microsoft
Development Tools and/or on-line documentation.  See these other
materials for detailed information regarding Microsoft code samples.
 
THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
PARTICULAR PURPOSE.
=====================================================================*/

using System;
using System.Globalization;
using System.IO;
using System.Runtime.Remoting;

public class MyHost
{
    public static void Main(string[] args)
    {
        int ret = Initialize(args);
        if (ret != 0)
            return;

        Console.WriteLine("MyHost is ready to process remote messages.");

        String keyState = "";
        while (String.Compare(keyState,"0", true,CultureInfo.InvariantCulture) != 0)
        {
            Console.WriteLine("Press a key and ENTER: G=GC.Collect, 0=Exit");
            keyState = Console.ReadLine();

            Console.WriteLine("Pressed: " + keyState);

            // Force a GC
            if (String.Compare(keyState,"G", true,CultureInfo.InvariantCulture) == 0)
            {
                Console.WriteLine("GC Collect - start");
                GC.Collect();
                GC.WaitForPendingFinalizers();
                Console.WriteLine("GC Collect - done");
            }
        }
    }

    public static int Initialize(String[] args)
    {
        if (args.Length == 0)
        {
            Usage();
            return -1;
        }

        for (int i=0;i<args.Length;i++)
        {
            if (
               String.Compare(args[i],"HELP", true,CultureInfo.InvariantCulture) == 0 ||
               String.Compare(args[i],"?", true,CultureInfo.InvariantCulture) == 0 ||
               String.Compare(args[i],"/h", true,CultureInfo.InvariantCulture) == 0 ||
               String.Compare(args[i],"-h", true,CultureInfo.InvariantCulture) == 0 ||
               String.Compare(args[i],"-?", true,CultureInfo.InvariantCulture) == 0 ||
               String.Compare(args[i],"/?", true,CultureInfo.InvariantCulture) == 0
               )
            {
                Usage();
                return -1;
            }

            // Load Configuration
            if (String.Compare(args[i],"-cfg",true,CultureInfo.InvariantCulture)==0)
            {
                RemotingConfiguration.Configure(args[i+1]);
            }
        }

        return 0;
    }

    public static void Usage()
    {
        Console.WriteLine("Usage: FooHost [-cfg ConfigFileName.config]\n");
        Console.WriteLine("Examples : FooHost -cfg FooHost.exe.config");
    }
}



