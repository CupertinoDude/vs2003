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
Imports System.Web
Imports System.Web.SessionState
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports Microsoft.VisualBasic

Namespace Customize.Vb
    Public Class datalist7
        Inherits System.Web.UI.Page

#Region " Web Forms Designer Generated Code "

        Protected WithEvents MyDataList As System.Web.UI.WebControls.DataList
        Protected WithEvents Message As System.Web.UI.WebControls.Label
        Protected WithEvents EditBtn As System.Web.UI.WebControls.LinkButton
        Protected WithEvents edit_price As System.Web.UI.HtmlControls.HtmlInputText
        Protected WithEvents CancelBtn As System.Web.UI.WebControls.LinkButton
        Protected WithEvents UpdateBtn As System.Web.UI.WebControls.LinkButton

        Private WithEvents datalist7 As System.Web.UI.Page

        Sub New()
            datalist7 = Me
            AddHandler datalist7.Init, New System.EventHandler(AddressOf Me.datalist7_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            AddHandler datalist7.Load, New System.EventHandler(AddressOf Me.datalist7_Load)
            AddHandler MyDataList.CancelCommand, New System.Web.UI.WebControls.DataListCommandEventHandler(AddressOf Me.MyDataList_Cancel)
            AddHandler MyDataList.EditCommand, New System.Web.UI.WebControls.DataListCommandEventHandler(AddressOf Me.MyDataList_Edit)
            AddHandler MyDataList.UpdateCommand, New System.Web.UI.WebControls.DataListCommandEventHandler(AddressOf Me.MyDataList_Update)
        End Sub

#End Region

        Protected Sub datalist7_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            If Not (Page.IsPostBack) Then
                PopulateList()
            End If
        End Sub

        Protected Sub datalist7_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

        Sub PopulateList()

            Dim DS As DataSet
            Dim MyConnection As SqlConnection
            Dim MyCommand As SqlDataAdapter

            MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
            MyCommand = New SqlDataAdapter("select * from Titles where type = 'business'", MyConnection)

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
        End Sub

        Sub MyDataList_Edit(ByVal Sender As Object, ByVal E As DataListCommandEventArgs)

            MyDataList.EditItemIndex = CInt(E.Item.ItemIndex)
            PopulateList()
        End Sub

        Sub MyDataList_Update(ByVal Sender As Object, ByVal e As DataListCommandEventArgs)

            ' database update left out for simplicity's sake...
            Dim Price As String = CType(e.Item.FindControl("edit_price"), HtmlInputText).Value

            Message.Text = "Price Updated: " & Price
            MyDataList.EditItemIndex = -1
            PopulateList()
        End Sub

        Sub MyDataList_Cancel(ByVal Sender As Object, ByVal E As DataListCommandEventArgs)

            MyDataList.EditItemIndex = -1
            PopulateList()
        End Sub

    End Class


End Namespace