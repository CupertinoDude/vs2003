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
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Channels
Imports System.Runtime.Remoting.Channels.Tcp

Namespace RemotingSamples
  Public Class Sample

    Shared Sub Main

      Dim chan As New TcpChannel(8085)
      ChannelServices.RegisterChannel(chan)
      RemotingConfiguration.RegisterWellKnownServiceType(Type.GetType("RemotingSamples.HelloServer,Share"), "SayHello", WellKnownObjectMode.SingleCall)
      System.Console.WriteLine("Hit <enter> to exit...")
      System.Console.ReadLine()
    End Sub
  End Class
End Namespace
