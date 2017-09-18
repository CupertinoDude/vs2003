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

Imports System.Web.Services
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

Namespace DataTypes.Vb
    Public Class DataTypesService
        Inherits System.Web.Services.WebService

#Region " XML Web services Designer Generated Code "

        'Required by the WebServices Designer
        Private components As System.ComponentModel.Container

        Public Sub New()
            MyBase.New()

            'CODEGEN: This procedure is required by the WebServices Designer
            'Do not modify it using the code editor.
            InitializeComponent()

            'Add your own initialization code after the InitializeComponent call
        End Sub

        Private Sub InitializeComponent()
            'CODEGEN: This procedure is required by the WebServices Designer
            'Do not modify it using the code editor.
            components = New System.ComponentModel.Container()
        End Sub

        Protected Overloads Overrides Sub Dispose(ByVal disposing as Boolean)
            'CODEGEN: This procedure is required by the WebServices Designer
            'Do not modify it using the code editor.
        End Sub

#End Region


        <WebMethod()> Public Function SayHello() As String

            Return "Hello World!"
        End Function

        <WebMethod()> Public Function SayHelloName(ByVal Name As String) As String

            Return "Hello " & Name
        End Function

        <WebMethod()> Public Function GetIntArray() As Integer()

            Dim I As Integer
            Dim A(5) As Integer
            For I = 0 To 4
                A(I) = I * 10
            Next
            Return A
        End Function

        <WebMethod()> Public Function GetMode() As Mode

            Return Mode.EOff
        End Function

        <WebMethod()> Public Function GetOrder() As Order

            Dim MyOrder As New Order()

            MyOrder.Price = 34.5
            MyOrder.OrderID = 323232

            Return MyOrder
        End Function

        <WebMethod()> Public Function GetOrders() As Order()

            Dim MyOrder(2) As Order

            MyOrder(0) = New Order()
            MyOrder(0).Price = 34.5
            MyOrder(0).OrderID = 323232
            MyOrder(1) = New Order()
            MyOrder(1).Price = 99.4
            MyOrder(1).OrderID = 645645

            Return MyOrder
        End Function


    End Class

    Public Enum Mode

        EOn = 1
        EOff = 2

    End Enum

    Public Class Order

        Public OrderID As Integer
        Public Price As Double
    End Class

End Namespace