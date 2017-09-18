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

Namespace Intrinsics.Vb
    Public Class SessionService1
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


        <WebMethod(EnableSession:=True)> Public Function UpdateHitCounter() As String

            If Session("HitCounter") Is Nothing Then
                Session("HitCounter") = 1
            Else
                Session("HitCounter") = CInt(Session("HitCounter")) + 1
            End If

            Return "You have accessed this service " & Session("HitCounter").ToString() & " times."
        End Function

        <WebMethod(EnableSession:=False)> Public Function UpdateAppCounter() As String

            If Application("HitCounter") Is Nothing Then
                Application("HitCounter") = 1
            Else
                Application("HitCounter") = CInt(Application("HitCounter")) + 1
            End If

            Return "This service has been accessed " & Application("HitCounter").ToString() & " times."
        End Function

    End Class
End Namespace