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

    Public Class validator7
        Inherits System.Web.UI.Page

        Protected WithEvents lblOutput As System.Web.UI.WebControls.Label
        Protected WithEvents ValidateBtn As System.Web.UI.WebControls.Button
        Protected WithEvents TextBox1 As System.Web.UI.WebControls.TextBox
        Protected WithEvents TextBox2 As System.Web.UI.WebControls.TextBox
        Protected WithEvents TextBox3 As System.Web.UI.WebControls.TextBox
        Protected WithEvents RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator
        Protected WithEvents RequiredFieldValidator2 As System.Web.UI.WebControls.RequiredFieldValidator
        Protected WithEvents RequiredFieldValidator3 As System.Web.UI.WebControls.RequiredFieldValidator
        Protected WithEvents RegularExpressionValidator1 As System.Web.UI.WebControls.RegularExpressionValidator
        Protected WithEvents RegularExpressionValidator2 As System.Web.UI.WebControls.regularexpressionvalidator
        Protected WithEvents RegularExpressionValidator3 As System.Web.UI.WebControls.RegularExpressionValidator

#Region " Web Forms Designer Generated Code "

        Dim WithEvents validator7 As System.Web.UI.Page

        Sub New()
            validator7 = Me
            AddHandler validator7.Init, New System.EventHandler(AddressOf validator7_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            AddHandler validator7.Load, New System.EventHandler(AddressOf validator7_Load)
            AddHandler ValidateBtn.Click, New System.EventHandler(AddressOf ValidateBtn_Click)
        End Sub

#End Region

        Private Sub ValidateBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            If (Page.IsValid) Then
                lblOutput.Text = "Page is Valid!"
            Else
                lblOutput.Text = "Page is InValid! :-("
            End If
        End Sub

        Protected Sub validator7_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            If Not IsPostBack Then   ' Evals true first time browser hits the page	

            End If
        End Sub

        Protected Sub validator7_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

    End Class

End Namespace