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

using Acme;
using System;
using System.IO;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

using Microsoft.Samples.Windows.Forms.Cs.MasterDetails.Data;

namespace Microsoft.Samples.Windows.Forms.Cs.MasterDetails
{
    public class CustomersAndOrders : System.Web.Services.WebService
    {

        //Retrieve Customers and Orders
        [ WebMethod ]
        public DataSet GetCustomersAndOrders()
        {

            CustomersAndOrdersDataSet customersAndOrdersDataSet1 = 
                new CustomersAndOrdersDataSet();
            SqlConnection con = new SqlConnection(
                "server=(local)\\NetSDK;database=northwind;Integrated Security=SSPI");
            SqlDataAdapter cmdCustomers = new SqlDataAdapter(
                "Select * from Customers", con);
            SqlDataAdapter cmdOrders = new SqlDataAdapter("Select * from Orders", con);
        
        try {
                cmdCustomers.Fill(customersAndOrdersDataSet1, "Customers");
                cmdOrders.Fill(customersAndOrdersDataSet1, "Orders");

                return customersAndOrdersDataSet1;
        }
        catch (Exception ex){
                throw (ex);
        }
        finally{
            con.Close();
        }
        }

        //Push Customers and Orders changes back into the database
        [ WebMethod ]
        public DataSet UpdateCustomersAndOrders(DataSet ds)
        {
            SqlConnection con = new SqlConnection(
                "server=(local)\\NetSDK;database=northwind;Integrated Security=SSPI");

            //We want the update as part of a single transaction so open the connection
            //first and pass it to the updates
            con.Open();
            SqlTransaction tran = con.BeginTransaction();
            try
            {
                UpdateCustomers(ds, con, tran);
                UpdateOrders(ds, con, tran);

                //Don't commit if errors occurred
                if (!ds.HasErrors)
                {
                    //Commit the txn
                    tran.Commit();

                    //Commit the changes to the dataset
                    ds.AcceptChanges();
                }
                else
                {
                    //Dataset has errors - roll back the transaction
                    tran.Rollback();
                }
            }
            catch(Exception e)
            {
                //Roll back the txn if we have a failure
                tran.Rollback();
                throw e;
            }
            finally
            {
                //Make sure we close the connection no matter what
                con.Close();
            }

            return ds ;
        }

        //Update Customers
        private void UpdateCustomers(DataSet ds, SqlConnection con, SqlTransaction tran)
        {
            // Note:  You must have a CustomerID and Company Name
            const string insertCustSQL = "INSERT INTO [Customers]([CustomerID], " +
                "[CompanyName], [ContactName], [ContactTitle], [Address], [City], " +
                "[Region], [PostalCode], [Country], [Phone], [Fax]) VALUES " +
                "(@CustomerID, @CompanyName, @ContactName, @ContactTitle, @Address, " +
                "@City, @Region, @PostalCode, @Country, @Phone, @Fax)";

            // Note:  The CustomerID cannot be changed unless there is no
            //        Orders associated with it
            const string updateCustSQL = "UPDATE [Customers] SET [CustomerID] = " +
                "@CustomerID, [CompanyName] = @CompanyName, [ContactName] = " +
                "@ContactName, [ContactTitle] = @ContactTitle, [Address] = @Address, " +
                "[City] = @City, [Region] = @Region, [PostalCode] = @PostalCode, " +
                "[Country] = @Country, [Phone] = @Phone, [Fax] = @Fax " +
                "WHERE [CustomerID] = @oldCustomerID ";

            // Note:  Delete will only succeed if the Customer does not have any
            //        Orders associated with it
            const string deleteCustSQL = "DELETE FROM [Customers] WHERE " +
                "[CustomerID] = @CustomerID ";

            //Create the command
            SqlDataAdapter cmdCustomers = 
                new SqlDataAdapter("Select * from Customers", con);

            //Add the insert, update and delete commands
            cmdCustomers.InsertCommand = new SqlCommand(insertCustSQL, con, tran);
            buildCustomersInsertParams(cmdCustomers.InsertCommand);
            cmdCustomers.UpdateCommand = new SqlCommand(updateCustSQL, con, tran);
            buildCustomersUpdateParams(cmdCustomers.UpdateCommand);
            cmdCustomers.DeleteCommand = new SqlCommand(deleteCustSQL, con, tran);
            buildCustomersDeleteParams(cmdCustomers.DeleteCommand);

            //Catch the row update commands so that we can deal with errors
            cmdCustomers.RowUpdated += new SqlRowUpdatedEventHandler(
                this.CustomersAndOrders_RowUpdated);

            foreach (DataRow row in ds.Tables["Customers"].Rows)
            {
                string[] colNames = new string[] {
                    "CustomerID", "CompanyName", "ContactName", "ContactTitle",
                    "Address", "City", "Region", "PostalCode", "Country",
                    "Phone", "Fax"
                };
                
                foreach(string col in colNames)
                {
                    if (!row.IsNull(col))
                    {
                        if ( !InputValidator.IsSafeText(row[col].ToString()) )
                        {
                            string msg = col + " can only contain limited punctuation\r\n";
                            row.RowError += msg;
                            row.SetColumnError(col, msg);
                        }
                    }
                }
            }

            //Apply the updates
            if ( !ds.HasErrors )
                cmdCustomers.Update(ds, "Customers");
        }

