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
Imports System.Collections
Imports System.Collections.Specialized
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Data
Imports System.Data.SqlClient
Imports PortalModulePage
Imports Microsoft.VisualBasic

Public Class SiteDirectoryEdit : Inherits PortalModulePage

  Public myDataGrid As DataGrid

  Protected Sub Page_Load(sender As Object, e As EventArgs)

    Dim hshTable as NameValueCollection = CType(Context.GetConfig("system.web/dsnstore"), NameValueCollection)
    Dim dsn as String = CType(hshTable.Item("portaldb"), String)

    Dim myAdapter As SqlDataAdapter = new SqlDataAdapter()
    myAdapter.SelectCommand  = new SQLCommand()
    myAdapter.SelectCommand.Connection = new SQLConnection(dsn)
    myAdapter.SelectCommand.CommandText = "GetSiteLinks"
    myAdapter.SelectCommand.CommandType = CommandType.StoredProcedure

    Dim myDataSet As DataSet = New DataSet()

    Try
        myAdapter.Fill(myDataSet, "Results")
    
        Dim LinkList() As String
        Dim LinkIndices As String = UserState("SiteDirectory_Links")
    
        If (LinkIndices <> "") Then
          LinkList = Split(LinkIndices, ",")
        End If
    
        Dim rows As DataRowCollection = myDataSet.Tables(0).Rows
        Dim index As Integer = 0
        Dim Source As ArrayList = New ArrayList()
        Dim i,j As Integer
    
        For i=0 To rows.Count-1
          Dim propertyBag As Hashtable = new Hashtable()
    
          For j=0 to myDataSet.Tables(0).Columns.Count-1
            Dim value As Object = rows(i).Item(myDataSet.Tables(0).Columns(j))
                    if (String.Compare(myDataSet.Tables(0).Columns(j).ToString(), "LinkRef") = 0) Then
              propertyBag(myDataSet.Tables(0).Columns(j).ToString()) = IIf(value Is Nothing, "" , Request.ApplicationPath + "/" + value.ToString())
            Else
              propertyBag(myDataSet.Tables(0).Columns(j).ToString()) = IIf(value Is Nothing, "" , value.ToString())
            End If
          Next j
    
          propertyBag("IsChecked") = False
    
          If (LinkIndices <> "") Then
            If ((index < LinkList.Length) And (i = (Int32.Parse(LinkList(index))-1))) Then
              propertyBag("IsChecked") = True
              index += 1
            End If
          End If
    
          Source.Add (propertyBag)
        Next i
    
        myDataGrid.DataSource = Source
        If (Not IsPostBack) Then DataBind()
    Catch ex as Exception
    	Throw ex
    Finally
    	myAdapter.SelectCommand.Connection.Close()
    End Try
    
    End Sub

  Protected Sub Submit_Click(sender As Object, e As EventArgs)

    Dim s As String = ""
    Dim i As Integer

    For i=0 To myDataGrid.Items.Count-1
      Dim cb As HtmlInputCheckBox = CType(myDataGrid.Items(i).FindControl("mSelected"), HtmlInputCheckBox)
      If (cb.Checked()) Then s += (i+1).ToString() + ","
    Next i

    UserState("SiteDirectory_Links") = TrimEnd(s, ",")
    Response.Redirect("/Quickstart/aspplus/samples/portal/VB/default.aspx")

  End Sub

  Private Function TrimEnd(source As String, trimchar as String) As String

    Dim tc() as Char = trimchar.ToCharArray()
    TrimEnd = source.TrimEnd(tc)

  End Function

End Class