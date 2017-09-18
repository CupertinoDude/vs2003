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

Namespace Pagelets.Vb
    Public Class pagelet5
        Inherits System.Web.UI.Page

#Region " Web Forms Designer Generated Code "

        Protected WithEvents MyLogin As Pagelets.Vb.UserControls.pagelet5
        Protected WithEvents MyLabel As System.Web.UI.WebControls.Label

        Dim WithEvents pagelet5 As System.Web.UI.Page

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

            If (Page.IsPostBack) Then
                Page.Validate()
                If (Page.IsValid) Then
                    MyLabel.Text &= "The UserId is " & MyLogin.UserId & "<br>"
                    MyLabel.Text &= "The Password is " & MyLogin.Password & "<br>"
                End If
            End If

        End Sub

        Protected Sub pagelet5_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

    End Class
End Namespace
