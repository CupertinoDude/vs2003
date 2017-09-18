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

namespace BusinessLayer
{
using System;
using System.Data;
using System.Data.SqlClient;
using DataLayer;

  public class BusObj
  {
    private DataObj data;

    public BusObj()
    {
      data = new DataObj("server=(local)\\NetSDK;database=grocertogo;Integrated Security=SSPI");
    }

    public DataView GetCategories()
    {
       return data.GetCategories();
    }

    public DataView GetProductsForCategory(String category, int customerid)
    {
       DataView view = data.GetProductsForCategory(category);

       double discount = 0;
       if ((customerid >= 25)&&(customerid < 50))
       {
         discount = .50;
       }
       else if ((customerid >= 50)&&(customerid < 75))
       {
         discount = 1.00;
       }
       else if ((customerid >= 75)&&(customerid < 100))
       {
         discount = 1.50;
       }

       for (int i=0; i<view.Count; i++)
       {
         view[i]["UnitPrice"] = Double.Parse(view[i]["UnitPrice"].ToString()) - discount;
       }

       return view;
    }
  }

}