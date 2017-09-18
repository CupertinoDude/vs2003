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
Imports System.Text
Imports Microsoft.VisualBasic
Imports System.Reflection

< _
    Assembly : AssemblyTitle(""), _
    Assembly : AssemblyDescription("A QuickStart Tutorial Assembly"), _
    Assembly : AssemblyConfiguration(""), _
    Assembly : AssemblyCompany("Microsoft Corporation"), _
    Assembly : AssemblyProduct("Microsoft QuickStart Tutorials"), _
    Assembly : AssemblyCopyright(" Microsoft Corporation.  All rights reserved."), _
    Assembly : AssemblyTrademark(""), _
    Assembly : AssemblyCulture(""), _
    Assembly : AssemblyVersion("1.1.*"), _
    Assembly : AssemblyDelaySign(false), _
    Assembly : AssemblyKeyFile(""), _
    Assembly : AssemblyKeyName("") _
>
Namespace HelloWorld

  Public Class HelloObjVB

    Private _name As String

    Public Sub New()

        MyBase.New()
        _name = ""
    End Sub

    Public Property FirstName As String

      Get
        return _name
      End Get

      Set
        _name = Value
      End Set
    End Property

    Public Function SayHello() As String

      Dim SB As StringBuilder
      SB = New StringBuilder("Hello ")

      If Not (_name = "")
         SB.Append(_name)
      Else
         SB.Append("World")
      End If

      SB.Append("!")
      Return SB.ToString()
    End Function

  End Class

End Namespace