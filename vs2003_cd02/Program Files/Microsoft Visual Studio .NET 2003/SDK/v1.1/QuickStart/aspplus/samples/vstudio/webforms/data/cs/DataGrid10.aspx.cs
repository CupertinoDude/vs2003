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
    ///    Summary description for DataGrid10.
    /// </summary>
    public class DataGrid10 : System.Web.UI.Page
    {
		protected System.Web.UI.WebControls.DataGrid MyDataGrid;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Message;
		private System.ComponentModel.IContainer components;
		protected SqlConnection myConnection;
	
	public DataGrid10()
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

		public void MyDataGrid_Delete(Object sender, DataGridCommandEventArgs e)
		{
			String deleteCmd = "DELETE from Employee where emp_id = @Id";

			SqlCommand myCommand = new SqlCommand(deleteCmd, myConnection);
			myCommand.Parameters.Add(new SqlParameter("@Id", SqlDbType.NVarChar, 11));
			myCommand.Parameters["@Id"].Value = MyDataGrid.DataKeys[(int)e.Item.ItemIndex];

			myCommand.Connection.Open();

			try
			{
				myCommand.ExecuteNonQuery();
				Message.InnerHtml = "<b>Record Deleted</b><br>" + deleteCmd;
			}
			catch (SqlException)
			{
				Message.InnerHtml = "ERROR: Could not delete record";
				Message.Style["color"] = "red";
			}

			myCommand.Connection.Close();

			BindGrid();
		}

		public void BindGrid()
		{
			SqlDataAdapter myCommand = new SqlDataAdapter("select * from Employee", myConnection);

			DataSet ds = new DataSet();
			myCommand.Fill(ds, "Employee");

			MyDataGrid.DataSource=ds.Tables["Employee"].DefaultView;
			MyDataGrid.DataBind();
		}

		private void Page_Load(object sender, System.EventArgs e)
		{
			myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");

			if (!IsPostBack)
				BindGrid();
		}

		private void Page_UnLoad(object sender, System.EventArgs e)
		{
			myConnection.Close();
		}
    }
}
