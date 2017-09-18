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

    Public Class DataGrid13_Details
        Inherits System.Web.UI.Page

        Protected MyDataGrid As System.Web.UI.WebControls.DataGrid
        Protected AuthorId As System.Web.UI.WebControls.Label

        Private components As System.ComponentModel.IContainer

        Dim MyConnection As SqlConnection

#Region " Web Forms Designer Generated Code "

        Dim WithEvents DataGrid13_Details As System.Web.UI.Page

        Sub New()
            DataGrid13_Details = Me
            AddHandler DataGrid13_Details.Init, New System.EventHandler(AddressOf Me.DataGrid13_Details_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub DataGrid13_Details_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Protected Sub DataGrid13_Details_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            AuthorId.Text = Request.QueryString("id")

            Dim DS As DataSet
            Dim MyConnection As SqlConnection
            Dim MyCommand As SqlDataAdapter

            Dim SelectCmd As String = "select t.title_id, t.type, t.pub_id, t.price " _
                             & "from titles t, titleauthor ta, authors a " _
                             & "where  ta.au_id=@Id AND ta.title_id=t.title_id AND ta.au_id = a.au_id"

            MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
            MyCommand = New SqlDataAdapter(SelectCmd, MyConnection)

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@Id", SqlDbType.NVarChar, 11))
            MyCommand.SelectCommand.Parameters("@Id").Value = Request.QueryString("id")

            DS = New DataSet()
	    Try
	        MyCommand.Fill(DS, "Titles")
	        MyDataGrid.DataSource = DS.Tables("Titles").DefaultView
	        MyDataGrid.DataBind()
	    Catch
	    Finally
		MyConnection.Close()
	    End Try
        End Sub


        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Load, AddressOf Me.DataGrid13_Details_Load

        End Sub
    End Class

End Namespace