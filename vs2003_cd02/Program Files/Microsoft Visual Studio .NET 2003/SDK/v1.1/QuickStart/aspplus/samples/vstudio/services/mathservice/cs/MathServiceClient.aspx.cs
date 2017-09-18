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

namespace Services.MathService.Cs
{
    using System;
    using System.Collections;
    using System.ComponentModel;
    using System.Web;
    using System.Web.SessionState;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    /// <summary>
    ///    Summary description for MathServiceClient.
    /// </summary>
    public class MathServiceClient : System.Web.UI.Page
    {
        protected internal System.Web.UI.WebControls.TextBox Operand1;
        protected internal System.Web.UI.WebControls.TextBox Operand2;
        protected internal System.Web.UI.HtmlControls.HtmlInputButton Add;
        protected internal System.Web.UI.HtmlControls.HtmlInputButton Subtract;
        protected internal System.Web.UI.HtmlControls.HtmlInputButton Multiply;
        protected internal System.Web.UI.HtmlControls.HtmlInputButton Divide;
        protected internal System.Web.UI.WebControls.Label Result;

        public MathServiceClient()
        {
            Page.Init += new System.EventHandler(Page_Init);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
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
            Add.ServerClick += new System.EventHandler (this.Submit_Click);
            Subtract.ServerClick += new System.EventHandler (this.Submit_Click);
            Multiply.ServerClick += new System.EventHandler (this.Submit_Click);
            Divide.ServerClick += new System.EventHandler (this.Submit_Click);
        }

        /// <summary>
        ///    Handles ServerClick event for Add, Subtract, Multiply and Divide
        ///    buttons.
        ///    Calls appropriate service method and displays results.
        /// </summary>
        public void Submit_Click(object sender, EventArgs e)
        {
            int operand1 = 0;
            int operand2 = 0;

            try
            {
                operand1 = Int32.Parse(Operand1.Text);
                operand2 = Int32.Parse(Operand2.Text);
            }
            catch (Exception) { /* ignored */ }

            MathService service = new MathService();


            Result.Text = "<b>Result</b> = ";

            switch (((Control)sender).ID)
            {
                case "Add":
                    Result.Text += service.Add(operand1, operand2).ToString();
                    break;

                case "Subtract":
                    Result.Text += service.Subtract(operand1, operand2).ToString();
                    break;

                case "Multiply":
                    Result.Text += service.Multiply(operand1, operand2).ToString();
                    break;

                case "Divide":
                    Result.Text += service.Divide(operand1, operand2).ToString();
                    break;
            }
        }
    }
}
