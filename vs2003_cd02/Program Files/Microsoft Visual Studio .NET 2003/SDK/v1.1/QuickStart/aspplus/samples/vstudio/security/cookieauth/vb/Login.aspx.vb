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

Namespace CookieAuth.Vb
    Public Class Login
        Inherits System.Web.UI.Page

        Protected LoginBtn As System.Web.UI.WebControls.Button
        Protected PersistCookie As System.Web.UI.WebControls.CheckBox
        Protected Msg As System.Web.UI.WebControls.Label
        Protected UserPass As System.Web.UI.HtmlControls.HtmlInputText
        Protected RequiredFieldValidator2 As System.Web.UI.WebControls.RequiredFieldValidator
        Protected RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator
        Protected UserEmail As System.Web.UI.HtmlControls.HtmlInputText
        Private components As System.ComponentModel.IContainer


#Region " Web Forms Designer Generated Code "

        Dim WithEvents Login As System.Web.UI.Page

        Sub New()
            Login = Me
            AddHandler Init, New System.EventHandler(AddressOf Me.Login_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub Login_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Protected Sub Login_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            If Not IsPostBack Then   ' Evals true first time browser hits the page
            End If
        End Sub



        Protected Sub Login_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
            If UserEmail.Value = "someone@www.contoso.com" And UserPass.Value = "password" Then
                FormsAuthentication.RedirectFromLoginPage(UserEmail.Value, PersistCookie.Checked)
            Else
                Msg.Text = "Invalid Credentials: Please try again"
            End If
        End Sub

        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Me.LoginBtn.Click, AddressOf Me.Login_Click

        End Sub
    End Class
End Namespace