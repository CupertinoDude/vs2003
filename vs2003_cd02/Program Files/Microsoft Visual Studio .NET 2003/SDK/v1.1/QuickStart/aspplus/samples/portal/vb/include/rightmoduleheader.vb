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
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports PortalModuleControl
Imports Microsoft.VisualBasic

Public Class RightModuleHeader : Inherits PortalModuleControl

    Public Title As String = "Right Module"
    Public EditPage As String = "#edit"
    Private _ShowEditButton As Boolean = True
    Private _ShowCloseButton As Boolean = True
    Public ModuleSource As String = ""
    Public CustomHtml As String = ""
    Public anchorEditPage as HtmlAnchor

    Public Property ShowEditButton As Boolean
        Get
            Return _ShowEditButton
        End Get
        Set
            _ShowEditButton = Value
        End Set
    End Property
    Public Property ShowCloseButton As Boolean
        Get
            Return _ShowCloseButton
        End Get
        Set
            _ShowCloseButton = Value
        End Set
    End Property

    Protected Sub Page_Load(sender As Object, e As EventArgs)

        If (String.Compare(UserState("UserId"),"ANONYMOUS") = 0) Then
            EditPage = "login.aspx"
        End If

        anchorEditPage.Attributes("style") = "color:" + UserState("HeadColor")
        DataBind()

    End Sub

    Protected Sub CloseButton_Click(sender As Object, e As EventArgs)

        If (String.Compare(UserState("UserId"),"ANONYMOUS") <> 0) Then

            Dim pageIndex As Integer = 0

            If (Not Request.Cookies("_PageIndex") Is Nothing) Then
                pageIndex = Int32.Parse(Request.Cookies("_PageIndex").Value)
      End If

      Dim rightModules As String = UserState("PageModules_" + pageIndex.ToString() + "R")
            Dim moduleList() As String = Split(rightModules, ";")

            Dim s As String = ""
      Dim i as Integer

            For i=0 To moduleList.Length-1
                If (String.Compare(ModuleSource, moduleList(i)) <> 0) Then
                    s += moduleList(i) + ";"
        End If
            Next i

            UserState("PageModules_" + pageIndex.ToString() + "R") = TrimEnd(s, ";")
            Response.Redirect("default.aspx")
        Else
            Response.Redirect("login.aspx")
        End If

    End Sub

  Private Function TrimEnd(source As String, trimchar as String) As String

    Dim tc() as Char = trimchar.ToCharArray()
    TrimEnd = source.TrimEnd(tc)

  End Function

End Class