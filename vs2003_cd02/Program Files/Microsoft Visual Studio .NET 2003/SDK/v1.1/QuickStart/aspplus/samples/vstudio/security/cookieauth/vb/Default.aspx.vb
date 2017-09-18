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

Imports System.Drawing
Imports System.Web.Security
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls


Namespace CookieAuth.Vb
    Public Class VbDefault
        Inherits System.Web.UI.Page

        Protected Welcome As System.Web.UI.WebControls.Label
        Protected SignoutBtn As System.Web.UI.WebControls.Button
        Private components As System.ComponentModel.IContainer

#Region " Web Forms Designer Generated Code "

        Dim WithEvents VbDefault As System.Web.UI.Page

        Sub New()
            VbDefault = Me
            AddHandler Init, New System.EventHandler(AddressOf Me.VbDefault_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub VbDefault_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Protected Sub VbDefault_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            Welcome.Text = "Hello, " + User.Identity.Name
        End Sub


        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Load, AddressOf Me.VbDefault_Load
            AddHandler Me.SignoutBtn.Click, AddressOf Me.Signout_Click
        End Sub

        Protected Sub Signout_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
            FormsAuthentication.SignOut()
            Response.Redirect("login.aspx")
        End Sub
    End Class
End Namespace