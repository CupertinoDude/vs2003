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
    Public Class pagelet7
        Inherits System.Web.UI.Page

#Region " Web Forms Designer Generated Code "

        Dim WithEvents pagelet7 As System.Web.UI.Page

        Sub New()
            pagelet7 = Me
            AddHandler pagelet7.Init, New System.EventHandler(AddressOf Me.pagelet7_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            AddHandler pagelet7.Load, New System.EventHandler(AddressOf Me.pagelet7_Load)
        End Sub

#End Region

        Protected Sub pagelet7_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            Dim c1 As Pagelets.Vb.UserControls.pagelet7
            Dim c2 As Pagelets.Vb.UserControls.pagelet7
            Dim c3 As Pagelets.Vb.UserControls.pagelet7

            Page.Controls.Add(New HtmlGenericControl("hr"))

            ' LoadControl returns type UserControl so we have to CType to pagelet7
            c1 = CType(LoadControl("pagelet7.ascx"), Pagelets.Vb.UserControls.pagelet7)
            c1.Category = "business"
            Page.Controls.Add(c1)

            Page.Controls.Add(New HtmlGenericControl("hr"))

            c2 = CType(LoadControl("pagelet7.ascx"), Pagelets.Vb.UserControls.pagelet7)
            c2.Category = "trad_cook"
            Page.Controls.Add(c2)

            Page.Controls.Add(New HtmlGenericControl("hr"))

            c3 = CType(LoadControl("pagelet7.ascx"), Pagelets.Vb.UserControls.pagelet7)
            c3.Category = "mod_cook"
            Page.Controls.Add(c3)
        End Sub

        Protected Sub pagelet7_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

    End Class
End Namespace
