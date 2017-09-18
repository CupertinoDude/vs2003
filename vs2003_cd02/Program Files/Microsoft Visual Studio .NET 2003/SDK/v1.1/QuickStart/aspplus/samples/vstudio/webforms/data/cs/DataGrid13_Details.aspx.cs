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
    ///    Summary description for DataGrid13_Details.
    /// </summary>
    public class DataGrid13_Details : System.Web.UI.Page
    {
		protected System.Web.UI.WebControls.DataGrid MyDataGrid;
		protected System.Web.UI.WebControls.Label AuthorId;
		private System.ComponentModel.IContainer components;
		protected SqlConnection myConnection;
	
	public DataGrid13_Details()
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
			AuthorId.Text = Request.QueryString["id"];

			myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");

			String selectCmd = "select t.title_id, t.type, t.pub_id, t.price "  
				+ "from titles t, titleauthor ta, authors a "
				+ "where  ta.au_id=@Id AND ta.title_id=t.title_id AND ta.au_id = a.au_id";

			SqlDataAdapter myCommand = new SqlDataAdapter(selectCmd, myConnection);

			myCommand.SelectCommand.Parameters.Add(new SqlParameter("@Id", SqlDbType.NVarChar, 11));
			myCommand.SelectCommand.Parameters["@Id"].Value = Request.QueryString["id"];

			DataSet ds = new DataSet();
        
			try 
			{
				myCommand.Fill(ds, "Titles");
				MyDataGrid.DataSource=ds.Tables["Titles"].DefaultView;
				MyDataGrid.DataBind();
			} 
			catch (Exception) {}
			finally
			{
				myConnection.Close();
			}
		}
    }
}
