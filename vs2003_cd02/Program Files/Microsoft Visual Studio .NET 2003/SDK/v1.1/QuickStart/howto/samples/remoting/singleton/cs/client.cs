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
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Http;
using System.Runtime.Remoting.Channels.Tcp;

namespace RemotingSamples {
  public class Client {
    
    public bool init = false;
    public static Thread thread1 = null;
    public static Thread thread2 = null;
    
    public static int Main(string [] args)
    {
      Client c = new Client();  
      thread1 = new Thread(new ThreadStart(c.RunMe));
      thread2 = new Thread(new ThreadStart(c.RunMe)); 
      thread1.Start();
      thread2.Start();
      return 0;
    } 
    
    
    public void RunMe()
    {
      if (Thread.CurrentThread == thread1) {
        HttpChannel chan = new HttpChannel();
        ChannelServices.RegisterChannel(chan);
        Console.WriteLine("I am thread one");
        HelloServer obj = (HelloServer)Activator.GetObject(typeof(HelloServer), "http://localhost:8086/SayHello");
        for (int i = 0; i < 1000; i++) {
          Console.WriteLine(obj.CountMe() + " - from thread 1 "); 
          Thread.Sleep(0);
        }  
      }  
      else if (Thread.CurrentThread == thread2) {
        TcpChannel chan = new TcpChannel();
        ChannelServices.RegisterChannel(chan);
        Console.WriteLine("I am thread two");
        HelloServer obj = (HelloServer)Activator.GetObject(typeof(HelloServer), "tcp://localhost:8085/SayHello");
        for (int i = 0; i < 1000; i++) {
          Console.WriteLine(obj.CountMe() + " - from thread 2 "); 
          Thread.Sleep(0);
        }  
      }  
    }
  }
}
