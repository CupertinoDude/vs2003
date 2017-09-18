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

namespace RemotingSamples {
  public class Client
  {
    public static int Main(string [] args)
    {
      TcpChannel chan = new TcpChannel();
      ChannelServices.RegisterChannel(chan);
      ForwardMe param = new ForwardMe();
      HelloServer obj = (HelloServer)Activator.GetObject(typeof(RemotingSamples.HelloServer), "tcp://localhost:8085/SayHello");
      if (obj == null) System.Console.WriteLine("Could not locate server");
      else {
        Console.WriteLine("The value is {0}", param.getValue());
        ForwardMe after = obj.HelloMethod(param);
        Console.WriteLine("The value after the call is {0}", after.getValue());
      }
      return 0;
    }
  }
}
