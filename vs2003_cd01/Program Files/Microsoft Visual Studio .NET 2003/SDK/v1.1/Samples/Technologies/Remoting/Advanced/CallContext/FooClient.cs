/*=====================================================================

  File:      FooClient.cs

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
using System.Reflection;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Messaging;
using FooAssembly;

public class Client
{
    public static int Main(string[] args)
    {
        Console.WriteLine("CallContext Remoting Sample\n");
        int ret = Initialize(args);

        if (ret != -1)
        {
            switch (scenario)
            {
            case 1: 
                Scenario1();
                break;
            }
        }

        Console.WriteLine("\nEnd\n");

        return ret;
    }

    public static void Scenario1()
    {
        SimpleObject so = new SimpleObject();

        CallContext.SetData("USER", new CallContextString("billg"));

        CallContextString str = (CallContextString) CallContext.GetData("USER");

	if (null == str)
          Console.WriteLine("USER is null");
        else
          Console.WriteLine("USER is '{0}'", str);

        String result;

        result = so.DoWork();
        Console.WriteLine("The returned String is '{0}'", result);
/*
        ValueObject v = new ValueObject();
        result = so.DoValueWork(v);
        Console.WriteLine("The returned String is '{0}'", result);
*/
    }

    //---------------------------------------------------
    public static int scenario = 1;

    public static int Initialize(String[] args)
    {
        if (args.Length == 0)
        {
            RemotingConfiguration.Configure("FooClient.exe.config");
            return 0;
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

            if (String.Compare(args[i],"-s1",true,CultureInfo.InvariantCulture)==0)
            {
                scenario = 1;
            }

            if (String.Compare(args[i],"-cfg",true,CultureInfo.InvariantCulture)==0)
            {
                RemotingConfiguration.Configure(args[i+1]);
            }
        }

        return 0;
    }

    public static void Usage()
    {
        Console.WriteLine("Usage: FooClient [-cfg Configfile.config]\n");
        Console.WriteLine("Examples : FooClient -cfg FooClient.exe.config");
    }
}

