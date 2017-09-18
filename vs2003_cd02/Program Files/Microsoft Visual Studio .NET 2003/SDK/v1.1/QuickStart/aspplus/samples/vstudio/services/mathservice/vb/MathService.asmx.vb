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

Namespace Services.MathService.Vb
    Public Class MathService
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


        <WebMethod()> Public Function Add(ByVal A As System.Single, ByVal B As System.Single) As System.Single

            Return A + B
        End Function

        <WebMethod()> Public Function Subtract(ByVal A As System.Single, ByVal B As System.Single) As System.Single

            Return A - B
        End Function

        <WebMethod()> Public Function Multiply(ByVal A As System.Single, ByVal B As System.Single) As System.Single

            Return A * B
        End Function

        <WebMethod()> Public Function Divide(ByVal A As System.Single, ByVal B As System.Single) As System.Single

            If B = 0 Then
                Return -1
            End If
            Return Convert.ToSingle(A / B)
        End Function

    End Class
End Namespace