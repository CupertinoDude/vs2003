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
Imports system.Collections
Imports System.Collections.Specialized
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Data
Imports System.Data.SqlClient
Imports PortalModulePage
Imports Microsoft.VisualBasic

Public Class Customize : Inherits PortalModulePage

  Public pageName As String
  Public txtPageName As HtmlInputControl
  Public myDataGrid As DataGrid

  Private m_pageIndex As Integer
  Private m_pageList() As String
  Private m_Source As ArrayList

  Protected Sub Page_Load(sender As Object, e As EventArgs)

    Dim hshTable as NameValueCollection = CType(Context.GetConfig("system.web/dsnstore"), NameValueCollection)
    Dim dsn as String = CType(hshTable.Item("portaldb"), String)
    Dim myAdapter As SqlDataAdapter = New SqlDataAdapter()

    myAdapter.SelectCommand = New SqlCommand()
    myAdapter.SelectCommand.Connection = New SqlConnection(dsn)
    myAdapter.SelectCommand.CommandText =  "GetPublicModules"
    myAdapter.SelectCommand.CommandType = CommandType.StoredProcedure

    Dim myDataSet As DataSet = New DataSet()
    Try
        myAdapter.Fill(myDataSet,"Results")

        If (Not Request.Cookies("_PageIndex") Is Nothing) Then
          m_pageIndex = Int32.Parse(Request.Cookies("_PageIndex").Value)
        Else
          m_pageIndex = 0
        End If

        m_pageList = Split(UserState("PageNames"),";")
        pageName = m_pageList(m_pageIndex)

        Dim moduleHash As Hashtable = new Hashtable()
        Dim leftModules As String = UserState("PageModules_" + m_pageIndex.ToString() + "L")
        Dim i As Integer

        If (leftModules <> "") Then
          Dim leftModuleList() As String = Split(leftModules,";")

          For i=0 To leftModuleList.Length-1
             moduleHash(leftModuleList(i)) = True
          Next i
        End If

        Dim rightModules As String = UserState("PageModules_" + m_pageIndex.ToString() + "R")

        If (rightModules <> "") Then
          Dim rightModuleList() As String = Split(rightModules, ";")

          For i=0 To rightModuleList.Length-1
             moduleHash(rightModuleList(i)) = True
          Next i
        End If

        Dim rows As DataRowCollection = myDataSet.Tables(0).Rows

        m_Source = New ArrayList()

        For i=0 To rows.Count-1
          Dim propertyBag As Hashtable = new Hashtable()
          Dim j As Integer

          For j=0 To myDataSet.Tables(0).Columns.Count-1
            Dim value As Object = rows(i).Item(myDataSet.Tables(0).Columns(j))
            propertyBag(myDataSet.Tables(0).Columns(j).ToString()) = IIf(value Is Nothing, "", value.ToString())
          Next j

          If (Not moduleHash(propertyBag("Source")) Is Nothing) Then
             propertyBag("IsChecked") = True
          else
             propertyBag("IsChecked") = false
          End If

          m_Source.Add(propertyBag)
        Next i

        myDataGrid.DataSource = m_Source
        If (Not IsPostBack) Then DataBind()
    Catch ex as Exception
    	Throw ex
    Finally
    	myAdapter.SelectCommand.Connection.Close()
    End Try

  End Sub

  Protected Sub Submit_Click(sender As Object, e As EventArgs)

    Dim sLeft As String = ""
    Dim sRight As String = ""
    Dim i As Integer

    For i=0 To myDataGrid.Items.Count-1

      Dim mSelected As HtmlInputCheckBox = CType(myDataGrid.Items(i).FindControl("mSelected"), HtmlInputCheckBox)
      Dim mType As Label = CType(myDataGrid.Items(i).FindControl("mType"), Label)
      Dim hsh As Hashtable = CType(m_Source(i), Hashtable)

      If (mSelected.Checked) Then
        If (String.Compare (mType.Text ,"L") = 0) Then
          sLeft += hsh("Source").ToString() + ";"
        Else
          sRight += hsh("Source").ToString() + ";"
        End If
      End If

    Next i

    If (Request.Cookies("_PageIndex") Is Nothing ) Then m_pageIndex = 0

    If (String.Compare(UserState("UserId"),"ANONYMOUS") <> 0) Then
      UserState("PageModules_" + m_pageIndex.ToString() + "L") = TrimEnd(sLeft, ";")
      UserState("PageModules_" + m_pageIndex.ToString() + "R") = TrimEnd(sRight, ";")
    End If

    m_pageList(m_pageIndex) = txtPageName.Value

    Dim s As String = ""

    for i=0 To m_pageList.Length-1
      s += m_pageList(i) + ";"
    Next i

    UserState("PageNames") = TrimEnd(s, ";")
    Response.Redirect("/Quickstart/aspplus/samples/portal/VB/default.aspx")

  End Sub

  Private Function TrimEnd(source As String, trimchar as String) As String

    Dim tc() as Char = trimchar.ToCharArray()
    TrimEnd = source.TrimEnd(tc)

  End Function


End Class