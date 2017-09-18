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
    ///    Demonstrates a UserControl with public properties.
    ///    Codebehind class for pagelet3.ascx.
    /// </summary>
    public class pagelet3 : System.Web.UI.UserControl
    {
        protected internal System.Web.UI.HtmlControls.HtmlInputText TxtAddress;
        protected internal System.Web.UI.HtmlControls.HtmlInputText TxtCity;
        protected internal System.Web.UI.HtmlControls.HtmlInputText TxtState;
        protected internal System.Web.UI.HtmlControls.HtmlInputText TxtZip;

        public String Caption = "Address";

        public String Address {
            get {
                return TxtAddress.Value;
            }
            set {
                TxtAddress.Value = value;
            }
        }

        public String City {
            get {
                return TxtCity.Value;
            }
            set {
                TxtCity.Value = value;
            }
        }

        public String State {
            get {
                return TxtState.Value;
            }
            set {
                TxtState.Value = value;
            }
        }

        public String Zip {
            get {
                return TxtZip.Value;
            }
            set {
                TxtZip.Value = value;
            }
        }

        public pagelet3() {
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
