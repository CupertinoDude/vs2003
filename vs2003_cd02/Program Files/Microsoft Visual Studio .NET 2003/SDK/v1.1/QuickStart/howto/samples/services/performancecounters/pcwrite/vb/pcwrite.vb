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

public class PCWrite

  Const objectName As String = "Orders"
  Const counterName As String = "Milk Orders"
  Const instanceName As String = "International"

  public shared sub Main()
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
    If (PerformanceCounterCategory.Exists(objectName)) Then
        if(not PerformanceCounterCategory.CounterExists(counterName, objectName)) then
          Console.WriteLine("The counter does not exists!")
          exit sub
        end if
    
        Dim aCounter As PerformanceCounter = new PerformanceCounter(objectName, counterName ,instanceName, false)
        aCounter.RawValue = 50
    
        Console.WriteLine("Press 'q' to quit the sample")
        Console.WriteLine("Press '+' to increment the counter")
        Console.WriteLine("Press '-' to decrement the counter")
    
        Console.WriteLine("Started")
        Dim command as Integer
        Do
          command = Console.Read()
          if(command=45) then
            aCounter.IncrementBy(-5)
          end if
          if(command=43) then
            aCounter.IncrementBy(5)
          end if
        loop until command=113
    Else
        Console.WriteLine("The Category has to be installed installed first by running: pcwrite /inst")
    End If
  end sub

   Private Shared Function InstallCounters() As Boolean
       If (not PerformanceCounterCategory.Exists(objectName)) Then
          PerformanceCounterCategory.Create(objectName,"Simple Counter Object",counterName,"Simple Counter")
          Console.WriteLine("Category has been created.")
	  InstallCounters = True
       Else
	  InstallCounters = False
       End If
   End Function 'InstallCounters

   Private Shared Sub DeleteCounters()
         If PerformanceCounterCategory.Exists(objectName) Then
            PerformanceCounterCategory.Delete(objectName)
            Console.WriteLine("Category has been successfully deleted!  ")
         Else
            Console.WriteLine("Category not installed!  ")
         End If
   End Sub 'DeleteCounters

   Private Shared Sub ShowUsage()
      Console.WriteLine("Usage")
      Console.WriteLine("-----")
      Console.WriteLine("To install perf counter: pcwrite /inst")
      Console.WriteLine("To apply changes to perf counter: pcwrite")
      Console.WriteLine("To delete perf counter: pcwrite /del")
   End Sub 'ShowUsage 
end class
