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

Imports System
Imports System.Threading
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Messaging
Imports System.Runtime.Remoting.Channels
Imports System.Runtime.Remoting.Channels.TCP

Namespace RemotingSamples

  Public Class Client

    public shared e as ManualResetEvent
    public delegate function MyDelegate(name as String) as String

    Shared Sub Main
      e = new ManualResetEvent(false)

      dim chan as TCPChannel
      chan = new TCPChannel()
      ChannelServices.RegisterChannel(chan)
      dim obj as HelloServer
      obj = ctype(Activator.GetObject(Type.GetType("RemotingSamples.HelloServer,Object"), "tcp://localhost:8085/SayHello"),HelloServer)
      if obj is nothing then
          System.Console.WriteLine("Could not locate server")
      Else
          dim cb as AsyncCallback
	      cb = new AsyncCallback(AddressOf Client.MyCallBack)
          dim d as MyDelegate
	      d = new MyDelegate(AddressOf obj.HelloMethod)
          dim ar as IAsyncResult
          ar = d.BeginInvoke("Caveman", cb, 0)
      End If

      e.WaitOne()
    end sub


    shared sub MyCallBack(ar as IAsyncResult)
      Dim d As MyDelegate = CType(ar, AsyncResult).AsyncDelegate
      Console.WriteLine(d.EndInvoke(ar))
      e.Set()
    end sub

  end class

end namespace
