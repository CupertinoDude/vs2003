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
	using Acme;
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
    ///    Summary description for DataGrid4.
    /// </summary>
    public class DataGrid4 : System.Web.UI.Page
    {
		protected System.Web.UI.HtmlControls.HtmlInputText au_lname;
		protected System.Web.UI.HtmlControls.HtmlInputText address;
		protected System.Web.UI.HtmlControls.HtmlSelect contract;
		protected System.Web.UI.HtmlControls.HtmlInputButton Submit1;
		protected System.Web.UI.HtmlControls.HtmlInputText zip;
		protected System.Web.UI.HtmlControls.HtmlSelect state;
		protected System.Web.UI.HtmlControls.HtmlInputText au_id;
		protected System.Web.UI.HtmlControls.HtmlInputText city;
		protected System.Web.UI.HtmlControls.HtmlInputText au_fname;
		protected System.Web.UI.WebControls.DataGrid MyDataGrid;
		protected System.Web.UI.HtmlControls.HtmlInputText phone;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Message;
		protected System.Web.UI.HtmlControls.HtmlTableCell TD1;
		protected System.Web.UI.WebControls.RegularExpressionValidator au_idValidator;
		protected System.Web.UI.WebControls.RegularExpressionValidator au_lnameValidator;
		protected System.Web.UI.WebControls.RegularExpressionValidator au_fnameValidator;
		protected System.Web.UI.WebControls.RegularExpressionValidator phoneValidator;
		protected System.Web.UI.WebControls.RegularExpressionValidator addressValidator;
		protected System.Web.UI.WebControls.RegularExpressionValidator cityValidator;
		protected System.Web.UI.WebControls.RegularExpressionValidator stateValidator;
		protected System.Web.UI.WebControls.RegularExpressionValidator zipValidator;
		protected System.Web.UI.WebControls.RegularExpressionValidator contractValidator;
		protected SqlConnection myConnection;
	
	public DataGrid4()
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
			this.Load += new System.EventHandler(this.Page_Load);

		}

		private void Page_Load(object sender, System.EventArgs e)
		{
			myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");

			if (!IsPostBack) 
			{
				BindGrid();
				Page.DataBind();
			}
		}

		protected void AddAuthor_Click(object sender, System.EventArgs e)
		{
			Page.Validate();
			if ( !Page.IsValid )
			{
				return;
			}

			if (au_id.Value == "" || au_fname.Value == "" || au_lname.Value == "" || phone.Value == "")
			{
				Message.InnerHtml = "ERROR: Null values not allowed for Author ID, Name or Phone";
				Message.Style["color"] = "red";
				BindGrid();
				return;
			}

			String insertCmd = "insert into Authors (au_id, au_lname, au_fname, phone, address, city, state, zip, contract) values (@Id, @LName, @FName, @Phone, @Address, @City, @State, @Zip, @Contract)";

			SqlCommand myCommand = new SqlCommand(insertCmd, myConnection);

			myCommand.Parameters.Add(new SqlParameter("@Id", SqlDbType.NVarChar, 11));
			myCommand.Parameters["@Id"].Value = au_id.Value;

			myCommand.Parameters.Add(new SqlParameter("@LName", SqlDbType.NVarChar, 40));
			myCommand.Parameters["@LName"].Value = au_lname.Value;

			myCommand.Parameters.Add(new SqlParameter("@FName", SqlDbType.NVarChar, 20));
			myCommand.Parameters["@FName"].Value = au_fname.Value;

			myCommand.Parameters.Add(new SqlParameter("@Phone", SqlDbType.NChar, 12));
			myCommand.Parameters["@Phone"].Value = phone.Value;

			myCommand.Parameters.Add(new SqlParameter("@Address", SqlDbType.NVarChar, 40));
			myCommand.Parameters["@Address"].Value = address.Value;

			myCommand.Parameters.Add(new SqlParameter("@City", SqlDbType.NVarChar, 20));
			myCommand.Parameters["@City"].Value = city.Value;

			myCommand.Parameters.Add(new SqlParameter("@State", SqlDbType.NChar, 2));
			myCommand.Parameters["@State"].Value = state.Value;

			myCommand.Parameters.Add(new SqlParameter("@Zip", SqlDbType.NChar, 5));
			myCommand.Parameters["@Zip"].Value = zip.Value;

			myCommand.Parameters.Add(new SqlParameter("@Contract", SqlDbType.NVarChar,1));
			myCommand.Parameters["@Contract"].Value = contract.Value;

			myCommand.Connection.Open();

			try 
			{
				myCommand.ExecuteNonQuery();
				Message.InnerHtml = "<b>Record Added</b><br>" + insertCmd.ToString();
			}
			catch (SqlException E)
			{
				if (E.Number == 2627)
					Message.InnerHtml = "ERROR: A record already exists with the same primary key";
				else
					Message.InnerHtml = "ERROR: Could not add record, please ensure the fields are correctly filled out";
				Message.Style["color"] = "red";
			}

			myCommand.Connection.Close();

			BindGrid();
		}

		public void BindGrid() 
		{
			SqlDataAdapter myCommand = new SqlDataAdapter("select * from Authors", myConnection);

			DataSet ds = new DataSet();
			myCommand.Fill(ds, "Authors");

			MyDataGrid.DataSource=ds.Tables["Authors"].DefaultView;
			MyDataGrid.DataBind();
		}

		private void Page_UnLoad(object sender, System.EventArgs e)
		{
			myConnection.Close();
		}
    }
}
