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

namespace DataTypes.Cs
{
    using System;
    using System.Collections;
    using System.ComponentModel;

    /// <summary>
    ///    Summary description for DataTypesClient.
    /// </summary>
    public class DataTypesClient : System.Web.UI.Page
    {
		protected System.Web.UI.HtmlControls.HtmlGenericControl Message2;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Message1;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Message3;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Message5;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Message4;
		private System.ComponentModel.IContainer components;
	
		public DataTypesClient()
		{
			Page.Init += new System.EventHandler(Page_Init);
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Windows Form Designer.
            //
            InitializeComponent();
        }

		private void InitializeComponent()
		{
			this.components = new System.ComponentModel.Container();
			this.Load += new System.EventHandler(this.Page_Load);

		}

		private void Page_Load(object sender, System.EventArgs e)
		{
			DataTypesService  d = new DataTypesService ();
			Message1.InnerHtml = d.SayHello();
			Message1.InnerHtml += "<br>" + d.SayHelloName("Bob");	
			Message3.InnerHtml += d.GetMode();
	
			int[] myIntArray = d.GetIntArray();
			String myString = "Contents of the Array:<BR>";
			for( int i=0; i<myIntArray.Length; i++)
			{
				myString = myString + myIntArray[i] + "<BR>";
			}
			Message2.InnerHtml += myString;
	
			Order myOrder =  d.GetOrder();
			Message4.InnerHtml += "<BR>OrderID: " + myOrder.OrderID;
			Message4.InnerHtml += "<BR>Price: " + myOrder.Price;

			Order[] myOrders = d.GetOrders();
			Message5.InnerHtml += "<BR>OrderID: " + myOrders[0].OrderID;
			Message5.InnerHtml += "<BR>Price: " + myOrders[0].Price;
		}
    }
}
