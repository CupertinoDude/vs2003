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
Imports System.Timers
Imports System.Threading

Public Class PCDemo

      Shared theCounter As PerformanceCounter

      Const objectName As String = "ACounterDemo"
      Const counterName As String = "CountPerSecond"
      Const instanceName As String = "_Total"

    Public Shared Sub Main()
      'Get the category/counters installed...

      If Environment.GetCommandLineArgs().Length  > 1 Then
         If Environment.GetCommandLineArgs()(1).StartsWith("/inst") Then
            If (InstallCounters()) Then
               Exit Sub
            Else
               Console.WriteLine("Continuing with sample...")
            End If
         Else
            If Environment.GetCommandLineArgs()(1).StartsWith("/del") Then
               DeleteCounters()
               Exit Sub
            Else
               ShowUsage()
               Exit Sub
            End If
         End If
      End If 

      Try
	theCounter = new PerformanceCounter(objectName, counterName ,instanceName, false)
	 theCounter.RawValue = 0
      Catch E As Exception
        Console.WriteLine("Unable to create Performance Counters.")
        Console.WriteLine("Please ensure that you have administrator privileges")
        Console.WriteLine("on this machine before running this sample.")
	Exit Sub
      End Try

      Dim aTimer As new System.Timers.Timer
      AddHandler aTimer.Elapsed, AddressOf OnTimer

      aTimer.Interval = 100
      aTimer.Enabled = true
      aTimer.AutoReset = false

      Console.WriteLine("Press '+' to increase the interval")
      Console.WriteLine("Press '-' to decrease the interval")
      Console.WriteLine("Press 'q' to quit the sample")
      Console.WriteLine("Started")

      Dim command As Integer
      Do
        command = Console.Read()
        if(command=43) then     ' + = ASCII 43
          aTimer.Interval = Math.Max(1,aTimer.Interval/2)
        elseif(command=45) then   ' - = ASCII 45
          aTimer.Interval *= 2
        end if

      Loop until command=113
    End Sub

   ' Returns true if we install the counters...
   Private Shared Function InstallCounters() As Boolean
      Try
          If Not PerformanceCounterCategory.Exists(objectName) Then
            Dim ccd As CounterCreationData = new CounterCreationData()
            ccd.CounterName = counterName
            ccd.CounterType = PerformanceCounterType.RateOfCountsPerSecond32
            Dim ccds As New CounterCreationDataCollection
            ccds.Add(ccd)
            PerformanceCounterCategory.Create(objectName,"Sample Object",ccds)
	    Console.WriteLine("Performance Counter has been successfully created.")
	    InstallCounters=True
          End If
      Catch E As Exception
          Console.WriteLine("Unable to create Performance Counter.")
	  InstallCounters=False
      End Try
   End Function 'InstallCounters

    Public Shared Sub OnTimer(source as Object, e As ElapsedEventArgs)
          Try
              theCounter.IncrementBy(1)
              Dim theTimer As System.Timers.Timer = CType(source,System.Timers.Timer)
              theTimer.Enabled = True
          Catch Exc As Exception
              Console.WriteLine("You must have Administrator privelages to run this sample.")
          End Try
    End Sub

   Private Shared Sub DeleteCounters()
      Try
         If PerformanceCounterCategory.Exists(objectName) Then
            PerformanceCounterCategory.Delete(objectName)
            Console.Write("Category has been successfully deleted!  ")
         Else
            Console.Write("Category not installed!  ")
         End If
      Catch
      End Try
   End Sub 'DeleteCounters

   Private Shared Sub ShowUsage()
      Console.WriteLine("Usage")
      Console.WriteLine("-----")
      Console.WriteLine("To install perf counter AcounterDemo: pcdemo /inst")
      Console.WriteLine("To apply changes to perf counter AcounterDemo: pcdemo")
      Console.WriteLine("To delete perf counter AcounterDemo: pcdemo /del")
   End Sub 'ShowUsage 
End Class