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
    Public Class pagelet3
        Inherits System.Web.UI.UserControl

        Public Caption As String = "Address"

        Public Property Address() As String
            Get
                Return TxtAddress.Value
            End Get
            Set(ByVal Value As String)
                TxtAddress.Value = Value
            End Set
        End Property

        Public Property City() As String
            Get
                Return TxtCity.Value
            End Get
            Set(ByVal Value As String)
                TxtCity.Value = Value
            End Set
        End Property

        Public Property StateName() As String
            Get
                Return TxtState.Value
            End Get
            Set(ByVal Value As String)
                TxtState.Value = Value
            End Set
        End Property

        Public Property Zip() As String
            Get
                Return TxtZip.Value
            End Get
            Set(ByVal Value As String)
                TxtZip.Value = Value
            End Set
        End Property

#Region " Web Forms Designer Generated Code "

        Protected WithEvents TxtAddress As System.Web.UI.HtmlControls.HtmlInputText
        Protected WithEvents TxtCity As System.Web.UI.HtmlControls.HtmlInputText
        Protected WithEvents TxtState As System.Web.UI.HtmlControls.HtmlInputText
        Protected WithEvents TxtZip As System.Web.UI.HtmlControls.HtmlInputText

        Dim WithEvents pagelet3 As System.Web.UI.UserControl

        Sub New()
            pagelet3 = Me
            AddHandler pagelet3.Init, New System.EventHandler(AddressOf Me.pagelet3_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            AddHandler pagelet3.Load, New System.EventHandler(AddressOf Me.pagelet3_Load)
        End Sub

#End Region

        Protected Sub pagelet3_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            If Not IsPostBack Then   ' Evals true first time browser hits the page	

            End If
        End Sub

        Protected Sub pagelet3_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

    End Class
End Namespace