'=====================================================================
'  File:      VBDerived.vb
'
'  Summary:   Demonstrates a type writen using VB derived from a type
'             written in C++.
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
'======================================================================

Option Explicit On 
Option Strict On


Imports System

Public Class VBDerived 
Inherits VCBase

   Public Sub New()
      REM MyBase.New

      Console.WriteLine("  Executing the VBDerived.New() constructor")

   End Sub

   Overrides Public Sub Method
      Console.WriteLine(" Executing the VBDerived.Method() virtual method")
   End Sub

   Public Sub AnotherMethodThatThrows
      Try
         MyBase.MethodThatThrows()      
      Catch e As OutOfMemoryException
         Throw(new ApplicationException("Some application function failed!", e))
      End Try
   End Sub

End Class

