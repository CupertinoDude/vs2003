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

  public class Sample

    shared sub main
      dim chan as TCPChannel
      chan = new TCPChannel(8085)
      ChannelServices.RegisterChannel(chan)
      RemotingConfiguration.RegisterWellKnownServiceType(Type.GetType("RemotingSamples.HelloServer,share"), "SayHello", WellKnownObjectMode.SingleCall)
      System.Console.WriteLine("Hit <enter> to exit...")
      System.Console.ReadLine()
    end sub

  end class

end namespace
