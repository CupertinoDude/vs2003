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
    Public Class datalist8
        Inherits System.Web.UI.Page

#Region " Web Forms Designer Generated Code "

        Protected WithEvents MyDataList As System.Web.UI.WebControls.DataList
        Protected WithEvents Save As System.Web.UI.WebControls.CheckBox
        Protected WithEvents Message As System.Web.UI.WebControls.Label
        Protected WithEvents SubmitBtn As System.Web.UI.HtmlControls.HtmlInputButton

        Private WithEvents datalist8 As System.Web.UI.Page

        Sub New()
            datalist8 = Me
            AddHandler datalist8.Init, New System.EventHandler(AddressOf Me.datalist8_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            AddHandler datalist8.Load, New System.EventHandler(AddressOf Me.datalist8_Load)
            AddHandler SubmitBtn.ServerClick, New System.EventHandler(AddressOf Me.SubmitBtn_Click)
        End Sub

#End Region

        Protected Sub datalist8_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            If Not (Page.IsPostBack) Then

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
            End If
        End Sub

        Protected Sub datalist8_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

        Sub SubmitBtn_Click(ByVal Src As System.Object, ByVal e As System.EventArgs)

            Dim i As Integer

            For i = 0 To MyDataList.Items.Count - 1
                Dim CurrentCheckBox As CheckBox
                CurrentCheckBox = CType(MyDataList.Items(i).FindControl("Save"), CheckBox)
                Message.Text &= "Item(" & i.ToString() & "): " & CurrentCheckBox.Checked.ToString() & "<br>"
            Next
        End Sub

    End Class

End Namespace