'=====================================================================
'  File:      Except.vb
'
'  Summary:   Demonstrates how to use exceptions
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
Imports System.Windows.Forms
Imports Microsoft.VisualBasic

Public Class App
   Public Shared Sub Main()
      'Setup unhandled exception handler
      AddHandler Thread.GetDomain().UnhandledException, AddressOf App.HandleUnhandled

      'Function calls that use exception handling blocks to catch exceptions
      ProtectedFunction(1)
      Console.WriteLine()
      ProtectedFunction(2)
      Console.WriteLine()
      ProtectedFunction(3)
      Console.WriteLine()

      'This one just throws
      Console.WriteLine("Just about to execute code that throws an unhandled exception:")
      MethodThatThrows(1)
      'This code is never executed
      Console.WriteLine("This code never executes!")
   End Sub

   'This method is designed to throw one of three exceptions
   Public Shared Sub MethodThatThrows(opt As Integer)
      Select Case opt
      Case 1
         Dim x As Byte
         x = 230
         x = x + x
      Case 2
         Dim o As Object          
         Console.WriteLine(o.ToString())
      Case 3
         throw(new MyException("This is a custom exception"))
      End Select
   End Sub

   'This method calls the MethodThatThrows, but catches the exceptions   
   Public Shared Sub ProtectedFunction(opt As Integer)
      Try
         MethodThatThrows(opt)
      Catch e As Exception
         Console.WriteLine ("Exception:" & ControlChars.CrLf & "   " & e.GetType().ToString())
         Console.WriteLine ("Message:" & ControlChars.CrLf & "   " & e.Message)
         Console.WriteLine ("Stack Trace:" & ControlChars.CrLf & e.StackTrace)
         Console.WriteLine ("Help Link:" & ControlChars.CrLf & "   " & e.HelpLink)
      End Try
   End Sub

   'Not the most exciting unhandled exception handler in the world
   Public Shared Sub HandleUnhandled(sender As Object, args As UnhandledExceptionEventArgs)
        MessageBox.Show("Unhandled Exception!" & ControlChars.CrLf & args.ExceptionObject.GetType().ToString(), "Exceptions")
   End Sub

End Class

'Custom exception class derived from ApplicationException
Class MyException 
Inherits ApplicationException
   Public Sub New(msg As String)
      MyBase.New(msg)
      HelpLink = "http://NotARealURL.Microsoft.com/help.html"
   End Sub
End Class





