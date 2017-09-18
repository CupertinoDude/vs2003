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

namespace Data.Cs
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
    ///    Summary description for DataGrid11.
    /// </summary>
    public class DataGrid11 : System.Web.UI.Page
    {
		protected System.Web.UI.WebControls.DataGrid MyDataGrid;
		private System.ComponentModel.IContainer components;
		protected SqlConnection myConnection;
	
	public DataGrid11()
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
		}

		protected void MyDataGrid_Sort(Object sender, DataGridSortCommandEventArgs e) 
		{
			BindGrid(e.SortExpression);
		}

		public void BindGrid(String sortfield) 
		{
			SqlDataAdapter myCommand = new SqlDataAdapter("select * from Authors", myConnection);

			DataSet ds = new DataSet();
			myCommand.Fill(ds, "Authors");

			DataView Source = ds.Tables["Authors"].DefaultView;
			Source.Sort = sortfield;

			MyDataGrid.DataSource=Source;
			MyDataGrid.DataBind();
		}

		private void Page_Load(object sender, System.EventArgs e)
		{
			myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");

			if (!IsPostBack)
				BindGrid("au_id");
		}

		private void Page_UnLoad(object sender, System.EventArgs e)
		{
			myConnection.Close();
		}
    }
}
