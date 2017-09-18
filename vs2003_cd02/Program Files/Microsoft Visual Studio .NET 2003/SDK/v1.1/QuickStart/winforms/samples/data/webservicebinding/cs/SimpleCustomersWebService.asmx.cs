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

namespace Microsoft.Samples.Windows.Forms.Cs.WebServiceBinding
{
    using System;
    using System.Web.Services;
    using System.Data;
    using System.Data.SqlClient;
    using Microsoft.Samples.Windows.Forms.Cs.WebServiceBinding.Data;

    public class CustomersList : WebService 
    {

        [ WebMethod ]
        public DataSet GetCustomers() 
        {
            CustomersAndOrdersDataSet customersAndOrdersDataSet1 = new CustomersAndOrdersDataSet();
            SqlConnection con = new SqlConnection("server=(local)\\NetSDK;database=northwind;Integrated Security=SSPI");
            SqlDataAdapter cmdCustomers = new SqlDataAdapter("Select * from Customers", con);
            SqlDataAdapter cmdOrders = new SqlDataAdapter("Select * from Orders", con);
	    try {
            	cmdCustomers.Fill(customersAndOrdersDataSet1, "Customers");
            	cmdOrders.Fill(customersAndOrdersDataSet1, "Orders");
            	return customersAndOrdersDataSet1 ;
	    }
	    catch (Exception ex){
	        throw (ex);
	    }
	    finally{
	        con.Close();
	    }
        }
     
    }
}
