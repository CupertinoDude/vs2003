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

namespace Pagelets.Cs
{
    using System;
    using System.Collections;
    using System.ComponentModel;
    using System.Data;
    using System.Drawing;
    using System.Web;
    using System.Web.SessionState;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    /// <summary>
    ///    Demonstration of a simple Login UserControl.
    ///    Codebehind class for pagelet4.aspx.
    /// </summary>
    public class pagelet4 : System.Web.UI.Page
    {
        protected internal Pagelets.Cs.UserControls.pagelet4 MyLogin;
        protected internal System.Web.UI.WebControls.Label MyLabel;

	    public pagelet4()
	    {
	        Page.Init += new System.EventHandler(Page_Init);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // If user is posting form
            if (Page.IsPostBack)
            {
                MyLabel.Text += String.Format("The UserId is {0}<br>", MyLogin.UserId);
                MyLabel.Text += String.Format("The Password is {0}<br>", MyLogin.Password);
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
        private void InitializeComponent()
        {
	        this.Load += new System.EventHandler (this.Page_Load);
        }
    }
}
