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

Namespace Microsoft.Samples.Windows.Forms.Vb.MasterDetails.Data

    Public Class CustomersAndOrdersDataSet
        Inherits System.Data.DataSet

        Private tableCustomers As CustomersDataTable

        Private tableOrders As OrdersDataTable

        Private relationCustomersOrders As DataRelation

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

        <System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)> _
        Public ReadOnly Property Orders() As OrdersDataTable
            Get
                Return Me.tableOrders
            End Get
        End Property

        Private Sub InitClass()
            Me.DataSetName = "CustomersAndOrdersDataSet"
            Me.Namespace = ""
            Me.tableCustomers = New CustomersDataTable()
            Me.Tables.Add(Me.tableCustomers)
            Me.tableOrders = New OrdersDataTable()
            Me.Tables.Add(Me.tableOrders)
            Me.tableOrders.Constraints.Add(New System.Data.ForeignKeyConstraint("CustomersOrders", New DataColumn() {Me.tableCustomers.CustomerIDColumn}, New DataColumn() {Me.tableOrders.CustomerIDColumn}))
            Me.relationCustomersOrders = New DataRelation("CustomersOrders", New DataColumn() {Me.tableCustomers.CustomerIDColumn}, New DataColumn() {Me.tableOrders.CustomerIDColumn}, False)
            Me.Relations.Add(Me.relationCustomersOrders)
        End Sub

        Public Delegate Sub CustomersRowChangeEventHandler(ByVal sender As Object, ByVal e As CustomersRowChangeEvent)

        Public Delegate Sub OrdersRowChangeEventHandler(ByVal sender As Object, ByVal e As OrdersRowChangeEvent)

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

            Public Function GetOrdersRows() As OrdersRow()
                Return CType(Me.GetChildRows(Me.Table.ChildRelations("CustomersOrders")), OrdersRow())
            End Function
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

        Public Class OrdersDataTable
            Inherits DataTable
            Implements System.Collections.IEnumerable

            Private columnOrderID As DataColumn

            Private columnCustomerID As DataColumn

            Private columnEmployeeID As DataColumn

            Private columnOrderDate As DataColumn

            Private columnRequiredDate As DataColumn

            Private columnShippedDate As DataColumn

            Private columnShipVia As DataColumn

            Private columnFreight As DataColumn

            Private columnShipName As DataColumn

            Private columnShipAddress As DataColumn

            Private columnShipCity As DataColumn

            Private columnShipRegion As DataColumn

            Private columnShipPostalCode As DataColumn

            Private columnShipCountry As DataColumn

            Friend Sub New()
                MyBase.New("Orders")
                Me.InitClass()
            End Sub

            Public ReadOnly Property Count() As Integer
                Get
                    Return Me.Rows.Count
                End Get
            End Property

            Friend ReadOnly Property OrderIDColumn() As DataColumn
                Get
                    Return Me.columnOrderID
                End Get
            End Property

            Friend ReadOnly Property CustomerIDColumn() As DataColumn
                Get
                    Return Me.columnCustomerID
                End Get
            End Property

            Friend ReadOnly Property EmployeeIDColumn() As DataColumn
                Get
                    Return Me.columnEmployeeID
                End Get
            End Property

            Friend ReadOnly Property OrderDateColumn() As DataColumn
                Get
                    Return Me.columnOrderDate
                End Get
            End Property

            Friend ReadOnly Property RequiredDateColumn() As DataColumn
                Get
                    Return Me.columnRequiredDate
                End Get
            End Property

            Friend ReadOnly Property ShippedDateColumn() As DataColumn
                Get
                    Return Me.columnShippedDate
                End Get
            End Property

            Friend ReadOnly Property ShipViaColumn() As DataColumn
                Get
                    Return Me.columnShipVia
                End Get
            End Property

            Friend ReadOnly Property FreightColumn() As DataColumn
                Get
                    Return Me.columnFreight
                End Get
            End Property

            Friend ReadOnly Property ShipNameColumn() As DataColumn
                Get
                    Return Me.columnShipName
                End Get
            End Property

            Friend ReadOnly Property ShipAddressColumn() As DataColumn
                Get
                    Return Me.columnShipAddress
                End Get
            End Property

            Friend ReadOnly Property ShipCityColumn() As DataColumn
                Get
                    Return Me.columnShipCity
                End Get
            End Property

            Friend ReadOnly Property ShipRegionColumn() As DataColumn
                Get
                    Return Me.columnShipRegion
                End Get
            End Property

            Friend ReadOnly Property ShipPostalCodeColumn() As DataColumn
                Get
                    Return Me.columnShipPostalCode
                End Get
            End Property

            Friend ReadOnly Property ShipCountryColumn() As DataColumn
                Get
                    Return Me.columnShipCountry
                End Get
            End Property

            Default Public ReadOnly Property Item(ByVal index As Integer) As OrdersRow
                Get
                    Return CType(Me.Rows(index), OrdersRow)
                End Get
            End Property

            Public Event OrdersRowChanged As OrdersRowChangeEventHandler

            Public Event OrdersRowChanging As OrdersRowChangeEventHandler

            Public Event OrdersRowDeleted As OrdersRowChangeEventHandler

            Public Event OrdersRowDeleting As OrdersRowChangeEventHandler

            Public Overloads Sub AddOrdersRow(ByVal row As OrdersRow)
                Me.Rows.Add(row)
            End Sub

            Public Overloads Function AddOrdersRow(ByVal parentCustomersRowByCustomersOrders As CustomersRow, ByVal EmployeeID As Integer, ByVal OrderDate As Date, ByVal RequiredDate As Date, ByVal ShippedDate As Date, ByVal ShipVia As Integer, ByVal Freight As Decimal, ByVal ShipName As String, ByVal ShipAddress As String, ByVal ShipCity As String, ByVal ShipRegion As String, ByVal ShipPostalCode As String, ByVal ShipCountry As String) As OrdersRow
                Dim rowOrdersRow As OrdersRow = CType(Me.NewRow, OrdersRow)
                rowOrdersRow.ItemArray = New Object() {Nothing, parentCustomersRowByCustomersOrders(0), EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry}
                Me.Rows.Add(rowOrdersRow)
                Return rowOrdersRow
            End Function

            Public Function FindByOrderID(ByVal OrderID As Integer) As OrdersRow
                Return CType(Me.Rows.Find(New Object() {OrderID}), OrdersRow)
            End Function

            Public Function GetEnumerator() As System.Collections.IEnumerator Implements System.Collections.IEnumerable.GetEnumerator
                Return Me.Rows.GetEnumerator
            End Function

            Private Sub InitClass()
                Me.columnOrderID = New DataColumn("OrderID", GetType(System.Int32), "", MappingType.Element)
                Me.columnOrderID.AutoIncrement = True
                Me.columnOrderID.AllowDBNull = False
                Me.columnOrderID.ReadOnly = True
                Me.columnOrderID.Unique = True
                Me.Columns.Add(Me.columnOrderID)
                Me.columnCustomerID = New DataColumn("CustomerID", GetType(System.String), "", MappingType.Element)
                Me.Columns.Add(Me.columnCustomerID)
                Me.columnEmployeeID = New DataColumn("EmployeeID", GetType(System.Int32), "", MappingType.Element)
                Me.Columns.Add(Me.columnEmployeeID)
                Me.columnOrderDate = New DataColumn("OrderDate", GetType(System.DateTime), "", MappingType.Element)
                Me.Columns.Add(Me.columnOrderDate)
                Me.columnRequiredDate = New DataColumn("RequiredDate", GetType(System.DateTime), "", MappingType.Element)
                Me.Columns.Add(Me.columnRequiredDate)
                Me.columnShippedDate = New DataColumn("ShippedDate", GetType(System.DateTime), "", MappingType.Element)
                Me.Columns.Add(Me.columnShippedDate)
                Me.columnShipVia = New DataColumn("ShipVia", GetType(System.Int32), "", MappingType.Element)
                Me.Columns.Add(Me.columnShipVia)
                Me.columnFreight = New DataColumn("Freight", GetType(System.Decimal), "", MappingType.Element)
                Me.Columns.Add(Me.columnFreight)
                Me.columnShipName = New DataColumn("ShipName", GetType(System.String), "", MappingType.Element)
                Me.Columns.Add(Me.columnShipName)
                Me.columnShipAddress = New DataColumn("ShipAddress", GetType(System.String), "", MappingType.Element)
                Me.Columns.Add(Me.columnShipAddress)
                Me.columnShipCity = New DataColumn("ShipCity", GetType(System.String), "", MappingType.Element)
                Me.Columns.Add(Me.columnShipCity)
                Me.columnShipRegion = New DataColumn("ShipRegion", GetType(System.String), "", MappingType.Element)
                Me.Columns.Add(Me.columnShipRegion)
                Me.columnShipPostalCode = New DataColumn("ShipPostalCode", GetType(System.String), "", MappingType.Element)
                Me.Columns.Add(Me.columnShipPostalCode)
                Me.columnShipCountry = New DataColumn("ShipCountry", GetType(System.String), "", MappingType.Element)
                Me.Columns.Add(Me.columnShipCountry)
                Me.PrimaryKey = New DataColumn() {Me.columnOrderID}
            End Sub

            Public Function NewOrdersRow() As OrdersRow
                Return CType(Me.NewRow, OrdersRow)
            End Function

            Protected Overrides Function NewRowFromBuilder(ByVal builder As DataRowBuilder) As DataRow
                'We need to ensure that all Rows in the tabled are typed rows.
                'Table calls newRow whenever it needs to create a row.
                'So the following conditions are covered by Row newRow(Record record)
                '* Cursor calls table.addRecord(record) 
                '* table.addRow(object[] values) calls newRow(record)    
                Return New OrdersRow(builder)
            End Function

            Protected Overrides Function GetRowType() As System.Type
                Return GetType(OrdersRow)
            End Function

            Protected Overrides Sub OnRowChanged(ByVal e As DataRowChangeEventArgs)
                MyBase.OnRowChanged(e)
                If (Not (Me.OrdersRowChangedEvent) Is Nothing) Then
                    RaiseEvent OrdersRowChanged(Me, New OrdersRowChangeEvent(CType(e.Row, OrdersRow), e.Action))
                End If
            End Sub

            Protected Overrides Sub OnRowChanging(ByVal e As DataRowChangeEventArgs)
                MyBase.OnRowChanging(e)
                If (Not (Me.OrdersRowChangingEvent) Is Nothing) Then
                    RaiseEvent OrdersRowChanging(Me, New OrdersRowChangeEvent(CType(e.Row, OrdersRow), e.Action))
                End If
            End Sub

            Protected Overrides Sub OnRowDeleted(ByVal e As DataRowChangeEventArgs)
                MyBase.OnRowDeleted(e)
                If (Not (Me.OrdersRowDeletedEvent) Is Nothing) Then
                    RaiseEvent OrdersRowDeleted(Me, New OrdersRowChangeEvent(CType(e.Row, OrdersRow), e.Action))
                End If
            End Sub

            Protected Overrides Sub OnRowDeleting(ByVal e As DataRowChangeEventArgs)
                MyBase.OnRowDeleting(e)
                If (Not (Me.OrdersRowDeletingEvent) Is Nothing) Then
                    RaiseEvent OrdersRowDeleting(Me, New OrdersRowChangeEvent(CType(e.Row, OrdersRow), e.Action))
                End If
            End Sub

            Public Sub RemoveOrdersRow(ByVal row As OrdersRow)
                Me.Rows.Remove(row)
            End Sub
        End Class

        Public Class OrdersRow
            Inherits DataRow

            Private tableOrders As OrdersDataTable

            Friend Sub New(ByVal rb As DataRowBuilder)
                MyBase.New(rb)
                Me.tableOrders = CType(Me.Table, OrdersDataTable)
            End Sub

            Public Property OrderID() As Integer
                Get
                    Return CType(Me(Me.tableOrders.OrderIDColumn), Integer)
                End Get
                Set(ByVal Value As Integer)
                    Me(Me.tableOrders.OrderIDColumn) = Value
                End Set
            End Property

            Public Property CustomerID() As String
                Get
                    Try
                        Return CType(Me(Me.tableOrders.CustomerIDColumn), String)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As String)
                    Me(Me.tableOrders.CustomerIDColumn) = Value
                End Set
            End Property

            Public Property EmployeeID() As Integer
                Get
                    Try
                        Return CType(Me(Me.tableOrders.EmployeeIDColumn), Integer)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As Integer)
                    Me(Me.tableOrders.EmployeeIDColumn) = Value
                End Set
            End Property

            Public Property OrderDate() As Date
                Get
                    Try
                        Return CType(Me(Me.tableOrders.OrderDateColumn), Date)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As Date)
                    Me(Me.tableOrders.OrderDateColumn) = Value
                End Set
            End Property

            Public Property RequiredDate() As Date
                Get
                    Try
                        Return CType(Me(Me.tableOrders.RequiredDateColumn), Date)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As Date)
                    Me(Me.tableOrders.RequiredDateColumn) = Value
                End Set
            End Property

            Public Property ShippedDate() As Date
                Get
                    Try
                        Return CType(Me(Me.tableOrders.ShippedDateColumn), Date)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As Date)
                    Me(Me.tableOrders.ShippedDateColumn) = Value
                End Set
            End Property

            Public Property ShipVia() As Integer
                Get
                    Try
                        Return CType(Me(Me.tableOrders.ShipViaColumn), Integer)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As Integer)
                    Me(Me.tableOrders.ShipViaColumn) = Value
                End Set
            End Property

            Public Property Freight() As Decimal
                Get
                    Try
                        Return CType(Me(Me.tableOrders.FreightColumn), Decimal)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As Decimal)
                    Me(Me.tableOrders.FreightColumn) = Value
                End Set
            End Property

            Public Property ShipName() As String
                Get
                    Try
                        Return CType(Me(Me.tableOrders.ShipNameColumn), String)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As String)
                    Me(Me.tableOrders.ShipNameColumn) = Value
                End Set
            End Property

            Public Property ShipAddress() As String
                Get
                    Try
                        Return CType(Me(Me.tableOrders.ShipAddressColumn), String)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As String)
                    Me(Me.tableOrders.ShipAddressColumn) = Value
                End Set
            End Property

            Public Property ShipCity() As String
                Get
                    Try
                        Return CType(Me(Me.tableOrders.ShipCityColumn), String)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As String)
                    Me(Me.tableOrders.ShipCityColumn) = Value
                End Set
            End Property

            Public Property ShipRegion() As String
                Get
                    Try
                        Return CType(Me(Me.tableOrders.ShipRegionColumn), String)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As String)
                    Me(Me.tableOrders.ShipRegionColumn) = Value
                End Set
            End Property

            Public Property ShipPostalCode() As String
                Get
                    Try
                        Return CType(Me(Me.tableOrders.ShipPostalCodeColumn), String)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As String)
                    Me(Me.tableOrders.ShipPostalCodeColumn) = Value
                End Set
            End Property

            Public Property ShipCountry() As String
                Get
                    Try
                        Return CType(Me(Me.tableOrders.ShipCountryColumn), String)
                    Catch e As InvalidCastException
                        Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                    End Try
                End Get
                Set(ByVal Value As String)
                    Me(Me.tableOrders.ShipCountryColumn) = Value
                End Set
            End Property

            Public Property CustomersRow() As CustomersRow
                Get
                    Return CType(Me.GetParentRow(Me.Table.ParentRelations("CustomersOrders")), CustomersRow)
                End Get
                Set(ByVal Value As CustomersRow)
                    Me.SetParentRow(Value, Me.Table.ParentRelations("CustomersOrders"))
                End Set
            End Property

            Public Function IsCustomerIDNull() As Boolean
                Return Me.IsNull(Me.tableOrders.CustomerIDColumn)
            End Function

            Public Sub SetCustomerIDNull()
                Me(Me.tableOrders.CustomerIDColumn) = Convert.DBNull
            End Sub

            Public Function IsEmployeeIDNull() As Boolean
                Return Me.IsNull(Me.tableOrders.EmployeeIDColumn)
            End Function

            Public Sub SetEmployeeIDNull()
                Me(Me.tableOrders.EmployeeIDColumn) = Convert.DBNull
            End Sub

            Public Function IsOrderDateNull() As Boolean
                Return Me.IsNull(Me.tableOrders.OrderDateColumn)
            End Function

            Public Sub SetOrderDateNull()
                Me(Me.tableOrders.OrderDateColumn) = Convert.DBNull
            End Sub

            Public Function IsRequiredDateNull() As Boolean
                Return Me.IsNull(Me.tableOrders.RequiredDateColumn)
            End Function

            Public Sub SetRequiredDateNull()
                Me(Me.tableOrders.RequiredDateColumn) = Convert.DBNull
            End Sub

            Public Function IsShippedDateNull() As Boolean
                Return Me.IsNull(Me.tableOrders.ShippedDateColumn)
            End Function

            Public Sub SetShippedDateNull()
                Me(Me.tableOrders.ShippedDateColumn) = Convert.DBNull
            End Sub

            Public Function IsShipViaNull() As Boolean
                Return Me.IsNull(Me.tableOrders.ShipViaColumn)
            End Function

            Public Sub SetShipViaNull()
                Me(Me.tableOrders.ShipViaColumn) = Convert.DBNull
            End Sub

            Public Function IsFreightNull() As Boolean
                Return Me.IsNull(Me.tableOrders.FreightColumn)
            End Function

            Public Sub SetFreightNull()
                Me(Me.tableOrders.FreightColumn) = Convert.DBNull
            End Sub

            Public Function IsShipNameNull() As Boolean
                Return Me.IsNull(Me.tableOrders.ShipNameColumn)
            End Function

            Public Sub SetShipNameNull()
                Me(Me.tableOrders.ShipNameColumn) = Convert.DBNull
            End Sub

            Public Function IsShipAddressNull() As Boolean
                Return Me.IsNull(Me.tableOrders.ShipAddressColumn)
            End Function

            Public Sub SetShipAddressNull()
                Me(Me.tableOrders.ShipAddressColumn) = Convert.DBNull
            End Sub

            Public Function IsShipCityNull() As Boolean
                Return Me.IsNull(Me.tableOrders.ShipCityColumn)
            End Function

            Public Sub SetShipCityNull()
                Me(Me.tableOrders.ShipCityColumn) = Convert.DBNull
            End Sub

            Public Function IsShipRegionNull() As Boolean
                Return Me.IsNull(Me.tableOrders.ShipRegionColumn)
            End Function

            Public Sub SetShipRegionNull()
                Me(Me.tableOrders.ShipRegionColumn) = Convert.DBNull
            End Sub

            Public Function IsShipPostalCodeNull() As Boolean
                Return Me.IsNull(Me.tableOrders.ShipPostalCodeColumn)
            End Function

            Public Sub SetShipPostalCodeNull()
                Me(Me.tableOrders.ShipPostalCodeColumn) = Convert.DBNull
            End Sub

            Public Function IsShipCountryNull() As Boolean
                Return Me.IsNull(Me.tableOrders.ShipCountryColumn)
            End Function

            Public Sub SetShipCountryNull()
                Me(Me.tableOrders.ShipCountryColumn) = Convert.DBNull
            End Sub
        End Class

        Public Class OrdersRowChangeEvent
            Inherits EventArgs

            Private eventRow As OrdersRow

            Private eventAction As System.Data.DataRowAction

            Public Sub New(ByVal row As OrdersRow, ByVal action As DataRowAction)
                MyBase.New()
                Me.eventRow = row
                Me.eventAction = action
            End Sub

            Public ReadOnly Property Row() As OrdersRow
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