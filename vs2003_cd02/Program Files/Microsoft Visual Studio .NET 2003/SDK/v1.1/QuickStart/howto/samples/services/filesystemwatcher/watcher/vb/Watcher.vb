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

Namespace Watcher

    Module Watcher

        Public Sub Main()
            Dim args As String()
            Dim appName As String
            args = Environment.GetCommandLineArgs()
            appName = args(0)

            If (args.Length <> 2) Then
                Console.WriteLine("Usage: " + appname + "<directory>")

            Else
                Dim watcher As FileSystemWatcher
                watcher = New FileSystemWatcher
                watcher.Path = args(1)
                watcher.NotifyFilter = NotifyFilters.FileName Or NotifyFilters.Attributes Or NotifyFilters.LastAccess Or NotifyFilters.LastWrite Or NotifyFilters.Security Or NotifyFilters.Size

                AddHandler watcher.Changed, AddressOf OnChanged
                AddHandler watcher.Created, AddressOf OnChanged
                AddHandler watcher.Deleted, AddressOf OnChanged
                AddHandler watcher.Renamed, AddressOf OnRenamed

                watcher.EnableRaisingEvents = True
            End If

            Console.WriteLine("Press Enter to quit the sample")
            Console.WriteLine()
            Console.ReadLine()
        End Sub

        Public Sub OnChanged(ByVal source As Object, ByVal e As FileSystemEventArgs)
            Console.WriteLine("File: {0} {1}", e.FullPath, e.ChangeType.ToString("G"))
        End Sub

        Public Sub OnRenamed(ByVal source As Object, ByVal e As RenamedEventArgs)
            Console.WriteLine("File: {0} Renamed to {1}", e.OldFullPath, e.FullPath)
        End Sub

    End Module

End Namespace
