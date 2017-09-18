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

Namespace Pagelets.Vb.UserControls
    Public Class pagelet6
        Inherits System.Web.UI.UserControl

#Region " Web Forms Designer Generated Code "

        Protected WithEvents Category As System.Web.UI.WebControls.DropDownList
        Protected WithEvents MyDataList As System.Web.UI.WebControls.DataList

        Dim WithEvents pagelet6 As System.Web.UI.UserControl

        Sub New()
            pagelet6 = Me
            AddHandler pagelet6.Init, New System.EventHandler(AddressOf Me.pagelet6_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            AddHandler pagelet6.Load, New System.EventHandler(AddressOf Me.pagelet6_Load)
            AddHandler Category.SelectedIndexChanged, New System.EventHandler(AddressOf Me.Category_SelectedIndexChanged)
        End Sub

#End Region

        Protected Sub pagelet6_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            If Not (Page.IsPostBack) Then

                Dim DS As DataSet
                Dim MyConnection As SqlConnection
                Dim MyCommand As SqlDataAdapter

                MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
                MyCommand = New SqlDataAdapter("select * from Titles where type='" & Category.SelectedItem.Value & "'", MyConnection)

                DS = New DataSet()
                MyCommand.Fill(DS, "Titles")

                MyDataList.DataSource = DS.Tables("Titles").DefaultView
                MyDataList.DataBind()
            End If
        End Sub

        Protected Sub pagelet6_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

        Protected Sub Category_SelectedIndexChanged(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            Dim DS As DataSet
            Dim MyConnection As SqlConnection
            Dim MyCommand As SqlDataAdapter

            MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
            MyCommand = New SqlDataAdapter("select * from Titles where type='" & Category.SelectedItem.Value & "'", MyConnection)

            DS = New DataSet()
            MyCommand.Fill(DS, "Titles")

            MyDataList.DataSource = DS.Tables("Titles").DefaultView
            MyDataList.DataBind()
        End Sub

    End Class
End Namespace