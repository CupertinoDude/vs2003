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

using System.Reflection;

[assembly: AssemblyTitle("")]
[assembly: AssemblyDescription("A QuickStart Tutorial Assembly")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("Microsoft Corporation")]
[assembly: AssemblyProduct("Microsoft QuickStart Tutorials")]
[assembly: AssemblyCopyright(" Microsoft Corporation.  All rights reserved.")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCulture("")]
[assembly: AssemblyVersion("1.1.*")]

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
    ///    Summary description for Login.
    /// </summary>
    public class Login : System.Web.UI.Page
    {
		protected System.Web.UI.WebControls.CheckBox PersistCookie;
		protected System.Web.UI.WebControls.Label Msg;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator2;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
		protected System.Web.UI.WebControls.Button LoginBtn;
		protected System.Web.UI.HtmlControls.HtmlInputText UserEmail;
		protected System.Web.UI.HtmlControls.HtmlInputText UserPass;
		private System.ComponentModel.IContainer components;

		public Login()
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
			this.LoginBtn.Click += new System.EventHandler(this.Login_Click);
		}

		private void Page_Load(object sender, System.EventArgs e)
		{

		}

		protected void Login_Click(Object sender, EventArgs E)
		{
			// authenticate user: this samples accepts only one user with
			// a name of someone@www.contoso.com and a password of 'password'

			if ((UserEmail.Value == "someone@www.contoso.com") && (UserPass.Value == "password"))
			{
				FormsAuthentication.RedirectFromLoginPage(UserEmail.Value, PersistCookie.Checked);
			}
			else
			{
				Msg.Text = "Invalid Credentials: Please try again";
			}
		}
	}
}
