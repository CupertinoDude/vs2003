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
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports PortalModulePage
Imports Microsoft.VisualBasic

Public Class DeletePage : Inherits PortalModulePage

	Public pageName As String

	Private m_pageIndex As Integer
	Private m_pageList() As String

	Protected Sub Page_Load(sender As Object, e As EventArgs)
		Dim pageNames As String

        If Not Request.Cookies("_PageIndex") Is Nothing Then
		    m_pageIndex = Int32.Parse(Request.Cookies("_PageIndex").Value)
		End If

		If Not UserState("PageNames") Is Nothing Then
		    pageNames = UserState("PageNames")
    		m_pageList = Split(pageNames, ";")
    		pageName = m_pageList(m_pageIndex)
		End If
	End Sub

	Protected Sub Submit_Click(sender As Object, e As EventArgs)

		Dim s As String = ""
		Dim i As Integer

		For i=0 To m_pageList.Length-1
			If (i <> m_pageIndex) Then s += m_pageList(i) + ";"
		Next i

		'Shift Pages up
		For i = m_PageIndex To m_pageList.Length-2
			UserState("PageModules_" + i.ToString() + "L") = UserState("PageModules_" + (i+1).ToString() + "L")
			UserState("PageModules_" + i.ToString() + "R") = UserState("PageModules_" + (i+1).ToString() + "R")
		Next i

		UserState("PageModules_" + (m_pageList.Length-1).ToString() + "L") = ""
		UserState("PageModules_" + (m_pageList.Length-1).ToString() + "R") = ""
		UserState("PageNames") = TrimEnd(s, ";")

		Dim pageIndex As HttpCookie = New HttpCookie("_PageIndex", "0")

		pageIndex.Path = "/"
		pageIndex.Expires = New DateTime(2002, 10, 10)
		Response.Cookies.Add(pageIndex)
		Response.Redirect("/Quickstart/aspplus/samples/portal/VB/default.aspx")

	End Sub

	Protected Sub Cancel_Click(sender As Object, e As EventArgs)
		Response.Redirect("/Quickstart/aspplus/samples/portal/VB/default.aspx")
	End Sub

	Private Function TrimEnd(source As String, trimchar as String) As String

		Dim tc() as Char = trimchar.ToCharArray()
		TrimEnd = source.TrimEnd(tc)

	End Function

End Class