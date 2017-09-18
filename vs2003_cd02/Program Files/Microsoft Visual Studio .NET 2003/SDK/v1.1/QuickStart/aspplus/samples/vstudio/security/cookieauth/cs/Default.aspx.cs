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

namespace CookieAuth.Cs
{
    using System;
    using System.Collections;
    using System.ComponentModel;
    using System.Data;
    using System.Drawing;
	using System.Web;
    using System.Web.Security;
	using System.Web.SessionState;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    /// <summary>
    ///    Summary description for CDefault.
    /// </summary>
    public class Default : System.Web.UI.Page
    {
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.Label Welcome;
		private System.ComponentModel.IContainer components;
	
		public Default()
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
			this.Button1.Click += new System.EventHandler(this.Signout_Click);

		}

		private void Page_Load(object sender, System.EventArgs e)
		{
			Welcome.Text = "Hello, " + User.Identity.Name;
		}

		protected void Signout_Click(object sender, System.EventArgs e)
		{
			FormsAuthentication.SignOut();
			Response.Redirect("login.aspx");
		}
    }
}
