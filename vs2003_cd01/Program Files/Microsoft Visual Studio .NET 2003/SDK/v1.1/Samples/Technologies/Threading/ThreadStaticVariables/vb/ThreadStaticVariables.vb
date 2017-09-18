'=====================================================================
'  File:      ThreadStaticVariables.vb
'
'  Summary:   Demonstrates how to use [ThreadStatic] to create statics
'             backed by thread local storage.
'
'---------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
'
'  Copyright (C) Microsoft Corporation.  All rights reserved.
'
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
'
'THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'=====================================================================

Option Explicit On 
Option Strict On


Imports System
Imports System.Threading


Class Operation
    ' NOTE: Only the first instance (Thread 3) of x will be set to 10.
    ' When new thread static instances are created (Threads 1 & 2), thread
    ' static variables are always zeroed out. This sample demonstrates this.
    <ThreadStatic()> Private Shared tsValue As Int32 = 10
    Private threadId As Int32
    
    
    Public Sub New(threadId As Int32)
        Me.threadId = threadId
    End Sub 'New
    
    
    Public Sub ThreadMethod()
        ' Locking is done so that each thread's output is grouped together
        ' making the output easier to read
        SyncLock GetType(Operation)
            Dim x As Int32
            For x = 0 To 9
                Console.WriteLine("Thread {0}: {1}", threadId, tsValue) 
		tsValue = tsValue + 1
            Next x
        End SyncLock
    End Sub 'ThreadMethod
End Class 'Operation



Class App
    Shared Sub Main()
        ' Create 3 Operation objects; each one processed by its own thread
        Dim o1 As New Operation(0)
        Dim t1 As New Thread(New ThreadStart(AddressOf o1.ThreadMethod))
        t1.Start()

        Dim o2 As New Operation(1)
        Dim t2 As New Thread(New ThreadStart(AddressOf o2.ThreadMethod))
        t2.Start()

        Dim o3 As New Operation(2)
        o3.ThreadMethod() ' The primary thread will execute this method

        ' Wait for the other threads to terminate
        t1.Join()
        t2.Join()
    End Sub 'Main
End Class 'App
