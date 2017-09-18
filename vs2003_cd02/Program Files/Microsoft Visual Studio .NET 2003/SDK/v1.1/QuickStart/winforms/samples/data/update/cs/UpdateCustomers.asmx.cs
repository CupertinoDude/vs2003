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

namespace Microsoft.Samples.Windows.Forms.Cs.Update
{
	using Acme;
    using System;
    using System.IO;
    using System.Web.Services;
    using System.Data;
    using System.Data.SqlClient;

    public class UpdateCustomers : System.Web.Services.WebService
    {


        //Push Customers changes back into the database
        [ WebMethod ]
        public DataSet Save(DataSet customersDataSet)
        {

            SqlConnection con = new SqlConnection("server=(local)\\NetSDK;database=northwind;Integrated Security=SSPI");

            //We want the update as part of a single transaction so open the connection
            //first and pass it to the updates
            con.Open();
            SqlTransaction tran = con.BeginTransaction();
            try
            {

                ApplyCustomerUpdates(customersDataSet, con, tran);

                //Don't commit if errors occured
                if (!customersDataSet.HasErrors)
                {
                    //Commit the txn
                    tran.Commit();

                    //Commit the changes to the dataset
                    customersDataSet.AcceptChanges();

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

            return customersDataSet ;
        }

        //Update Customers
        private void ApplyCustomerUpdates(DataSet ds, SqlConnection con, SqlTransaction tran)
        {

            const string insertCustSQL = "INSERT INTO [Customers]([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax]) VALUES (@CustomerID, @CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region, @PostalCode, @Country, @Phone, @Fax)";
            const string updateCustSQL = "UPDATE [Customers] SET [CustomerID] = @CustomerID, [CompanyName] = @CompanyName, [ContactName] = @ContactName, [ContactTitle] = @ContactTitle, [Address] = @Address, [City] = @City, [Region] = @Region, [PostalCode] = @PostalCode, [Country] = @Country, [Phone] = @Phone, [Fax] = @Fax WHERE [CustomerID] = @oldCustomerID ";
            const string deleteCustSQL = "DELETE FROM [Customers] WHERE [CustomerID] = @CustomerID ";

            //Create the command
            SqlDataAdapter cmdCustomers = new SqlDataAdapter("Select * from Customers", con);

            //Add the insert, update and delete commands
            cmdCustomers.InsertCommand = new SqlCommand(insertCustSQL, con);
            cmdCustomers.InsertCommand.Transaction = tran;
            buildCustomersInsertParams(cmdCustomers.InsertCommand);
            cmdCustomers.UpdateCommand = new SqlCommand(updateCustSQL, con);
            cmdCustomers.UpdateCommand.Transaction = tran;
            buildCustomersUpdateParams(cmdCustomers.UpdateCommand);
            cmdCustomers.DeleteCommand = new SqlCommand(deleteCustSQL, con);
            cmdCustomers.DeleteCommand.Transaction = tran;
            buildCustomersDeleteParams(cmdCustomers.DeleteCommand);

            //Catch the row update commands so that we can deal with errors
            cmdCustomers.RowUpdated += new SqlRowUpdatedEventHandler(this.Customers_RowUpdated);

            foreach (DataRow row in ds.Tables["Customers"].Rows)
            {
                string[] colNames = new string[] {"CustomerID", "CompanyName", "ContactName", "ContactTitle", "Address", "City", "Region", "Country", "Phone", "Fax"};
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

                //Check for a bad post code - for US post code must be non-null & numeric
                if (row["Country"].Equals("USA"))
                {
                    if (row.IsNull("PostalCode"))
                    {
                        row.RowError += "Zip Code Required\r\n";
                        row["PostalCode"] = "Zip Code required";
                        row.SetColumnError("PostalCode", "Zip Code required");
                    }
                    else
                    {
                        //Attempt to convert the zip code to a number
                        try
                        {
                            Convert.ToInt32(row["PostalCode"]);
                        }
                        catch(Exception)
                        {
                            row.RowError += "Zip Code is invalid\r\n";
                            row.SetColumnError("PostalCode", "Invalid Zip Code");
                        }
                    }
                }
            }

            //Apply the updates
            if (!ds.HasErrors)
                cmdCustomers.Update(ds, "Customers");

        }

        //Once the row update has been pushed back into the database look for errors
        private void Customers_RowUpdated(object sender, SqlRowUpdatedEventArgs rue)
        {

            if (rue.Status == UpdateStatus.ErrorsOccurred)
            {
                rue.Status = UpdateStatus.Continue;
                rue.Row.RowError = rue.Errors.Message ;
            }
            else
            {
                rue.Row.ClearErrors();
            }
        }

        private void buildCustomersUpdateParams(SqlCommand workCommand)
        {

            SqlParameter workParam = null;
            workParam = workCommand.Parameters.Add(new SqlParameter("@CustomerID", SqlDbType.NChar, 5));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "CustomerID";
            workParam = workCommand.Parameters.Add(new SqlParameter("@CompanyName", SqlDbType.NVarChar, 40));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "CompanyName";
            workParam = workCommand.Parameters.Add(new SqlParameter("@ContactName", SqlDbType.NVarChar, 30));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ContactName";
            workParam = workCommand.Parameters.Add(new SqlParameter("@ContactTitle", SqlDbType.NVarChar, 30));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ContactTitle";
            workParam = workCommand.Parameters.Add(new SqlParameter("@Address", SqlDbType.NVarChar, 60));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Address";
            workParam = workCommand.Parameters.Add(new SqlParameter("@City", SqlDbType.NVarChar, 15));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "City";
            workParam = workCommand.Parameters.Add(new SqlParameter("@Region", SqlDbType.NVarChar, 15));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Region";
            workParam = workCommand.Parameters.Add(new SqlParameter("@PostalCode", SqlDbType.NVarChar, 10));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "PostalCode";
            workParam = workCommand.Parameters.Add(new SqlParameter("@Country", SqlDbType.NVarChar, 15));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Country";
            workParam = workCommand.Parameters.Add(new SqlParameter("@Phone", SqlDbType.NVarChar, 24));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Phone";
            workParam = workCommand.Parameters.Add(new SqlParameter("@Fax", SqlDbType.NVarChar, 24));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Fax";
            workParam = workCommand.Parameters.Add(new SqlParameter("@oldCustomerID", SqlDbType.NChar, 5));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "CustomerID";
        }

        private void buildCustomersInsertParams(SqlCommand workCommand)
        {

            SqlParameter workParam = null;
            workParam = workCommand.Parameters.Add(new SqlParameter("@CustomerID", SqlDbType.NChar, 5));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "CustomerID";
            workParam = workCommand.Parameters.Add(new SqlParameter("@CompanyName", SqlDbType.NVarChar, 40));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "CompanyName";
            workParam = workCommand.Parameters.Add(new SqlParameter("@ContactName", SqlDbType.NVarChar, 30));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ContactName";
            workParam = workCommand.Parameters.Add(new SqlParameter("@ContactTitle", SqlDbType.NVarChar, 30));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "ContactTitle";
            workParam = workCommand.Parameters.Add(new SqlParameter("@Address", SqlDbType.NVarChar, 60));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Address";
            workParam = workCommand.Parameters.Add(new SqlParameter("@City", SqlDbType.NVarChar, 15));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "City";
            workParam = workCommand.Parameters.Add(new SqlParameter("@Region", SqlDbType.NVarChar, 15));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Region";
            workParam = workCommand.Parameters.Add(new SqlParameter("@PostalCode", SqlDbType.NVarChar, 10));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "PostalCode";
            workParam = workCommand.Parameters.Add(new SqlParameter("@Country", SqlDbType.NVarChar, 15));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Country";
            workParam = workCommand.Parameters.Add(new SqlParameter("@Phone", SqlDbType.NVarChar, 24));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Phone";
            workParam = workCommand.Parameters.Add(new SqlParameter("@Fax", SqlDbType.NVarChar, 24));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "Fax";

        }

        private void buildCustomersDeleteParams(SqlCommand workCommand)
        {

            SqlParameter workParam = null;
            workParam = workCommand.Parameters.Add(new SqlParameter("@CustomerID", SqlDbType.NChar, 5));
            workParam.Direction = ParameterDirection.Input;
            workParam.SourceColumn = "CustomerID";

        }

    }

}
