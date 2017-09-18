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
Imports System.Data
Imports System.Data.SqlClient
Imports System.Reflection

< _
    Assembly : AssemblyTitle(""), _
    Assembly : AssemblyDescription("A QuickStart Tutorial Assembly"), _
    Assembly : AssemblyConfiguration(""), _
    Assembly : AssemblyCompany("Microsoft Corporation"), _
    Assembly : AssemblyProduct("Microsoft QuickStart Tutorials"), _
    Assembly : AssemblyCopyright(" Microsoft Corporation.  All rights reserved."), _
    Assembly : AssemblyTrademark(""), _
    Assembly : AssemblyCulture(""), _
    Assembly : AssemblyVersion("1.1.*"), _
    Assembly : AssemblyDelaySign(false), _
    Assembly : AssemblyKeyFile(""), _
    Assembly : AssemblyKeyName("") _
>
Namespace DataLayer

  Public Class DataObjVB

    Private _connStr As String

    Public Sub New()

      MyBase.New()
      _connStr = ""
    End Sub

    Public Sub New(ConnStr As String)

      MyBase.New()
      _connStr = ConnStr
    End Sub

    Public Property ConnectionString As String

      Get
        Return _connStr
      End Get

      Set
        _connStr = Value
      End Set
    End Property

    Public Function GetCategories() As DataView

      Dim DS As DataSet
      Dim MyConnection As SqlConnection
      Dim MyCommand As SqlDataAdapter

      MyConnection = New SqlConnection(_connStr)
      MyCommand = New SqlDataAdapter("select distinct CategoryName from Categories", MyConnection)

      DS = new DataSet()
      Try
      	MyCommand.Fill(DS, "Categories")

      	Return DS.Tables("Categories").DefaultView
      Catch ex as Exception
    	Throw ex
      Finally
    	MyConnection.Close()
      End Try
    End Function

    Public Function GetProductsForCategory(Category As String) As DataView

      Dim DS As DataSet
      Dim MyConnection As SqlConnection
      Dim MyCommand As SqlDataAdapter

      MyConnection = New SqlConnection(_connStr)

      MyCommand = New SqlDataAdapter("select ProductName, ImagePath, UnitPrice, c.CategoryId  from Products p, Categories c where c.CategoryName='" & Category & "' and p.CategoryId = c.CategoryId", myConnection)

      DS = new DataSet()
      Try
      	MyCommand.Fill(DS, "Products")

      	Return DS.Tables("Products").DefaultView
      Catch ex as Exception
    	Throw ex
      Finally
    	MyConnection.Close()
      End Try
    End Function

  End Class

End Namespace