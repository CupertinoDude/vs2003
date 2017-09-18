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
Imports System.Data
Imports System.Data.SqlClient

Namespace DataService.Vb
    Public Class DataServiceClient
        Inherits System.Web.UI.Page

        Protected Authors_DataGrid As System.Web.UI.WebControls.DataGrid
        Protected Message As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected Submit1 As System.Web.UI.HtmlControls.HtmlInputButton
        Private components As System.ComponentModel.IContainer

#Region " Web Forms Designer Generated Code "

        Dim WithEvents DataServiceClient As System.Web.UI.Page

        Sub New()
            DataServiceClient = Me
            AddHandler DataServiceClient.Init, New System.EventHandler(AddressOf Me.DataServiceClient_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub DataServiceClient_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Protected Sub DataServiceClient_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            Dim D As DataService.Vb.DataServiceService = New DataService.Vb.DataServiceService()
            Dim MyData As DataSet = D.GetTitleAuthors()

            Authors_DataGrid.DataSource = MyData.Tables("Authors").DefaultView
            Authors_DataGrid.DataBind()

            Message.InnerHtml = "The number of rows is: " & MyData.Tables("Authors").Rows.Count.ToString()
        End Sub

        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Load, AddressOf Me.DataServiceClient_Load
            AddHandler Submit1.ServerClick, AddressOf Me.Submit_DataSet
        End Sub

        Protected Sub Submit_DataSet(ByVal Src As Object, ByVal E As System.EventArgs)

            Dim D As DataService.Vb.DataServiceService = New DataService.Vb.DataServiceService()
            Dim MyData As DataSet = D.GetTitleAuthors()

            'Remove three rows from the Authors table
            MyData.Tables("Authors").Rows.RemoveAt(0)
            MyData.Tables("Authors").Rows.RemoveAt(1)
            MyData.Tables("Authors").Rows.RemoveAt(2)

            Dim RowCount As Integer = D.PutTitleAuthors(MyData)

            Authors_DataGrid.DataSource = MyData.Tables("Authors").DefaultView
            Authors_DataGrid.DataBind()

            Message.InnerHtml = "The modified number of rows is: " & RowCount.ToString()
        End Sub

    End Class

End Namespace
