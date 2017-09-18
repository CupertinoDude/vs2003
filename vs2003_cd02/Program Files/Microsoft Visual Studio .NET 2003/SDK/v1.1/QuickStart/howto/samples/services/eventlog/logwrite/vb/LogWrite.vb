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
Imports System.Diagnostics
Imports System.Globalization

Namespace LogWrite

    Module LogWrite

        Public Sub Main()

            Dim args As String()
            Dim appName As String
            args = Environment.GetCommandLineArgs()
            appName = args(0)

            If (args.Length <> 4) Then
                Console.WriteLine("Usage: " + appName + " <log> <message> <source>")
                Console.WriteLine ()
                Console.WriteLine ("Press Enter to continue...")
                Console.ReadLine()
                Exit Sub
            End If

            Dim log As String
            Dim source As String

            log = args(1)
            source = args(3)

            If (Not EventLog.SourceExists(source)) Then
                EventLog.CreateEventSource(source, log)
            End If

            Dim aLog As EventLog
            aLog = New EventLog
            aLog.Source = source

            If (String.Compare(aLog.Log, log, true, CultureInfo.InvariantCulture) <> 0) Then
                Console.WriteLine("Some other application is using the source!")
                Exit Sub
            End If

            aLog.WriteEntry(args(2), EventLogEntryType.Information)
            Console.WriteLine("Entry written successfuly!")
        End Sub

    End Module

End Namespace
