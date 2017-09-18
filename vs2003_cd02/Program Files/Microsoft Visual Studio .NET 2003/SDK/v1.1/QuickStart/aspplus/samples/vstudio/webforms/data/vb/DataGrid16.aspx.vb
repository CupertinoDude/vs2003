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
Imports System


Namespace Data.Vb

    Public Class DataGrid16
        Inherits System.Web.UI.Page

        Protected MyDataGrid As System.Web.UI.WebControls.DataGrid
        Protected BeginDate As System.Web.UI.WebControls.Calendar
        Protected EndDate As System.Web.UI.WebControls.Calendar
        Protected Submit1 As System.Web.UI.HtmlControls.HtmlInputButton
        Private components As System.ComponentModel.IContainer

        Dim MyConnection As SqlConnection

#Region " Web Forms Designer Generated Code "

        Dim WithEvents DataGrid16 As System.Web.UI.Page

        Sub New()
            DataGrid16 = Me
            AddHandler DataGrid16.Init, New System.EventHandler(AddressOf Me.DataGrid16_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub DataGrid16_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Protected Sub DataGrid16_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            If Not IsPostBack Then   ' Evals true first time browser hits the page	

            End If
        End Sub


        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Load, AddressOf Me.DataGrid16_Load
            AddHandler Me.Submit1.ServerClick, AddressOf Me.GetSales_Click

        End Sub

        Sub GetSales_Click(ByVal Sender As Object, ByVal E As EventArgs)

            Dim DS As DataSet
            Dim MyConnection As SqlConnection
            Dim MyCommand As SqlDataAdapter

            MyConnection = New SqlConnection("server=(local)\NetSDK;database=northwind;Integrated Security=SSPI")
            MyCommand = New SqlDataAdapter("Employee Sales By Country", MyConnection)

            MyCommand.SelectCommand.CommandType = CommandType.StoredProcedure

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@Beginning_Date", SqlDbType.DateTime))
            MyCommand.SelectCommand.Parameters("@Beginning_Date").Value = BeginDate.SelectedDate

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@Ending_Date", SqlDbType.DateTime))
            MyCommand.SelectCommand.Parameters("@Ending_Date").Value = EndDate.SelectedDate

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