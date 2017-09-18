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
    ///    Summary description for DataGrid16.
    /// </summary>
    public class DataGrid16 : System.Web.UI.Page
    {
		protected System.Web.UI.WebControls.DataGrid MyDataGrid;
		protected System.Web.UI.WebControls.Calendar BeginDate;
		protected System.Web.UI.WebControls.Calendar EndDate;
		private System.ComponentModel.IContainer components;
		protected SqlConnection myConnection;
	
	public DataGrid16()
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

		private void Page_Load(object sender, System.EventArgs e)
		{

		}

		public void GetSales_Click(Object sender, EventArgs E) 
		{
			SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=northwind;Integrated Security=SSPI");
			SqlDataAdapter myCommand = new SqlDataAdapter("Employee Sales By Country", myConnection);

			myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;

			myCommand.SelectCommand.Parameters.Add(new SqlParameter("@Beginning_Date", SqlDbType.DateTime));
			myCommand.SelectCommand.Parameters["@Beginning_Date"].Value = BeginDate.SelectedDate;

			myCommand.SelectCommand.Parameters.Add(new SqlParameter("@Ending_Date", SqlDbType.DateTime));
			myCommand.SelectCommand.Parameters["@Ending_Date"].Value = EndDate.SelectedDate;

			DataSet ds = new DataSet();
			try {
				myCommand.Fill(ds, "Sales");
	
				MyDataGrid.DataSource=ds.Tables["Sales"].DefaultView;
				MyDataGrid.DataBind();
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
