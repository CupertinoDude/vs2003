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

Public Class MQCtrl
    Public Shared Sub  Main()
        Dim appName As String = Environment.GetCommandLineArgs()(0)

        if(Environment.GetCommandLineArgs().Length <> 4) then
            Console.WriteLine("Usage: ")
            Console.WriteLine("    {0} <queue> <command> <value>", appName)
            Console.WriteLine("")
            Console.WriteLine("        <Command> =")
            Console.WriteLine("            l: change label")
            Console.WriteLine("            s: change queue size")
            Console.WriteLine("            j: change journal size")
            Exit Sub
        End if

        Dim mqPath As String = ".\" + Environment.GetCommandLineArgs()(1)
        if(Not MessageQueue.Exists(mqPath)) then
            Console.WriteLine("The queue {0} does not exist", mqPath)
            Exit Sub
        End if

        Dim mq As MessageQueue = new MessageQueue(mqPath)

        Dim command As String = Environment.GetCommandLineArgs()(2)
        Dim value As String = Environment.GetCommandLineArgs()(3)
        if(command = "l") then
            mq.Label = value
        elseif(command = "s") then
            mq.MaximumQueueSize = Int32.Parse(value)
        else if(command = "j") then
            mq.MaximumJournalSize = Int32.Parse(value)
        end if
    end sub
end class