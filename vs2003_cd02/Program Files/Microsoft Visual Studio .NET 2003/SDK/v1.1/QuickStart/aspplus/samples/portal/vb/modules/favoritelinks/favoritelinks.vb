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
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports PortalModuleControl
Imports Microsoft.VisualBasic

Public Class FavoriteLinks : Inherits PortalModuleControl

	Public mySpan as HtmlContainerControl

    Protected Sub Page_Load(sender As Object, e As EventArgs)

		Dim dl As ArrayList = New ArrayList()
		Dim links As String = UserState("FavoriteLinks_List")
		Dim i As Integer

		If (links <> "") Then
			Dim s As String
			Dim linkList() As String = Split(links, ",")

			For i=0 To linkList.Length-1 Step 2
				If (String.Compare(linkList(i),"CATEGORY") = 0) Then
				  s = "<b><u><p>" + linkList(i+1) + "</b></u><p>"
				Else
				  s = "<img src='/Quickstart/aspplus/samples/portal/VB/images/bullet.gif' align='middle'> <a target='_new' href='" + linkList(i+1) + "'>" + linkList(i) + "</a><br>"
				End If
				dl.Add(s)
			Next i
		End If

		Dim innerHtml As String = ""
		Dim cnt As Integer = CInt(dl.Count / 2)

		for i=0 To cnt-1
			innerHtml += dl(i).ToString()
		Next i

		innerHtml += "</td><td align='left' height='25' valign='top' style='padding:15,15,15,15;"
		innerHtml += "border-color:black;border-style:solid;border-right:0;border-top:0;border-bottom:0;border-width:1;' >"
		innerHtml += ""

		for i=cnt To dl.Count-1
			innerHtml += dl(i).ToString()
		Next i

		innerHtml += ""
		mySpan.InnerHtml = innerHtml

	End Sub

End Class
