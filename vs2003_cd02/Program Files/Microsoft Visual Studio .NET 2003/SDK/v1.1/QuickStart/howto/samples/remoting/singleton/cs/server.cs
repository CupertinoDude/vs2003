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
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Tcp;
using System.Runtime.Remoting.Channels.Http;

namespace RemotingSamples {
  public class Sample {

    public static int Main(string [] args) {

      TcpChannel chan1 = new TcpChannel(8085);
      HttpChannel chan2 = new HttpChannel(8086);
      ChannelServices.RegisterChannel(chan1);
      ChannelServices.RegisterChannel(chan2);
      RemotingConfiguration.RegisterWellKnownServiceType(typeof(HelloServer), "SayHello", WellKnownObjectMode.Singleton);
      System.Console.WriteLine("Hit <enter> to exit...");
      System.Console.ReadLine();
      return 0;
    }
  }
}
