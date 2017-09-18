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


Namespace Data.Vb

    Public Class DataGrid11
        Inherits System.Web.UI.Page

        Protected MyDataGrid As System.Web.UI.WebControls.DataGrid
        Private components As System.ComponentModel.IContainer

        Dim MyConnection As SqlConnection

#Region " Web Forms Designer Generated Code "

        Dim WithEvents DataGrid11 As System.Web.UI.Page

        Sub New()
            DataGrid11 = Me
            AddHandler DataGrid11.Init, New System.EventHandler(AddressOf Me.DataGrid11_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub DataGrid11_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Protected Sub DataGrid11_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")

            If Not (IsPostBack) Then
                BindGrid("au_id")
            End If
        End Sub

        Protected Sub DataGrid11_UnLoad(ByVal Sender As System.Object, ByVal e As System.EventArgs)
	    MyConnection.Close()
	End Sub

        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Load, AddressOf Me.DataGrid11_Load
            AddHandler Me.MyDataGrid.SortCommand, AddressOf Me.MyDataGrid_Sort

        End Sub

        Sub MyDataGrid_Sort(ByVal Sender As Object, ByVal E As DataGridSortCommandEventArgs)

            BindGrid(E.SortExpression)
        End Sub

        Sub BindGrid(ByVal SortField As String)

            Dim DS As DataSet
            Dim MyCommand As SqlDataAdapter
            MyCommand = New SqlDataAdapter("select * from Authors", MyConnection)

            DS = New DataSet()
            MyCommand.Fill(DS, "Authors")

            Dim Source As DataView = DS.Tables("Authors").DefaultView
            Source.Sort = SortField

            MyDataGrid.DataSource = Source
            MyDataGrid.DataBind()
        End Sub
    End Class

End Namespace