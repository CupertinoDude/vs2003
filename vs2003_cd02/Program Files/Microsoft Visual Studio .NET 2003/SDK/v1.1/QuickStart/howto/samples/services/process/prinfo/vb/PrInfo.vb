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
Imports System.Threading

Namespace PrInfo

    Module PrInfo

        Public Sub Main()

            Dim args As String()
            Dim appName As String
            args = Environment.GetCommandLineArgs()
            appName = args(0)

            If (args.Length <> 3 And (args.Length <> 2 OrElse args(1) <> "e")) Then
                Console.WriteLine("Usage: ")
                Console.WriteLine("    " + appName + " e: Enumerate processes")
                Console.WriteLine("    " + appName + " <command> <process_id>")
                Console.WriteLine("")
                Console.WriteLine("         <command> =")
                Console.WriteLine("            i: Show process info")
                Console.WriteLine("            c: Close")
                Console.WriteLine("            k: Kill")
                Console.WriteLine("            p: show curent priority")
                Exit Sub
            End If

            Dim command As String
            command = args(1)

            If (command = "e") Then
                Dim processes() As Process
                processes = Process.GetProcesses()

                Dim myprocess As Process
                Dim i As Integer
                For i = 0 To processes.length - 1
                    myprocess = processes(i)
                    Console.WriteLine(CStr(myprocess.Id) + "    : " + myprocess.ProcessName)
                Next
            Else
                Dim processid As int32
                processid = Int32.Parse(args(2))
                Dim myprocess As Process
                myprocess = Process.GetProcessById(processid)

                Select Case (command)
                    Case "c"
                        myprocess.CloseMainWindow()
                    case "k":
                        myprocess.Kill()
                    case "p":
                        Console.WriteLine("Priority: " + CStr(myprocess.PriorityClass))
                    case "i":
                        Console.WriteLine("Priority Class         :{0}", CStr(myprocess.PriorityClass))
                        Console.WriteLine("Handle Count           :{0}", myprocess.HandleCount)
                        Console.WriteLine("Main Window Title      :{0}", myprocess.MainWindowTitle)
                        Console.WriteLine("Min Working Set        :{0}", myprocess.MinWorkingSet)
                        Console.WriteLine("Max Working Set        :{0}", myprocess.MaxWorkingSet)
                        Console.WriteLine("Paged Memory Size      :{0}", myprocess.PagedMemorySize)
                        Console.WriteLine("Peak Paged Memory Size :{0}", myprocess.PeakPagedMemorySize)
                End Select
            End If
        End Sub
    End Module
End Namespace
