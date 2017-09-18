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
    ///    Summary description for datalist5.
    /// </summary>
    public class datalist5 : System.Web.UI.Page
    {
        protected internal System.Web.UI.WebControls.DataList MyDataList;
        protected internal System.Web.UI.HtmlControls.HtmlImage TitleImage;
        protected internal System.Web.UI.WebControls.LinkButton SelectTitle;
        protected internal System.Web.UI.WebControls.LinkButton DiscussionsBtn;
        protected internal System.Web.UI.WebControls.LinkButton RatingsBtn;
        protected internal System.Web.UI.HtmlControls.HtmlImage DetailsImage;
        protected internal System.Web.UI.WebControls.Label DetailsTitle;
        protected internal System.Web.UI.WebControls.Label DetailsTitleId;
        protected internal System.Web.UI.WebControls.Label DetailsPubId;
        protected internal System.Web.UI.WebControls.Label DetailsType;
        protected internal System.Web.UI.WebControls.Label DetailsPrice;
        protected internal System.Web.UI.WebControls.HyperLink PurchaseLink;
        protected internal System.Web.UI.WebControls.Label Message;

        private SqlConnection myConnection;

	    public datalist5()
	    {
    	    Page.Init += new System.EventHandler(Page_Init);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");

            if (!Page.IsPostBack) {
                SqlDataAdapter myCommand = new SqlDataAdapter("select * from Titles where type = 'business'", myConnection);

                DataSet ds = new DataSet();
                myCommand.Fill(ds, "Titles");

                MyDataList.DataSource=ds.Tables["Titles"].DefaultView;
                MyDataList.DataBind();
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
            this.Load += new System.EventHandler(this.Page_Load);
            MyDataList.ItemCommand += new System.Web.UI.WebControls.DataListCommandEventHandler (this.MyDataList_ItemCommand);
            MyDataList.SelectedIndexChanged += new System.EventHandler (this.MyDataList_Select);
        }

        void MyDataList_Select(object sender, System.EventArgs e) {
            String title = MyDataList.DataKeys[MyDataList.SelectedItem.ItemIndex].ToString();
            SqlDataAdapter myCommand = new SqlDataAdapter("select * from Titles where title_id = '" + title + "'" , myConnection);

            DataSet ds = new DataSet();
            myCommand.Fill(ds, "TitleDetails");

            DataRowView rowview = ds.Tables["TitleDetails"].DefaultView[0];

            DetailsImage.Src = "/quickstart/aspplus/images/title-" + rowview["title_id"] + ".gif";
            DetailsPubId.Text = "<b>Publisher ID: </b>" + rowview["pub_id"].ToString() + "<br>";
            DetailsTitleId.Text = "<b>Title ID: </b>" + rowview["title_id"].ToString() + "<br>";
            DetailsType.Text = "<b>Category: </b>" + rowview["type"].ToString() + "<br>";
            DetailsPrice.Text = "<b>Price: </b> $ " + rowview["price"].ToString() + "<p>";
            PurchaseLink.ImageUrl = "/quickstart/aspplus/images/purchase_book.gif";
            PurchaseLink.NavigateUrl ="purchase.aspx?titleid=" + rowview["title_id"].ToString();
            DetailsTitle.Text = rowview["title"].ToString();

            DetailsImage.Visible = true;
        }

        void MyDataList_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e) {
            String title = MyDataList.DataKeys[e.Item.ItemIndex].ToString();
            String command = e.CommandName;

            switch(command) {

                case "Discuss" :
                    ShowDiscussions(title);
                    break;

                case "Ratings" :
                    ShowRatings(title);
                    break;
            }
        }

        private void ShowRatings(String title) {
            Message.Text = String.Format("<h5>Ratings for {0}</h5>",title);
            Message.Text += "Print Ratings here...";
        }

        private void ShowDiscussions(String title) {
            Message.Text = String.Format("<h5>Discussions for {0}</h5>",title );
            Message.Text += "Print Discussions here...";
        }
    }
}
