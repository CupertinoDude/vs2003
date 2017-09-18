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

Option Strict Off

Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls

Public Class MyCodeBehind : Inherits Page

    Public Name As TextBox
    Public Category As DropDownList
    Public MyList As DataList

    Public Sub SubmitBtn_Click(Sender As Object, E As EventArgs)

        If (Page.IsValid)

          Dim DS As DataSet
          Dim MyConnection As SqlConnection
          Dim MyCommand As SqlDataAdapter

          MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")

          Dim query As String
          query = "select * from Titles where type='" & Category.SelectedItem.Value & "'"

          MyCommand = New SqlDataAdapter("select * from Titles where type='" & Category.SelectedItem.Value & "'", myConnection)

          DS = new DataSet()
          MyCommand.Fill(DS, "Titles")

          MyList.DataSource = DS.Tables("Titles").DefaultView
          MyList.DataBind()

        End If
        
    End Sub

End Class