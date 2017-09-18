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

Namespace Validate.Vb

    Public Class validator1
        Inherits System.Web.UI.Page

        Protected WithEvents ValidateBtn As System.Web.UI.WebControls.Button
        Protected WithEvents lblOutput As System.Web.UI.WebControls.Label
        Protected WithEvents RadioButtonList1 As System.Web.UI.WebControls.RadioButtonList
        Protected WithEvents RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator
        Protected WithEvents RequiredFieldValidator2 As System.Web.UI.WebControls.RequiredFieldValidator
        Protected WithEvents RequiredFieldValidator3 As System.Web.UI.WebControls.RequiredFieldValidator
        Protected WithEvents TextBox1 As System.Web.UI.WebControls.TextBox
        Protected WithEvents DropDownList1 As System.Web.UI.WebControls.DropDownList

#Region " Web Forms Designer Generated Code "

        Dim WithEvents validator1 As System.Web.UI.Page

        Sub New()
            validator1 = Me

            AddHandler validator1.Init, New System.EventHandler(AddressOf validator1_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            AddHandler validator1.Load, New System.EventHandler(AddressOf validator1_Load)
            AddHandler ValidateBtn.Click, New System.EventHandler(AddressOf ValidateBtn_Click)
        End Sub

#End Region

        Private Sub ValidateBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            If (Page.IsValid) Then
                lblOutput.Text = "Page is Valid!"
            Else
                lblOutput.Text = "Some of the required fields are empty"
            End If
        End Sub

        Protected Sub validator1_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            If Not IsPostBack Then   ' Evals true first time browser hits the page

            End If
        End Sub

        Protected Sub validator1_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

    End Class

End Namespace