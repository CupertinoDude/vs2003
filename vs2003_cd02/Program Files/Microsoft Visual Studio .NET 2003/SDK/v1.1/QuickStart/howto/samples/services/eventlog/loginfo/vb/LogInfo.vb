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
Imports System.Environment
Imports System.Diagnostics

Namespace LogInfo

    Module LogInfo

        Public Sub Main()

            Dim appName As String
            Dim args As String()

            args = Environment.GetCommandLineArgs()
            appName = args(0)

            If (args.Length <> 2 And args.Length <> 3) Then
                Console.WriteLine("Usage: {0} <log> [<machine>]", appName)
                Console.WriteLine ()
                Console.WriteLine ("Press Enter to continue...")
                Console.ReadLine()
                Exit Sub
            End If

            Dim log As String
            log = args(1)

            Dim machine As String
            If (args.Length = 3) Then
                machine = args(2)
            Else
                machine = "." ' local machine
            End If

            If (Not EventLog.Exists(log, machine)) Then
                Console.WriteLine("The log does not exist!")
                Exit Sub
            End If

            Dim aLog As EventLog
            aLog = New EventLog
            aLog.Log = log
            aLog.MachineName = machine

            Console.WriteLine("There are {0} entr[y|ies] in the log:", CStr(aLog.Entries.Count))
            Dim entry As EventLogEntry

            For Each entry In alog.entries
                Console.WriteLine("    Entry: {0}", entry.Message)
            Next entry

        End Sub

    End Module

End Namespace
