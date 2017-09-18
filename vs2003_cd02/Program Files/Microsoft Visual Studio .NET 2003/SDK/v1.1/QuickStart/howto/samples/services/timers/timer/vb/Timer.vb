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
Imports System.Threading
Imports System.Timers

Namespace Timer

    Module Timer

        Public Sub Main()
            Dim aTimer As System.Timers.Timer
            aTimer = New System.Timers.Timer

            AddHandler aTimer.Elapsed, AddressOf OnTimer

            aTimer.Interval = 1000
            aTimer.Enabled = True

            Console.WriteLine("Press 'q' to quit the sample")
            While (Console.Read() <> 113)
            End While
        End Sub

        Public Sub OnTimer(ByVal source As Object, ByVal e As ElapsedEventArgs)
            Console.WriteLine("Hello World!")
        End Sub

    End Module

End Namespace
