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

using Microsoft.Samples.Windows.Forms.Cs.Update.Data;

namespace Microsoft.Samples.Windows.Forms.Cs.Update
{
	
    using System;
    using System.Web.Services;
    using System.Data;
    using System.Data.SqlClient;
                                           
    public class ListCustomers : System.Web.Services.WebService
    {

        [ WebMethod ]
        public DataSet GetCustomers() 
        {
            CustomersDataSet customersDataSet1 = new CustomersDataSet();
            SqlConnection con = new SqlConnection("server=(local)\\NetSDK;database=northwind;Integrated Security=SSPI");
            SqlDataAdapter cmdCustomers = new SqlDataAdapter("Select * from Customers where country='USA'", con);
	    try {
	            cmdCustomers.Fill(customersDataSet1, "Customers");
	            return customersDataSet1 ;
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
