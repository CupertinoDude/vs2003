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
using System.Collections;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Tcp;
using System.Runtime.Serialization.Formatters.Binary;
using System.Runtime.Serialization.Formatters;
 
namespace RemotingSamples {
  public class Sample {
    public static int Main(string [] args) {
 
      // creating a custom formatter for your TcpChannel sink chain.
      BinaryServerFormatterSinkProvider provider = new BinaryServerFormatterSinkProvider();
      provider.TypeFilterLevel = TypeFilterLevel.Full;

      // creating the dictionary to set the port on the channel instance.
      IDictionary props = new Hashtable();
      props["port"] = 8085;

      // pass the props for the port setting and the server provider in the server chain argument. (Client remains null here.)
      TcpChannel chan = new TcpChannel(props, null, provider);
      ChannelServices.RegisterChannel(chan);
      RemotingConfiguration.RegisterWellKnownServiceType(Type.GetType("RemotingSamples.HelloServer,Share"), "SayHello", WellKnownObjectMode.SingleCall);

      System.Console.WriteLine("Hit <enter> to exit...");
      System.Console.ReadLine();
      return 0;
    }
  }
}

