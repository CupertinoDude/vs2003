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

namespace Customize.Cs
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
    ///    Summary description for style3.
    /// </summary>
    public class style3 : System.Web.UI.Page
    {
        protected internal System.Web.UI.HtmlControls.HtmlInputRadioButton MyRadio3;
        protected internal System.Web.UI.HtmlControls.HtmlInputRadioButton MyRadio2;
        protected internal System.Web.UI.HtmlControls.HtmlInputRadioButton MyRadio1;
        protected internal System.Web.UI.HtmlControls.HtmlSelect MySelect;
        protected internal System.Web.UI.HtmlControls.HtmlInputText MyText;
        protected internal System.Web.UI.HtmlControls.HtmlButton MyButton;
        protected internal System.Web.UI.HtmlControls.HtmlGenericControl MySpan;
        protected internal System.Web.UI.HtmlControls.HtmlGenericControl Message;
        protected internal System.Web.UI.HtmlControls.HtmlSelect ColorSelect;
        protected internal System.Web.UI.HtmlControls.HtmlInputButton SubmitBtn;
    
	    public style3()
	    {
	       Page.Init += new System.EventHandler(Page_Init);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Message.InnerHtml += "<h5>Accessing Styles...</h5>";

            Message.InnerHtml += "The color of the span is: " + MySpan.Style["color"] + "<br>";
            Message.InnerHtml += "The width of the textbox is: " + MyText.Style["width"] + "<p>";

            Message.InnerHtml += "MySelect's style collection is: <br>";

            IEnumerator keys = MySelect.Style.Keys.GetEnumerator();

            while (keys.MoveNext()) {

                String key = (String)keys.Current;
                Message.InnerHtml += "<img src='/quickstart/images/bullet.gif'>&nbsp;&nbsp;";
                Message.InnerHtml += key + "=" + MySelect.Style[key] + "<br>";
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
        private void InitializeComponent() {
            this.Load += new System.EventHandler (this.Page_Load);
            SubmitBtn.ServerClick += new System.EventHandler (this.SubmitBtn_Click);
        }

        void SubmitBtn_Click(object sender, EventArgs e) {
            Message.InnerHtml += "<h5>Modifying Styles...</h5>";

            MySpan.Style["color"] = ColorSelect.Value;            
            MyText.Style["width"] = "600";

            Message.InnerHtml += "The color of the span is: " + MySpan.Style["color"] + "<br>";
            Message.InnerHtml += "The width of the textbox is: " + MyText.Style["width"];
        }
    }
}
