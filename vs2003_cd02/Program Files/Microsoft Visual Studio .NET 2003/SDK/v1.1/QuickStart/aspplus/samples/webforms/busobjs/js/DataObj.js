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

import System;
import System.Data;
import System.Data.SqlClient;
import System.Reflection;

[assembly: AssemblyTitle("")]
[assembly: AssemblyDescription("A QuickStart Tutorial Assembly")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("Microsoft Corporation")]
[assembly: AssemblyProduct("Microsoft QuickStart Tutorials")]
[assembly: AssemblyCopyright(" Microsoft Corporation.  All rights reserved.")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCulture("")]
[assembly: AssemblyVersion("1.1.*")]

package DataLayerJS {
    public class DataObj {
        private var _connStr:String;

        public function DataObj() {
            _connStr = null;
        }

        public function DataObj(connStr:String) {
            _connStr = connStr;
        }

        public function get ConnectionString() : String {
            return _connStr;
        }
        public function set ConnectionString(value:String) {
            _connStr = value;
        }

        public function GetCategories() : DataView {
            var myConnection:SqlConnection = new SqlConnection(_connStr);
            var myCommand:SqlDataAdapter = new SqlDataAdapter("select distinct CategoryName from Categories", myConnection);

            var ds:DataSet = new DataSet();

	    try {
            	myCommand.Fill(ds, "Categories");

            	return ds.Tables["Categories"].DefaultView;
	    } catch(ex){
     		throw (ex);
	    }finally{
    		 myConnection.Close();
	    }
        }

        public function GetProductsForCategory(category:String) : DataView {
            var myConnection:SqlConnection = new SqlConnection(_connStr);
            var myCommand:SqlDataAdapter = new SqlDataAdapter("select ProductName, ImagePath, UnitPrice, c.CategoryId  from Products p, Categories c where c.CategoryName='" + category + "' and p.CategoryId = c.CategoryId", myConnection);

            var ds:DataSet = new DataSet();
	    try {
            	myCommand.Fill(ds, "Products");

            	return ds.Tables["Products"].DefaultView;
	    } catch(ex){
     		throw (ex);
	    }finally{
    		 myConnection.Close();
	    }
        }
    }
}