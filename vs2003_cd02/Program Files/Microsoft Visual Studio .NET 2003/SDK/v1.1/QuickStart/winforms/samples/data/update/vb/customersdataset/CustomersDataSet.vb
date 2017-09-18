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
Imports Microsoft.Win32

Namespace Microsoft.Samples.Windows.Forms.Vb.Update.Data

    Public Class CustomersDataSet
        Inherits System.Data.DataSet

        Private tableCustomers As CustomersDataTable

        Public Sub New()
            MyBase.New()
            Me.InitClass()
        End Sub

        <System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)> _
        Public ReadOnly Property Customers() As CustomersDataTable
            Get
                Return Me.tableCustomers
            End Get
        End Property

        Private Sub InitClass()
            Me.DataSetName = "CustomersDataSet"
            Me.Namespace = ""
            Me.tableCustomers = New CustomersDataTable()
            Me.Tables.Add(Me.tableCustomers)
        End Sub

        Public Delegate Sub CustomersRowChangeEventHandler(ByVal sender As Object, ByVal e As CustomersRowChangeEvent)

        Public Class CustomersDataTable
            Inherits DataTable
            Implements System.Collections.IEnumerable

            Private columnCustomerID As DataColumn

            Private columnCompanyName As DataColumn

            Private columnContactName As DataColumn

            Private columnContactTitle As DataColumn

            Private columnAddress As DataColumn

            Private columnCity As DataColumn

            Private column_Region As DataColumn

            Private columnPostalCode As DataColumn

            Private columnCountry As DataColumn

            Private columnPhone As DataColumn

            Private columnFax As DataColumn

            Friend Sub New()
                MyBase.New("Customers")
                Me.InitClass()
            End Sub

            Public ReadOnly Property Count() As Integer
                Get
                    Return Me.Rows.Count
                End Get
            End Property

            Friend ReadOnly Property CustomerIDColumn() As DataColumn
                Get
                    Return Me.columnCustomerID
                End Get
            End Property

            Friend ReadOnly Property CompanyNameColumn() As DataColumn
                Get
                    Return Me.columnCompanyName
                End Get
            End Property

            Friend ReadOnly Property ContactNameColumn() As DataColumn
                Get
                    Return Me.columnContactName
                End Get
            End Property

            Friend ReadOnly Property ContactTitleColumn() As DataColumn
                Get
                    Return Me.columnContactTitle
                End Get
            End Property

            Friend ReadOnly Property AddressColumn() As DataColumn
                Get
                    Return Me.columnAddress
                End Get
            End Property

            Friend ReadOnly Property CityColumn() As DataColumn
                Get
                    Return Me.columnCity
                End Get
            End Property

            Friend ReadOnly Property _RegionColumn() As DataColumn
                Get
                    Return Me.column_Region
                End Get
            End Property

            Friend ReadOnly Property PostalCodeColumn() As DataColumn
                Get
                    Return Me.columnPostalCode
                End Get
            End Property

            Friend ReadOnly Property CountryColumn() As DataColumn
                Get
                    Return Me.columnCountry
                End Get
            End Property

            Friend ReadOnly Property PhoneColumn() As DataColumn
                Get
                    Return Me.columnPhone
                End Get
            End Property

            Friend ReadOnly Property FaxColumn() As DataColumn
                Get
                    Return Me.columnFax
                End Get
            End Property

            Default Public ReadOnly Property Item(ByVal index As Integer) As CustomersRow
                Get
                    Return CType(Me.Rows(index), CustomersRow)
                End Get
            End Property

            Public Event CustomersRowChanged As CustomersRowChangeEventHandler

            Public Event CustomersRowChanging As CustomersRowChangeEventHandler

            Public Event CustomersRowDeleted As CustomersRowChangeEventHandler

            Public Event CustomersRowDeleting As CustomersRowChangeEventHandler

            Public Overloads Sub AddCustomersRow(ByVal row As CustomersRow)
                Me.Rows.Add(row)
            End Sub

            Public Overloads Function AddCustomersRow(ByVal CustomerID As String, ByVal CompanyName As String, ByVal ContactName As String, ByVal ContactTitle As String, ByVal Address As String, ByVal City As String, ByVal _Region As String, ByVal PostalCode As String, ByVal Country As String, ByVal Phone As String, ByVal Fax As String) As CustomersRow
                Dim rowCustomersRow As CustomersRow = CType(Me.NewRow, CustomersRow)
                rowCustomersRow.ItemArray = New Object() {CustomerID, CompanyName, ContactName, ContactTitle, Address, City, _Region, PostalCode, Country, Phone, Fax}
                Me.Rows.Add(rowCustomersRow)
                Return rowCustomersRow
            End Function

            Public Function FindByCustomerID(ByVal CustomerID As String) As CustomersRow
                Return CType(Me.Rows.Find(New Object() {CustomerID}), CustomersRow)
            End Function

            Public Function GetEnumerator() As System.Collections.IEnumerator Implements System.Collections.IEnumerable.GetEnumerator
                Return Me.Rows.GetEnumerator
            End Function

            Private Sub InitClass()
                Me.columnCustomerID = New DataColumn("CustomerID", GetType(System.String), "", MappingType.Element)
                Me.columnCustomerID.AllowDBNull = False
                Me.columnCustomerID.Unique = True
                Me.Columns.Add(Me.columnCustomerID)
                Me.columnCompanyName = New DataColumn("CompanyName", GetType(System.String), "", MappingType.Element)
                Me.columnCompanyName.AllowDBNull = False
                Me.Columns.Add(Me.columnCompanyName)
                Me.columnContactName = New DataColumn("ContactName", GetType(System.String), "", MappingType.Element)
                Me.Columns.Add(Me.columnContactName)
                Me.columnContactTitle = New DataColumn("ContactTitle", GetType(System.String), "", MappingType.Element)
                Me.Columns.Add(Me.columnContactTitle)
                Me.columnAddress = New DataColumn("Address", GetType(System.String), "", MappingType.Element)
                Me.Columns.Add(Me.columnAddress)
                Me.columnCity = New DataColumn("City", GetType(System.String), "", MappingType.Element)
                Me.Columns.Add(Me.columnCity)
                Me.column_Region = New DataColumn("Region", GetType(System.String), "", MappingType.Element)
                Me.Columns.Add(Me.column_Region)
                Me.columnPostalCode = New DataColumn("PostalCode", GetType(System.String), "", MappingType.Element)
                Me.Columns.Add(Me.columnPostalCode)
                Me.columnCountry = New DataColumn("Country", GetType(System.String), "", MappingType.Element)
                Me.Columns.Add(Me.columnCountry)
                Me.columnPhone = New DataColumn("Phone", GetType(System.String), "", MappingType.Element)
                Me.Columns.Add(Me.columnPhone)
                Me.columnFax = New DataColumn("Fax", GetType(System.String), "", MappingType.Element)
                Me.Columns.Add(Me.columnFax)
                Me.PrimaryKey = New DataColumn() {Me.columnCustomerID}
            End Sub

            Public Function NewCustomersRow() As CustomersRow
                Return CType(Me.NewRow, CustomersRow)
            End Function

            Protected Overrides Function NewRowFromBuilder(ByVal builder As DataRowBuilder) As DataRow
                'We need to ensure that all Rows in the tabled are typed rows.
                'Table calls newRow whenever it needs to create a row.
                'So the following conditions are covered by Row newRow(Record record)
                '* Cursor calls table.addRecord(record) 
                '* table.addRow(object[] values) calls newRow(record)    
                Return New CustomersRow(builder)
            End Function

            Protected Overrides Function GetRowType() As System.Type
                Return GetType(CustomersRow)
            End Function

            Protected Overrides Sub OnRowChanged(ByVal e As DataRowChangeEventArgs)
                MyBase.OnRowChanged(e)
                If (Not (Me.CustomersRowChangedEvent) Is Nothing) Then
                    RaiseEvent CustomersRowChanged(Me, New CustomersRowChangeEvent(CType(e.Row, CustomersRow), e.Action))
                End If
            End Sub

            Protected Overrides Sub OnRowChanging(ByVal e As DataRowChangeEventArgs)
                MyBase.OnRowChanging(e)
                If (Not (Me.CustomersRowChangingEvent) Is Nothing) Then
                    RaiseEvent CustomersRowChanging(Me, New CustomersRowChangeEvent(CType(e.Row, CustomersRow), e.Action))
                End If
            End Sub

            Protected Overrides Sub OnRowDeleted(ByVal e As DataRowChangeEventArgs)
                MyBase.OnRowDeleted(e)
                If (Not (Me.CustomersRowDeletedEvent) Is Nothing) Then
                    RaiseEvent CustomersRowDeleted(Me, New CustomersRowChangeEvent(CType(e.Row, CustomersRow), e.Action))
                End If
            End Sub

            Protected Overrides Sub OnRowDeleting(ByVal e As DataRowChangeEventArgs)
                MyBase.OnRowDeleting(e)
                If (Not (Me.CustomersRowDeletingEvent) Is Nothing) Then
                    RaiseEvent CustomersRowDeleting(Me, New CustomersRowChangeEvent(CType(e.Row, CustomersRow), e.Action))
                End If
            End Sub

            Public Sub RemoveCustomersRow(ByVal row As CustomersRow)
                Me.Rows.Remove(row)
            End Sub
        End Class

        Public Class CustomersRow
            Inherits DataRow

            Private tableCustomers As CustomersDataTable

            Friend Sub New(ByVal rb As DataRowBuilder)
                MyBase.New(rb)
                Me.tableCustomers = CType(Me.Table, CustomersDataTable)
            End Sub

            Public Property CustomerID() As String
                Get
                    Return CType(Me(Me.tableCustomers.CustomerIDColumn), String)
                End Get
                Set(ByVal Value As String)
                    Me(Me.tableCustomers.CustomerIDColumn) = Value
                End Set
            End Property

            Public Property CompanyName() As String
                Get
                    Return CType(Me(Me.tableCustomers.CompanyNameColumn), String)
                End Get
                Set(ByVal Value As String)
                    Me(Me.tableCustomers.CompanyNameColumn) = Value
                End Set
            End Property

            Public Property ContactName() As String
                Get
                    Try
                        Return CType(Me(Me.tableCustomers.ContactNameColumn), String)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As String)
                    Me(Me.tableCustomers.ContactNameColumn) = Value
                End Set
            End Property

            Public Property ContactTitle() As String
                Get
                    Try
                        Return CType(Me(Me.tableCustomers.ContactTitleColumn), String)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As String)
                    Me(Me.tableCustomers.ContactTitleColumn) = Value
                End Set
            End Property

            Public Property Address() As String
                Get
                    Try
                        Return CType(Me(Me.tableCustomers.AddressColumn), String)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As String)
                    Me(Me.tableCustomers.AddressColumn) = Value
                End Set
            End Property

            Public Property City() As String
                Get
                    Try
                        Return CType(Me(Me.tableCustomers.CityColumn), String)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As String)
                    Me(Me.tableCustomers.CityColumn) = Value
                End Set
            End Property

            Public Property _Region() As String
                Get
                    Try
                        Return CType(Me(Me.tableCustomers._RegionColumn), String)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As String)
                    Me(Me.tableCustomers._RegionColumn) = Value
                End Set
            End Property

            Public Property PostalCode() As String
                Get
                    Try
                        Return CType(Me(Me.tableCustomers.PostalCodeColumn), String)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As String)
                    Me(Me.tableCustomers.PostalCodeColumn) = Value
                End Set
            End Property

            Public Property Country() As String
                Get
                    Try
                        Return CType(Me(Me.tableCustomers.CountryColumn), String)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As String)
                    Me(Me.tableCustomers.CountryColumn) = Value
                End Set
            End Property

            Public Property Phone() As String
                Get
                    Try
                        Return CType(Me(Me.tableCustomers.PhoneColumn), String)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As String)
                    Me(Me.tableCustomers.PhoneColumn) = Value
                End Set
            End Property

            Public Property Fax() As String
                Get
                    Try
                        Return CType(Me(Me.tableCustomers.FaxColumn), String)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As String)
                    Me(Me.tableCustomers.FaxColumn) = Value
                End Set
            End Property

            Public Function IsContactNameNull() As Boolean
                Return Me.IsNull(Me.tableCustomers.ContactNameColumn)
            End Function

            Public Sub SetContactNameNull()
                Me(Me.tableCustomers.ContactNameColumn) = Convert.DBNull
            End Sub

            Public Function IsContactTitleNull() As Boolean
                Return Me.IsNull(Me.tableCustomers.ContactTitleColumn)
            End Function

            Public Sub SetContactTitleNull()
                Me(Me.tableCustomers.ContactTitleColumn) = Convert.DBNull
            End Sub

            Public Function IsAddressNull() As Boolean
                Return Me.IsNull(Me.tableCustomers.AddressColumn)
            End Function

            Public Sub SetAddressNull()
                Me(Me.tableCustomers.AddressColumn) = Convert.DBNull
            End Sub

            Public Function IsCityNull() As Boolean
                Return Me.IsNull(Me.tableCustomers.CityColumn)
            End Function

            Public Sub SetCityNull()
                Me(Me.tableCustomers.CityColumn) = Convert.DBNull
            End Sub

            Public Function Is_RegionNull() As Boolean
                Return Me.IsNull(Me.tableCustomers._RegionColumn)
            End Function

            Public Sub Set_RegionNull()
                Me(Me.tableCustomers._RegionColumn) = Convert.DBNull
            End Sub

            Public Function IsPostalCodeNull() As Boolean
                Return Me.IsNull(Me.tableCustomers.PostalCodeColumn)
            End Function

            Public Sub SetPostalCodeNull()
                Me(Me.tableCustomers.PostalCodeColumn) = Convert.DBNull
            End Sub

            Public Function IsCountryNull() As Boolean
                Return Me.IsNull(Me.tableCustomers.CountryColumn)
            End Function

            Public Sub SetCountryNull()
                Me(Me.tableCustomers.CountryColumn) = Convert.DBNull
            End Sub

            Public Function IsPhoneNull() As Boolean
                Return Me.IsNull(Me.tableCustomers.PhoneColumn)
            End Function

            Public Sub SetPhoneNull()
                Me(Me.tableCustomers.PhoneColumn) = Convert.DBNull
            End Sub

            Public Function IsFaxNull() As Boolean
                Return Me.IsNull(Me.tableCustomers.FaxColumn)
            End Function

            Public Sub SetFaxNull()
                Me(Me.tableCustomers.FaxColumn) = Convert.DBNull
            End Sub
        End Class

        Public Class CustomersRowChangeEvent
            Inherits EventArgs

            Private eventRow As CustomersRow

            Private eventAction As System.Data.DataRowAction

            Public Sub New(ByVal row As CustomersRow, ByVal action As DataRowAction)
                MyBase.New()
                Me.eventRow = row
                Me.eventAction = action
            End Sub

            Public ReadOnly Property Row() As CustomersRow
                Get
                    Return Me.eventRow
                End Get
            End Property

            Public ReadOnly Property Action() As DataRowAction
                Get
                    Return Me.eventAction
                End Get
            End Property
        End Class
    End Class
End Namespace