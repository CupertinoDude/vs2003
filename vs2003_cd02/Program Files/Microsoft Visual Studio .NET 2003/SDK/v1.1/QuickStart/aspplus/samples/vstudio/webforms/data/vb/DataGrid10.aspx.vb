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

    Public Class DataGrid10
        Inherits System.Web.UI.Page

        Protected MyDataGrid As System.Web.UI.WebControls.DataGrid
        Protected Message As System.Web.UI.HtmlControls.HtmlGenericControl
        Private components As System.ComponentModel.IContainer

        Dim MyConnection As SqlConnection

#Region " Web Forms Designer Generated Code "

        Dim WithEvents DataGrid10 As System.Web.UI.Page

        Sub New()
            DataGrid10 = Me
            AddHandler DataGrid10.Init, New System.EventHandler(AddressOf Me.DataGrid10_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub DataGrid10_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Protected Sub DataGrid10_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")

            If Not (IsPostBack) Then
                BindGrid()
            End If
        End Sub

	Protected Sub DataGrid10_UnLoad(ByVal Sender As System.Object, ByVal e As System.EventArgs)
		MyConnection.Close()
	End Sub
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Load, AddressOf Me.DataGrid10_Load
            AddHandler Me.MyDataGrid.DeleteCommand, AddressOf Me.MyDataGrid_Delete

        End Sub

        Sub MyDataGrid_Delete(ByVal Sender As Object, ByVal E As DataGridCommandEventArgs)

            Dim MyCommand As SqlCommand
            Dim DeleteCmd As String = "DELETE from Employee where emp_id = @Id"

            MyCommand = New SqlCommand(DeleteCmd, MyConnection)
            MyCommand.Parameters.Add(New SqlParameter("@Id", SqlDbType.NVarChar, 11))
            MyCommand.Parameters("@Id").Value = MyDataGrid.DataKeys(CInt(E.Item.ItemIndex))

            MyCommand.Connection.Open()

            Try
                MyCommand.ExecuteNonQuery()
                Message.InnerHtml = "<b>Record Deleted</b><br>" & DeleteCmd
            Catch Exc As SQLException
                Message.InnerHtml = "ERROR: Could not delete record"
                Message.Style("color") = "red"
            End Try

            MyCommand.Connection.Close()

            BindGrid()
        End Sub

        Sub BindGrid()

            Dim DS As DataSet
            Dim MyCommand As SqlDataAdapter
            MyCommand = New SqlDataAdapter("select * from Employee", MyConnection)

            DS = New DataSet()
            MyCommand.Fill(DS, "Employee")

            MyDataGrid.DataSource = DS.Tables("Employee").DefaultView
            MyDataGrid.DataBind()
        End Sub
    End Class

End Namespace