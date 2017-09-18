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

using System.Reflection;

[assembly: AssemblyTitle("")]
[assembly: AssemblyDescription("A QuickStart Tutorial Assembly")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("Microsoft Corporation")]
[assembly: AssemblyProduct("Microsoft QuickStart Tutorials")]
[assembly: AssemblyCopyright(" Microsoft Corporation.  All rights reserved.")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCulture("")]
[assembly: AssemblyVersion("1.1.*")]

namespace DataLayer
{
using System;
using System.Data;
using System.Data.SqlClient;

  public class DataObj
  {
    private String _connStr;

    public DataObj()
    {
      _connStr = null;
    }

    public DataObj(String connStr)
    {
      _connStr = connStr;
    }

    public String ConnectionString
    {
      get
      {
        return _connStr;
      }
      set
      {
        _connStr = value;
      }
    }

    public DataView GetCategories()
    {
      SqlConnection myConnection = new SqlConnection(_connStr);
      SqlDataAdapter myCommand = new SqlDataAdapter("select distinct CategoryName from Categories", myConnection);

      DataSet ds = new DataSet();
      try {
      	myCommand.Fill(ds, "Categories");

      	return ds.Tables["Categories"].DefaultView;
      }
      catch (Exception ex){
    	throw (ex);
      }
      finally{
    	myConnection.Close();
      }
    }

    public DataView GetProductsForCategory(String category)
    {
      SqlConnection myConnection = new SqlConnection(_connStr);
      SqlDataAdapter myCommand = new SqlDataAdapter("select ProductName, ImagePath, UnitPrice, c.CategoryId  from Products p, Categories c where c.CategoryName='" + category + "' and p.CategoryId = c.CategoryId", myConnection);

      DataSet ds = new DataSet();
      try {
      	myCommand.Fill(ds, "Products");

      	return ds.Tables["Products"].DefaultView;
      }
      catch (Exception ex){
    	throw (ex);
      }
      finally{
    	myConnection.Close();
      }
    }
  }

}