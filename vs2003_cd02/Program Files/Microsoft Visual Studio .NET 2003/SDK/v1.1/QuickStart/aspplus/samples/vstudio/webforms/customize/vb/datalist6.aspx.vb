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
    Public Class datalist6
        Inherits System.Web.UI.Page

        Private MyConnection As System.Data.SqlClient.SqlConnection

#Region " Web Forms Designer Generated Code "

        Protected WithEvents MyDataList As System.Web.UI.WebControls.DataList
        Protected WithEvents Message As System.Web.UI.WebControls.Label
        Protected WithEvents DetailsImage As System.Web.UI.HtmlControls.HtmlImage
        Protected WithEvents DetailsPubId As System.Web.UI.WebControls.Label
        Protected WithEvents DetailsTitleId As System.Web.UI.WebControls.Label
        Protected WithEvents DetailsType As System.Web.UI.WebControls.Label
        Protected WithEvents DetailsPrice As System.Web.UI.WebControls.Label
        Protected WithEvents PurchaseLink As System.Web.UI.WebControls.HyperLink
        Protected WithEvents DetailsTitle As System.Web.UI.WebControls.Label

        Dim WithEvents datalist6 As System.Web.UI.Page

        Sub New()
            datalist6 = Me
            AddHandler datalist6.Init, New System.EventHandler(AddressOf Me.datalist6_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            AddHandler datalist6.Load, New System.EventHandler(AddressOf Me.datalist6_Load)
        End Sub

#End Region

        Protected Sub datalist6_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")

            Dim DS As New DataSet()
            Dim MyCommand As New SqlDataAdapter("select * from Titles where type = 'business'", MyConnection)

            MyCommand.Fill(DS, "Titles")

            MyDataList.DataSource = DS.Tables("Titles").DefaultView

            If Not (Page.IsPostBack) Then
                MyDataList.DataBind()
            End If
        End Sub

        Protected Sub datalist6_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

        Sub MyDataList_Select(ByVal Sender As Object, ByVal E As EventArgs)

            Dim Title As String = MyDataList.DataKeys(MyDataList.SelectedItem.ItemIndex).ToString()
            Dim MyCommand As New SqlDataAdapter("select * from Titles where title_id = '" & Title & "'", MyConnection)

            Dim DS As New DataSet()
            MyCommand.Fill(DS, "TitleDetails")

            Dim RowView As DataRowView = DS.Tables("TitleDetails").DefaultView(0)

            DetailsImage.Src = "/quickstart/aspplus/images/title-" & RowView("title_id").ToString() & ".gif"
            DetailsPubId.Text = "<b>Publisher ID: </b>" & RowView("pub_id").ToString() & "<br>"
            DetailsTitleId.Text = "<b>Title ID: </b>" & RowView("title_id").ToString() & "<br>"
            DetailsType.Text = "<b>Category: </b>" & RowView("type").ToString() + "<br>"
            DetailsPrice.Text = "<b>Price: </b> $ " & RowView("price").ToString() + "<p>"
            PurchaseLink.Text = "<img border='0' src='/quickstart/aspplus/images/purchase_book.gif' >"
            PurchaseLink.NavigateUrl = "purchase.aspx?titleid=" & RowView("title_id").ToString()
            DetailsTitle.Text = RowView("title").ToString()

            DetailsImage.Visible = True

            MyDataList.DataBind()
        End Sub

        Sub MyDataList_ItemCommand(ByVal Sender As Object, ByVal e As DataListCommandEventArgs)

            Dim Title As String = MyDataList.DataKeys(E.Item.ItemIndex).ToString()
            Dim Command As String = e.CommandName

            If Command.Equals("Discuss") Then

                ShowDiscussions(Title)

            ElseIf Command.Equals("Ratings") Then

                ShowRatings(Title)

            End If
        End Sub

        Sub ShowRatings(ByVal Title As String)
            Message.Text = String.Format("<h5>Ratings for {0}</h5>", title)
            Message.Text &= "Print Ratings here..."
        End Sub

        Sub ShowDiscussions(ByVal Title As String)
            Message.Text = String.Format("<h5>Discussions for {0}</h5>",title)
            Message.Text &= "Print Discussions here..."
        End Sub

    End Class

End Namespace