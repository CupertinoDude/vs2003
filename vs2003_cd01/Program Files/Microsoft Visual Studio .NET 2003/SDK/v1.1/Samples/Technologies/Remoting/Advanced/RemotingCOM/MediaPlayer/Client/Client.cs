/*=====================================================================

  File:      Client.cs

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
using System.IO;
using System.Runtime.Remoting;
using Homenet;
using System.Threading;

public class MyRemoteControl
{

    public static ManualResetEvent Done = new ManualResetEvent(false);

    public static void Main(String[] args)
    {
        int ret = Initialize(args);
        Console.WriteLine("MyRemoteControl Sample\n");

        if (ret != -1)
        {
            RemoteControl remoteControl = new RemoteControl();
      remoteControl.Scenario2();

            NullRemoteControl(out remoteControl);

            Console.WriteLine("\nEnd\n");
        }
    }

    private static void NullRemoteControl(out RemoteControl rc)
    {
        rc = null;
    }



    //---------------------------------------------------
    public static int scenario = 1;

    public static int Initialize(String[] args)
    {
        if (args.Length == 0)
        {
            RemotingConfiguration.Configure("Client.exe.config");
            return 0;
        }


        for (int i=0;i<args.Length;i++)
        {
            if (
               String.Compare(args[i],"HELP", true) == 0 ||
               String.Compare(args[i],"?", true) == 0 ||
               String.Compare(args[i],"/h", true) == 0 ||
               String.Compare(args[i],"-h", true) == 0 ||
               String.Compare(args[i],"-?", true) == 0 ||
               String.Compare(args[i],"/?", true) == 0
               )
            {
                Usage();
                return -1;
            }

            if (args[i].CompareTo("-cfg")==0)
            {
                RemotingConfiguration.Configure(args[i+1]);
            }
        }

        return 0;
    }

    public static void Usage()
    {
        Console.WriteLine("Usage: Client [-cfg Configfile.config]\n");
        Console.WriteLine("Examples : Client -cfg Client.exe.config");
    }
}

//public class RemoteControl : MarshalByRefObject, IMediaStatus
public class RemoteControl : BaseRemoteControl
{

    public bool Scenario2()
    {
        bool ret=true;
        Console.WriteLine("Scenario 2");
        Console.WriteLine("new VCR()");
        VCR vcr = new VCR();

        String title = "file:" + Directory.GetCurrentDirectory() + "\\clock.avi";

        String keyState = "";
        while (String.Compare(keyState,"0", true) != 0)
        {
            Console.WriteLine("Press PT=Play Title, P=Play, A=Pause, S=Stop,0=Exit");
            keyState = Console.ReadLine();

            Console.WriteLine("Pressed: " + keyState);

            if (String.Compare(keyState,"PT", true) == 0)
            {
                ret = vcr.Play(title);
            }

            if (String.Compare(keyState,"P", true) == 0)
                vcr.PlaySimple();

            if (String.Compare(keyState,"A", true) == 0)
                vcr.Pause();

            if (String.Compare(keyState,"S", true) == 0)
                vcr.Stop();
        }

        return ret;
    }

    public override bool StatusUpdate(String title)
    {
        Console.WriteLine("StatusUpdate: " + title);
        return true;
    }
    

    ~RemoteControl()
    {
      MyRemoteControl.Done.Set();
    }
}



