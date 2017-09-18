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

    Public Class DataGrid13
        Inherits System.Web.UI.Page

        Protected MyDataGrid As System.Web.UI.WebControls.DataGrid
        Protected Message As System.Web.UI.HtmlControls.HtmlGenericControl
        Private components As System.ComponentModel.IContainer

        Dim MyConnection As SqlConnection

#Region " Web Forms Designer Generated Code "

        Dim WithEvents DataGrid13 As System.Web.UI.Page

        Sub New()
            DataGrid13 = Me
            AddHandler DataGrid13.Init, New System.EventHandler(AddressOf Me.DataGrid13_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub DataGrid13_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Protected Sub DataGrid13_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            Dim DS As DataSet
            Dim MyConnection As SqlConnection
            Dim MyCommand As SqlDataAdapter

            MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
            MyCommand = New SqlDataAdapter("select * from Authors", MyConnection)

            DS = New DataSet()
	
	    Try
	            MyCommand.Fill(DS, "Authors")
	
	            MyDataGrid.DataSource = DS.Tables("Authors").DefaultView
	            MyDataGrid.DataBind()
	    Catch ex as Exception
    		   Throw ex
	    Finally
    		  MyConnection.Close()
	    End Try
        End Sub


        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Load, AddressOf Me.DataGrid13_Load

        End Sub
    End Class

End Namespace