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
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports PortalModulePage
Imports Microsoft.VisualBasic

Public Class Layout : Inherits PortalModulePage

    Public selectSize As Integer = 5
    Public pageName As HtmlContainerControl
    Public mySelect As HtmlSelect
    Public mySelect2 As HtmlSelect

    Private m_moduleTable As Hashtable

    Private Sub BuildModuleList(list As HtmlSelect, modules As String)
        If Modules = "" Then Return

        Dim moduleList() As String = Split(modules, ";")
        Dim i As Integer

        For i=0 To moduleList.Length-1
            Dim moduleSource As String = ModuleList(i)
            If moduleSource <> "" Then
                list.Items.Add(New ListItem(m_moduleTable(moduleSource).ToString(), moduleSource))
            End If
        Next i
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        Dim pageIndex As Integer = 0

        If (Not Request.Cookies("_PageIndex") Is Nothing) Then
            pageIndex = Int32.Parse(Request.Cookies("_PageIndex").Value)
        End If

        If (String.Compare(Request.HttpMethod,"Post", True) <> 0) Then
            Dim hsh As NameValueCollection = CType(Context.GetConfig("system.web/dsnstore"), NameValueCollection)
            Dim dsn As String = CType(hsh.Item("portaldb"), String)

            Dim myAdapter As SqlDataAdapter = new SqlDataAdapter()
            myAdapter.SelectCommand = New SqlCommand()
            myAdapter.SelectCommand.Connection = New SqlConnection(dsn)
            myAdapter.SelectCommand.CommandType = CommandType.StoredProcedure
            myAdapter.SelectCommand.CommandText = "GetPublicModules"

            Dim myDataSet As DataSet = new DataSet()
	    Try 
                myAdapter.Fill(myDataSet, "Results")

               Dim source As DataView = myDataSet.Tables(0).DefaultView
               Dim i As Integer

               m_moduleTable = new Hashtable()

               For i=0 To source.Count-1
                   Dim moduleName As String = source.Item(i).Item("Name").ToString()
                   Dim moduleSource As String = source.Item(i).Item("Source").ToString()
                   m_moduleTable(moduleSource) = moduleName
               Next i

               BuildModuleList(mySelect, UserState("PageModules_" + pageIndex.ToString() + "L"))
               BuildModuleList(mySelect2, UserState("PageModules_" + pageIndex.ToString() + "R"))

               Dim pageNames As String = UserState("PageNames")
               If (pageNames = "") Then Return

               Dim pageList() As String = Split(pageNames, ";")
               pageName.InnerHtml = pageList(pageIndex)
	   Catch ex as Exception
	       Throw ex
	   Finally
	       myAdapter.SelectCommand.Connection.Close()
	   End Try
        ElseIf Not IsPostBack()
            Dim leftModules As String = Request.Form("mySelect")
            Dim leftModuleList() As String = Split(leftModules, ",")
            Dim sLeft As String = ""
            Dim i As Integer

            For i=0 To leftModuleList.Length-1
                sLeft += leftModuleList(i) + ";"
            Next i

            Dim rightModules As String = Request.Form("mySelect2")
            Dim rightModuleList() As String = Split(rightModules, ",")
            Dim sRight As String = ""

            For i=0 To rightModuleList.Length-1
                sRight += rightModuleList(i) + ";"
            Next i

            If (String.Compare(UserState("UserId"),"ANONYMOUS") <> 0) Then
                UserState("PageModules_" + pageIndex.ToString() + "L") = TrimEnd(sLeft, ";")
                UserState("PageModules_" + pageIndex.ToString() + "R") = TrimEnd(sRight, ";")
            End If

            Response.Redirect("/Quickstart/aspplus/samples/portal/VB/default.aspx")
        End If
    End Sub

    Private Function TrimEnd(source As String, trimchar as String) As String
        Dim tc() as Char = trimchar.ToCharArray()
        TrimEnd = source.TrimEnd(tc)
    End Function

End Class
