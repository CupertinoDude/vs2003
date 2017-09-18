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
Imports System.IO
Imports System.Net
Imports System.Net.Sockets
Imports System.Text

Public Class Client

    Public Shared Sub Main()
        Dim tcpc As New TCPClient()
        Dim read(35) As Byte
        Dim args As String() = Environment.GetCommandLineArgs()

        If (args.Length < 2) Then
            Console.WriteLine("Please specify a server name in the command line")
            Exit Sub
        End If

        Dim server As String = args(1)

        ' Verify that the server exists
        Try
            DNS.GetHostByName(server)
        Catch
            Console.WriteLine("Cannot find server: {0}", server)
            Exit Sub
        End Try


        ' Try to connect to the server
        Try
            tcpc.Connect(server,13)
        Catch exc as SocketException
            Console.WriteLine("Cannot connect to {0}: {1}", server, exc.Message)
            Exit Sub
        End Try


        ' Get the stream
        Dim s As Stream
        Try
          s = tcpc.GetStream()
        Catch exc As InvalidOperationException
            Console.WriteLine("Cannot connect to {0}: {1}", server, exc.Message)
            Exit Sub
        End Try

        ' Read the stream and convert it to ASII
        Dim bytes As Integer = s.Read(read, 0, read.Length)
        Dim Time As String = Encoding.ASCII.GetString(read)

        ' Display the data
        Console.WriteLine("Received {0} bytes", bytes)
        Console.WriteLine("Current date and time is: {0}", Time)

        tcpc.Close()

        ' Wait for user response to exit
        Console.WriteLine("Press Return to exit")
        Console.Read()
    End Sub

End Class
