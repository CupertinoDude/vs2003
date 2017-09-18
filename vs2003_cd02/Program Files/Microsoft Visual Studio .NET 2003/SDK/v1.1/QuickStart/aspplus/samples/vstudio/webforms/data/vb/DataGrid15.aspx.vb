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
Imports System.Drawing
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Data
Imports System.Data.SqlClient


Namespace Data.Vb

    Public Class DataGrid15
        Inherits System.Web.UI.Page

        Protected SelectYear As System.Web.UI.HtmlControls.HtmlSelect
        Protected MyDataGrid As System.Web.UI.WebControls.DataGrid
        Protected SelectCategory As System.Web.UI.HtmlControls.HtmlSelect
        Protected Submit1 As System.Web.UI.HtmlControls.HtmlInputButton
        Private components As System.ComponentModel.IContainer

        Dim MyConnection As SqlConnection

#Region " Web Forms Designer Generated Code "

        Dim WithEvents DataGrid15 As System.Web.UI.Page

        Sub New()
            DataGrid15 = Me
            AddHandler DataGrid15.Init, New System.EventHandler(AddressOf Me.DataGrid15_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub DataGrid15_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Protected Sub DataGrid15_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            If Not IsPostBack Then   ' Evals true first time browser hits the page	

            End If
        End Sub


        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Load, AddressOf Me.DataGrid15_Load
            AddHandler Me.Submit1.ServerClick, AddressOf Me.GetEmployees_Click

        End Sub

        Sub GetEmployees_Click(ByVal Sender As Object, ByVal E As System.EventArgs)

            Dim DS As DataSet
            Dim MyConnection As SqlConnection
            Dim MyCommand As SqlDataAdapter

            MyConnection = New SqlConnection("server=(local)\NetSDK;database=northwind;Integrated Security=SSPI")
            MyCommand = New SqlDataAdapter("SalesByCategory", MyConnection)

            MyCommand.SelectCommand.CommandType = CommandType.StoredProcedure

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@CategoryName", SqlDbType.NVarChar, 15))
            MyCommand.SelectCommand.Parameters("@CategoryName").Value = SelectCategory.Value

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@OrdYear", SqlDbType.NVarChar, 4))
            MyCommand.SelectCommand.Parameters("@OrdYear").Value = SelectYear.Value

            DS = New DataSet()
	    Try
            	MyCommand.Fill(DS, "Sales")

            	MyDataGrid.DataSource = DS.Tables("Sales").DefaultView
            	MyDataGrid.DataBind()
	    Catch ex as Exception
    		Throw ex
	    Finally
    		MyConnection.Close()
	    End Try
        End Sub

    End Class

End Namespace