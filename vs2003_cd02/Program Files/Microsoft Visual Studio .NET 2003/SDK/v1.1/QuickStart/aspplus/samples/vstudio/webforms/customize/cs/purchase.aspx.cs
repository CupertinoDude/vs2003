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

namespace Customize.Cs
{
    using System;
    using System.Collections;
    using System.ComponentModel;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Text.RegularExpressions;
    using System.Web;
    using System.Web.SessionState;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    /// <summary>
    ///    Summary description for purchase.
    /// </summary>
    public class purchase : System.Web.UI.Page
    {
        protected internal System.Web.UI.WebControls.DataList MyDataList;
        protected internal System.Web.UI.HtmlControls.HtmlInputButton SubmitBtn;
        protected internal System.Web.UI.HtmlControls.HtmlInputText txtAccountNum;
        protected internal System.Web.UI.HtmlControls.HtmlInputText txtAddress;
        protected internal System.Web.UI.HtmlControls.HtmlInputText txtName;
        protected internal System.Web.UI.WebControls.Label Message;
    
        public purchase()
        {
            Page.Init += new System.EventHandler(Page_Init);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ( Request.QueryString["titleid"] != null )
            {
                // Validate the title using a regular expression
                //   wwdddd
                //   ^\\w{2}\\d{4}$
                if ( Regex.IsMatch(Request.QueryString["titleid"], "^\\w{2}\\d{4}$") )
                {
                    String query = "select * from Titles where title_id = '" + Request.QueryString["titleid"] + "'";

                    SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
                    SqlDataAdapter myCommand = new SqlDataAdapter(query, myConnection);

                    DataSet ds = new DataSet();
                    try
                    {
                        myCommand.Fill(ds, "Titles");

                        MyDataList.DataSource = ds.Tables["Titles"].DefaultView;
                        MyDataList.DataBind();
                    }
                    catch (Exception ex)
                    {
                        throw (ex);
                    }
                    finally
                    {
                        myConnection.Close();
                    }
                }
            }
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
        private void InitializeComponent() {
            this.Load += new System.EventHandler (this.Page_Load);
            SubmitBtn.ServerClick += new System.EventHandler (this.Submit_Click);
        }

        void Submit_Click(object sender, System.EventArgs e) {
            Message.Text = "<h2>Purchase Made!!!</h2>";
        }
    }
}
