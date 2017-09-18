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
Imports System.ComponentModel.Design
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Text.RegularExpressions
Imports System.Web
Imports System.Web.SessionState
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports Microsoft.VisualBasic

Namespace Customize.Vb
    Public Class purchase
        Inherits System.Web.UI.Page

#Region " Web Forms Designer Generated Code "

        Protected WithEvents MyDataList As System.Web.UI.WebControls.DataList
        Protected WithEvents txtName As System.Web.UI.HtmlControls.HtmlInputText
        Protected WithEvents txtAddress As System.Web.UI.HtmlControls.HtmlInputText
        Protected WithEvents txtAccountNum As System.Web.UI.HtmlControls.HtmlInputText
        Protected WithEvents SubmitBtn As System.Web.UI.HtmlControls.HtmlInputButton
        Protected WithEvents Message As System.Web.UI.WebControls.Label

        Dim WithEvents purchase As System.Web.UI.Page

        Sub New()
            purchase = Me
            AddHandler purchase.Init, New System.EventHandler(AddressOf Me.purchase_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            AddHandler purchase.Load, New System.EventHandler(AddressOf Me.purchase_Load)
            AddHandler SubmitBtn.ServerClick, New System.EventHandler(AddressOf Me.SubmitBtn_Click)
        End Sub

#End Region

        Protected Sub purchase_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            If Not Request.QueryString("titleid") Is Nothing Then
                ' Validate the title using a regular expression
                '   wwdddd
                '   ^\w{2}\d{4}$
                If Regex.IsMatch(CStr(Request.QueryString("titleid")), "^\w{2}\d{4}$")
                    Dim DS As DataSet
                    Dim MyConnection As SqlConnection
                    Dim MyCommand As SqlDataAdapter

                    Dim Query As String
                    Query = "select * from Titles where title_id = '" & Request.QueryString("titleid") & "'"

                    MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
                    MyCommand = New SqlDataAdapter(Query, MyConnection)

                    DS = New DataSet()
                    Try
                        MyCommand.Fill(DS, "Titles")

                        MyDataList.DataSource = DS.Tables("Titles").DefaultView
                        MyDataList.DataBind()
                    Catch ex as Exception
                        Throw ex
                    Finally
                        MyConnection.Close()
                    End Try
                End If
            End If
        End Sub

        Protected Sub purchase_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

        Sub SubmitBtn_Click(ByVal Src As Object, ByVal E As EventArgs)
            Message.Text = "<h2>Purchase Made!!!</h2>"
        End Sub

    End Class
End Namespace