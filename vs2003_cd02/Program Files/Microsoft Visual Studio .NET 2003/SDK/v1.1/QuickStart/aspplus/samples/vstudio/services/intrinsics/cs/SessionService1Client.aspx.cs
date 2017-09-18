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

namespace Intrinsics.Cs
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
    ///    Summary description for SessionService1Client.
    /// </summary>
    public class SessionService1Client : System.Web.UI.Page
    {
		protected System.Web.UI.HtmlControls.HtmlGenericControl Message1;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Message2;
		private System.ComponentModel.IContainer components;
	
		public SessionService1Client()
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
			SessionService1  s = new SessionService1();
			Message1.InnerHtml = s.UpdateHitCounter() + "<BR>" + s.UpdateHitCounter() + "<BR>" + s.UpdateHitCounter();
			Message2.InnerHtml = s.UpdateAppCounter() + "<BR>" + s.UpdateAppCounter() + "<BR>" + s.UpdateAppCounter();
		}
    }
}
