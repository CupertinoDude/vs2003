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
Imports System.Collections


Namespace Data.Vb

    Public Class xmlgen
        Inherits System.Web.UI.Page

        Protected GetBoth As System.Web.UI.HtmlControls.HtmlInputRadioButton
        Private components As System.ComponentModel.IContainer

        Public Source As DataView
        Public DS As DataSet
        Protected WithEvents query As System.Web.UI.WebControls.Label
        Protected WithEvents table As System.Web.UI.WebControls.DropDownList
        Protected WithEvents database As System.Web.UI.WebControls.DropDownList
        Protected WithEvents connect As System.Web.UI.WebControls.Label

        Shared originalString As String = "server=(local)\NetSDK;database=;Integrated Security=SSPI"
        Dim connectString As String = originalString
        Dim selectString As String = ""

        Dim tables(4) As Object
        Protected WithEvents lblXml As System.Web.UI.WebControls.Label
        Protected WithEvents lblData As System.Web.UI.WebControls.Label
        Protected WithEvents MyDataGrid As System.Web.UI.WebControls.DataGrid
        Protected WithEvents GetSchema As System.Web.UI.HtmlControls.HtmlInputRadioButton
        Protected WithEvents GetData As System.Web.UI.HtmlControls.HtmlInputRadioButton
        Protected WithEvents Submit As System.Web.UI.HtmlControls.HtmlInputButton


#Region " Web Forms Designer Generated Code "

        Dim WithEvents xmlgen As System.Web.UI.Page

        Sub New()
            xmlgen = Me
            AddHandler xmlgen.Init, New System.EventHandler(AddressOf Me.xmlgen_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub xmlgen_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
            AddHandler Load, AddressOf Me.xmlgen_Load
        End Sub

#End Region

        Protected Sub xmlgen_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
            If tables(0) Is Nothing Then
                tables(0) = New String() {"authors", "discounts", "employee", "jobs", "publishers", "sales", "stores", "titleauthor", "titles"}
                tables(1) = New String() {"Categories", "Customers", "Employees", "Orders", "Products", "Region", "Shippers", "Suppliers", "Territories"}
                tables(2) = New String() {"Categories", "Customers", "ProductDetails", "Products"}
                tables(3) = New String() {"Modules", "Personalization", "SiteDirectory", "UserData"}
            End If

            If Not IsPostBack Then
                database_SelectedIndexChanged(database, Nothing)
            End If

            Inititalize()
        End Sub


        Private Sub InitializeComponent()

        End Sub

        Private Sub Inititalize()
            connectString = originalString.Replace("database=", "database=" + database.SelectedItem.Text)
            selectString = "select * from " & table.SelectedItem.Text

            connect.Text = connectString
            query.Text = selectString

            lblXml.Visible = False
            lblData.Visible = False
        End Sub

        Public Sub database_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles database.SelectedIndexChanged
            table.DataSource = tables(database.SelectedIndex)
            table.DataBind()

            Inititalize()
        End Sub

        Public Sub table_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles table.SelectedIndexChanged
            Inititalize()
        End Sub

        Private Sub Submit_ServerClick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Submit.ServerClick

            If (Page.IsPostBack) Then

                Dim MyConnection As SqlConnection
                Dim MyCommand As SqlDataAdapter

                MyConnection = New SqlConnection(connectString)
                MyCommand = New SqlDataAdapter(selectString, MyConnection)

                DS = New DataSet()
                Try
                    MyCommand.Fill(DS, "Table")

                    Source = New DataView(DS.Tables(0))

                    MyDataGrid.DataSource = Source
                    MyDataGrid.DataBind()

                    lblData.Text = "<b>Data:</b><br>"
                    lblData.Visible = True

                    lblXml.Text = "<b>Result:</b><br>"
                    lblXml.Text &= "<textarea cols=80 rows=25>"

                    If GetSchema.Checked Then
                        lblXml.Text &= DS.GetXmlSchema()
                    ElseIf GetData.Checked Then
                        lblXml.Text &= DS.GetXml()
                    End If

                    lblXml.Text &= "</textarea>"
                    lblXml.Visible = True
                Catch ex As Exception
                    Throw ex
                Finally
                    MyConnection.Close()
                End Try
            End If
        End Sub
    End Class
End Namespace