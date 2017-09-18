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

namespace Microsoft.Samples.Windows.Forms.Cs.Update.Data {
    using System;
    using System.Data;
    using Microsoft.Win32;
    
    
    public class CustomersDataSet : System.Data.DataSet {
        
        private CustomersDataTable tableCustomers;
        
        public CustomersDataSet() {
            this.InitClass();
        }
        
        [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
        public CustomersDataTable Customers {
            get {
                return this.tableCustomers;
            }
        }
        
        private void InitClass() {
            this.DataSetName = "CustomersDataSet";
            this.Namespace = "";
            this.tableCustomers = new CustomersDataTable();
            this.Tables.Add(this.tableCustomers);
        }
        
        public delegate void CustomersRowChangeEventHandler(object sender, CustomersRowChangeEvent e);
        
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
                        throw new StrongTypingException("Cannot get value because it is DBNull.",e);
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
                        throw new StrongTypingException("Cannot get value because it is DBNull.",e);
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
                        throw new StrongTypingException("Cannot get value because it is DBNull.",e);
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
                        throw new StrongTypingException("Cannot get value because it is DBNull.",e);
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
                        throw new StrongTypingException("Cannot get value because it is DBNull.",e);
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
                        throw new StrongTypingException("Cannot get value because it is DBNull.",e);
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
                        throw new StrongTypingException("Cannot get value because it is DBNull.",e);
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
                        throw new StrongTypingException("Cannot get value because it is DBNull.",e);
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
                        throw new StrongTypingException("Cannot get value because it is DBNull.",e);
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
    }
}
