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
Imports PortalModuleControl

Public Class BookOfTheDay : Inherits PortalModuleControl

  Private m_bookArray(6) as String
    Private m_TitleId As String = ""
    Private m_Title As String= ""
    Private m_Category As String= ""
    Private m_Price As String = ""

  Public Sub New()
    m_bookArray(0) = "TC7777"
    m_bookArray(1) = "PC8888"
    m_bookArray(2) = "TC3218"
    m_bookArray(3) = "MC3021"
    m_bookArray(4) = "PS2091"
    m_bookArray(5) = "BU7832"
  End Sub

    Public Property TitleId() As String
        Get
      return m_TitleId
        End Get
    Set
      m_TitleId = value
    End Set
    End Property

    Public Property Title() As String
        Get
      return m_Title
        End Get
    Set
      m_Title = value
    End Set
    End Property

    Public Property Category() As String
        Get
      return m_Category
        End Get
    Set
      m_Category = value
    End Set
    End Property

    Public Property Price() As String
        Get
      return m_Price
        End Get
    Set
      m_Price = value
    End Set
    End Property

    Private Function GetBookId(index As Integer) As String
    GetBookId = m_bookArray(index Mod 6)
    End Function

    Protected Sub Page_Load(sender As Object, e As EventArgs)

    Dim query As String = "select * from Titles where title_id = '" + GetBookId(DateTime.Now.Day) + "'"
    Dim hsh As NameValueCollection = CType(Context.GetConfig("system.web/dsnstore"), NameValueCollection)
        Dim dsn As String = hsh("pubs").ToString()
        Dim myConnection As SqlConnection = New SqlConnection(dsn)
	Try
            Dim myCommand As SqlDataAdapter = New SqlDataAdapter(query, myConnection)
            Dim ds As DataSet = New DataSet()

            myCommand.Fill(ds, "Titles")

            Dim myData As DataView = ds.Tables("Titles").DefaultView

            TitleId = myData(0).Item("title_id").ToString()
            Title = myData(0).Item("title").ToString()
            Category = myData(0).Item("type").ToString()
            Price = myData(0).Item("price").ToString()
            DataBind()
	Catch ex as Exception
    	    Throw ex
	Finally
    	    myConnection.Close()
	End Try

    End Sub

End Class
