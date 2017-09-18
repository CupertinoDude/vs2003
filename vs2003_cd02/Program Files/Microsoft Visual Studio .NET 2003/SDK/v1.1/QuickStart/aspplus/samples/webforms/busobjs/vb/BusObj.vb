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
Imports DataLayer
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
Namespace BusinessLayer

  Public Class BusObjVB

    Private Data As DataObjVB

    Public Sub New()

      MyBase.New()
      Data = New DataObjVB("server=(local)\NetSDK;database=grocertogo;Integrated Security=SSPI")
    End Sub

    Public Function GetCategories() As DataView

       Return Data.GetCategories()
    End Function

    Public Function GetProductsForCategory(Category As String, CustomerId As Integer) As DataView

       Dim View As DataView
       View = Data.GetProductsForCategory(Category)

       Dim Discount As Double = 0
       If (CustomerId >= 25) And (CustomerId < 50)
         Discount = .50
       Else If (CustomerId >= 50) And (CustomerId < 75)
         Discount = 1.00
       Else If (CustomerId >= 75) And (CustomerId < 100)
         Discount = 1.50
       End If

       Dim I As Integer
       For I = 0 To View.Count - 1
         View(I)("UnitPrice") = CDbl(View(I)("UnitPrice").ToString()) - Discount
       Next

       Return View
    End Function

  End Class

End Namespace