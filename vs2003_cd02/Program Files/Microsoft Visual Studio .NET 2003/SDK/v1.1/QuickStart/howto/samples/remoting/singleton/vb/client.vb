'-----------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
' 
'  Copyright (C) Microsoft Corporation.  All rights reserved.
' 
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
' 
'THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'-----------------------------------------------------------------------

imports System
imports System.Threading
imports System.Runtime.Remoting
imports System.Runtime.Remoting.Channels
imports System.Runtime.Remoting.Channels.HTTP
imports System.Runtime.Remoting.Channels.TCP

namespace RemotingSamples

  public class Client

    dim init as boolean = false
    public shared thread1 as Thread
    public shared thread2 as Thread

    shared sub main
      dim c as Client
      c = new Client()
      thread1 = new Thread(new ThreadStart(AddressOf c.RunMe))
      thread2 = new Thread(new ThreadStart(AddressOf c.RunMe))
      thread1.Start()
      thread2.Start()
    end sub


    public sub RunMe()
      if Thread.CurrentThread Is thread1 then
        dim chan as HTTPChannel
	    chan = new HTTPChannel()
        ChannelServices.RegisterChannel(chan)
        Console.WriteLine("I am thread one")
        dim obj as HelloServer
	    obj = ctype(Activator.GetObject(Type.GetType("RemotingSamples.HelloServer,object"), "http://localhost:8086/SayHello"),HelloServer)
        dim i as integer
        for i = 0 to 1000
          Console.WriteLine(obj.CountMe().ToString() & " - from thread 1 ")
          Thread.Sleep(0)
        next i
      else if Thread.CurrentThread Is thread2 then
        dim chan as TCPChannel
	    chan = new TCPChannel()
        ChannelServices.RegisterChannel(chan)
        Console.WriteLine("I am thread two")
        dim obj as HelloServer
	    obj = ctype(Activator.GetObject(Type.GetType("RemotingSamples.HelloServer,object"), "tcp://localhost:8085/SayHello"),HelloServer)
	    dim i as integer
        for i = 0 to 1000
          Console.WriteLine(obj.CountMe().ToString() & " - from thread 2 ")
          Thread.Sleep(0)
        next i
      end if
    end sub

  end class

end namespace
