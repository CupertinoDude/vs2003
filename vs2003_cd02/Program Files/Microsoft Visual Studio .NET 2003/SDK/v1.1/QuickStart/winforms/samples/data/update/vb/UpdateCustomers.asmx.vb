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

Namespace Microsoft.Samples.Windows.Forms.Vb.Update
    Public Class UpdateCustomers
        Inherits System.Web.Services.WebService

        'Push Customers changes back into the database
        <WebMethod()> Public Function Save(ByVal customersDataSet As DataSet) As DataSet
            Dim con As New SqlConnection("server=(local)\NetSDK;database=northwind;Integrated Security=SSPI")


            'We want the update as part of a single transaction so open the connection
            'first and pass it to the updates
            con.Open()
            Dim tran As SqlTransaction = con.BeginTransaction()
            Try

                ApplyCustomerUpdates(customersDataSet, con, tran)
                If Not customersDataSet.HasErrors Then

                    'Don't commit if errors occured
                    'Commit the txn
                    tran.Commit()

                    'Commit the changes to the dataset
                    customersDataSet.AcceptChanges()
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

            Return customersDataSet
        End Function


        'Update Customers
        Private Sub ApplyCustomerUpdates(ByVal ds As DataSet, ByVal con As SqlConnection, ByVal tran As SqlTransaction)
            Const insertCustSQL As String = "INSERT INTO [Customers]([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax]) VALUES (@CustomerID, @CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region, @PostalCode, @Country, @Phone, @Fax)"
            Const updateCustSQL As String = "UPDATE [Customers] SET [CustomerID] = @CustomerID, [CompanyName] = @CompanyName, [ContactName] = @ContactName, [ContactTitle] = @ContactTitle, [Address] = @Address, [City] = @City, [Region] = @Region, [PostalCode] = @PostalCode, [Country] = @Country, [Phone] = @Phone, [Fax] = @Fax WHERE [CustomerID] = @oldCustomerID "
            Const deleteCustSQL As String = "DELETE FROM [Customers] WHERE [CustomerID] = @CustomerID "

            'Create the command
            Dim cmdCustomers As New SqlDataAdapter("Select * from Customers", con)

            'Add the insert, update and delete commands
            cmdCustomers.InsertCommand = New SqlCommand(insertCustSQL, con)
            cmdCustomers.InsertCommand.Transaction = tran
            buildCustomersInsertParams(cmdCustomers.InsertCommand)
            cmdCustomers.UpdateCommand = New SqlCommand(updateCustSQL, con)
            cmdCustomers.UpdateCommand.Transaction = tran
            buildCustomersUpdateParams(cmdCustomers.UpdateCommand)
            cmdCustomers.DeleteCommand = New SqlCommand(deleteCustSQL, con)
            cmdCustomers.DeleteCommand.Transaction = tran
            buildCustomersDeleteParams(cmdCustomers.DeleteCommand)

            'Catch the row update commands so that we can deal with errors
            AddHandler cmdCustomers.RowUpdated, AddressOf Me.Customers_RowUpdated

            'Check for a bad post code - for US post code must be non-null & numeric
            Dim row As DataRow
            For Each row In ds.Tables("Customers").Rows
                Dim colNames() As String
                Dim col As String
                
                colNames = new String() {"CustomerID", "CompanyName", "ContactName", "ContactTitle", "Address", "City", "Region", "Country", "Phone", "Fax"}
                For Each Col In ColNames
                    If Not row.IsNull(col)
                        If Not InputValidator.IsSafeText(CStr(row(col)))
                            Dim Msg As String = col & " can only contain limited punctuation"
                            row.RowError &= msg
                            row.SetColumnError(col, msg)
                        End If
                    End If
                Next
            
                If row("Country").Equals("USA") Then
                    If row.IsNull("PostalCode") Then
                        row.RowError = "Errors have occurred - deliberate error - See XML Web service"
                        row("PostalCode") = "Zip Code required"
                        row.SetColumnError("PostalCode", "Zip Code required")
                    Else
                        'Attempt to convert the zip code to a number
                        Try
                            Convert.ToInt32(row("PostalCode"))
                        Catch
                        End Try
                    End If
                End If
            Next row
            If Not ds.HasErrors Then

                'Apply the updates
                cmdCustomers.Update(ds, "Customers")

            End If
        End Sub


        'Once the row update has been pushed back into the database look for errors
        Private Sub Customers_RowUpdated(ByVal sender As Object, ByVal rue As SqlRowUpdatedEventArgs)
            If rue.Status = UpdateStatus.ErrorsOccurred Then

                rue.Status = UpdateStatus.Continue
                rue.Row.RowError = rue.Errors.Message
            Else
                rue.Row.ClearErrors()
            End If
        End Sub


        Private Sub buildCustomersUpdateParams(ByVal workCommand As SqlCommand)
            Dim workParam As SqlParameter = Nothing

            workParam = workCommand.Parameters.Add(New SqlParameter("@CustomerID", SqlDbType.NChar, 5))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "CustomerID"
            workParam = workCommand.Parameters.Add(New SqlParameter("@CompanyName", SqlDbType.NVarChar, 40))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "CompanyName"
            workParam = workCommand.Parameters.Add(New SqlParameter("@ContactName", SqlDbType.NVarChar, 30))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ContactName"
            workParam = workCommand.Parameters.Add(New SqlParameter("@ContactTitle", SqlDbType.NVarChar, 30))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ContactTitle"
            workParam = workCommand.Parameters.Add(New SqlParameter("@Address", SqlDbType.NVarChar, 60))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Address"
            workParam = workCommand.Parameters.Add(New SqlParameter("@City", SqlDbType.NVarChar, 15))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "City"
            workParam = workCommand.Parameters.Add(New SqlParameter("@Region", SqlDbType.NVarChar, 15))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Region"
            workParam = workCommand.Parameters.Add(New SqlParameter("@PostalCode", SqlDbType.NVarChar, 10))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "PostalCode"
            workParam = workCommand.Parameters.Add(New SqlParameter("@Country", SqlDbType.NVarChar, 15))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Country"
            workParam = workCommand.Parameters.Add(New SqlParameter("@Phone", SqlDbType.NVarChar, 24))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Phone"
            workParam = workCommand.Parameters.Add(New SqlParameter("@Fax", SqlDbType.NVarChar, 24))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Fax"
            workParam = workCommand.Parameters.Add(New SqlParameter("@oldCustomerID", SqlDbType.NChar, 5))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "CustomerID"
        End Sub


        Private Sub buildCustomersInsertParams(ByVal workCommand As SqlCommand)
            Dim workParam As SqlParameter = Nothing

            workParam = workCommand.Parameters.Add(New SqlParameter("@CustomerID", SqlDbType.NChar, 5))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "CustomerID"
            workParam = workCommand.Parameters.Add(New SqlParameter("@CompanyName", SqlDbType.NVarChar, 40))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "CompanyName"
            workParam = workCommand.Parameters.Add(New SqlParameter("@ContactName", SqlDbType.NVarChar, 30))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ContactName"
            workParam = workCommand.Parameters.Add(New SqlParameter("@ContactTitle", SqlDbType.NVarChar, 30))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "ContactTitle"
            workParam = workCommand.Parameters.Add(New SqlParameter("@Address", SqlDbType.NVarChar, 60))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Address"
            workParam = workCommand.Parameters.Add(New SqlParameter("@City", SqlDbType.NVarChar, 15))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "City"
            workParam = workCommand.Parameters.Add(New SqlParameter("@Region", SqlDbType.NVarChar, 15))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Region"
            workParam = workCommand.Parameters.Add(New SqlParameter("@PostalCode", SqlDbType.NVarChar, 10))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "PostalCode"
            workParam = workCommand.Parameters.Add(New SqlParameter("@Country", SqlDbType.NVarChar, 15))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Country"
            workParam = workCommand.Parameters.Add(New SqlParameter("@Phone", SqlDbType.NVarChar, 24))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Phone"
            workParam = workCommand.Parameters.Add(New SqlParameter("@Fax", SqlDbType.NVarChar, 24))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "Fax"

        End Sub


        Private Sub buildCustomersDeleteParams(ByVal workCommand As SqlCommand)
            Dim workParam As SqlParameter = Nothing

            workParam = workCommand.Parameters.Add(New SqlParameter("@CustomerID", SqlDbType.NChar, 5))
            workParam.Direction = ParameterDirection.Input
            workParam.SourceColumn = "CustomerID"

        End Sub

    End Class
End Namespace