        //Update Orders
        private void UpdateOrders(DataSet ds, SqlConnection con, SqlTransaction tran)
        {
            const string insertOrderSQL = "INSERT INTO [Orders](" +
                "[CustomerID], [EmployeeID], [OrderDate], [RequiredDate], " +
                "[ShippedDate], [ShipVia], [Freight], [ShipName], [ShipAddress], " +
                "[ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) " +
                "VALUES (@CustomerID, @EmployeeID, @OrderDate, " +
                "@RequiredDate, @ShippedDate, @ShipVia, @Freight, @ShipName, " +
                "@ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry)";

            const string updateOrderSQL = "UPDATE [Orders] SET [CustomerID] = " +
                "@CustomerID, [EmployeeID] = @EmployeeID, [OrderDate] = @OrderDate, " +
                "[RequiredDate] = @RequiredDate, [ShippedDate] = @ShippedDate, " +
                "[ShipVia] = @ShipVia, [Freight] = @Freight, [ShipName] = @ShipName, " +
                "[ShipAddress] = @ShipAddress, [ShipCity] = @ShipCity, " +
                "[ShipRegion] = @ShipRegion, [ShipPostalCode] = @ShipPostalCode, " +
                "[ShipCountry] = @ShipCountry  WHERE [OrderID] = @oldOrderID";

            // Delete will only work if there are no order details associated with
            // the order number
            const string deleteOrderSQL = "DELETE FROM [Orders] WHERE " +
                "[OrderID] = @OrderID ";

            //Create the command
            SqlDataAdapter cmdOrders = new SqlDataAdapter("Select * from Orders", con);

            //Add the insert, update and delete commands
            cmdOrders.InsertCommand = new SqlCommand(insertOrderSQL, con, tran);
            buildOrdersInsertParams(cmdOrders.InsertCommand);
            cmdOrders.UpdateCommand = new SqlCommand(updateOrderSQL, con, tran);
            buildOrdersUpdateParams(cmdOrders.UpdateCommand);
            cmdOrders.DeleteCommand = new SqlCommand(deleteOrderSQL, con, tran);
            buildOrdersDeleteParams(cmdOrders.DeleteCommand);

            //Catch the row update commands so that we can deal with errors
            cmdOrders.RowUpdated += new SqlRowUpdatedEventHandler(
                this.CustomersAndOrders_RowUpdated);

            foreach (DataRow row in ds.Tables["Orders"].Rows)
            {
                string[] colNames = new string[] {
                    "CustomerID", "EmployeeID", "OrderDate", "RequiredDate",
                    "ShippedDate", "ShipVia", "Freight", "ShipName", "ShipAddress",
                    "ShipCity", "ShipRegion", "ShipPostalCode", "ShipCountry"
                };
                
                foreach(string col in colNames)
                {
                    if (!row.IsNull(col))
                    {
                        if ( !InputValidator.IsSafeText(row[col].ToString()) )
                        {
                            string msg = col + " can only contain limited punctuation\r\n";
                            row.RowError += msg;
                            row.SetColumnError(col, msg);
                        }
                    }
                }
            }

            //Apply the updates
            if ( !ds.HasErrors )
                cmdOrders.Update(ds, "Orders");
        }

        //Once the row update has been pushed back into the database look for errors
        private void CustomersAndOrders_RowUpdated(
            object sender, SqlRowUpdatedEventArgs rue)
        {
            if (rue.Status == UpdateStatus.ErrorsOccurred)
            {
                rue.Status = UpdateStatus.Continue;
                rue.Row.RowError = rue.Errors.Message + 
                    " - Deliberate error see WebService for details";
            }
            else
            {
                rue.Row.ClearErrors();
            }
        }

