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
    ///    Summary description for DataGrid3.
    /// </summary>
    public class DataGrid3 : System.Web.UI.Page
    {
		protected System.Web.UI.WebControls.DataGrid MyDataGrid;
		protected System.Web.UI.HtmlControls.HtmlInputButton Submit1;
		private System.ComponentModel.IContainer components;
		protected System.Web.UI.HtmlControls.HtmlSelect MySelect;
		protected SqlConnection myConnection;
	
	public DataGrid3()
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
			SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
        
			if (!IsPostBack) 
			{
				SqlDataAdapter myCommand = new SqlDataAdapter("select distinct State from Authors", myConnection);

				DataSet ds = new DataSet();
				myCommand.Fill(ds, "States");

				MySelect.DataSource= ds.Tables["States"].DefaultView;
				MySelect.DataBind();
			}
		}

		public void GetAuthors_Click(Object sender, EventArgs E) 
		{
			String selectCmd = "select * from Authors where state = @State";

			myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
			SqlDataAdapter myCommand = new SqlDataAdapter(selectCmd, myConnection);

			myCommand.SelectCommand.Parameters.Add(new SqlParameter("@State", SqlDbType.NVarChar, 2));
			myCommand.SelectCommand.Parameters["@State"].Value = MySelect.Value;

			DataSet ds = new DataSet();
			myCommand.Fill(ds, "Authors");

			MyDataGrid.DataSource= ds.Tables["Authors"].DefaultView;
			MyDataGrid.DataBind();
		}
		private void Page_UnLoad(object sender, System.EventArgs e)
		{
			myConnection.Close();
		}

    }
}
