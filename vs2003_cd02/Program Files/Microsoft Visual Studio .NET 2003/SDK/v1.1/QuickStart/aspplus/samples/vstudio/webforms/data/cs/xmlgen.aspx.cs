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
	using System.IO;
    using System.Web;
    using System.Web.SessionState;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    /// <summary>
    ///    Summary description for xmlgen.
    /// </summary>
    public class xmlgen : System.Web.UI.Page
    {
		protected System.Web.UI.HtmlControls.HtmlInputButton Submit1;
		protected System.Web.UI.WebControls.DataGrid MyDataGrid;
		protected System.Web.UI.HtmlControls.HtmlInputRadioButton GetData;
		protected System.Web.UI.HtmlControls.HtmlInputRadioButton GetSchema;
		protected System.Web.UI.WebControls.Label lblData;
		protected System.Web.UI.WebControls.Label lblXML;
		public DataView Source;
		public DataSet ds;

		private static string originalString = "server=(local)\\NetSDK;database=;Integrated Security=SSPI";
		private string connectString = originalString;
		protected System.Web.UI.WebControls.Label connect;
		protected System.Web.UI.WebControls.DropDownList database;
		protected System.Web.UI.WebControls.DropDownList table;
		private string selectString = "";
		protected System.Web.UI.WebControls.Label query;

		string[][] tables = new string[][]
			{
				new string[] {"authors", "discounts", "employee", "jobs", "publishers", "sales", "stores", "titleauthor", "titles"},
				new string[] {"Categories", "Customers", "Employees", "Orders", "Products", "Region", "Shippers", "Suppliers", "Territories"},
				new string[] {"Categories", "Customers", "ProductDetails", "Products"},
				new string[] {"Modules", "Personalization", "SiteDirectory", "UserData"}
			};

		public xmlgen()
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
			this.Submit1.ServerClick += new System.EventHandler(this.Submit_Click);
			this.database.SelectedIndexChanged += new System.EventHandler(this.database_SelectedIndexChanged);
			this.table.SelectedIndexChanged += new System.EventHandler(this.table_SelectedIndexChanged);
			this.Load += new System.EventHandler(this.Page_Load);

		}

		private void Page_Load(object sender, System.EventArgs e)
		{
			if ( !IsPostBack )
			{
				database_SelectedIndexChanged(database, null);
			}
            
			Initialize();
		}

		protected void Submit_Click(Object sender, EventArgs evt)
		{
			if (Page.IsPostBack)
			{
				SqlConnection myConnection = new SqlConnection(connectString);
				SqlDataAdapter myCommand = new SqlDataAdapter(selectString, myConnection);

				ds = new DataSet();
				try {
				    myCommand.Fill(ds, "Table");

				    Source = new DataView(ds.Tables[0]);

				    MyDataGrid.DataSource=Source;
				    MyDataGrid.DataBind();

				    lblXML.Text = "<b>Result:</b><br>";
				    lblXML.Text += "<textarea cols=80 rows=25>";

				    if (GetSchema.Checked)	{
					lblXML.Text += ds.GetXmlSchema();
				    } else if (GetData.Checked) {
					lblXML.Text += ds.GetXml();
				    }

				    lblXML.Text += "</textarea>";

				    lblData.Text = "<b>Data:</b><br>";
				}
				catch (Exception ex){
    				    throw (ex);
				}
				finally{
    				    myConnection.Close();
				}

			}
		}

		private void Initialize()
		{
			connectString = originalString.Replace("database=", "database=" + database.SelectedItem.Text);
			selectString = "select * from " + table.SelectedItem.Text;
            
			connect.Text = connectString;
			query.Text = selectString;
		}

		public void table_SelectedIndexChanged(Object sender, EventArgs e)
		{
			Initialize();
		}

		private void database_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			table.DataSource = tables[database.SelectedIndex];
			table.DataBind();

			Initialize();
		}
	}
}
