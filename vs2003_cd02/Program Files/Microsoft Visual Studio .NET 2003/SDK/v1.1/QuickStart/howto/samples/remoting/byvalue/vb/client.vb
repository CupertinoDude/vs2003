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
imports System.Runtime.Remoting
imports System.Runtime.Remoting.Channels
imports System.Runtime.Remoting.Channels.TCP

namespace RemotingSamples

  public class Client

    shared sub main
      Dim Chan As New TCPChannel()
      ChannelServices.RegisterChannel(chan)
      Dim Param As New ForwardMe()
      Dim obj as HelloServer
      obj = ctype(Activator.GetObject(Type.GetType("RemotingSamples.HelloServer,Share"), "tcp://localhost:8085/SayHello"),HelloServer)
      If obj Is Nothing
          System.Console.WriteLine("Could not locate server")
      Else
          Console.WriteLine("The value is {0}", param.getValue().ToString())
          dim after as ForwardMe
	      after = obj.HelloMethod(param)
          Console.WriteLine("The value after the call is {0}", after.getValue().ToString())
      End If

    end sub

  end class

end namespace
