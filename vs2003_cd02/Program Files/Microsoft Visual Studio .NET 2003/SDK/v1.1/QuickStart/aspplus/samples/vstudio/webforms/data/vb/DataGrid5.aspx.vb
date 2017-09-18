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

    Public Class DataGrid5
        Inherits System.Web.UI.Page

        Protected au_fname As System.Web.UI.HtmlControls.HtmlInputText
        Protected zip As System.Web.UI.HtmlControls.HtmlInputText
        Protected au_lname As System.Web.UI.HtmlControls.HtmlInputText
        Protected address As System.Web.UI.HtmlControls.HtmlInputText
        Protected au_fnameReqVal As System.Web.UI.WebControls.RequiredFieldValidator
        Protected phone As System.Web.UI.HtmlControls.HtmlInputText
        Protected city As System.Web.UI.HtmlControls.HtmlInputText
        Protected au_lnameReqVal As System.Web.UI.WebControls.RequiredFieldValidator
        Protected MyDataGrid As System.Web.UI.WebControls.DataGrid
        Protected au_id As System.Web.UI.HtmlControls.HtmlInputText
        Protected contract As System.Web.UI.HtmlControls.HtmlSelect
        Protected phoneReqVal As System.Web.UI.WebControls.RequiredFieldValidator
        Protected Submit1 As System.Web.UI.HtmlControls.HtmlInputButton
        Protected au_idRegexVal As System.Web.UI.WebControls.RegularExpressionValidator
        Protected au_idReqVal As System.Web.UI.WebControls.RequiredFieldValidator
        Protected RegularExpressionValidator1 As System.Web.UI.WebControls.RegularExpressionValidator
        Protected state As System.Web.UI.HtmlControls.HtmlSelect
        Protected phoneRegexVal As System.Web.UI.WebControls.RegularExpressionValidator
        Private components As System.ComponentModel.IContainer
        Protected Message As System.Web.UI.HtmlControls.HtmlGenericControl

        Dim MyConnection As SqlConnection

#Region " Web Forms Designer Generated Code "

        Dim WithEvents DataGrid5 As System.Web.UI.Page

        Sub New()
            DataGrid5 = Me
            AddHandler DataGrid5.Init, New System.EventHandler(AddressOf Me.DataGrid5_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub DataGrid5_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Protected Sub DataGrid5_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")

            If Not (IsPostBack) Then
                BindGrid()
                Page.DataBind()
            End If
        End Sub


        Protected Sub DataGrid5_UnLoad(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            MyConnection.Close()
        End Sub

        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Load, AddressOf Me.DataGrid5_Load
            AddHandler Me.Submit1.ServerClick, AddressOf Me.AddAuthor_Click

        End Sub

        Sub AddAuthor_Click(ByVal Sender As Object, ByVal E As EventArgs)
            Message.InnerHtml = ""

            If (Page.IsValid) Then

                Dim DS As DataSet
                Dim MyCommand As SqlCommand

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

            End If

            BindGrid()
        End Sub

        Sub BindGrid()

            Dim DS As DataSet
            Dim MyCommand As SqlDataAdapter
            MyCommand = New SqlDataAdapter("select * from Authors", MyConnection)

            DS = New DataSet()
            MyCommand.Fill(DS, "Authors")

            MyDataGrid.DataSource = DS.Tables("Authors").DefaultView
            MyDataGrid.DataBind()
        End Sub
    End Class

End Namespace