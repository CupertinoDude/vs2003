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
    ///    Summary description for validator5.
    /// </summary>
    public class validator5 : System.Web.UI.Page
    {

        protected internal System.Web.UI.WebControls.TextBox txtComp;
        protected internal System.Web.UI.WebControls.DropDownList lstType;
        protected internal System.Web.UI.WebControls.TextBox txtMin;
        protected internal System.Web.UI.WebControls.TextBox txtMax;
        protected internal System.Web.UI.WebControls.Button ValidateBtn;
        protected internal System.Web.UI.WebControls.RangeValidator rangeVal;
        protected internal System.Web.UI.WebControls.Label lblOutput;

        public validator5()
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
            ValidateBtn.Click += new System.EventHandler (this.ValidateBtn_Click);
            lstType.SelectedIndexChanged += new System.EventHandler (this.lstType_SelectedIndexChanged);
        }

        void ValidateBtn_Click(object sender, System.EventArgs e) {
            if (Page.IsValid) {
                lblOutput.Text = "Result: Valid!";
            } else {
                lblOutput.Text = "Result: Not valid!";
            }
        }

        void lstType_SelectedIndexChanged(object sender, System.EventArgs e) {
            rangeVal.Type = (ValidationDataType) lstType.SelectedIndex;
            
            // User may try to input invalid values for the datatype
            try
            {
                rangeVal.MinimumValue = txtMin.Text;
                rangeVal.MaximumValue = txtMax.Text;
            }
            catch
            {
            }

            try
            {
                rangeVal.Validate();
            } 
            catch (Exception exc) 
            {
                lblOutput.Text = "Error: " + exc.Message;
            }
        }
    }
}
