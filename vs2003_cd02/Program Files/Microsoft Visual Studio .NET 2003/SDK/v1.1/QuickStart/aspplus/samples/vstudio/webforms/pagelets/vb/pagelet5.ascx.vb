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

Namespace Pagelets.Vb.UserControls
    Public Class pagelet5
        Inherits System.Web.UI.UserControl

        Public BackColor As String = "white"

        Public Property UserId() As String
            Get
                Return UserName.Text
            End Get
            Set(ByVal Value As String)
                UserName.Text = Value
            End Set
        End Property

        Public Property Password() As String
            Get
                Return Pass.Text
            End Get
            Set(ByVal Value As String)
                Pass.Text = Value
            End Set
        End Property

        Public ReadOnly Property Valid() As Boolean
            Get
                Return Page.IsValid
            End Get
        End Property

#Region " Web Forms Designer Generated Code "

        Protected WithEvents UserName As System.Web.UI.WebControls.TextBox
        Protected WithEvents Pass As System.Web.UI.WebControls.TextBox
        Protected WithEvents SubmitBtn As System.Web.UI.WebControls.Button
        Protected WithEvents Validator1 As System.Web.UI.WebControls.RegularExpressionValidator
        Protected WithEvents Validator2 As System.Web.UI.WebControls.RequiredFieldValidator
        Protected WithEvents Validator3 As System.Web.UI.WebControls.RequiredFieldValidator

        Dim WithEvents pagelet5 As System.Web.UI.UserControl

        Sub New()
            pagelet5 = Me
            AddHandler pagelet5.Init, New System.EventHandler(AddressOf Me.pagelet5_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            AddHandler pagelet5.Load, New System.EventHandler(AddressOf Me.pagelet5_Load)
        End Sub

#End Region

        Protected Sub pagelet5_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            If Not IsPostBack Then   ' Evals true first time browser hits the page	

            End If
        End Sub

        Protected Sub pagelet5_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

    End Class
End Namespace