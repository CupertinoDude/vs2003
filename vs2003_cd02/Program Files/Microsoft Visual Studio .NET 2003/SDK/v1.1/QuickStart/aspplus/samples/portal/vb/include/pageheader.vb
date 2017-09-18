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
Imports PortalModuleControl

Public Class PageHeader : Inherits PortalModuleControl

    Private _ShowSignOut As Boolean = True

    Public Property ShowSignOut As Boolean
        Get
            Return _ShowSignOut
        End Get
        Set
            _ShowSignOut = Value
        End Set
    End Property

    Protected Sub SignOff_Click(sender As Object, e As EventArgs )

       Dim PageIndex As HttpCookie = New HttpCookie("_PageIndex", "0")

       PageIndex.Path = "/"
       PageIndex.Expires = new DateTime(2002, 10, 10)
       Response.Cookies.Add(PageIndex)
       System.Web.Security.FormsAuthentication.SignOut()
       Response.Redirect("/Quickstart/aspplus/samples/portal/VB/default.aspx")

    End Sub

End Class