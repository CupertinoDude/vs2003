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

Imports Acme
Imports System
Imports System.IO
Imports System.Web.Services
Imports System.Data
Imports System.Data.SqlClient
Imports Microsoft.Samples.Windows.Forms.Vb.MasterDetails.Data

Namespace Microsoft.Samples.Windows.Forms.Vb.MasterDetails
    Public Class CustomersAndOrders
        Inherits WebService

        'Retrieve Customers and Orders
        <WebMethod()> Public Function GetCustomersAndOrders() As DataSet
            Dim customersAndOrdersDataSet1 As New CustomersAndOrdersDataSet()
            Dim con As SqlConnection = New SqlConnection( _
                "server=(local)\NetSDK;database=northwind;Integrated Security=SSPI")
            Dim cmdCustomers As SqlDataAdapter = New SqlDataAdapter( _
                "Select * from Customers", con)
            Dim cmdOrders As SqlDataAdapter = New SqlDataAdapter( _
                "Select * from Orders", con)
        Try
                cmdCustomers.Fill(customersAndOrdersDataSet1, "Customers")
                cmdOrders.Fill(customersAndOrdersDataSet1, "Orders")
                Return customersAndOrdersDataSet1
        Catch ex as Exception
                Throw ex
        Finally
                 con.Close()
        End Try
        End Function

        'Push Customers and Orders changes back into the database
        <WebMethod()> Public Function UpdateCustomersAndOrders( _
            ByVal ds As DataSet) As DataSet

            Dim con As SqlConnection = New SqlConnection( _
                "server=(local)\NetSDK;database=northwind;Integrated Security=SSPI")

            'We want the update as part of a single transaction so open the connection
            'first and pass it to the updates
            con.Open()
            Dim tran As SqlTransaction = con.BeginTransaction
            Try
                UpdateCustomers(ds, con, tran)
                UpdateOrders(ds, con, tran)

                'Don't commit if errors occured
                If Not (ds.HasErrors) Then
                    'Commit the txn
                    tran.Commit()

                    'Commit the changes to the dataset
                    ds.AcceptChanges()
                Else
                    'Dataset has errors - roll back the transaction
                    tran.Rollback()
                End If

            Catch e As Exception

                'Roll back the txn if we have a failure
                tran.Rollback()
                Throw e

            Finally

                'Make sure we close the connection no matter what
                con.Close()

            End Try

            Return ds

        End Function

        'Update Customers
        Private Sub UpdateCustomers(ByVal ds As DataSet, _
            ByVal con As SqlConnection, ByVal tran as SqlTransaction)

            ' Note:  You must have a CustomerID and Company Name
            Dim insertCustSQL As String = "INSERT INTO [Customers]([CustomerID], " & _
                "[CompanyName], [ContactName], [ContactTitle], [Address], [City], " & _
                "[Region], [PostalCode], [Country], [Phone], [Fax]) VALUES " & _
                "(@CustomerID, @CompanyName, @ContactName, @ContactTitle, @Address, " & _
                "@City, @Region, @PostalCode, @Country, @Phone, @Fax)"

            ' Note:  The CustomerID cannot be changed unless there is no
            '        Orders associated with it
            Dim updateCustSQL As String = "UPDATE [Customers] SET [CustomerID] = " & _
                "@CustomerID, [CompanyName] = @CompanyName, " & _
                "[ContactName] = @ContactName, [ContactTitle] = @ContactTitle, " & _
                "[Address] = @Address, [City] = @City, [Region] = @Region, " & _
                "[PostalCode] = @PostalCode, [Country] = @Country, [Phone] = @Phone, " & _
                "[Fax] = @Fax WHERE [CustomerID] = @oldCustomerID"

            ' Note:  Delete will only succeed if the Customer does not have any
            '        Orders associated with it
            Dim deleteCustSQL As String = "DELETE FROM [Customers] WHERE " & _
                "[CustomerID] = @CustomerID "

            'Create the command
            Dim cmdCustomers As SqlDataAdapter = New SqlDataAdapter( _
                "Select * from Customers", con)

            'Add the insert, update and delete commands
            cmdCustomers.InsertCommand = New SqlCommand(insertCustSQL, con, tran)
            buildCustomersInsertParams(cmdCustomers.InsertCommand)
            cmdCustomers.UpdateCommand = New SqlCommand(updateCustSQL, con, tran)
            buildCustomersUpdateParams(cmdCustomers.UpdateCommand)
            cmdCustomers.DeleteCommand = New SqlCommand(deleteCustSQL, con, tran)
            buildCustomersDeleteParams(cmdCustomers.DeleteCommand)

            'Catch the row update commands so that we can deal with errors
            AddHandler cmdCustomers.RowUpdated, New SqlRowUpdatedEventHandler( _
                AddressOf Me.CustomersAndOrders_RowUpdated)

            Dim row As DataRow
            For Each row In ds.Tables("Customers").Rows
                Dim colNames() As String = new String() { _
                    "CustomerID", "CompanyName", "ContactName", "ContactTitle", _
                    "Address", "City", "Region", "PostalCode", "Country", _
                    "Phone", "Fax" _
                }
                
                Dim col As String
                For Each col In colNames
                    If Not row.IsNull(col)
                        If Not InputValidator.IsSafeText(CStr(row(col)))
                            Dim msg As String = col & " can only contain limited punctuation"
                            row.RowError &= msg
                            row.SetColumnError(col, msg)
                        End If
                    End If
                Next
            Next

            'Apply the updates
            If Not ds.HasErrors
                cmdCustomers.Update(ds, "Customers")
            End If
        End Sub

        'Update Orders
        Private Sub UpdateOrders(ByVal ds As DataSet, ByVal con As SqlConnection, _
            ByVal tran as SqlTransaction)

            Dim insertOrderSQL As String = "INSERT INTO [Orders](" & _
                "[CustomerID], [EmployeeID], [OrderDate], [RequiredDate], " & _
                "[ShippedDate], [ShipVia], [Freight], [ShipName], [ShipAddress], " & _
                "[ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) " & _
                "VALUES (@CustomerID, @EmployeeID, @OrderDate, @RequiredDate, " & _
                "@ShippedDate, @ShipVia, @Freight, @ShipName, @ShipAddress, " & _
                "@ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry)"

            ' Note this update command causes an error that is displayed in the grid
            ' because the OrderID field is an autogenerated Identity field and cannot
            ' be updated
            'Dim updateOrderSQL As String = "UPDATE [Orders] SET [OrderID] = @OrderID, " & _
            '    "[CustomerID] = @CustomerID, [EmployeeID] = @EmployeeID, " & _
            '    "[OrderDate] = @OrderDate, [RequiredDate] = @RequiredDate, " & _
            '    "[ShippedDate] = @ShippedDate, [ShipVia] = @ShipVia, " & _
            '    "[Freight] = @Freight, [ShipName] = @ShipName, " & _
            '    "[ShipAddress] = @ShipAddress, [ShipCity] = @ShipCity, " & _
            '    "[ShipRegion] = @ShipRegion, [ShipPostalCode] = @ShipPostalCode, " & _
            '    "[ShipCountry] = @ShipCountry  WHERE [OrderID] = @oldOrderID"

            'This command does not cause an error
            Dim updateOrderSQL As String  = "UPDATE [Orders] SET " & _
                "[CustomerID] = @CustomerID, [EmployeeID] = @EmployeeID, " & _
                "[OrderDate] = @OrderDate, [RequiredDate] = @RequiredDate, " & _
                "[ShippedDate] = @ShippedDate, [ShipVia] = @ShipVia, " & _
                "[Freight] = @Freight, [ShipName] = @ShipName, " & _
                "[ShipAddress] = @ShipAddress, [ShipCity] = @ShipCity, " & _
                "[ShipRegion] = @ShipRegion, [ShipPostalCode] = @ShipPostalCode, " & _
                "[ShipCountry] = @ShipCountry  WHERE [OrderID] = @oldOrderID"

            ' Delete will only work if there are no order details associated with
            ' the order number
            Dim deleteOrderSQL As String = "DELETE FROM [Orders] WHERE " & _
                "[OrderID] = @OrderID"

            'Create the command
            Dim cmdOrders As SqlDataAdapter = New SqlDataAdapter( _
                "Select * from Orders", con)

            'Add the insert, update and delete commands
            cmdOrders.InsertCommand = New SqlCommand(insertOrderSQL, con, tran)
            buildOrdersInsertParams(cmdOrders.InsertCommand)
            cmdOrders.UpdateCommand = New SqlCommand(updateOrderSQL, con, tran)
            buildOrdersUpdateParams(cmdOrders.UpdateCommand)
            cmdOrders.DeleteCommand = New SqlCommand(deleteOrderSQL, con, tran)
            buildOrdersDeleteParams(cmdOrders.DeleteCommand)

            'Catch the row update commands so that we can deal with errors
            AddHandler cmdOrders.RowUpdated, _
                New SqlRowUpdatedEventHandler(AddressOf Me.CustomersAndOrders_RowUpdated)

            Dim row As DataRow
            For Each row In ds.Tables("Orders").Rows
                Dim colNames() As String = new String() { _
                    "CustomerID", "EmployeeID", "OrderDate", "RequiredDate", _
                    "ShippedDate", "ShipVia", "Freight", "ShipName", "ShipAddress", _
                    "ShipCity", "ShipRegion", "ShipPostalCode", "ShipCountry" _
                }
                
                Dim col As String
                For Each col In colNames
                    If Not row.IsNull(col)
                        If Not InputValidator.IsSafeText(CStr(row(col)))
                            Dim msg As String = col & " can only contain limited punctuation"
                            row.RowError &= msg
                            row.SetColumnError(col, msg)
                        End If
                    End If
                Next
            Next

            'Apply the updates
            If Not ds.HasErrors
                cmdOrders.Update(ds, "Orders")
            End IF
        End Sub

        'Once the row update has been pushed back into the database look for errors
        Private Sub CustomersAndOrders_RowUpdated(ByVal sender As Object, _
            ByVal rue As SqlRowUpdatedEventArgs)

            If (rue.Status = UpdateStatus.ErrorsOccurred) Then
                rue.Status = UpdateStatus.Continue
                rue.Row.RowError = rue.Errors.Message & _
                    " - Deliberate error see WebService for details"
            Else
                rue.Row.ClearErrors()
            End If
        End Sub

        Private Sub buildCustomersUpdateParams(ByVal workCommand As SqlCommand)

            Dim workParam As SqlParameter
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@CustomerID", SqlDbType.NChar, 5))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "CustomerID"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@CompanyName", SqlDbType.NVarChar, 40))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "CompanyName"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ContactName", SqlDbType.NVarChar, 30))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ContactName"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ContactTitle", SqlDbType.NVarChar, 30))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ContactTitle"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@Address", SqlDbType.NVarChar, 60))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Address"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@City", SqlDbType.NVarChar, 15))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "City"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@Region", SqlDbType.NVarChar, 15))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Region"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@PostalCode", SqlDbType.NVarChar, 10))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "PostalCode"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@Country", SqlDbType.NVarChar, 15))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Country"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@Phone", SqlDbType.NVarChar, 24))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Phone"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@Fax", SqlDbType.NVarChar, 24))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Fax"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@oldCustomerID", SqlDbType.NChar, 5))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "CustomerID"
            workParam.SourceVersion = DataRowVersion.Original
        End Sub

        Private Sub buildCustomersInsertParams(ByVal workCommand As SqlCommand)
            Dim workParam As SqlParameter
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@CustomerID", SqlDbType.NChar, 5))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "CustomerID"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@CompanyName", SqlDbType.NVarChar, 40))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "CompanyName"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ContactName", SqlDbType.NVarChar, 30))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ContactName"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ContactTitle", SqlDbType.NVarChar, 30))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ContactTitle"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@Address", SqlDbType.NVarChar, 60))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Address"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@City", SqlDbType.NVarChar, 15))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "City"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@Region", SqlDbType.NVarChar, 15))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Region"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@PostalCode", SqlDbType.NVarChar, 10))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "PostalCode"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@Country", SqlDbType.NVarChar, 15))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Country"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@Phone", SqlDbType.NVarChar, 24))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Phone"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@Fax", SqlDbType.NVarChar, 24))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Fax"
        End Sub

        Private Sub buildCustomersDeleteParams(ByVal workCommand As SqlCommand)
            Dim workParam As SqlParameter
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@CustomerID", SqlDbType.NChar, 5))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "CustomerID"
            workParam.SourceVersion = DataRowVersion.Original
        End Sub

        Private Sub buildOrdersUpdateParams(ByVal workCommand As SqlCommand)

            Dim workParam As SqlParameter
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@OrderID", SqlDbType.Int, 4))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "OrderID"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@CustomerID", SqlDbType.NChar, 5))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "CustomerID"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@EmployeeID", SqlDbType.Int, 4))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "EmployeeID"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@OrderDate", SqlDbType.DateTime, 8))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "OrderDate"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@RequiredDate", SqlDbType.DateTime, 8))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "RequiredDate"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ShippedDate", SqlDbType.DateTime, 8))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ShippedDate"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ShipVia", SqlDbType.Int, 4))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ShipVia"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@Freight", SqlDbType.Money, 8))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Freight"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ShipName", SqlDbType.NVarChar, 40))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ShipName"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ShipAddress", SqlDbType.NVarChar, 60))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ShipAddress"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ShipCity", SqlDbType.NVarChar, 15))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ShipCity"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ShipRegion", SqlDbType.NVarChar, 15))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ShipRegion"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ShipPostalCode", SqlDbType.NVarChar, 10))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ShipPostalCode"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ShipCountry", SqlDbType.NVarChar, 15))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ShipCountry"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@oldOrderID", SqlDbType.Int, 4))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "OrderID"
            workParam.SourceVersion = DataRowVersion.Original
        End Sub

        Private Sub buildOrdersInsertParams(ByVal workCommand As SqlCommand)
            Dim workParam As SqlParameter
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@CustomerID", SqlDbType.NChar, 5))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "CustomerID"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@EmployeeID", SqlDbType.Int, 4))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "EmployeeID"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@OrderDate", SqlDbType.DateTime, 8))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "OrderDate"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@RequiredDate", SqlDbType.DateTime, 8))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "RequiredDate"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ShippedDate", SqlDbType.DateTime, 8))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ShippedDate"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ShipVia", SqlDbType.Int, 4))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ShipVia"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@Freight", SqlDbType.Money, 8))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Freight"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ShipName", SqlDbType.NVarChar, 40))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ShipName"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ShipAddress", SqlDbType.NVarChar, 60))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ShipAddress"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ShipCity", SqlDbType.NVarChar, 15))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ShipCity"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ShipRegion", SqlDbType.NVarChar, 15))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ShipRegion"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ShipPostalCode", SqlDbType.NVarChar, 10))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ShipPostalCode"
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@ShipCountry", SqlDbType.NVarChar, 15))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ShipCountry"
        End Sub

        Private Sub buildOrdersDeleteParams(ByVal workCommand As SqlCommand)
            Dim workParam As SqlParameter
            workParam = workCommand.Parameters.Add(New SqlParameter( _
                "@OrderID", SqlDbType.Int, 4))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "OrderID"
            workParam.SourceVersion = DataRowVersion.Original
        End Sub

    End Class
End Namespace