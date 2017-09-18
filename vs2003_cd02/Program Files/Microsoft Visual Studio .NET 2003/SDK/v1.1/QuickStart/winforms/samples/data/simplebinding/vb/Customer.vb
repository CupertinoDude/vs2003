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
Imports System.ComponentModel
Imports System.IO
Imports System.Collections
Imports Microsoft.VisualBasic

Namespace Microsoft.Samples.WinForms.VB.SimpleBinding.Data

   Public Class Customer
        Inherits Component

        Private strID As String
        Private strTitle As String
        Private strFirstname As String
        Private strLastName As String
        Private strAddress As String
        Private dtDateOfBirth As Date

        Friend Shared Function ReadCustomer1() As Customer
            Dim cust As Customer = New Customer("536-45-1245")
            cust.Title = "Mr."
            cust.FirstName = "Otis"
            cust.LastName = "Redding"
            cust.DateOfBirth = Date.Parse("9/9/1941", System.Globalization.CultureInfo.CreateSpecificCulture("en-US").DateTimeFormat)
            cust.Address = "1 Dock Street, The Bay, Georgia, USA"
            Return cust
        End Function

        Friend Shared Function ReadCustomer2() As Customer
            Dim cust As Customer = New Customer("246-12-5645")
            cust.Title = "Mr."
            cust.FirstName = "James"
            cust.LastName = "Brown"
            cust.DateOfBirth = Date.Parse("5/3/1933", System.Globalization.CultureInfo.CreateSpecificCulture("en-US").DateTimeFormat)
            cust.Address = "45 New Bag Street, Barnwell, South Carolina, USA"
            Return cust
        End Function

        Friend Shared Function ReadCustomer3() As Customer
            Dim cust As Customer = New Customer("651-27-8117")
            cust.Title = "Mz."
            cust.FirstName = "Aretha"
            cust.LastName = "Franklin"
            cust.DateOfBirth = Date.Parse("3/25/1942", System.Globalization.CultureInfo.CreateSpecificCulture("en-US").DateTimeFormat)
            cust.Address = "21 Chain Ave., Memphis, Tennessee, USA"
            Return cust
        End Function

        Friend Shared Function ReadCustomer4() As Customer
            Dim cust As Customer = New Customer("786-34-2114")
            cust.Title = "Mr."
            cust.FirstName = "Louis"
            cust.LastName = "Armstrong"
            cust.DateOfBirth = Date.Parse("8/4/1901", System.Globalization.CultureInfo.CreateSpecificCulture("en-US").DateTimeFormat)
            cust.Address = "The West End, New Orleans, Lousiana, USA"
            Return cust
        End Function

        Friend Shared Function ReadCustomer5() As Customer
            Dim cust As Customer = New Customer("445-34-4332")
            cust.Title = "Mz."
            cust.FirstName = "Billie"
            cust.LastName = "Holiday"
            cust.DateOfBirth = Date.Parse("4/17/1915", System.Globalization.CultureInfo.CreateSpecificCulture("en-US").DateTimeFormat)
            cust.Address = "Southern Breeze Ave., Baltimore, Maryland, USA"
            Return cust
        End Function

        Friend Sub New(ByVal ID As String)
            MyBase.New()
            Me.strID = ID
        End Sub

        Public ReadOnly Property ID() As String
            Get
                Return strID
            End Get
        End Property

        Public Property FirstName() As String
            Get
                Return strFirstname
            End Get
            Set(ByVal Value As String)
                strFirstname = Value
            End Set
        End Property

        Public Property Title() As String
            Get
                Return strTitle
            End Get
            Set(ByVal Value As String)
                strTitle = Value
            End Set
        End Property

        Public Property LastName() As String
            Get
                Return strLastName
            End Get
            Set(ByVal Value As String)
                strLastName = Value
            End Set
        End Property

        Public Property Address() As String
            Get
                Return strAddress
            End Get
            Set(ByVal Value As String)
                strAddress = Value
            End Set
        End Property

        Public Property DateOfBirth() As Date
            Get
                Return dtDateOfBirth
            End Get
            Set(ByVal Value As Date)
                dtDateOfBirth = Value
            End Set
        End Property

        Public Overrides Function ToString() As String
            Dim sb As StringWriter = New StringWriter()
            sb.WriteLine("Customer:")
            sb.WriteLine(Me.ID)
            sb.Write(Me.Title)
            sb.Write(Me.FirstName)
            sb.WriteLine(Me.LastName)
            sb.WriteLine(Me.DateOfBirth.ToString())
            sb.WriteLine(Me.Address)
            Return sb.ToString()
        End Function

    End Class


    ' Strongly typed list of Customers
    ' Implements IComponent so that we can use in the designer
    Public Class CustomerList
        Inherits CollectionBase

        Private compImpl As Component = New Component()

        Public Shared Function GetCustomersArray() As Customer()
            Dim custList(4) As Customer
            custList(0) = Customer.ReadCustomer1()
            custList(1) = Customer.ReadCustomer2()
            custList(2) = Customer.ReadCustomer3()
            custList(3) = Customer.ReadCustomer4()
            custList(4) = Customer.ReadCustomer5()
            Return custList
        End Function

        Public Shared Function GetCustomers() As CustomerList
            Dim custList As CustomerList = New CustomerList()
            custList.Add(Customer.ReadCustomer1())
            custList.Add(Customer.ReadCustomer2())
            custList.Add(Customer.ReadCustomer3())
            custList.Add(Customer.ReadCustomer4())
            custList.Add(Customer.ReadCustomer5())
            Return custList
        End Function

        ' Component implementation so that we can design this puppy
        Public Overridable Sub Dispose()
            compImpl.Dispose()
        End Sub


        <Browsable(False), DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)> _
        Public Property Site() As ISite
            Get
                Return compImpl.Site
            End Get
            Set(ByVal Value As ISite)
                compImpl.Site = Value
            End Set
        End Property

        Public Property this(ByVal index As Integer) As Customer
            Get
                Return CType(List(index), Customer)
            End Get
            Set(ByVal Value As Customer)
                List(index) = Value
            End Set
        End Property

        Public Function Add(ByVal value As Customer) As Integer
            Add = List.Add(value)
        End Function

        Public Sub Insert(ByVal index As Integer, ByVal value As Customer)
            List.Insert(index, value)
        End Sub

        Public Function IndexOf(ByVal value As Customer) As Integer
            Return List.IndexOf(value)
        End Function

        Public Function Contains(ByVal value As Customer) As Boolean
            Return List.Contains(value)
        End Function

        Public Sub Remove(ByVal value As Customer)
            List.Remove(value)
        End Sub

        Public Sub CopyTo(ByVal array() As Customer, ByVal index As Integer)
            List.CopyTo(array, index)
        End Sub
    End Class

End Namespace

