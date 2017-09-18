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

    Public Class validator9
        Inherits System.Web.UI.Page

        Protected WithEvents valSum As System.Web.UI.WebControls.ValidationSummary
        Protected WithEvents email As System.Web.UI.WebControls.TextBox
        Protected WithEvents emailReqVal As System.Web.UI.WebControls.RequiredFieldValidator
        Protected WithEvents emailRegexVal As System.Web.UI.WebControls.RegularExpressionValidator
        Protected WithEvents passwd As System.Web.UI.WebControls.TextBox
        Protected WithEvents passwdReqVal As System.Web.UI.WebControls.RequiredFieldValidator
        Protected WithEvents passwdRegexVal As System.Web.UI.WebControls.RegularExpressionValidator
        Protected WithEvents passwd2 As System.Web.UI.WebControls.TextBox
        Protected WithEvents passwd2ReqVal As System.Web.UI.WebControls.RequiredFieldValidator
        Protected WithEvents CompareValidator1 As System.Web.UI.WebControls.CompareValidator
        Protected WithEvents RegularExpressionValidator1 As System.Web.UI.WebControls.RegularExpressionValidator
        Protected WithEvents txtFn As System.Web.UI.WebControls.TextBox
        Protected WithEvents txtLn As System.Web.UI.WebControls.TextBox
        Protected WithEvents txtAddress As System.Web.UI.WebControls.TextBox
        Protected WithEvents txtState As System.Web.UI.WebControls.TextBox
        Protected WithEvents txtZip As System.Web.UI.WebControls.TextBox
        Protected WithEvents txtPhone As System.Web.UI.WebControls.TextBox
        Protected WithEvents phoneReqVal As System.Web.UI.WebControls.RequiredFieldValidator
        Protected WithEvents phoneRegexVal As System.Web.UI.WebControls.RegularExpressionValidator
        Protected WithEvents ccType As System.Web.UI.WebControls.RadioButtonList
        Protected WithEvents ccTypeReqVal As System.Web.UI.WebControls.RequiredFieldValidator
        Protected WithEvents ccNum As System.Web.UI.WebControls.TextBox
        Protected WithEvents ccNumReqVal As System.Web.UI.WebControls.RequiredFieldValidator
        Protected WithEvents ccNumCustVal As System.Web.UI.WebControls.CustomValidator
        Protected WithEvents expDate As System.Web.UI.WebControls.DropDownList
        Protected WithEvents expDateReqVal As System.Web.UI.WebControls.RequiredFieldValidator

#Region " Web Forms Designer Generated Code "

        Dim WithEvents validator9 As System.Web.UI.Page

        Sub New()
            validator9 = Me
            AddHandler validator9.Init, New System.EventHandler(AddressOf validator9_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            AddHandler validator9.Load, New System.EventHandler(AddressOf validator9_Load)
        End Sub

#End Region

        Protected Sub validator9_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            If Not IsPostback Then   ' Evals true first time browser hits the page	

            End If
        End Sub

        Protected Sub validator9_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

    End Class

End Namespace