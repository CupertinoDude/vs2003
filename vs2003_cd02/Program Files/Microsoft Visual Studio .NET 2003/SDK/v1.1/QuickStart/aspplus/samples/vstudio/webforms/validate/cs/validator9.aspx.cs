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

namespace Validate.Cs
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
    ///    Summary description for validator9.
    /// </summary>
    public class validator9 : System.Web.UI.Page
    {
        protected internal System.Web.UI.WebControls.ValidationSummary valSum;
        protected internal System.Web.UI.WebControls.TextBox email;
        protected internal System.Web.UI.WebControls.RequiredFieldValidator emailReqVal;
        protected internal System.Web.UI.WebControls.RegularExpressionValidator emailRegexVal;
        protected internal System.Web.UI.WebControls.TextBox passwd;
        protected internal System.Web.UI.WebControls.RequiredFieldValidator passwdReqVal;
        protected internal System.Web.UI.WebControls.RegularExpressionValidator passwdRegexVal;
        protected internal System.Web.UI.WebControls.TextBox passwd2;
        protected internal System.Web.UI.WebControls.RequiredFieldValidator passwd2ReqVal;
        protected internal System.Web.UI.WebControls.CompareValidator CompareValidator1;
        protected internal System.Web.UI.WebControls.TextBox fn;
        protected internal System.Web.UI.WebControls.TextBox ln;
        protected internal System.Web.UI.WebControls.TextBox address;
        protected internal System.Web.UI.WebControls.TextBox state;
        protected internal System.Web.UI.WebControls.TextBox zip;
        protected internal System.Web.UI.WebControls.RegularExpressionValidator RegularExpressionValidator1;
        protected internal System.Web.UI.WebControls.TextBox phone;
        protected internal System.Web.UI.WebControls.RequiredFieldValidator phoneReqVal;
        protected internal System.Web.UI.WebControls.RegularExpressionValidator phoneRegexVal;
        protected internal System.Web.UI.WebControls.RadioButtonList ccType;
        protected internal System.Web.UI.WebControls.RequiredFieldValidator ccTypeReqVal;
        protected internal System.Web.UI.WebControls.TextBox ccNum;
        protected internal System.Web.UI.WebControls.RequiredFieldValidator ccNumReqVal;
        protected internal System.Web.UI.WebControls.CustomValidator ccNumCustVal;
        protected internal System.Web.UI.WebControls.DropDownList expDate;
        protected internal System.Web.UI.WebControls.RequiredFieldValidator expDateReqVal;

	    public validator9()
	    {
	        Page.Init += new System.EventHandler(Page_Init);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //
                // Evals true first time browser hits the page
                //
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
