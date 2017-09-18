'
'*------------------------------------------------------------------------------
'*  <copyright from='1997' to='2002' company='Microsoft Corporation'>
'*   Copyright (c) Microsoft Corporation. All Rights Reserved.
'*
'*   This source code is intended only as a supplement to Microsoft
'*   Development Tools and/or on-line documentation.  See these other
'*   materials for detailed information regarding Microsoft code samples.
'*
'*   </copyright>
'*-------------------------------------------------------------------------------
'*
'* File: SQLHelper.vb
'*
'* Purpose: Contains all of this projects Designer generated DataAdaptor
'*          code. This code was generated using the desktop Data Designers
'*          and then modified for use in a device application.
'*

Public Class SQLHelper

    Friend WithEvents SqlDataAdapter1 As System.Data.SqlClient.SqlDataAdapter
    Friend WithEvents SqlConnection1 As System.Data.SqlClient.SqlConnection
    Friend WithEvents SqlDataAdapter2 As System.Data.SqlClient.SqlDataAdapter
    Friend SqlSelectCommand2 As System.Data.SqlClient.SqlCommand
    Friend SqlInsertCommand2 As System.Data.SqlClient.SqlCommand
    Friend SqlUpdateCommand2 As System.Data.SqlClient.SqlCommand
    Friend SqlDeleteCommand2 As System.Data.SqlClient.SqlCommand
    Friend SqlSelectCommand1 As System.Data.SqlClient.SqlCommand
    Friend SqlInsertCommand1 As System.Data.SqlClient.SqlCommand
    Friend SqlUpdateCommand1 As System.Data.SqlClient.SqlCommand
    Friend SqlDeleteCommand1 As System.Data.SqlClient.SqlCommand
    Friend WithEvents SqlDataAdapter3 As System.Data.SqlClient.SqlDataAdapter
    Friend SqlSelectCommand3 As System.Data.SqlClient.SqlCommand
    Friend SqlInsertCommand3 As System.Data.SqlClient.SqlCommand
    Friend SqlUpdateCommand3 As System.Data.SqlClient.SqlCommand
    Friend SqlDeleteCommand3 As System.Data.SqlClient.SqlCommand
    Friend WithEvents SqlDataAdapter4 As System.Data.SqlClient.SqlDataAdapter
    Friend SqlSelectCommand4 As System.Data.SqlClient.SqlCommand
    Friend SqlInsertCommand4 As System.Data.SqlClient.SqlCommand
    Friend SqlUpdateCommand4 As System.Data.SqlClient.SqlCommand
    Friend SqlDeleteCommand4 As System.Data.SqlClient.SqlCommand

    Sub New(ByVal svr As String, ByVal usr As String, ByVal pwd As String)

        Me.SqlDataAdapter1 = New System.Data.SqlClient.SqlDataAdapter
        Me.SqlConnection1 = New System.Data.SqlClient.SqlConnection
        Me.SqlDataAdapter2 = New System.Data.SqlClient.SqlDataAdapter
        Me.SqlSelectCommand2 = New System.Data.SqlClient.SqlCommand
        Me.SqlInsertCommand2 = New System.Data.SqlClient.SqlCommand
        Me.SqlUpdateCommand2 = New System.Data.SqlClient.SqlCommand
        Me.SqlDeleteCommand2 = New System.Data.SqlClient.SqlCommand
        Me.SqlSelectCommand1 = New System.Data.SqlClient.SqlCommand
        Me.SqlInsertCommand1 = New System.Data.SqlClient.SqlCommand
        Me.SqlUpdateCommand1 = New System.Data.SqlClient.SqlCommand
        Me.SqlDeleteCommand1 = New System.Data.SqlClient.SqlCommand
        Me.SqlDataAdapter3 = New System.Data.SqlClient.SqlDataAdapter
        Me.SqlSelectCommand3 = New System.Data.SqlClient.SqlCommand
        Me.SqlInsertCommand3 = New System.Data.SqlClient.SqlCommand
        Me.SqlUpdateCommand3 = New System.Data.SqlClient.SqlCommand
        Me.SqlDeleteCommand3 = New System.Data.SqlClient.SqlCommand
        Me.SqlDataAdapter4 = New System.Data.SqlClient.SqlDataAdapter
        Me.SqlSelectCommand4 = New System.Data.SqlClient.SqlCommand
        Me.SqlInsertCommand4 = New System.Data.SqlClient.SqlCommand
        Me.SqlUpdateCommand4 = New System.Data.SqlClient.SqlCommand
        Me.SqlDeleteCommand4 = New System.Data.SqlClient.SqlCommand
        '
        'SqlDataAdapter1
        '
        Me.SqlDataAdapter1.DeleteCommand = Me.SqlDeleteCommand1
        Me.SqlDataAdapter1.InsertCommand = Me.SqlInsertCommand1
        Me.SqlDataAdapter1.SelectCommand = Me.SqlSelectCommand1
        Me.SqlDataAdapter1.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "Customers", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("CustomerID", "CustomerID"), New System.Data.Common.DataColumnMapping("CompanyName", "CompanyName"), New System.Data.Common.DataColumnMapping("ContactName", "ContactName"), New System.Data.Common.DataColumnMapping("ContactTitle", "ContactTitle"), New System.Data.Common.DataColumnMapping("Address", "Address"), New System.Data.Common.DataColumnMapping("City", "City"), New System.Data.Common.DataColumnMapping("Region", "Region"), New System.Data.Common.DataColumnMapping("PostalCode", "PostalCode"), New System.Data.Common.DataColumnMapping("Country", "Country"), New System.Data.Common.DataColumnMapping("Phone", "Phone"), New System.Data.Common.DataColumnMapping("Fax", "Fax")})})
        Me.SqlDataAdapter1.UpdateCommand = Me.SqlUpdateCommand1


        ' This check is to ensure that the connection constants
        ' have been modified before deployment.
        If svr = "" And usr = "" And pwd = "" Then
            MessageBox.Show( _
                "You have not modified the SQL connection settings for this sample. " & _
                "Please click on the 'Settings' tab and enter your connection details. " _
            )
        End If


        '
        'SqlConnection1
        '
        Me.SqlConnection1.ConnectionString = _
            "data source=" & svr & ";" & _
            "user id=" & usr & ";" & _
            "password=" & pwd & ";" & _
            "initial catalog=Northwind;" & _
            "persist security info=True;" & _
            "packet size=4096"

        '
        'SqlDataAdapter2
        '
        Me.SqlDataAdapter2.DeleteCommand = Me.SqlDeleteCommand2
        Me.SqlDataAdapter2.InsertCommand = Me.SqlInsertCommand2
        Me.SqlDataAdapter2.SelectCommand = Me.SqlSelectCommand2
        Me.SqlDataAdapter2.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "Orders", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("OrderID", "OrderID"), New System.Data.Common.DataColumnMapping("CustomerID", "CustomerID"), New System.Data.Common.DataColumnMapping("EmployeeID", "EmployeeID"), New System.Data.Common.DataColumnMapping("OrderDate", "OrderDate"), New System.Data.Common.DataColumnMapping("RequiredDate", "RequiredDate"), New System.Data.Common.DataColumnMapping("ShippedDate", "ShippedDate"), New System.Data.Common.DataColumnMapping("ShipVia", "ShipVia"), New System.Data.Common.DataColumnMapping("Freight", "Freight"), New System.Data.Common.DataColumnMapping("ShipName", "ShipName"), New System.Data.Common.DataColumnMapping("ShipAddress", "ShipAddress"), New System.Data.Common.DataColumnMapping("ShipCity", "ShipCity"), New System.Data.Common.DataColumnMapping("ShipRegion", "ShipRegion"), New System.Data.Common.DataColumnMapping("ShipPostalCode", "ShipPostalCode"), New System.Data.Common.DataColumnMapping("ShipCountry", "ShipCountry")})})
        Me.SqlDataAdapter2.UpdateCommand = Me.SqlUpdateCommand2
        '
        'SqlSelectCommand2
        '
        Me.SqlSelectCommand2.CommandText = "SELECT OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, Shi" & _
        "pVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, Ship" & _
        "Country FROM dbo.Orders"
        Me.SqlSelectCommand2.Connection = Me.SqlConnection1
        '
        'SqlInsertCommand2
        '
        Me.SqlInsertCommand2.CommandText = "INSERT INTO dbo.Orders(CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDa" & _
        "te, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCod" & _
        "e, ShipCountry) VALUES (@CustomerID, @EmployeeID, @OrderDate, @RequiredDate, @Sh" & _
        "ippedDate, @ShipVia, @Freight, @ShipName, @ShipAddress, @ShipCity, @ShipRegion, " & _
        "@ShipPostalCode, @ShipCountry); SELECT OrderID, CustomerID, EmployeeID, OrderDat" & _
        "e, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity," & _
        " ShipRegion, ShipPostalCode, ShipCountry FROM dbo.Orders WHERE (OrderID = @@IDEN" & _
        "TITY)"
        Me.SqlInsertCommand2.Connection = Me.SqlConnection1
        Me.SqlInsertCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@CustomerID", System.Data.SqlDbType.NVarChar, 5, "CustomerID"))
        Me.SqlInsertCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@EmployeeID", System.Data.SqlDbType.Int, 4, "EmployeeID"))
        Me.SqlInsertCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@OrderDate", System.Data.SqlDbType.DateTime, 8, "OrderDate"))
        Me.SqlInsertCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@RequiredDate", System.Data.SqlDbType.DateTime, 8, "RequiredDate"))
        Me.SqlInsertCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ShippedDate", System.Data.SqlDbType.DateTime, 8, "ShippedDate"))
        Me.SqlInsertCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ShipVia", System.Data.SqlDbType.Int, 4, "ShipVia"))
        Me.SqlInsertCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Freight", System.Data.SqlDbType.Money, 8, "Freight"))
        Me.SqlInsertCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ShipName", System.Data.SqlDbType.NVarChar, 40, "ShipName"))
        Me.SqlInsertCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ShipAddress", System.Data.SqlDbType.NVarChar, 60, "ShipAddress"))
        Me.SqlInsertCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ShipCity", System.Data.SqlDbType.NVarChar, 15, "ShipCity"))
        Me.SqlInsertCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ShipRegion", System.Data.SqlDbType.NVarChar, 15, "ShipRegion"))
        Me.SqlInsertCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ShipPostalCode", System.Data.SqlDbType.NVarChar, 10, "ShipPostalCode"))
        Me.SqlInsertCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ShipCountry", System.Data.SqlDbType.NVarChar, 15, "ShipCountry"))
        '
        'SqlUpdateCommand2
        '
        Me.SqlUpdateCommand2.CommandText = "UPDATE dbo.Orders SET CustomerID = @CustomerID, EmployeeID = @EmployeeID, OrderDa" & _
        "te = @OrderDate, RequiredDate = @RequiredDate, ShippedDate = @ShippedDate, ShipV" & _
        "ia = @ShipVia, Freight = @Freight, ShipName = @ShipName, ShipAddress = @ShipAddr" & _
        "ess, ShipCity = @ShipCity, ShipRegion = @ShipRegion, ShipPostalCode = @ShipPosta" & _
        "lCode, ShipCountry = @ShipCountry WHERE (OrderID = @Original_OrderID) AND (Custo" & _
        "merID = @Original_CustomerID OR @Original_CustomerID IS NULL AND CustomerID IS N" & _
        "ULL) AND (EmployeeID = @Original_EmployeeID OR @Original_EmployeeID IS NULL AND " & _
        "EmployeeID IS NULL) AND (Freight = @Original_Freight OR @Original_Freight IS NUL" & _
        "L AND Freight IS NULL) AND (OrderDate = @Original_OrderDate OR @Original_OrderDa" & _
        "te IS NULL AND OrderDate IS NULL) AND (RequiredDate = @Original_RequiredDate OR " & _
        "@Original_RequiredDate IS NULL AND RequiredDate IS NULL) AND (ShipAddress = @Ori" & _
        "ginal_ShipAddress OR @Original_ShipAddress IS NULL AND ShipAddress IS NULL) AND " & _
        "(ShipCity = @Original_ShipCity OR @Original_ShipCity IS NULL AND ShipCity IS NUL" & _
        "L) AND (ShipCountry = @Original_ShipCountry OR @Original_ShipCountry IS NULL AND" & _
        " ShipCountry IS NULL) AND (ShipName = @Original_ShipName OR @Original_ShipName I" & _
        "S NULL AND ShipName IS NULL) AND (ShipPostalCode = @Original_ShipPostalCode OR @" & _
        "Original_ShipPostalCode IS NULL AND ShipPostalCode IS NULL) AND (ShipRegion = @O" & _
        "riginal_ShipRegion OR @Original_ShipRegion IS NULL AND ShipRegion IS NULL) AND (" & _
        "ShipVia = @Original_ShipVia OR @Original_ShipVia IS NULL AND ShipVia IS NULL) AN" & _
        "D (ShippedDate = @Original_ShippedDate OR @Original_ShippedDate IS NULL AND Ship" & _
        "pedDate IS NULL); SELECT OrderID, CustomerID, EmployeeID, OrderDate, RequiredDat" & _
        "e, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, S" & _
        "hipPostalCode, ShipCountry FROM dbo.Orders WHERE (OrderID = @OrderID)"
        Me.SqlUpdateCommand2.Connection = Me.SqlConnection1
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@CustomerID", System.Data.SqlDbType.NVarChar, 5, "CustomerID"))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@EmployeeID", System.Data.SqlDbType.Int, 4, "EmployeeID"))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@OrderDate", System.Data.SqlDbType.DateTime, 8, "OrderDate"))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@RequiredDate", System.Data.SqlDbType.DateTime, 8, "RequiredDate"))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ShippedDate", System.Data.SqlDbType.DateTime, 8, "ShippedDate"))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ShipVia", System.Data.SqlDbType.Int, 4, "ShipVia"))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Freight", System.Data.SqlDbType.Money, 8, "Freight"))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ShipName", System.Data.SqlDbType.NVarChar, 40, "ShipName"))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ShipAddress", System.Data.SqlDbType.NVarChar, 60, "ShipAddress"))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ShipCity", System.Data.SqlDbType.NVarChar, 15, "ShipCity"))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ShipRegion", System.Data.SqlDbType.NVarChar, 15, "ShipRegion"))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ShipPostalCode", System.Data.SqlDbType.NVarChar, 10, "ShipPostalCode"))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ShipCountry", System.Data.SqlDbType.NVarChar, 15, "ShipCountry"))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_OrderID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "OrderID", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_CustomerID", System.Data.SqlDbType.NVarChar, 5, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "CustomerID", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_EmployeeID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "EmployeeID", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Freight", System.Data.SqlDbType.Money, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Freight", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_OrderDate", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "OrderDate", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_RequiredDate", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "RequiredDate", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ShipAddress", System.Data.SqlDbType.NVarChar, 60, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ShipAddress", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ShipCity", System.Data.SqlDbType.NVarChar, 15, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ShipCity", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ShipCountry", System.Data.SqlDbType.NVarChar, 15, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ShipCountry", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ShipName", System.Data.SqlDbType.NVarChar, 40, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ShipName", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ShipPostalCode", System.Data.SqlDbType.NVarChar, 10, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ShipPostalCode", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ShipRegion", System.Data.SqlDbType.NVarChar, 15, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ShipRegion", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ShipVia", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ShipVia", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ShippedDate", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ShippedDate", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@OrderID", System.Data.SqlDbType.Int, 4, "OrderID"))
        '
        'SqlDeleteCommand2
        '
        Me.SqlDeleteCommand2.CommandText = "DELETE FROM dbo.Orders WHERE (OrderID = @Original_OrderID) AND (CustomerID = @Ori" & _
        "ginal_CustomerID OR @Original_CustomerID IS NULL AND CustomerID IS NULL) AND (Em" & _
        "ployeeID = @Original_EmployeeID OR @Original_EmployeeID IS NULL AND EmployeeID I" & _
        "S NULL) AND (Freight = @Original_Freight OR @Original_Freight IS NULL AND Freigh" & _
        "t IS NULL) AND (OrderDate = @Original_OrderDate OR @Original_OrderDate IS NULL A" & _
        "ND OrderDate IS NULL) AND (RequiredDate = @Original_RequiredDate OR @Original_Re" & _
        "quiredDate IS NULL AND RequiredDate IS NULL) AND (ShipAddress = @Original_ShipAd" & _
        "dress OR @Original_ShipAddress IS NULL AND ShipAddress IS NULL) AND (ShipCity = " & _
        "@Original_ShipCity OR @Original_ShipCity IS NULL AND ShipCity IS NULL) AND (Ship" & _
        "Country = @Original_ShipCountry OR @Original_ShipCountry IS NULL AND ShipCountry" & _
        " IS NULL) AND (ShipName = @Original_ShipName OR @Original_ShipName IS NULL AND S" & _
        "hipName IS NULL) AND (ShipPostalCode = @Original_ShipPostalCode OR @Original_Shi" & _
        "pPostalCode IS NULL AND ShipPostalCode IS NULL) AND (ShipRegion = @Original_Ship" & _
        "Region OR @Original_ShipRegion IS NULL AND ShipRegion IS NULL) AND (ShipVia = @O" & _
        "riginal_ShipVia OR @Original_ShipVia IS NULL AND ShipVia IS NULL) AND (ShippedDa" & _
        "te = @Original_ShippedDate OR @Original_ShippedDate IS NULL AND ShippedDate IS N" & _
        "ULL)"
        Me.SqlDeleteCommand2.Connection = Me.SqlConnection1
        Me.SqlDeleteCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_OrderID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "OrderID", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_CustomerID", System.Data.SqlDbType.NVarChar, 5, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "CustomerID", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_EmployeeID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "EmployeeID", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Freight", System.Data.SqlDbType.Money, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Freight", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_OrderDate", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "OrderDate", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_RequiredDate", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "RequiredDate", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ShipAddress", System.Data.SqlDbType.NVarChar, 60, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ShipAddress", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ShipCity", System.Data.SqlDbType.NVarChar, 15, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ShipCity", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ShipCountry", System.Data.SqlDbType.NVarChar, 15, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ShipCountry", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ShipName", System.Data.SqlDbType.NVarChar, 40, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ShipName", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ShipPostalCode", System.Data.SqlDbType.NVarChar, 10, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ShipPostalCode", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ShipRegion", System.Data.SqlDbType.NVarChar, 15, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ShipRegion", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ShipVia", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ShipVia", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ShippedDate", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ShippedDate", System.Data.DataRowVersion.Original, Nothing))
        '
        'SqlSelectCommand1
        '
        Me.SqlSelectCommand1.CommandText = "SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region," & _
        " PostalCode, Country, Phone, Fax FROM dbo.Customers ORDER BY CustomerID"
        Me.SqlSelectCommand1.Connection = Me.SqlConnection1
        '
        'SqlInsertCommand1
        '
        Me.SqlInsertCommand1.CommandText = "INSERT INTO dbo.Customers(CustomerID, CompanyName, ContactName, ContactTitle, Add" & _
        "ress, City, Region, PostalCode, Country, Phone, Fax) VALUES (@CustomerID, @Compa" & _
        "nyName, @ContactName, @ContactTitle, @Address, @City, @Region, @PostalCode, @Cou" & _
        "ntry, @Phone, @Fax); SELECT CustomerID, CompanyName, ContactName, ContactTitle, " & _
        "Address, City, Region, PostalCode, Country, Phone, Fax FROM dbo.Customers WHERE " & _
        "(CustomerID = @CustomerID) ORDER BY CustomerID"
        Me.SqlInsertCommand1.Connection = Me.SqlConnection1
        Me.SqlInsertCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@CustomerID", System.Data.SqlDbType.NVarChar, 5, "CustomerID"))
        Me.SqlInsertCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@CompanyName", System.Data.SqlDbType.NVarChar, 40, "CompanyName"))
        Me.SqlInsertCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ContactName", System.Data.SqlDbType.NVarChar, 30, "ContactName"))
        Me.SqlInsertCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ContactTitle", System.Data.SqlDbType.NVarChar, 30, "ContactTitle"))
        Me.SqlInsertCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Address", System.Data.SqlDbType.NVarChar, 60, "Address"))
        Me.SqlInsertCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@City", System.Data.SqlDbType.NVarChar, 15, "City"))
        Me.SqlInsertCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Region", System.Data.SqlDbType.NVarChar, 15, "Region"))
        Me.SqlInsertCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PostalCode", System.Data.SqlDbType.NVarChar, 10, "PostalCode"))
        Me.SqlInsertCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Country", System.Data.SqlDbType.NVarChar, 15, "Country"))
        Me.SqlInsertCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Phone", System.Data.SqlDbType.NVarChar, 24, "Phone"))
        Me.SqlInsertCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Fax", System.Data.SqlDbType.NVarChar, 24, "Fax"))
        '
        'SqlUpdateCommand1
        '
        Me.SqlUpdateCommand1.CommandText = "UPDATE dbo.Customers SET CustomerID = @CustomerID, CompanyName = @CompanyName, Co" & _
        "ntactName = @ContactName, ContactTitle = @ContactTitle, Address = @Address, City" & _
        " = @City, Region = @Region, PostalCode = @PostalCode, Country = @Country, Phone " & _
        "= @Phone, Fax = @Fax WHERE (CustomerID = @Original_CustomerID) AND (Address = @O" & _
        "riginal_Address OR @Original_Address IS NULL AND Address IS NULL) AND (City = @O" & _
        "riginal_City OR @Original_City IS NULL AND City IS NULL) AND (CompanyName = @Ori" & _
        "ginal_CompanyName) AND (ContactName = @Original_ContactName OR @Original_Contact" & _
        "Name IS NULL AND ContactName IS NULL) AND (ContactTitle = @Original_ContactTitle" & _
        " OR @Original_ContactTitle IS NULL AND ContactTitle IS NULL) AND (Country = @Ori" & _
        "ginal_Country OR @Original_Country IS NULL AND Country IS NULL) AND (Fax = @Orig" & _
        "inal_Fax OR @Original_Fax IS NULL AND Fax IS NULL) AND (Phone = @Original_Phone " & _
        "OR @Original_Phone IS NULL AND Phone IS NULL) AND (PostalCode = @Original_Postal" & _
        "Code OR @Original_PostalCode IS NULL AND PostalCode IS NULL) AND (Region = @Orig" & _
        "inal_Region OR @Original_Region IS NULL AND Region IS NULL); SELECT CustomerID, " & _
        "CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Count" & _
        "ry, Phone, Fax FROM dbo.Customers WHERE (CustomerID = @CustomerID) ORDER BY Cust" & _
        "omerID"
        Me.SqlUpdateCommand1.Connection = Me.SqlConnection1
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@CustomerID", System.Data.SqlDbType.NVarChar, 5, "CustomerID"))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@CompanyName", System.Data.SqlDbType.NVarChar, 40, "CompanyName"))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ContactName", System.Data.SqlDbType.NVarChar, 30, "ContactName"))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ContactTitle", System.Data.SqlDbType.NVarChar, 30, "ContactTitle"))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Address", System.Data.SqlDbType.NVarChar, 60, "Address"))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@City", System.Data.SqlDbType.NVarChar, 15, "City"))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Region", System.Data.SqlDbType.NVarChar, 15, "Region"))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PostalCode", System.Data.SqlDbType.NVarChar, 10, "PostalCode"))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Country", System.Data.SqlDbType.NVarChar, 15, "Country"))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Phone", System.Data.SqlDbType.NVarChar, 24, "Phone"))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Fax", System.Data.SqlDbType.NVarChar, 24, "Fax"))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_CustomerID", System.Data.SqlDbType.NVarChar, 5, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "CustomerID", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Address", System.Data.SqlDbType.NVarChar, 60, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Address", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_City", System.Data.SqlDbType.NVarChar, 15, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "City", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_CompanyName", System.Data.SqlDbType.NVarChar, 40, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "CompanyName", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ContactName", System.Data.SqlDbType.NVarChar, 30, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ContactName", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ContactTitle", System.Data.SqlDbType.NVarChar, 30, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ContactTitle", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Country", System.Data.SqlDbType.NVarChar, 15, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Country", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Fax", System.Data.SqlDbType.NVarChar, 24, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Fax", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Phone", System.Data.SqlDbType.NVarChar, 24, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Phone", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_PostalCode", System.Data.SqlDbType.NVarChar, 10, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PostalCode", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Region", System.Data.SqlDbType.NVarChar, 15, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Region", System.Data.DataRowVersion.Original, Nothing))
        '
        'SqlDeleteCommand1
        '
        Me.SqlDeleteCommand1.CommandText = "DELETE FROM dbo.Customers WHERE (CustomerID = @Original_CustomerID) AND (Address " & _
        "= @Original_Address OR @Original_Address IS NULL AND Address IS NULL) AND (City " & _
        "= @Original_City OR @Original_City IS NULL AND City IS NULL) AND (CompanyName = " & _
        "@Original_CompanyName) AND (ContactName = @Original_ContactName OR @Original_Con" & _
        "tactName IS NULL AND ContactName IS NULL) AND (ContactTitle = @Original_ContactT" & _
        "itle OR @Original_ContactTitle IS NULL AND ContactTitle IS NULL) AND (Country = " & _
        "@Original_Country OR @Original_Country IS NULL AND Country IS NULL) AND (Fax = @" & _
        "Original_Fax OR @Original_Fax IS NULL AND Fax IS NULL) AND (Phone = @Original_Ph" & _
        "one OR @Original_Phone IS NULL AND Phone IS NULL) AND (PostalCode = @Original_Po" & _
        "stalCode OR @Original_PostalCode IS NULL AND PostalCode IS NULL) AND (Region = @" & _
        "Original_Region OR @Original_Region IS NULL AND Region IS NULL)"
        Me.SqlDeleteCommand1.Connection = Me.SqlConnection1
        Me.SqlDeleteCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_CustomerID", System.Data.SqlDbType.NVarChar, 5, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "CustomerID", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Address", System.Data.SqlDbType.NVarChar, 60, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Address", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_City", System.Data.SqlDbType.NVarChar, 15, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "City", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_CompanyName", System.Data.SqlDbType.NVarChar, 40, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "CompanyName", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ContactName", System.Data.SqlDbType.NVarChar, 30, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ContactName", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ContactTitle", System.Data.SqlDbType.NVarChar, 30, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ContactTitle", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Country", System.Data.SqlDbType.NVarChar, 15, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Country", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Fax", System.Data.SqlDbType.NVarChar, 24, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Fax", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Phone", System.Data.SqlDbType.NVarChar, 24, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Phone", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_PostalCode", System.Data.SqlDbType.NVarChar, 10, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PostalCode", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Region", System.Data.SqlDbType.NVarChar, 15, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Region", System.Data.DataRowVersion.Original, Nothing))
        '
        'SqlDataAdapter3
        '
        Me.SqlDataAdapter3.DeleteCommand = Me.SqlDeleteCommand3
        Me.SqlDataAdapter3.InsertCommand = Me.SqlInsertCommand3
        Me.SqlDataAdapter3.SelectCommand = Me.SqlSelectCommand3
        Me.SqlDataAdapter3.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "Order Details", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("OrderID", "OrderID"), New System.Data.Common.DataColumnMapping("ProductID", "ProductID"), New System.Data.Common.DataColumnMapping("UnitPrice", "UnitPrice"), New System.Data.Common.DataColumnMapping("Quantity", "Quantity"), New System.Data.Common.DataColumnMapping("Discount", "Discount")})})
        Me.SqlDataAdapter3.UpdateCommand = Me.SqlUpdateCommand3
        '
        'SqlSelectCommand3
        '
        Me.SqlSelectCommand3.CommandText = "SELECT OrderID, ProductID, UnitPrice, Quantity, Discount FROM dbo.[Order Details]" & _
        " ORDER BY OrderID"
        Me.SqlSelectCommand3.Connection = Me.SqlConnection1
        '
        'SqlInsertCommand3
        '
        Me.SqlInsertCommand3.CommandText = "INSERT INTO dbo.[Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discoun" & _
        "t) VALUES (@OrderID, @ProductID, @UnitPrice, @Quantity, @Discount); SELECT Order" & _
        "ID, ProductID, UnitPrice, Quantity, Discount FROM dbo.[Order Details] WHERE (Ord" & _
        "erID = @OrderID) AND (ProductID = @ProductID) ORDER BY OrderID"
        Me.SqlInsertCommand3.Connection = Me.SqlConnection1
        Me.SqlInsertCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@OrderID", System.Data.SqlDbType.Int, 4, "OrderID"))
        Me.SqlInsertCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ProductID", System.Data.SqlDbType.Int, 4, "ProductID"))
        Me.SqlInsertCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@UnitPrice", System.Data.SqlDbType.Money, 8, "UnitPrice"))
        Me.SqlInsertCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Quantity", System.Data.SqlDbType.SmallInt, 2, "Quantity"))
        Me.SqlInsertCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Discount", System.Data.SqlDbType.Real, 4, "Discount"))
        '
        'SqlUpdateCommand3
        '
        Me.SqlUpdateCommand3.CommandText = "UPDATE dbo.[Order Details] SET OrderID = @OrderID, ProductID = @ProductID, UnitPr" & _
        "ice = @UnitPrice, Quantity = @Quantity, Discount = @Discount WHERE (OrderID = @O" & _
        "riginal_OrderID) AND (ProductID = @Original_ProductID) AND (Discount = @Original" & _
        "_Discount) AND (Quantity = @Original_Quantity) AND (UnitPrice = @Original_UnitPr" & _
        "ice); SELECT OrderID, ProductID, UnitPrice, Quantity, Discount FROM dbo.[Order D" & _
        "etails] WHERE (OrderID = @OrderID) AND (ProductID = @ProductID) ORDER BY OrderID" & _
        ""
        Me.SqlUpdateCommand3.Connection = Me.SqlConnection1
        Me.SqlUpdateCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@OrderID", System.Data.SqlDbType.Int, 4, "OrderID"))
        Me.SqlUpdateCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ProductID", System.Data.SqlDbType.Int, 4, "ProductID"))
        Me.SqlUpdateCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@UnitPrice", System.Data.SqlDbType.Money, 8, "UnitPrice"))
        Me.SqlUpdateCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Quantity", System.Data.SqlDbType.SmallInt, 2, "Quantity"))
        Me.SqlUpdateCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Discount", System.Data.SqlDbType.Real, 4, "Discount"))
        Me.SqlUpdateCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_OrderID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "OrderID", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ProductID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ProductID", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Discount", System.Data.SqlDbType.Real, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Discount", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Quantity", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Quantity", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_UnitPrice", System.Data.SqlDbType.Money, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "UnitPrice", System.Data.DataRowVersion.Original, Nothing))
        '
        'SqlDeleteCommand3
        '
        Me.SqlDeleteCommand3.CommandText = "DELETE FROM dbo.[Order Details] WHERE (OrderID = @Original_OrderID) AND (ProductI" & _
        "D = @Original_ProductID) AND (Discount = @Original_Discount) AND (Quantity = @Or" & _
        "iginal_Quantity) AND (UnitPrice = @Original_UnitPrice)"
        Me.SqlDeleteCommand3.Connection = Me.SqlConnection1
        Me.SqlDeleteCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_OrderID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "OrderID", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ProductID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ProductID", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Discount", System.Data.SqlDbType.Real, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Discount", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Quantity", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Quantity", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand3.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_UnitPrice", System.Data.SqlDbType.Money, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "UnitPrice", System.Data.DataRowVersion.Original, Nothing))
        '
        'SqlDataAdapter4
        '
        Me.SqlDataAdapter4.DeleteCommand = Me.SqlDeleteCommand4
        Me.SqlDataAdapter4.InsertCommand = Me.SqlInsertCommand4
        Me.SqlDataAdapter4.SelectCommand = Me.SqlSelectCommand4
        Me.SqlDataAdapter4.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "Products", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("ProductID", "ProductID"), New System.Data.Common.DataColumnMapping("ProductName", "ProductName"), New System.Data.Common.DataColumnMapping("SupplierID", "SupplierID"), New System.Data.Common.DataColumnMapping("CategoryID", "CategoryID"), New System.Data.Common.DataColumnMapping("QuantityPerUnit", "QuantityPerUnit"), New System.Data.Common.DataColumnMapping("UnitPrice", "UnitPrice"), New System.Data.Common.DataColumnMapping("UnitsInStock", "UnitsInStock"), New System.Data.Common.DataColumnMapping("UnitsOnOrder", "UnitsOnOrder"), New System.Data.Common.DataColumnMapping("ReorderLevel", "ReorderLevel"), New System.Data.Common.DataColumnMapping("Discontinued", "Discontinued")})})
        Me.SqlDataAdapter4.UpdateCommand = Me.SqlUpdateCommand4
        '
        'SqlSelectCommand4
        '
        Me.SqlSelectCommand4.CommandText = "SELECT ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice" & _
        ", UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued FROM dbo.Products ORDER" & _
        " BY ProductID"
        Me.SqlSelectCommand4.Connection = Me.SqlConnection1
        '
        'SqlInsertCommand4
        '
        Me.SqlInsertCommand4.CommandText = "INSERT INTO dbo.Products(ProductName, SupplierID, CategoryID, QuantityPerUnit, Un" & _
        "itPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued) VALUES (@Produc" & _
        "tName, @SupplierID, @CategoryID, @QuantityPerUnit, @UnitPrice, @UnitsInStock, @U" & _
        "nitsOnOrder, @ReorderLevel, @Discontinued); SELECT ProductID, ProductName, Suppl" & _
        "ierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, Reord" & _
        "erLevel, Discontinued FROM dbo.Products WHERE (ProductID = @@IDENTITY) ORDER BY " & _
        "ProductID"
        Me.SqlInsertCommand4.Connection = Me.SqlConnection1
        Me.SqlInsertCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ProductName", System.Data.SqlDbType.NVarChar, 40, "ProductName"))
        Me.SqlInsertCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@SupplierID", System.Data.SqlDbType.Int, 4, "SupplierID"))
        Me.SqlInsertCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@CategoryID", System.Data.SqlDbType.Int, 4, "CategoryID"))
        Me.SqlInsertCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@QuantityPerUnit", System.Data.SqlDbType.NVarChar, 20, "QuantityPerUnit"))
        Me.SqlInsertCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@UnitPrice", System.Data.SqlDbType.Money, 8, "UnitPrice"))
        Me.SqlInsertCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@UnitsInStock", System.Data.SqlDbType.SmallInt, 2, "UnitsInStock"))
        Me.SqlInsertCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@UnitsOnOrder", System.Data.SqlDbType.SmallInt, 2, "UnitsOnOrder"))
        Me.SqlInsertCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ReorderLevel", System.Data.SqlDbType.SmallInt, 2, "ReorderLevel"))
        Me.SqlInsertCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Discontinued", System.Data.SqlDbType.Bit, 1, "Discontinued"))
        '
        'SqlUpdateCommand4
        '
        Me.SqlUpdateCommand4.CommandText = "UPDATE dbo.Products SET ProductName = @ProductName, SupplierID = @SupplierID, Cat" & _
        "egoryID = @CategoryID, QuantityPerUnit = @QuantityPerUnit, UnitPrice = @UnitPric" & _
        "e, UnitsInStock = @UnitsInStock, UnitsOnOrder = @UnitsOnOrder, ReorderLevel = @R" & _
        "eorderLevel, Discontinued = @Discontinued WHERE (ProductID = @Original_ProductID" & _
        ") AND (CategoryID = @Original_CategoryID OR @Original_CategoryID IS NULL AND Cat" & _
        "egoryID IS NULL) AND (Discontinued = @Original_Discontinued) AND (ProductName = " & _
        "@Original_ProductName) AND (QuantityPerUnit = @Original_QuantityPerUnit OR @Orig" & _
        "inal_QuantityPerUnit IS NULL AND QuantityPerUnit IS NULL) AND (ReorderLevel = @O" & _
        "riginal_ReorderLevel OR @Original_ReorderLevel IS NULL AND ReorderLevel IS NULL)" & _
        " AND (SupplierID = @Original_SupplierID OR @Original_SupplierID IS NULL AND Supp" & _
        "lierID IS NULL) AND (UnitPrice = @Original_UnitPrice OR @Original_UnitPrice IS N" & _
        "ULL AND UnitPrice IS NULL) AND (UnitsInStock = @Original_UnitsInStock OR @Origin" & _
        "al_UnitsInStock IS NULL AND UnitsInStock IS NULL) AND (UnitsOnOrder = @Original_" & _
        "UnitsOnOrder OR @Original_UnitsOnOrder IS NULL AND UnitsOnOrder IS NULL); SELECT" & _
        " ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, Uni" & _
        "tsInStock, UnitsOnOrder, ReorderLevel, Discontinued FROM dbo.Products WHERE (Pro" & _
        "ductID = @ProductID) ORDER BY ProductID"
        Me.SqlUpdateCommand4.Connection = Me.SqlConnection1
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ProductName", System.Data.SqlDbType.NVarChar, 40, "ProductName"))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@SupplierID", System.Data.SqlDbType.Int, 4, "SupplierID"))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@CategoryID", System.Data.SqlDbType.Int, 4, "CategoryID"))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@QuantityPerUnit", System.Data.SqlDbType.NVarChar, 20, "QuantityPerUnit"))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@UnitPrice", System.Data.SqlDbType.Money, 8, "UnitPrice"))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@UnitsInStock", System.Data.SqlDbType.SmallInt, 2, "UnitsInStock"))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@UnitsOnOrder", System.Data.SqlDbType.SmallInt, 2, "UnitsOnOrder"))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ReorderLevel", System.Data.SqlDbType.SmallInt, 2, "ReorderLevel"))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Discontinued", System.Data.SqlDbType.Bit, 1, "Discontinued"))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ProductID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ProductID", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_CategoryID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "CategoryID", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Discontinued", System.Data.SqlDbType.Bit, 1, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Discontinued", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ProductName", System.Data.SqlDbType.NVarChar, 40, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ProductName", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_QuantityPerUnit", System.Data.SqlDbType.NVarChar, 20, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "QuantityPerUnit", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ReorderLevel", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ReorderLevel", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_SupplierID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "SupplierID", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_UnitPrice", System.Data.SqlDbType.Money, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "UnitPrice", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_UnitsInStock", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "UnitsInStock", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_UnitsOnOrder", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "UnitsOnOrder", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ProductID", System.Data.SqlDbType.Int, 4, "ProductID"))
        '
        'SqlDeleteCommand4
        '
        Me.SqlDeleteCommand4.CommandText = "DELETE FROM dbo.Products WHERE (ProductID = @Original_ProductID) AND (CategoryID " & _
        "= @Original_CategoryID OR @Original_CategoryID IS NULL AND CategoryID IS NULL) A" & _
        "ND (Discontinued = @Original_Discontinued) AND (ProductName = @Original_ProductN" & _
        "ame) AND (QuantityPerUnit = @Original_QuantityPerUnit OR @Original_QuantityPerUn" & _
        "it IS NULL AND QuantityPerUnit IS NULL) AND (ReorderLevel = @Original_ReorderLev" & _
        "el OR @Original_ReorderLevel IS NULL AND ReorderLevel IS NULL) AND (SupplierID =" & _
        " @Original_SupplierID OR @Original_SupplierID IS NULL AND SupplierID IS NULL) AN" & _
        "D (UnitPrice = @Original_UnitPrice OR @Original_UnitPrice IS NULL AND UnitPrice " & _
        "IS NULL) AND (UnitsInStock = @Original_UnitsInStock OR @Original_UnitsInStock IS" & _
        " NULL AND UnitsInStock IS NULL) AND (UnitsOnOrder = @Original_UnitsOnOrder OR @O" & _
        "riginal_UnitsOnOrder IS NULL AND UnitsOnOrder IS NULL)"
        Me.SqlDeleteCommand4.Connection = Me.SqlConnection1
        Me.SqlDeleteCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ProductID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ProductID", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_CategoryID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "CategoryID", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Discontinued", System.Data.SqlDbType.Bit, 1, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Discontinued", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ProductName", System.Data.SqlDbType.NVarChar, 40, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ProductName", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_QuantityPerUnit", System.Data.SqlDbType.NVarChar, 20, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "QuantityPerUnit", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ReorderLevel", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ReorderLevel", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_SupplierID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "SupplierID", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_UnitPrice", System.Data.SqlDbType.Money, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "UnitPrice", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_UnitsInStock", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "UnitsInStock", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_UnitsOnOrder", System.Data.SqlDbType.SmallInt, 2, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "UnitsOnOrder", System.Data.DataRowVersion.Original, Nothing))

    End Sub

End Class

