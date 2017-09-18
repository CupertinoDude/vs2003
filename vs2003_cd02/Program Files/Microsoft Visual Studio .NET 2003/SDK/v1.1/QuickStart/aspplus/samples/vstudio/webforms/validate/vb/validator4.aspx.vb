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

    Public Class validator4
        Inherits System.Web.UI.Page

        Protected WithEvents txtComp As System.Web.UI.WebControls.TextBox
        Protected WithEvents txtCompTo As System.Web.UI.WebControls.TextBox
        Protected WithEvents lstOperator As System.Web.UI.WebControls.ListBox
        Protected WithEvents ValidateBtn As System.Web.UI.WebControls.Button
        Protected WithEvents comp1 As System.Web.UI.WebControls.CompareValidator
        Protected WithEvents lblOutput As System.Web.UI.WebControls.Label

#Region " Web Forms Designer Generated Code "

        Dim WithEvents validator4 As System.Web.UI.Page

        Sub New()
            validator4 = Me
            AddHandler validator4.Init, New System.EventHandler(AddressOf validator4_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            AddHandler validator4.Load, New System.EventHandler(AddressOf validator4_Load)
            AddHandler ValidateBtn.Click, New System.EventHandler(AddressOf ValidateBtn_Click)
            AddHandler lstOperator.SelectedIndexChanged, New System.EventHandler(AddressOf lstOperator_SelectedIndexChanged)
        End Sub

#End Region

        Private Sub ValidateBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            If (Page.IsValid) Then
                lblOutput.Text = "Result: Valid!"
            Else
                lblOutput.Text = "Result: Not valid!"
            End If
        End Sub

        Private Sub lstOperator_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
            comp1.Operator = CType(lstOperator.SelectedIndex, ValidationCompareOperator)
            comp1.Validate()
        End Sub

        Protected Sub validator4_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            If Not IsPostBack Then   ' Evals true first time browser hits the page	

            End If
        End Sub

        Protected Sub validator4_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

    End Class

End Namespace