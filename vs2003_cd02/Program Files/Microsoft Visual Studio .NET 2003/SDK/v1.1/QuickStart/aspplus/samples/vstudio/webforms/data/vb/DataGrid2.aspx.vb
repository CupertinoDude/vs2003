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

    Public Class DataGrid2
        Inherits System.Web.UI.Page

        Protected MyDataGrid As System.Web.UI.WebControls.DataGrid
        Protected Submit1 As System.Web.UI.HtmlControls.HtmlInputButton
        Protected MySelect As System.Web.UI.HtmlControls.HtmlSelect
        Private components As System.ComponentModel.IContainer


#Region " Web Forms Designer Generated Code "

        Dim WithEvents DataGrid2 As System.Web.UI.Page

        Sub New()
            DataGrid2 = Me
            AddHandler DataGrid2.Init, New System.EventHandler(AddressOf Me.DataGrid2_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub DataGrid2_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Protected Sub DataGrid2_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            If Not IsPostBack Then   ' Evals true first time browser hits the page	

            End If
        End Sub


        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Load, AddressOf Me.DataGrid2_Load
            AddHandler Me.Submit1.ServerClick, AddressOf Me.GetAuthors_Click

        End Sub

        Sub GetAuthors_Click(ByVal Sender As Object, ByVal E As EventArgs)

            Dim DS As DataSet
            Dim MyConnection As SqlConnection
            Dim MyCommand As SqlDataAdapter

            Dim SelectCommand As String = "select * from Authors where state = @State"

            MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
            MyCommand = New SqlDataAdapter(SelectCommand, MyConnection)

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@State", SqlDbType.NVarChar, 2))
            MyCommand.SelectCommand.Parameters("@State").Value = MySelect.Value

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

    End Class

End Namespace