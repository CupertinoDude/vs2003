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

    Public Class DataGrid4
        Inherits System.Web.UI.Page

        Protected au_lname As System.Web.UI.HtmlControls.HtmlInputText
        Protected address As System.Web.UI.HtmlControls.HtmlInputText
        Protected contract As System.Web.UI.HtmlControls.HtmlSelect
        Protected Submit1 As System.Web.UI.HtmlControls.HtmlInputButton
        Protected state As System.Web.UI.HtmlControls.HtmlSelect
        Protected zip As System.Web.UI.HtmlControls.HtmlInputText
        Protected au_id As System.Web.UI.HtmlControls.HtmlInputText
        Protected city As System.Web.UI.HtmlControls.HtmlInputText
        Protected au_fname As System.Web.UI.HtmlControls.HtmlInputText
        Protected MyDataGrid As System.Web.UI.WebControls.DataGrid
        Protected phone As System.Web.UI.HtmlControls.HtmlInputText
        Private components As System.ComponentModel.IContainer
        Protected Message As System.Web.UI.HtmlControls.HtmlGenericControl

        Dim MyConnection As SqlConnection



#Region " Web Forms Designer Generated Code "

        Dim WithEvents DataGrid4 As System.Web.UI.Page

        Sub New()
            DataGrid4 = Me
            AddHandler DataGrid4.Init, New System.EventHandler(AddressOf Me.DataGrid4_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub DataGrid4_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Protected Sub DataGrid4_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")

            If Not (IsPostBack) Then
                BindGrid()
                Page.DataBind()
            End If
        End Sub

        Protected Sub DataGrid4_UnLoad(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            MyConnection.Close()
        End Sub

        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Load, AddressOf Me.DataGrid4_Load
            AddHandler Me.Submit1.ServerClick, AddressOf Me.AddAuthor_Click
        End Sub

        Public Sub AddAuthor_Click(ByVal Sender As System.Object, ByVal E As System.EventArgs)
            Page.Validate()
            If Not Page.IsValid Then
                Return
            End If

            Dim DS As DataSet
            Dim MyCommand As SqlCommand

            If au_id.Value = "" Or au_fname.Value = "" Or au_lname.Value = "" Or phone.Value = "" Then

                Message.InnerHtml = "ERROR: Null values not allowed for Author ID, Name or Phone"
                Message.Style("color") = "red"
                BindGrid()
            End If

            Dim InsertCmd As String = "insert into Authors (au_id, au_lname, au_fname, phone, address, city, state, zip, contract) values (@Id, @LName, @FName, @Phone, @Address, @City, @State, @Zip, @Contract)"

            MyCommand = New SqlCommand(InsertCmd, MyConnection)

            MyCommand.Parameters.Add(New SqlParameter("@Id", SqlDbType.NVarChar, 11))
            MyCommand.Parameters("@Id").Value = au_id.Value

            MyCommand.Parameters.Add(New SqlParameter("@LName", SqlDbType.NVarChar, 40))
            MyCommand.Parameters("@LName").Value = au_lname.Value

            MyCommand.Parameters.Add(New SqlParameter("@FName", SqlDbType.NVarChar, 20))
            MyCommand.Parameters("@FName").Value = au_fname.Value

            MyCommand.Parameters.Add(New SqlParameter("@Phone", SqlDbType.NChar, 12))
            MyCommand.Parameters("@Phone").Value = phone.Value

            MyCommand.Parameters.Add(New SqlParameter("@Address", SqlDbType.NVarChar, 40))
            MyCommand.Parameters("@Address").Value = address.Value

            MyCommand.Parameters.Add(New SqlParameter("@City", SqlDbType.NVarChar, 20))
            MyCommand.Parameters("@City").Value = city.Value

            MyCommand.Parameters.Add(New SqlParameter("@State", SqlDbType.NChar, 2))
            MyCommand.Parameters("@State").Value = state.Value

            MyCommand.Parameters.Add(New SqlParameter("@Zip", SqlDbType.NChar, 5))
            MyCommand.Parameters("@Zip").Value = zip.Value

            MyCommand.Parameters.Add(New SqlParameter("@Contract", SqlDbType.NVarChar, 1))
            MyCommand.Parameters("@Contract").Value = contract.Value

            MyCommand.Connection.Open()

            Try
                MyCommand.ExecuteNonQuery()
                Message.InnerHtml = "<b>Record Added</b><br>" & InsertCmd.ToString()

            Catch Exp As SqlException
                If Exp.Number = 2627 Then
                    Message.InnerHtml = "ERROR: A record already exists with the same primary key"
                Else
                    Message.InnerHtml = "ERROR: Could not add record, please ensure the fields are correctly filled out"
                End If
                Message.Style("color") = "red"

            End Try

            MyCommand.Connection.Close()

            BindGrid()
        End Sub

        Sub BindGrid()

            Dim MyCommand As SqlDataAdapter = New SqlDataAdapter("select * from Authors", MyConnection)

            Dim DS As DataSet = New DataSet()
            MyCommand.Fill(DS, "Authors")

            MyDataGrid.DataSource = DS.Tables("Authors").DefaultView
            MyDataGrid.DataBind()
        End Sub

    End Class

End Namespace