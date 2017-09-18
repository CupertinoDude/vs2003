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

namespace DataService.Cs
{
    using System;
    using System.Collections;
    using System.ComponentModel;
    using System.Data;
	using System.Data.SqlClient;
    using System.Drawing;
    using System.Web;
    using System.Web.SessionState;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    /// <summary>
    ///    Summary description for DataServiceClient.
    /// </summary>
    public class DataServiceClient : System.Web.UI.Page
    {
		protected System.Web.UI.WebControls.DataGrid Authors_DataGrid;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Message;
		protected System.Web.UI.HtmlControls.HtmlInputButton Submit1;
		private System.ComponentModel.IContainer components;
	
	public DataServiceClient()
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

        /// <summary>
        ///    Required method for Designer support - do not modify
        ///    the contents of this method with the code editor.
        /// </summary>
		private void InitializeComponent()
		{
			this.components = new System.ComponentModel.Container();
			this.Load += new System.EventHandler(this.Page_Load);
			this.Submit1.ServerClick += new System.EventHandler(this.Submit_DataSet);
		}

		private void Page_Load(object sender, System.EventArgs e)
		{
			DataServiceService d = new DataServiceService();
			DataSet myData = d.GetTitleAuthors();

			if (!Page.IsPostBack)
			{
				Authors_DataGrid.DataSource=myData.Tables["Authors"].DefaultView;
				Authors_DataGrid.DataBind();
			}

			Message.InnerHtml = "The number of rows is: " + myData.Tables["Authors"].Rows.Count.ToString();
		}
		
		protected void Submit_DataSet(Object Src, EventArgs E)
		{

			DataServiceService d = new DataServiceService();
			DataSet myData = d.GetTitleAuthors();

			//Remove three rows from the Authors table
			myData.Tables["Authors"].Rows.RemoveAt(0);
			myData.Tables["Authors"].Rows.RemoveAt(1);
			myData.Tables["Authors"].Rows.RemoveAt(2);

			int rowCount = d.PutTitleAuthors(myData);
			Message.InnerHtml = "The modified number of rows is: " + rowCount.ToString();

			Authors_DataGrid.DataSource=myData.Tables["Authors"].DefaultView;
			Authors_DataGrid.DataBind();
		}

    }
}
