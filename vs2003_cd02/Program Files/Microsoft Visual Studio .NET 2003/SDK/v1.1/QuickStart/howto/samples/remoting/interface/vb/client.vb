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
      dim chan as TCPChannel
      chan = new TCPChannel()
      ChannelServices.RegisterChannel(chan)
      dim obj as IHello
      obj = ctype(Activator.GetObject(Type.GetType("RemotingSamples.IHello,share"), "tcp://localhost:8085/SayHello"),IHello)
      if obj is nothing
          System.Console.WriteLine("Could not locate server")
        else
	  Console.WriteLine(obj.HelloMethod("Caveman"))
      end if

    end sub

  end class

end namespace
