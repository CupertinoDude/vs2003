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

namespace Pagelets.Cs.UserControls
{
    using System;
    using System.Collections;
    using System.ComponentModel;
    using System.Data;
    using System.Data.SqlClient;
    using System.Xml;
    using System.Drawing;
    using System.Web;
    using System.Web.SessionState;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    /// <summary>
    ///    Demonstration of a UserControl with an Event.
    ///    Codebehind class for pagelet6.ascx.
    /// </summary>
    public class pagelet6 : System.Web.UI.UserControl
    {
        protected internal System.Web.UI.WebControls.DropDownList Category;
        protected internal System.Web.UI.WebControls.DataList MyDataList;

        public pagelet6() {
            this.Init += new System.EventHandler(UserControl_Init);
        }

        protected void UserControl_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {

                SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
                SqlDataAdapter myCommand = new SqlDataAdapter("select * from Titles where type='" + Category.SelectedItem.Value + "'", myConnection);

                DataSet ds = new DataSet();
                myCommand.Fill(ds, "Titles");

                MyDataList.DataSource = ds.Tables["Titles"].DefaultView;
                MyDataList.DataBind();
            }
        }

        protected void UserControl_Init(object sender, EventArgs e)
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
	        this.Load += new System.EventHandler (this.UserControl_Load);
            Category.SelectedIndexChanged += new System.EventHandler (this.Category_Select);
        }

        /// <summary>
        ///    Handles event when a different category is selected.
        /// </summary>
        private void Category_Select(object sender, EventArgs e) {

            SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
            SqlDataAdapter myCommand = new SqlDataAdapter("select * from Titles where type='" + Category.SelectedItem.Value + "'", myConnection);

            DataSet ds = new DataSet();
            myCommand.Fill(ds, "Titles");

            MyDataList.DataSource = ds.Tables["Titles"].DefaultView;
            MyDataList.DataBind();
        }
    }
}
