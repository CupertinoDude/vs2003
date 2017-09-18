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
    ///    Summary description for datalist4.
    /// </summary>
    public class datalist4 : System.Web.UI.Page
    {
        protected internal System.Web.UI.WebControls.HyperLink PurchaseLink;
        protected internal System.Web.UI.HtmlControls.HtmlGenericControl DetailsPrice;
        protected internal System.Web.UI.HtmlControls.HtmlGenericControl DetailsType;
        protected internal System.Web.UI.HtmlControls.HtmlGenericControl DetailsPubId;
        protected internal System.Web.UI.HtmlControls.HtmlGenericControl DetailsTitleId;
        protected internal System.Web.UI.HtmlControls.HtmlGenericControl DetailsTitle;
        protected internal System.Web.UI.HtmlControls.HtmlImage DetailsImage;
        protected internal System.Web.UI.HtmlControls.HtmlImage TitleImage;
        protected internal System.Web.UI.WebControls.LinkButton SelectTitle;
        protected internal System.Web.UI.WebControls.DataList MyDataList;

        private SqlConnection myConnection;
    
	    public datalist4()
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
        private void InitializeComponent()
        {
            this.Load += new System.EventHandler(this.Page_Load);
            MyDataList.SelectedIndexChanged += new System.EventHandler(this.MyDataList_Select);
        }

        protected void MyDataList_Select(object sender, System.EventArgs e) {
            String title = MyDataList.DataKeys[MyDataList.SelectedItem.ItemIndex].ToString();
            SqlDataAdapter myCommand = new SqlDataAdapter("select * from Titles where title_id = '" + title + "'" , myConnection);

            DataSet ds = new DataSet();
            myCommand.Fill(ds, "TitleDetails");

            DataRowView rowview = ds.Tables["TitleDetails"].DefaultView[0];

            DetailsImage.Src = "/quickstart/aspplus/images/title-" + rowview["title_id"] + ".gif";
            DetailsPubId.InnerHtml = "<b>Publisher ID: </b>" + rowview["pub_id"].ToString() + "<br>";
            DetailsTitleId.InnerHtml = "<b>Title ID: </b>" + rowview["title_id"].ToString() + "<br>";
            DetailsType.InnerHtml = "<b>Category: </b>" + rowview["type"].ToString() + "<br>";
            DetailsPrice.InnerHtml = "<b>Price: </b> $ " + rowview["price"].ToString() + "<p>";            
            DetailsTitle.InnerHtml = rowview["title"].ToString();
            PurchaseLink.ImageUrl = "/quickstart/aspplus/images/purchase_book.gif";
            PurchaseLink.NavigateUrl = "purchase.aspx?titleid=" + rowview["title_id"].ToString();

            DetailsImage.Visible = true;
        }
    }
}
