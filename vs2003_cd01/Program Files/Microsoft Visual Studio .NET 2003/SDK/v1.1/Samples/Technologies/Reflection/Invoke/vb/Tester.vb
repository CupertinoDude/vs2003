'=====================================================================
'  File:      Tester.vb
'
'  Summary:   A simple DLL that exposes a function or two to be tested
'             by the invoke sample
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

Option Strict On
Option Explicit On


Imports System
Imports System.Windows.Forms

Public Class SomeType
    
    Public Shared Function AddTwoDoubles(num1 As Double, num2 As Double) As Double
        Return num1 + num2
    End Function 'AddTwoDoubles
    
    
    Public Function ShowMessage(ByVal message As String) As DialogResult
        Return MessageBox.Show(message)
    End Function 'ShowMessage


    Public Function ShowMessage(ByVal message As String, ByVal caption As String) As DialogResult
        Return MessageBox.Show(message, caption)
    End Function 'ShowMessage


    Public Function ShowMessage(ByVal message As String, ByVal caption As String, ByVal style As Integer) As DialogResult
        Return MessageBox.Show(message, caption, CType(style, MessageBoxButtons))
    End Function 'ShowMessage
End Class 'SomeType 
