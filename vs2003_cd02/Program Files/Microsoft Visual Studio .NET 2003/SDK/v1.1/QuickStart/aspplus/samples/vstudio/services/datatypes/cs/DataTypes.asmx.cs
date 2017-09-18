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

namespace DataTypes.Cs
{
    using System;
    using System.Collections;
    using System.ComponentModel;
    using System.Diagnostics;
    using System.Web;
    using System.Web.Services;

    /// <summary>
    ///    Summary description for DataTypes.
    /// </summary>
    public class DataTypesService : System.Web.Services.WebService
    {
        public DataTypesService()
        {
            //CODEGEN: This call is required by the XML Web services created using ASP.NET Designer
            InitializeComponent();
        }

        /// <summary>
        ///    Required method for Designer support - do not modify
        ///    the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
        }

        /// <summary>
        ///    Clean up any resources being used.
        /// </summary>
        protected override void Dispose(bool disposing)
        {
        }

		[WebMethod]
		public String SayHello()
		{
			return "Hello World!";
		}

		[WebMethod]
		public String SayHelloName(String name)
		{
			return "Hello " + name;
		}

		[WebMethod]
		public int[] GetIntArray()
		{
			int[] a = new int[5];
			for (int i=0; i<5; i++)
				a[i] = i*10;
			return a;
		}

		[WebMethod]
		public Mode GetMode()
		{
			return Mode.Off;
		}

		[WebMethod]
		public Order GetOrder()
		{
			Order myOrder = new Order();

			myOrder.Price=34.5;
			myOrder.OrderID = 323232;

			return myOrder;
		}

		[WebMethod]
		public Order[] GetOrders()
		{
			Order [] myOrder = new Order[2];

			myOrder[0] = new Order();
			myOrder[0].Price=34.5;
			myOrder[0].OrderID = 323232;
			myOrder[1] = new Order();
			myOrder[1].Price=99.4;
			myOrder[1].OrderID = 645645;

			return myOrder;
		}
	}

	public enum Mode
	{
		On = 1,
		Off = 2
	}

	public class Order
	{
		public int OrderID;
		public double Price;
	}

}
