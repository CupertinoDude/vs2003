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
Imports System.Messaging

Public Class MQSend

    Shared Sub Main()
        Dim appName As String = Environment.GetCommandLineArgs()(0)

        If(Environment.GetCommandLineArgs().Length <> 3) then
            Console.WriteLine("Usage: " + appName +" <queue> <message>")
        Else
            Dim queuePath As String = Environment.GetCommandLineArgs()(1)
            Dim message As String = Environment.GetCommandLineArgs()(2)

            Dim mqPath As String = ".\" + queuePath
            if( Not MessageQueue.Exists(mqPath)) then
                MessageQueue.Create(mqPath)
            End if

            Dim mq As MessageQueue = new MessageQueue(mqPath)
            mq.Send(message)
        End if

        Console.WriteLine()
        Console.WriteLine("Press Enter to continue...")
        Console.ReadLine()

    End Sub

End Class