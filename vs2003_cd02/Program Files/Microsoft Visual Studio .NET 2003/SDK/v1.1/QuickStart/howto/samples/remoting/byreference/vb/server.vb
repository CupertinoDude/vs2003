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
Imports System.Collections
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Channels
Imports System.Runtime.Remoting.Channels.TCP
Imports System.Runtime.Serialization.Formatters.Binary
Imports System.Runtime.Serialization.Formatters

Namespace RemotingSamples
    Public Class Sample
        Shared Sub Main
 
            ' creating a custom formatter for your TcpChannel sink chain.
            Dim provider As New BinaryServerFormatterSinkProvider()
            provider.TypeFilterLevel = TypeFilterLevel.Full

            ' creating the dictionary to set the port on the channel instance.
            Dim props As New Hashtable()
            props("port") = 8085

            ' pass the props for the port setting and the server provider in the server chain argument. (Client remains null (Nothing) here.)
            Dim chan As New TcpChannel(props, Nothing, provider)
            ChannelServices.RegisterChannel(chan)
            RemotingConfiguration.RegisterWellKnownServiceType(Type.GetType("RemotingSamples.HelloServer,Share"), "SayHello", WellKnownObjectMode.SingleCall)

            System.Console.WriteLine("Hit <enter> to exit...")
            System.Console.ReadLine()

        End Sub
    End Class
End Namespace
