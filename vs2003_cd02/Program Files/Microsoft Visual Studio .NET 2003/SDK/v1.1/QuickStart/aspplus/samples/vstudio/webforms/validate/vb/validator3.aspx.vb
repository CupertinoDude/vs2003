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

    Public Class validator3
        Inherits System.Web.UI.Page

        Protected WithEvents ValidateBtn As System.Web.UI.WebControls.Button
        Protected WithEvents RadioButtonList1 As System.Web.UI.WebControls.RadioButtonList
        Protected WithEvents RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator
        Protected WithEvents RequiredFieldValidator2 As System.Web.UI.WebControls.RequiredFieldValidator
        Protected WithEvents RequiredFieldValidator3 As System.Web.UI.WebControls.RequiredFieldValidator
        Protected WithEvents valSum As System.Web.UI.WebControls.ValidationSummary
        Protected WithEvents TextBox1 As System.Web.UI.WebControls.TextBox
        Protected WithEvents DropDownList1 As System.Web.UI.WebControls.DropDownList
        Protected WithEvents ListFormat As System.Web.UI.WebControls.DropDownList

#Region " Web Forms Designer Generated Code "

        Dim WithEvents validator3 As System.Web.UI.Page

        Sub New()
            validator3 = Me

            AddHandler validator3.Init, New System.EventHandler(AddressOf validator3_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            AddHandler validator3.Load, New System.EventHandler(AddressOf validator3_Load)
            AddHandler ListFormat.SelectedIndexChanged, New System.EventHandler(AddressOf ListFormat_SelectedIndexChanged)
        End Sub

#End Region

        Private Sub ListFormat_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
            ' Change display mode of the validator summary when a new option
            ' is selected from the "ListFormat" dropdownlist

            valSum.DisplayMode = CType(ListFormat.SelectedIndex, ValidationSummaryDisplayMode)
        End Sub

        Protected Sub validator3_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            If Not IsPostBack Then   ' Evals true first time browser hits the page	

            End If
        End Sub

        Protected Sub validator3_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

    End Class

End Namespace