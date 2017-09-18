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

    using Pagelets.Cs.UserControls;

    /// <summary>
    ///    Demonstration of adding UserControls to page at run-time.
    ///    Code behind class for pagelet7.aspx.
    /// </summary>
    public class pagelet7 : System.Web.UI.Page
    {
        public pagelet7()
        {
            Page.Init += new System.EventHandler(Page_Init);
        }

        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            Pagelets.Cs.UserControls.pagelet7 c1, c2, c3;

            Page.Controls.Add(new HtmlGenericControl("hr"));

            // LoadControl returns type UserControl so we must cast it to type pagelet7
            c1 = (Pagelets.Cs.UserControls.pagelet7)LoadControl("pagelet7.ascx");
            c1.Category = "business";
            Page.Controls.Add(c1);

            Page.Controls.Add(new HtmlGenericControl("hr"));

            c2 = (Pagelets.Cs.UserControls.pagelet7)LoadControl("pagelet7.ascx");
            c2.Category = "trad_cook";
            Page.Controls.Add(c2);

            Page.Controls.Add(new HtmlGenericControl("hr"));

            c3 = (Pagelets.Cs.UserControls.pagelet7)LoadControl("pagelet7.ascx");
            c3.Category = "mod_cook";
            Page.Controls.Add(c3);
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
            this.Load += new System.EventHandler(this.Page_Load);
        }
    }
}