        private void buildCustomersUpdateParams(SqlCommand workCommand)
        {
            SqlParameter workParam = null;
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@CustomerID", SqlDbType.NChar, 5));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "CustomerID";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@CompanyName", SqlDbType.NVarChar, 40));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "CompanyName";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ContactName", SqlDbType.NVarChar, 30));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ContactName";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ContactTitle", SqlDbType.NVarChar, 30));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ContactTitle";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@Address", SqlDbType.NVarChar, 60));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Address";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@City", SqlDbType.NVarChar, 15));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "City";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@Region", SqlDbType.NVarChar, 15));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Region";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@PostalCode", SqlDbType.NVarChar, 10));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "PostalCode";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@Country", SqlDbType.NVarChar, 15));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Country";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@Phone", SqlDbType.NVarChar, 24));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Phone";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@Fax", SqlDbType.NVarChar, 24));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Fax";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@oldCustomerID", SqlDbType.NChar, 5));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "CustomerID";
            workParam.SourceVersion = DataRowVersion.Original;
        }

        private void buildCustomersInsertParams(SqlCommand workCommand)
        {
            SqlParameter workParam = null;
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@CustomerID", SqlDbType.NChar, 5));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "CustomerID";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@CompanyName", SqlDbType.NVarChar, 40));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "CompanyName";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ContactName", SqlDbType.NVarChar, 30));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ContactName";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ContactTitle", SqlDbType.NVarChar, 30));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ContactTitle";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@Address", SqlDbType.NVarChar, 60));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Address";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@City", SqlDbType.NVarChar, 15));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "City";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@Region", SqlDbType.NVarChar, 15));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Region";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@PostalCode", SqlDbType.NVarChar, 10));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "PostalCode";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@Country", SqlDbType.NVarChar, 15));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Country";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@Phone", SqlDbType.NVarChar, 24));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Phone";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@Fax", SqlDbType.NVarChar, 24));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Fax";
        }

        private void buildCustomersDeleteParams(SqlCommand workCommand)
        {
            SqlParameter workParam = null;
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@CustomerID", SqlDbType.NChar, 5));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "CustomerID";
            workParam.SourceVersion = DataRowVersion.Original;
        }

        private void buildOrdersUpdateParams(SqlCommand workCommand)
        {
            SqlParameter workParam = null;
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@OrderID", SqlDbType.Int, 4));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "OrderID";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@CustomerID", SqlDbType.NChar, 5));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "CustomerID";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@EmployeeID", SqlDbType.Int, 4));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "EmployeeID";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@OrderDate", SqlDbType.DateTime, 8));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "OrderDate";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@RequiredDate", SqlDbType.DateTime, 8));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "RequiredDate";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ShippedDate", SqlDbType.DateTime, 8));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ShippedDate";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ShipVia", SqlDbType.Int, 4));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ShipVia";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@Freight", SqlDbType.Money, 8));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Freight";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ShipName", SqlDbType.NVarChar, 40));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ShipName";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ShipAddress", SqlDbType.NVarChar, 60));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ShipAddress";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ShipCity", SqlDbType.NVarChar, 15));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ShipCity";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ShipRegion", SqlDbType.NVarChar, 15));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ShipRegion";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ShipPostalCode", SqlDbType.NVarChar, 10));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ShipPostalCode";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ShipCountry", SqlDbType.NVarChar, 15));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ShipCountry";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@oldOrderID", SqlDbType.Int, 4));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "OrderID";
            workParam.SourceVersion = DataRowVersion.Original;
        }

        private void buildOrdersInsertParams(SqlCommand workCommand)
        {
            SqlParameter workParam = null;
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@CustomerID", SqlDbType.NChar, 5));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "CustomerID";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@EmployeeID", SqlDbType.Int, 4));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "EmployeeID";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@OrderDate", SqlDbType.DateTime, 8));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "OrderDate";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@RequiredDate", SqlDbType.DateTime, 8));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "RequiredDate";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ShippedDate", SqlDbType.DateTime, 8));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ShippedDate";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ShipVia", SqlDbType.Int, 4));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ShipVia";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@Freight", SqlDbType.Money, 8));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Freight";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ShipName", SqlDbType.NVarChar, 40));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ShipName";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ShipAddress", SqlDbType.NVarChar, 60));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ShipAddress";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ShipCity", SqlDbType.NVarChar, 15));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ShipCity";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ShipRegion", SqlDbType.NVarChar, 15));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ShipRegion";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ShipPostalCode", SqlDbType.NVarChar, 10));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ShipPostalCode";
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@ShipCountry", SqlDbType.NVarChar, 15));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ShipCountry";
        }

        private void buildOrdersDeleteParams(SqlCommand workCommand)
        {
            SqlParameter workParam = null;
            workParam = workCommand.Parameters.Add(new SqlParameter(
                "@OrderID", SqlDbType.Int, 4));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "OrderID";
            workParam.SourceVersion = DataRowVersion.Original;
        }
    }
}