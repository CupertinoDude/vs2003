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
    ///    Demonstration of a simple Login UserControl.
    ///    Codebehind class for pagelet4.ascx.
    /// </summary>
    public class pagelet4 : System.Web.UI.UserControl
    {
        protected internal System.Web.UI.WebControls.TextBox User;
        protected internal System.Web.UI.WebControls.TextBox Pass;
        protected internal System.Web.UI.WebControls.Button SubmitBtn;

        public String BackColor = "white";

        public String UserId {
            get {
                return User.Text;
            }
            set {
                User.Text = value;
            }
        }

        public String Password {
            get {
                return Pass.Text;
            }
            set {
                Pass.Text = value;
            }
        }

        public pagelet4() {
            this.Init += new System.EventHandler(UserControl_Init);
        }

        protected void UserControl_Load(object sender, EventArgs e)
        {

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
        }
    }
}