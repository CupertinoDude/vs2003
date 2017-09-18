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
using System.Threading;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Messaging;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Tcp;

namespace RemotingSamples {
  public class Client {

    public static ManualResetEvent e;
    public delegate String MyDelegate(String name);

    public static int Main(string [] args)
    {
      e = new ManualResetEvent(false);

      TcpChannel chan = new TcpChannel();
      ChannelServices.RegisterChannel(chan);
      HelloServer obj = (HelloServer)Activator.GetObject(typeof(RemotingSamples.HelloServer), "tcp://localhost:8085/SayHello");
      if (obj == null) System.Console.WriteLine("Could not locate server");
      else {
        AsyncCallback cb = new AsyncCallback(Client.MyCallBack);
        MyDelegate d = new MyDelegate(obj.HelloMethod);
        IAsyncResult ar = d.BeginInvoke("Caveman", cb, null);
      }

      e.WaitOne();
      return 0;
    }


    public static void MyCallBack(IAsyncResult ar)
    {
      MyDelegate d = (MyDelegate)((AsyncResult)ar).AsyncDelegate;
      Console.WriteLine(d.EndInvoke(ar));
      e.Set();
    }
  }
}
