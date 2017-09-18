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
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls


Namespace Intrinsics.Vb
    Public Class SessionService1Client
        Inherits System.Web.UI.Page

        Private components As System.ComponentModel.IContainer

        Protected Message1 As System.Web.UI.HtmlControls.HtmlGenericControl

        Protected Message2 As System.Web.UI.HtmlControls.HtmlGenericControl

#Region " Web Forms Designer Generated Code "

        Dim WithEvents SessionService1Client As System.Web.UI.Page

        Sub New()
            SessionService1Client = Me
            AddHandler SessionService1Client.Init, New System.EventHandler(AddressOf SessionService1Client_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub SessionService1Client_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Protected Sub SessionService1Client_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            Dim S As SessionService1 = New SessionService1()
            Message1.InnerHtml = S.UpdateHitCounter() & "<BR>" & S.UpdateHitCounter() & "<BR>" + S.UpdateHitCounter()
            Message2.InnerHtml = S.UpdateAppCounter() & "<BR>" & S.UpdateAppCounter() & "<BR>" + S.UpdateAppCounter()
        End Sub


        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Load, AddressOf Me.SessionService1Client_Load
        End Sub
    End Class
End Namespace