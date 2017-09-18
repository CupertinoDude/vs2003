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

    Public Class DataGrid3
        Inherits System.Web.UI.Page

        Protected MyDataGrid As System.Web.UI.WebControls.DataGrid
        Private components As System.ComponentModel.IContainer
        Protected MySelect As System.Web.UI.HtmlControls.HtmlSelect
        Protected Submit1 As System.Web.UI.HtmlControls.HtmlInputButton

        Dim MyConnection As SqlConnection

#Region " Web Forms Designer Generated Code "

        Dim WithEvents DataGrid3 As System.Web.UI.Page

        Sub New()
            DataGrid3 = Me
            AddHandler DataGrid3.Init, New System.EventHandler(AddressOf Me.DataGrid3_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub DataGrid3_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Protected Sub DataGrid3_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)

            MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")

            If Not (IsPostBack) Then

                Dim DS As DataSet
                Dim MyCommand As SqlDataAdapter

                MyCommand = New SqlDataAdapter("select distinct State from Authors", MyConnection)
                DS = New DataSet()
                MyCommand.Fill(DS, "States")

                MySelect.DataSource = DS.Tables("States").DefaultView
                MySelect.DataBind()
            End If
        End Sub

        Protected Sub DataGrid3_UnLoad(ByVal Sender As System.Object, ByVal e As System.EventArgs)
	    MyConnection.Close()
	End Sub

        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Load, AddressOf Me.DataGrid3_Load
            AddHandler Me.Submit1.ServerClick, AddressOf Me.GetAuthors_Click

        End Sub

        Sub GetAuthors_Click(ByVal Sender As Object, ByVal E As EventArgs)

            Dim DS As DataSet
            Dim MyCommand As SqlDataAdapter

            Dim SelectCmd As String = "select * from Authors where state = @State"

            MyCommand = New SqlDataAdapter(SelectCmd, MyConnection)

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@State", SqlDbType.NVarChar, 2))
            MyCommand.SelectCommand.Parameters("@State").Value = MySelect.Value

            DS = New DataSet()
            MyCommand.Fill(DS, "Authors")

            MyDataGrid.DataSource = DS.Tables("Authors").DefaultView
            MyDataGrid.DataBind()
        End Sub

    End Class

End Namespace