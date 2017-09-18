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
Imports System.ComponentModel.Design
Imports System.Data
Imports System.Drawing
Imports System.Web
Imports System.Web.SessionState
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports Microsoft.VisualBasic

Namespace Validate.Vb

    Public Class validator8
        Inherits System.Web.UI.Page

        Protected WithEvents lblOutput As System.Web.UI.WebControls.Label
        Protected WithEvents Text1 As System.Web.UI.WebControls.TextBox
        Protected WithEvents RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator
        Protected WithEvents CustomValidator1 As System.Web.UI.WebControls.CustomValidator
        Protected WithEvents ValidateBtn As System.Web.UI.WebControls.Button

#Region " Web Forms Designer Generated Code "

        Dim WithEvents validator8 As System.Web.UI.Page

        Sub New()
            validator8 = Me
            AddHandler validator8.Init, New System.EventHandler(AddressOf validator8_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            AddHandler validator8.Load, New System.EventHandler(AddressOf validator8_Load)
            AddHandler ValidateBtn.Click, New System.EventHandler(AddressOf ValidateBtn_OnClick)
            AddHandler CustomValidator1.ServerValidate, New System.Web.UI.WebControls.ServerValidateEventHandler(AddressOf CustomValidator1_ServerValidate)
        End Sub

#End Region

        Private Sub ValidateBtn_OnClick(ByVal sender As Object, ByVal e As System.EventArgs)
            If (Page.IsValid) Then
                lblOutput.Text = "Page is Valid!"
            Else
                lblOutput.Text = "Page is InValid! :-("
            End If
        End Sub

        Private Sub CustomValidator1_ServerValidate(source As Object, args As System.Web.UI.WebControls.ServerValidateEventArgs)
            Dim num As Integer = Integer.Parse(args.Value)

            If num Mod 2 = 0 Then
                args.IsValid = True
            Else
                args.IsValid = False
            End If
        End Sub

        Protected Sub validator8_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            If Not IsPostBack Then   ' Evals true first time browser hits the page

            End If
        End Sub

        Protected Sub validator8_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

    End Class

End Namespace