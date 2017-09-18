//-----------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
// 
//THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//-----------------------------------------------------------------------

namespace Microsoft.Samples.Windows.Forms.Cs.WebServiceBinding.Data {
    using System;
    using System.Data;
    using Microsoft.Win32;
    
    
    public class CustomersAndOrdersDataSet : System.Data.DataSet {
        
        private CustomersDataTable tableCustomers;
        
        private OrdersDataTable tableOrders;
        
        private DataRelation relationCustomersOrders;
        
        public CustomersAndOrdersDataSet() {
            this.InitClass();
        }
        
        [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
        public CustomersDataTable Customers {
            get {
                return this.tableCustomers;
            }
        }
        
        [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
        public OrdersDataTable Orders {
            get {
                return this.tableOrders;
            }
        }
        
        private void InitClass() {
            this.DataSetName = "CustomersAndOrdersDataSet";
            this.Namespace = "";
            this.tableCustomers = new CustomersDataTable();
            this.Tables.Add(this.tableCustomers);
            this.tableOrders = new OrdersDataTable();
            this.Tables.Add(this.tableOrders);
            this.tableOrders.Constraints.Add(new System.Data.ForeignKeyConstraint("CustomersOrders", new DataColumn[] {this.tableCustomers.CustomerIDColumn}, new DataColumn[] {this.tableOrders.CustomerIDColumn}));
            this.relationCustomersOrders = new DataRelation("CustomersOrders", new DataColumn[] {this.tableCustomers.CustomerIDColumn}, new DataColumn[] {this.tableOrders.CustomerIDColumn}, false);
            this.Relations.Add(this.relationCustomersOrders);
        }
        
        public delegate void CustomersRowChangeEventHandler(object sender, CustomersRowChangeEvent e);
        
        public delegate void OrdersRowChangeEventHandler(object sender, OrdersRowChangeEvent e);
        
        public class CustomersDataTable : DataTable, System.Collections.IEnumerable {
            
            private DataColumn columnCustomerID;
            
            private DataColumn columnCompanyName;
            
            private DataColumn columnContactName;
            
            private DataColumn columnContactTitle;
            
            private DataColumn columnAddress;
            
            private DataColumn columnCity;
            
            private DataColumn columnRegion;
            
            private DataColumn columnPostalCode;
            
            private DataColumn columnCountry;
            
            private DataColumn columnPhone;
            
            private DataColumn columnFax;
            
            internal CustomersDataTable() : 
                    base("Customers") {
                this.InitClass();
            }
            
            public int Count {
                get {
                    return this.Rows.Count;
                }
            }
            
            internal DataColumn CustomerIDColumn {
                get {
                    return this.columnCustomerID;
                }
            }
            
            internal DataColumn CompanyNameColumn {
                get {
                    return this.columnCompanyName;
                }
            }
            
            internal DataColumn ContactNameColumn {
                get {
                    return this.columnContactName;
                }
            }
            
            internal DataColumn ContactTitleColumn {
                get {
                    return this.columnContactTitle;
                }
            }
            
            internal DataColumn AddressColumn {
                get {
                    return this.columnAddress;
                }
            }
            
            internal DataColumn CityColumn {
                get {
                    return this.columnCity;
                }
            }
            
            internal DataColumn RegionColumn {
                get {
                    return this.columnRegion;
                }
            }
            
            internal DataColumn PostalCodeColumn {
                get {
                    return this.columnPostalCode;
                }
            }
            
            internal DataColumn CountryColumn {
                get {
                    return this.columnCountry;
                }
            }
            
            internal DataColumn PhoneColumn {
                get {
                    return this.columnPhone;
                }
            }
            
            internal DataColumn FaxColumn {
                get {
                    return this.columnFax;
                }
            }
            
            public CustomersRow this[int index] {
                get {
                    return ((CustomersRow)(this.Rows[index]));
                }
            }
            
            public event CustomersRowChangeEventHandler CustomersRowChanged;
            
            public event CustomersRowChangeEventHandler CustomersRowChanging;
            
            public event CustomersRowChangeEventHandler CustomersRowDeleted;
            
            public event CustomersRowChangeEventHandler CustomersRowDeleting;
            
            public void AddCustomersRow(CustomersRow row) {
                this.Rows.Add(row);
            }
            
            public CustomersRow AddCustomersRow(string CustomerID, string CompanyName, string ContactName, string ContactTitle, string Address, string City, string Region, string PostalCode, string Country, string Phone, string Fax) {
                CustomersRow rowCustomersRow = ((CustomersRow)(this.NewRow()));
                rowCustomersRow.ItemArray = new Object[] {CustomerID,
                        CompanyName,
                        ContactName,
                        ContactTitle,
                        Address,
                        City,
                        Region,
                        PostalCode,
                        Country,
                        Phone,
                        Fax};
                this.Rows.Add(rowCustomersRow);
                return rowCustomersRow;
            }
            
            public CustomersRow FindByCustomerID(string CustomerID) {
                return ((CustomersRow)(this.Rows.Find(new Object[] {CustomerID})));
            }
            
            public System.Collections.IEnumerator GetEnumerator() {
                return this.Rows.GetEnumerator();
            }
            
            private void InitClass() {
                this.columnCustomerID = new DataColumn("CustomerID", typeof(string), "", MappingType.Element);
                this.columnCustomerID.AllowDBNull = false;
                this.columnCustomerID.Unique = true;
                this.Columns.Add(this.columnCustomerID);
                this.columnCompanyName = new DataColumn("CompanyName", typeof(string), "", MappingType.Element);
                this.columnCompanyName.AllowDBNull = false;
                this.Columns.Add(this.columnCompanyName);
                this.columnContactName = new DataColumn("ContactName", typeof(string), "", MappingType.Element);
                this.Columns.Add(this.columnContactName);
                this.columnContactTitle = new DataColumn("ContactTitle", typeof(string), "", MappingType.Element);
                this.Columns.Add(this.columnContactTitle);
                this.columnAddress = new DataColumn("Address", typeof(string), "", MappingType.Element);
                this.Columns.Add(this.columnAddress);
                this.columnCity = new DataColumn("City", typeof(string), "", MappingType.Element);
                this.Columns.Add(this.columnCity);
                this.columnRegion = new DataColumn("Region", typeof(string), "", MappingType.Element);
                this.Columns.Add(this.columnRegion);
                this.columnPostalCode = new DataColumn("PostalCode", typeof(string), "", MappingType.Element);
                this.Columns.Add(this.columnPostalCode);
                this.columnCountry = new DataColumn("Country", typeof(string), "", MappingType.Element);
                this.Columns.Add(this.columnCountry);
                this.columnPhone = new DataColumn("Phone", typeof(string), "", MappingType.Element);
                this.Columns.Add(this.columnPhone);
                this.columnFax = new DataColumn("Fax", typeof(string), "", MappingType.Element);
                this.Columns.Add(this.columnFax);
                this.PrimaryKey = new DataColumn[] {this.columnCustomerID};
            }
            
            public CustomersRow NewCustomersRow() {
                return ((CustomersRow)(this.NewRow()));
            }
            
            protected override DataRow NewRowFromBuilder(DataRowBuilder builder) {
                // We need to ensure that all Rows in the tabled are typed rows.
                // Table calls newRow whenever it needs to create a row.
                // So the following conditions are covered by Row newRow(Record record)
                // * Cursor calls table.addRecord(record) 
                // * table.addRow(object[] values) calls newRow(record)    
                return new CustomersRow(builder);
            }
            
            protected override System.Type GetRowType() {
                return typeof(CustomersRow);
            }
            
            protected override void OnRowChanged(DataRowChangeEventArgs e) {
                base.OnRowChanged(e);
                if (((this.CustomersRowChanged) != (null))) {
                    this.CustomersRowChanged(this, new CustomersRowChangeEvent(((CustomersRow)(e.Row)), e.Action));
                }
            }
            
            protected override void OnRowChanging(DataRowChangeEventArgs e) {
                base.OnRowChanging(e);
                if (((this.CustomersRowChanging) != (null))) {
                    this.CustomersRowChanging(this, new CustomersRowChangeEvent(((CustomersRow)(e.Row)), e.Action));
                }
            }
            
            protected override void OnRowDeleted(DataRowChangeEventArgs e) {
                base.OnRowDeleted(e);
                if (((this.CustomersRowDeleted) != (null))) {
                    this.CustomersRowDeleted(this, new CustomersRowChangeEvent(((CustomersRow)(e.Row)), e.Action));
                }
            }
            
            protected override void OnRowDeleting(DataRowChangeEventArgs e) {
                base.OnRowDeleting(e);
                if (((this.CustomersRowDeleting) != (null))) {
                    this.CustomersRowDeleting(this, new CustomersRowChangeEvent(((CustomersRow)(e.Row)), e.Action));
                }
            }
            
            public void RemoveCustomersRow(CustomersRow row) {
                this.Rows.Remove(row);
            }
        }
        
        public class CustomersRow : DataRow {
            
            private CustomersDataTable tableCustomers;
            
            internal CustomersRow(DataRowBuilder rb) : 
                    base(rb) {
                this.tableCustomers = ((CustomersDataTable)(this.Table));
            }
            
            public string CustomerID {
                get {
                    return ((string)(this[this.tableCustomers.CustomerIDColumn]));
                }
                set {
                    this[this.tableCustomers.CustomerIDColumn] = value;
                }
            }
            
            public string CompanyName {
                get {
                    return ((string)(this[this.tableCustomers.CompanyNameColumn]));
                }
                set {
                    this[this.tableCustomers.CompanyNameColumn] = value;
                }
            }
            
            public string ContactName {
                get {
                    try {
                        return ((string)(this[this.tableCustomers.ContactNameColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableCustomers.ContactNameColumn] = value;
                }
            }
            
            public string ContactTitle {
                get {
                    try {
                        return ((string)(this[this.tableCustomers.ContactTitleColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableCustomers.ContactTitleColumn] = value;
                }
            }
            
            public string Address {
                get {
                    try {
                        return ((string)(this[this.tableCustomers.AddressColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableCustomers.AddressColumn] = value;
                }
            }
            
            public string City {
                get {
                    try {
                        return ((string)(this[this.tableCustomers.CityColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableCustomers.CityColumn] = value;
                }
            }
            
            public string Region {
                get {
                    try {
                        return ((string)(this[this.tableCustomers.RegionColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableCustomers.RegionColumn] = value;
                }
            }
            
            public string PostalCode {
                get {
                    try {
                        return ((string)(this[this.tableCustomers.PostalCodeColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableCustomers.PostalCodeColumn] = value;
                }
            }
            
            public string Country {
                get {
                    try {
                        return ((string)(this[this.tableCustomers.CountryColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableCustomers.CountryColumn] = value;
                }
            }
            
            public string Phone {
                get {
                    try {
                        return ((string)(this[this.tableCustomers.PhoneColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableCustomers.PhoneColumn] = value;
                }
            }
            
            public string Fax {
                get {
                    try {
                        return ((string)(this[this.tableCustomers.FaxColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableCustomers.FaxColumn] = value;
                }
            }
            
            public bool IsContactNameNull() {
                return this.IsNull(this.tableCustomers.ContactNameColumn);
            }
            
            public void SetContactNameNull() {
                this[this.tableCustomers.ContactNameColumn] = Convert.DBNull;
            }
            
            public bool IsContactTitleNull() {
                return this.IsNull(this.tableCustomers.ContactTitleColumn);
            }
            
            public void SetContactTitleNull() {
                this[this.tableCustomers.ContactTitleColumn] = Convert.DBNull;
            }
            
            public bool IsAddressNull() {
                return this.IsNull(this.tableCustomers.AddressColumn);
            }
            
            public void SetAddressNull() {
                this[this.tableCustomers.AddressColumn] = Convert.DBNull;
            }
            
            public bool IsCityNull() {
                return this.IsNull(this.tableCustomers.CityColumn);
            }
            
            public void SetCityNull() {
                this[this.tableCustomers.CityColumn] = Convert.DBNull;
            }
            
            public bool IsRegionNull() {
                return this.IsNull(this.tableCustomers.RegionColumn);
            }
            
            public void SetRegionNull() {
                this[this.tableCustomers.RegionColumn] = Convert.DBNull;
            }
            
            public bool IsPostalCodeNull() {
                return this.IsNull(this.tableCustomers.PostalCodeColumn);
            }
            
            public void SetPostalCodeNull() {
                this[this.tableCustomers.PostalCodeColumn] = Convert.DBNull;
            }
            
            public bool IsCountryNull() {
                return this.IsNull(this.tableCustomers.CountryColumn);
            }
            
            public void SetCountryNull() {
                this[this.tableCustomers.CountryColumn] = Convert.DBNull;
            }
            
            public bool IsPhoneNull() {
                return this.IsNull(this.tableCustomers.PhoneColumn);
            }
            
            public void SetPhoneNull() {
                this[this.tableCustomers.PhoneColumn] = Convert.DBNull;
            }
            
            public bool IsFaxNull() {
                return this.IsNull(this.tableCustomers.FaxColumn);
            }
            
            public void SetFaxNull() {
                this[this.tableCustomers.FaxColumn] = Convert.DBNull;
            }
            
            public OrdersRow[] GetOrdersRows() {
                return ((OrdersRow[])(this.GetChildRows(this.Table.ChildRelations["CustomersOrders"])));
            }
        }
        
        public class CustomersRowChangeEvent : EventArgs {
            
            private CustomersRow eventRow;
            
            private System.Data.DataRowAction eventAction;
            
            public CustomersRowChangeEvent(CustomersRow row, DataRowAction action) {
                this.eventRow = row;
                this.eventAction = action;
            }
            
            public CustomersRow Row {
                get {
                    return this.eventRow;
                }
            }
            
            public DataRowAction Action {
                get {
                    return this.eventAction;
                }
            }
        }
        
        public class OrdersDataTable : DataTable, System.Collections.IEnumerable {
            
            private DataColumn columnOrderID;
            
            private DataColumn columnCustomerID;
            
            private DataColumn columnEmployeeID;
            
            private DataColumn columnOrderDate;
            
            private DataColumn columnRequiredDate;
            
            private DataColumn columnShippedDate;
            
            private DataColumn columnShipVia;
            
            private DataColumn columnFreight;
            
            private DataColumn columnShipName;
            
            private DataColumn columnShipAddress;
            
            private DataColumn columnShipCity;
            
            private DataColumn columnShipRegion;
            
            private DataColumn columnShipPostalCode;
            
            private DataColumn columnShipCountry;
            
            internal OrdersDataTable() : 
                    base("Orders") {
                this.InitClass();
            }
            
            public int Count {
                get {
                    return this.Rows.Count;
                }
            }
            
            internal DataColumn OrderIDColumn {
                get {
                    return this.columnOrderID;
                }
            }
            
            internal DataColumn CustomerIDColumn {
                get {
                    return this.columnCustomerID;
                }
            }
            
            internal DataColumn EmployeeIDColumn {
                get {
                    return this.columnEmployeeID;
                }
            }
            
            internal DataColumn OrderDateColumn {
                get {
                    return this.columnOrderDate;
                }
            }
            
            internal DataColumn RequiredDateColumn {
                get {
                    return this.columnRequiredDate;
                }
            }
            
            internal DataColumn ShippedDateColumn {
                get {
                    return this.columnShippedDate;
                }
            }
            
            internal DataColumn ShipViaColumn {
                get {
                    return this.columnShipVia;
                }
            }
            
            internal DataColumn FreightColumn {
                get {
                    return this.columnFreight;
                }
            }
            
            internal DataColumn ShipNameColumn {
                get {
                    return this.columnShipName;
                }
            }
            
            internal DataColumn ShipAddressColumn {
                get {
                    return this.columnShipAddress;
                }
            }
            
            internal DataColumn ShipCityColumn {
                get {
                    return this.columnShipCity;
                }
            }
            
            internal DataColumn ShipRegionColumn {
                get {
                    return this.columnShipRegion;
                }
            }
            
            internal DataColumn ShipPostalCodeColumn {
                get {
                    return this.columnShipPostalCode;
                }
            }
            
            internal DataColumn ShipCountryColumn {
                get {
                    return this.columnShipCountry;
                }
            }
            
            public OrdersRow this[int index] {
                get {
                    return ((OrdersRow)(this.Rows[index]));
                }
            }
            
            public event OrdersRowChangeEventHandler OrdersRowChanged;
            
            public event OrdersRowChangeEventHandler OrdersRowChanging;
            
            public event OrdersRowChangeEventHandler OrdersRowDeleted;
            
            public event OrdersRowChangeEventHandler OrdersRowDeleting;
            
            public void AddOrdersRow(OrdersRow row) {
                this.Rows.Add(row);
            }
            
            public OrdersRow AddOrdersRow(CustomersRow parentCustomersRowByCustomersOrders, int EmployeeID, System.DateTime OrderDate, System.DateTime RequiredDate, System.DateTime ShippedDate, int ShipVia, System.Decimal Freight, string ShipName, string ShipAddress, string ShipCity, string ShipRegion, string ShipPostalCode, string ShipCountry) {
                OrdersRow rowOrdersRow = ((OrdersRow)(this.NewRow()));
                rowOrdersRow.ItemArray = new Object[] {null,
                        parentCustomersRowByCustomersOrders[0],
                        EmployeeID,
                        OrderDate,
                        RequiredDate,
                        ShippedDate,
                        ShipVia,
                        Freight,
                        ShipName,
                        ShipAddress,
                        ShipCity,
                        ShipRegion,
                        ShipPostalCode,
                        ShipCountry};
                this.Rows.Add(rowOrdersRow);
                return rowOrdersRow;
            }
            
            public OrdersRow FindByOrderID(int OrderID) {
                return ((OrdersRow)(this.Rows.Find(new Object[] {OrderID})));
            }
            
            public System.Collections.IEnumerator GetEnumerator() {
                return this.Rows.GetEnumerator();
            }
            
            private void InitClass() {
                this.columnOrderID = new DataColumn("OrderID", typeof(int), "", MappingType.Element);
                this.columnOrderID.AutoIncrement = true;
                this.columnOrderID.AllowDBNull = false;
                this.columnOrderID.ReadOnly = true;
                this.columnOrderID.Unique = true;
                this.Columns.Add(this.columnOrderID);
                this.columnCustomerID = new DataColumn("CustomerID", typeof(string), "", MappingType.Element);
                this.Columns.Add(this.columnCustomerID);
                this.columnEmployeeID = new DataColumn("EmployeeID", typeof(int), "", MappingType.Element);
                this.Columns.Add(this.columnEmployeeID);
                this.columnOrderDate = new DataColumn("OrderDate", typeof(System.DateTime), "", MappingType.Element);
                this.Columns.Add(this.columnOrderDate);
                this.columnRequiredDate = new DataColumn("RequiredDate", typeof(System.DateTime), "", MappingType.Element);
                this.Columns.Add(this.columnRequiredDate);
                this.columnShippedDate = new DataColumn("ShippedDate", typeof(System.DateTime), "", MappingType.Element);
                this.Columns.Add(this.columnShippedDate);
                this.columnShipVia = new DataColumn("ShipVia", typeof(int), "", MappingType.Element);
                this.Columns.Add(this.columnShipVia);
                this.columnFreight = new DataColumn("Freight", typeof(System.Decimal), "", MappingType.Element);
                this.Columns.Add(this.columnFreight);
                this.columnShipName = new DataColumn("ShipName", typeof(string), "", MappingType.Element);
                this.Columns.Add(this.columnShipName);
                this.columnShipAddress = new DataColumn("ShipAddress", typeof(string), "", MappingType.Element);
                this.Columns.Add(this.columnShipAddress);
                this.columnShipCity = new DataColumn("ShipCity", typeof(string), "", MappingType.Element);
                this.Columns.Add(this.columnShipCity);
                this.columnShipRegion = new DataColumn("ShipRegion", typeof(string), "", MappingType.Element);
                this.Columns.Add(this.columnShipRegion);
                this.columnShipPostalCode = new DataColumn("ShipPostalCode", typeof(string), "", MappingType.Element);
                this.Columns.Add(this.columnShipPostalCode);
                this.columnShipCountry = new DataColumn("ShipCountry", typeof(string), "", MappingType.Element);
                this.Columns.Add(this.columnShipCountry);
                this.PrimaryKey = new DataColumn[] {this.columnOrderID};
            }
            
            public OrdersRow NewOrdersRow() {
                return ((OrdersRow)(this.NewRow()));
            }
            
            protected override DataRow NewRowFromBuilder(DataRowBuilder builder) {
                // We need to ensure that all Rows in the tabled are typed rows.
                // Table calls newRow whenever it needs to create a row.
                // So the following conditions are covered by Row newRow(Record record)
                // * Cursor calls table.addRecord(record) 
                // * table.addRow(object[] values) calls newRow(record)    
                return new OrdersRow(builder);
            }
            
            protected override System.Type GetRowType() {
                return typeof(OrdersRow);
            }
            
            protected override void OnRowChanged(DataRowChangeEventArgs e) {
                base.OnRowChanged(e);
                if (((this.OrdersRowChanged) != (null))) {
                    this.OrdersRowChanged(this, new OrdersRowChangeEvent(((OrdersRow)(e.Row)), e.Action));
                }
            }
            
            protected override void OnRowChanging(DataRowChangeEventArgs e) {
                base.OnRowChanging(e);
                if (((this.OrdersRowChanging) != (null))) {
                    this.OrdersRowChanging(this, new OrdersRowChangeEvent(((OrdersRow)(e.Row)), e.Action));
                }
            }
            
            protected override void OnRowDeleted(DataRowChangeEventArgs e) {
                base.OnRowDeleted(e);
                if (((this.OrdersRowDeleted) != (null))) {
                    this.OrdersRowDeleted(this, new OrdersRowChangeEvent(((OrdersRow)(e.Row)), e.Action));
                }
            }
            
            protected override void OnRowDeleting(DataRowChangeEventArgs e) {
                base.OnRowDeleting(e);
                if (((this.OrdersRowDeleting) != (null))) {
                    this.OrdersRowDeleting(this, new OrdersRowChangeEvent(((OrdersRow)(e.Row)), e.Action));
                }
            }
            
            public void RemoveOrdersRow(OrdersRow row) {
                this.Rows.Remove(row);
            }
        }
        
        public class OrdersRow : DataRow {
            
            private OrdersDataTable tableOrders;
            
            internal OrdersRow(DataRowBuilder rb) : 
                    base(rb) {
                this.tableOrders = ((OrdersDataTable)(this.Table));
            }
            
            public int OrderID {
                get {
                    return ((int)(this[this.tableOrders.OrderIDColumn]));
                }
                set {
                    this[this.tableOrders.OrderIDColumn] = value;
                }
            }
            
            public string CustomerID {
                get {
                    try {
                        return ((string)(this[this.tableOrders.CustomerIDColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableOrders.CustomerIDColumn] = value;
                }
            }
            
            public int EmployeeID {
                get {
                    try {
                        return ((int)(this[this.tableOrders.EmployeeIDColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableOrders.EmployeeIDColumn] = value;
                }
            }
            
            public System.DateTime OrderDate {
                get {
                    try {
                        return ((System.DateTime)(this[this.tableOrders.OrderDateColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableOrders.OrderDateColumn] = value;
                }
            }
            
            public System.DateTime RequiredDate {
                get {
                    try {
                        return ((System.DateTime)(this[this.tableOrders.RequiredDateColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableOrders.RequiredDateColumn] = value;
                }
            }
            
            public System.DateTime ShippedDate {
                get {
                    try {
                        return ((System.DateTime)(this[this.tableOrders.ShippedDateColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableOrders.ShippedDateColumn] = value;
                }
            }
            
            public int ShipVia {
                get {
                    try {
                        return ((int)(this[this.tableOrders.ShipViaColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableOrders.ShipViaColumn] = value;
                }
            }
            
            public System.Decimal Freight {
                get {
                    try {
                        return ((System.Decimal)(this[this.tableOrders.FreightColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableOrders.FreightColumn] = value;
                }
            }
            
            public string ShipName {
                get {
                    try {
                        return ((string)(this[this.tableOrders.ShipNameColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableOrders.ShipNameColumn] = value;
                }
            }
            
            public string ShipAddress {
                get {
                    try {
                        return ((string)(this[this.tableOrders.ShipAddressColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableOrders.ShipAddressColumn] = value;
                }
            }
            
            public string ShipCity {
                get {
                    try {
                        return ((string)(this[this.tableOrders.ShipCityColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableOrders.ShipCityColumn] = value;
                }
            }
            
            public string ShipRegion {
                get {
                    try {
                        return ((string)(this[this.tableOrders.ShipRegionColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableOrders.ShipRegionColumn] = value;
                }
            }
            
            public string ShipPostalCode {
                get {
                    try {
                        return ((string)(this[this.tableOrders.ShipPostalCodeColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableOrders.ShipPostalCodeColumn] = value;
                }
            }
            
            public string ShipCountry {
                get {
                    try {
                        return ((string)(this[this.tableOrders.ShipCountryColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableOrders.ShipCountryColumn] = value;
                }
            }
            
            public CustomersRow CustomersRow {
                get {
                    return ((CustomersRow)(this.GetParentRow(this.Table.ParentRelations["CustomersOrders"])));
                }
                set {
                    this.SetParentRow(value, this.Table.ParentRelations["CustomersOrders"]);
                }
            }
            
            public bool IsCustomerIDNull() {
                return this.IsNull(this.tableOrders.CustomerIDColumn);
            }
            
            public void SetCustomerIDNull() {
                this[this.tableOrders.CustomerIDColumn] = Convert.DBNull;
            }
            
            public bool IsEmployeeIDNull() {
                return this.IsNull(this.tableOrders.EmployeeIDColumn);
            }
            
            public void SetEmployeeIDNull() {
                this[this.tableOrders.EmployeeIDColumn] = Convert.DBNull;
            }
            
            public bool IsOrderDateNull() {
                return this.IsNull(this.tableOrders.OrderDateColumn);
            }
            
            public void SetOrderDateNull() {
                this[this.tableOrders.OrderDateColumn] = Convert.DBNull;
            }
            
            public bool IsRequiredDateNull() {
                return this.IsNull(this.tableOrders.RequiredDateColumn);
            }
            
            public void SetRequiredDateNull() {
                this[this.tableOrders.RequiredDateColumn] = Convert.DBNull;
            }
            
            public bool IsShippedDateNull() {
                return this.IsNull(this.tableOrders.ShippedDateColumn);
            }
            
            public void SetShippedDateNull() {
                this[this.tableOrders.ShippedDateColumn] = Convert.DBNull;
            }
            
            public bool IsShipViaNull() {
                return this.IsNull(this.tableOrders.ShipViaColumn);
            }
            
            public void SetShipViaNull() {
                this[this.tableOrders.ShipViaColumn] = Convert.DBNull;
            }
            
            public bool IsFreightNull() {
                return this.IsNull(this.tableOrders.FreightColumn);
            }
            
            public void SetFreightNull() {
                this[this.tableOrders.FreightColumn] = Convert.DBNull;
            }
            
            public bool IsShipNameNull() {
                return this.IsNull(this.tableOrders.ShipNameColumn);
            }
            
            public void SetShipNameNull() {
                this[this.tableOrders.ShipNameColumn] = Convert.DBNull;
            }
            
            public bool IsShipAddressNull() {
                return this.IsNull(this.tableOrders.ShipAddressColumn);
            }
            
            public void SetShipAddressNull() {
                this[this.tableOrders.ShipAddressColumn] = Convert.DBNull;
            }
            
            public bool IsShipCityNull() {
                return this.IsNull(this.tableOrders.ShipCityColumn);
            }
            
            public void SetShipCityNull() {
                this[this.tableOrders.ShipCityColumn] = Convert.DBNull;
            }
            
            public bool IsShipRegionNull() {
                return this.IsNull(this.tableOrders.ShipRegionColumn);
            }
            
            public void SetShipRegionNull() {
                this[this.tableOrders.ShipRegionColumn] = Convert.DBNull;
            }
            
            public bool IsShipPostalCodeNull() {
                return this.IsNull(this.tableOrders.ShipPostalCodeColumn);
            }
            
            public void SetShipPostalCodeNull() {
                this[this.tableOrders.ShipPostalCodeColumn] = Convert.DBNull;
            }
            
            public bool IsShipCountryNull() {
                return this.IsNull(this.tableOrders.ShipCountryColumn);
            }
            
            public void SetShipCountryNull() {
                this[this.tableOrders.ShipCountryColumn] = Convert.DBNull;
            }
        }
        
        public class OrdersRowChangeEvent : EventArgs {
            
            private OrdersRow eventRow;
            
            private System.Data.DataRowAction eventAction;
            
            public OrdersRowChangeEvent(OrdersRow row, DataRowAction action) {
                this.eventRow = row;
                this.eventAction = action;
            }
            
            public OrdersRow Row {
                get {
                    return this.eventRow;
                }
            }
            
            public DataRowAction Action {
                get {
                    return this.eventAction;
                }
            }
        }
    }
}
