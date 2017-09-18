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
Imports System.ComponentModel
Imports System.IO
Imports Microsoft.VisualBasic.ControlChars

Namespace Microsoft.Samples.WinForms.VB.CustomerControl

    Public Class Customer
        Inherits System.ComponentModel.Component

        Private vid As String
        Private vtitle As String
        Private vfirstName As String
        Private vlastName As String
        Private vaddress As String

        Public Shared Function ReadCustomer() As Customer
            Dim cust As Customer = New Customer("536-45-1245")

            With cust
                .Title = "Mr."
                .FirstName = "Otis"
                .LastName = "Redding"
                .Address = "1 Dock Street, The Bay, SomeWhere, USA"
            End With

            Return cust
        End Function

        Sub New(ByVal strID As String)
            MyBase.New()

            Me.vid = strID
        End Sub

        Public ReadOnly Property ID() As String
            Get
                Return vid
            End Get
        End Property

        Public Property FirstName() As String
            Get
                Return vfirstName
            End Get

            Set(ByVal Value As String)
                vfirstName = Value
            End Set
        End Property

        Public Property Title() As String
            Get
                Return vtitle
            End Get

            Set(ByVal Value As String)
                vtitle = Value
            End Set
        End Property

        Public Property LastName() As String
            Get
                Return vlastName
            End Get

            Set(ByVal Value As String)
                vlastName = Value
            End Set
        End Property

        Public Property Address() As String
            Get
                Return vaddress
            End Get

            Set(ByVal Value As String)
                vaddress = Value
            End Set
        End Property

        Public Overrides Function ToString() As String
            Dim sb As StringWriter = New StringWriter()
            sb.WriteLine("Customer: " & CrLf)
            sb.WriteLine(Me.ID)
            sb.Write(Me.Title & " ")
            sb.Write(Me.FirstName & " ")
            sb.WriteLine(Me.LastName)
            sb.WriteLine(Me.Address)
            Return sb.ToString()
        End Function

    End Class ' Customer

End Namespace ' namespace Microsoft.Samples.WinForms.VB.CustomerControl
