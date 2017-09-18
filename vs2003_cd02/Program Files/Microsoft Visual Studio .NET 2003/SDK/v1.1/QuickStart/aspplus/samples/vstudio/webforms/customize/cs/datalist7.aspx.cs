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
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Web;
    using System.Web.SessionState;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    /// <summary>
    ///    Summary description for datalist7.
    /// </summary>
    public class datalist7 : System.Web.UI.Page
    {
        protected internal System.Web.UI.WebControls.DataList MyDataList;
        protected internal System.Web.UI.WebControls.LinkButton EditBtn;
        protected internal System.Web.UI.HtmlControls.HtmlInputText edit_price;
        protected internal System.Web.UI.WebControls.LinkButton UpdateBtn;
        protected internal System.Web.UI.WebControls.LinkButton CancelBtn;
        protected internal System.Web.UI.WebControls.Label Message;

	    public datalist7()
	    {
	        Page.Init += new System.EventHandler(Page_Init);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                PopulateList();
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
            MyDataList.EditCommand += new System.Web.UI.WebControls.DataListCommandEventHandler(this.MyDataList_Edit);
            MyDataList.UpdateCommand += new System.Web.UI.WebControls.DataListCommandEventHandler(this.MyDataList_Update);
            MyDataList.CancelCommand += new System.Web.UI.WebControls.DataListCommandEventHandler(this.MyDataList_Cancel);
        }

        void MyDataList_Cancel(object source, System.Web.UI.WebControls.DataListCommandEventArgs e) {

            MyDataList.EditItemIndex = -1;
            PopulateList();
        }

        void MyDataList_Edit(object source, System.Web.UI.WebControls.DataListCommandEventArgs e) {

            MyDataList.EditItemIndex = (int)e.Item.ItemIndex;
            PopulateList();
        }

        void MyDataList_Update(object source, System.Web.UI.WebControls.DataListCommandEventArgs e) {

            // database update left out for simplicity's sake...

            String price = ((HtmlInputText)e.Item.FindControl("edit_price")).Value;
            Message.Text = "Price Updated: " + price;
            MyDataList.EditItemIndex = -1;
            PopulateList();
        }

        void PopulateList() {

            SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
            SqlDataAdapter myCommand = new SqlDataAdapter("select * from Titles where type='business'", myConnection);

            DataSet ds = new DataSet();
	    try {
                myCommand.Fill(ds, "Titles");

                MyDataList.DataSource = ds.Tables["Titles"].DefaultView;
                MyDataList.DataBind();
	    }
	    catch (Exception ex){
    		throw (ex);
	    }
	    finally{
		myConnection.Close();
	    }
        }
    }
}
