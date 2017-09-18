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
Imports System.Collections
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports PortalModulePage
Imports Microsoft.VisualBasic

Public Class DefaultPage : Inherits PortalModulePage

    Public anchorDelete as HtmlAnchor
    Public anchorCustomize as HtmlAnchor
    Public anchorOptions as HtmlAnchor
    Public anchorOptions2 as HtmlAnchor
    Public anchorAdd as HtmlAnchor
    Public anchorSignOff as HtmlAnchor
    Public spanAdd as Label
    Public spanDelete as Label
    Public spanSignOff as Label
    Public PagePanelLinks As HtmlContainerControl
    Public LeftUIModules As PlaceHolder
    Public RightUIModules As PlaceHolder
    Public Login as Panel

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        Dim PageIndex as Long = 0
        Dim myPage as Page = CType(sender, Page)

        If (Request.QueryString.Item("_PageIndex") <> "") Then
            SetPageIndex(Request.QueryString.Item("_PageIndex"))
            PageIndex = Int32.Parse(Request.QueryString("_PageIndex"))
        ElseIf (Not Request.Cookies("_PageIndex") Is Nothing) Then
            PageIndex = Int32.Parse(Request.Cookies("_PageIndex").Value)
        End If


        If (PageIndex <> 0) Then
            anchorDelete.Visible = True
            spanDelete.Visible = True
        Else
            anchorDelete.Visible = False
            spanDelete.Visible = False
        End If

        anchorDelete.HRef = "/Quickstart/aspplus/samples/portal/VB/restricted/deletepage.aspx"
        anchorCustomize.HRef = "/Quickstart/aspplus/samples/portal/VB/restricted/customize.aspx"
        anchorOptions.HRef = "/Quickstart/aspplus/samples/portal/VB/restricted/options.aspx"
        anchorOptions2.HRef = "/Quickstart/aspplus/samples/portal/VB/restricted/layout.aspx"

        'Dynamically Construct Page Hyperlink List
        BuildPaneLinkList(PagePanelLinks, PageIndex)

        'Dynamically Construct Module List for Current Page
        BuildModuleList(LeftUIModules, UserState("PageModules_" + PageIndex.ToString() + "L"))
        BuildModuleList(RightUIModules, UserState("PageModules_" + PageIndex.toString() + "R"))
        DataBind()

        If (UserState("UserId") = "ANONYMOUS") Then
            Login.Visible=True
            anchorSignOff.Visible = False
            spanSignOff.Visible = False
        Else
            anchorSignOff.Visible = True
            spanSignOff.Visible = True
        End If
    End Sub

    Protected Sub SignOff_Click(myPage As Object, e As EventArgs)
        SetPageIndex("0")
        System.Web.Security.FormsAuthentication.SignOut()
        Response.Redirect("/Quickstart/aspplus/samples/portal/VB/default.aspx")
    End Sub

    Protected Sub AddPage_Click(sender As Object, e As EventArgs)
        If (String.Compare(UserState("UserId"),"ANONYMOUS") = 0) Then
            Response.Redirect("/Quickstart/aspplus/samples/portal/VB/login.aspx")
        Else
            Dim pageNames As String = UserState("PageNames") + ";New Page"
            Dim pageList() As String = Split(pageNames, ";")
            Dim numPages As Long = pageList.Length - 1

            SetPageIndex(numPages.ToString())
            UserState("PageNames") = pageNames
            Response.Redirect("/Quickstart/aspplus/samples/portal/VB/restricted/customize.aspx")
        End If
    End Sub

    Private Sub SetPageIndex(value as String)
        Dim PageIndex As HttpCookie = New HttpCookie("_PageIndex", value)

        PageIndex.Path = "/"
        PageIndex.Expires = New DateTime(2002, 10, 10)
        Response.Cookies.Add(PageIndex)
    End Sub

    Private Sub BuildModuleList(parent as Control, Modules As String)
        If (Modules = "") Then Return

        Dim ModuleList() As String = Split(Modules, ";")
        Dim i as Integer

        For i=0 To ModuleList.Length-1
            Dim moduleSource as String = ModuleList(i)

            If ((moduleSource <> "") And (moduleSource <> "System.DBNull")) Then
                Dim UIModule As Control = Page.LoadControl(moduleSource)
                parent.Controls.Add(New LiteralControl("<tr><td>"))
                parent.Controls.Add(UIModule)
                parent.Controls.Add(New LiteralControl("</td></tr>"))
            End If
        Next i
    End Sub

    Private Sub BuildPaneLinkList(container As HtmlContainerControl, currentPageIndex as Long)
        Dim pageNames As String = UserState("PageNames")
        If (pageNames = "") Then Return

        Dim pageList() As String = Split(pageNames, ";")

        If (pageList.Length > 2) Then
            anchorAdd.Visible = False
            spanAdd.Visible = False
        Else
            anchorAdd.Visible = True
            spanAdd.Visible = True
        End If

        Dim i as Integer

        For i=0 To pageList.Length-1
           If (pageList(i) = "") Then Exit For

           If (i = currentPageIndex) Then
              container.InnerHtml += "<td align=center bgcolor='" + UserState("HeadColor") + "' width='20%'>"
              container.InnerHtml += "  <table bgcolor='" + UserState("HeadColor") + "' border=0 width='100%' cellspacing=0 cellpadding=2>"
              container.InnerHtml += "    <tr align=center>"
              container.InnerHtml += "      <td></a><font face=Arial color='white'><b>&nbsp;"+pageList(i)+"</b></font>&nbsp;</td>"
              container.InnerHtml += "    </tr>"
              container.InnerHtml += "  </table>"
              container.InnerHtml += "</td>"
              container.InnerHtml += "<td width='1%'>&nbsp;</td>"
           Else
              container.InnerHtml += "<td align=center bgcolor='" + UserState("SubheadColor") + "' width='20%'>"
              container.InnerHtml += "  <table bgcolor='" + UserState("SubheadColor") + "' border=0 width='100%' cellspacing=0 cellpadding=2>"
              container.InnerHtml += "    <tr align=center>"
              container.InnerHtml += "      <td><font face=Arial size=-1>&nbsp;<a href='/Quickstart/aspplus/samples/portal/VB/default.aspx?_PageIndex=" + i.ToString() + "'>"+pageList(i)+"</a></font>&nbsp;</td>"
              container.InnerHtml += "    </tr>"
              container.InnerHtml += "  </table>"
              container.InnerHtml += "</td>"
              container.InnerHtml += "<td width='1%'>&nbsp;</td>"
           End If
        Next i
    End Sub

End Class