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

using System;
using System.Web;
using System.Collections;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public class DefaultPage : PortalModulePage
{
    public HtmlAnchor           anchorDelete;
    public HtmlAnchor           anchorCustomize;
    public HtmlAnchor           anchorOptions;
    public HtmlAnchor           anchorOptions2;
    public HtmlAnchor           anchorAdd;
    public HtmlAnchor           anchorSignOff;
    public Label                spanAdd;
    public Label                spanDelete;
    public Label                spanSignOff;
    public HtmlContainerControl PagePanelLinks;
    public PlaceHolder          LeftUIModules;
    public PlaceHolder          RightUIModules;
    public Panel                Login;

    protected  void Page_Load(Object sender, EventArgs E) {

        int pageIndex = 0;

        if (Request.QueryString["_PageIndex"] != null)
        {
            SetPageIndex(Request.QueryString["_PageIndex"]);
            pageIndex = Int32.Parse(Request.QueryString["_PageIndex"]);
        }
        else if (Request.Cookies["_PageIndex"] != null) {
            pageIndex = Int32.Parse(Request.Cookies["_PageIndex"].Value);
        }

        if (pageIndex != 0)
        {
            anchorDelete.Visible = true;
            spanDelete.Visible = true;
        }
        else
        {
            anchorDelete.Visible = false;
            spanDelete.Visible = false;
        }

        anchorDelete.HRef = "/quickstart/aspplus/samples/portal/CS/restricted/deletepage.aspx";
        anchorCustomize.HRef = "/quickstart/aspplus/samples/portal/CS/restricted/customize.aspx";
        anchorOptions.HRef = "/quickstart/aspplus/samples/portal/CS/restricted/options.aspx";
        anchorOptions2.HRef = "/quickstart/aspplus/samples/portal/CS/restricted/layout.aspx";

        // Dynamically Construct Page Hyperlink List
        BuildPaneLinkList(PagePanelLinks, pageIndex);

        // Dynamically Construct Module List for Current Page
        BuildModuleList(LeftUIModules, UserState["PageModules_" + pageIndex + "L"]);
        BuildModuleList(RightUIModules, UserState["PageModules_" + pageIndex + "R"]);

        if (UserState["UserId"]=="ANONYMOUS")
        {
            anchorSignOff.Visible = false;
            spanSignOff.Visible = false;
        }
        else
        {
            anchorSignOff.Visible = true;
            spanSignOff.Visible = true;
        }

        DataBind();
    }

    private void BuildModuleList(Control parent, String Modules) {

        if (Modules == null)
           return;

        String [] ModuleList = Modules.Split(new char[] {';'});

        if ((UserState["UserId"]=="ANONYMOUS")&&(parent.ID=="LeftUIModules"))
              Login.Visible=true;

        for (int i=0;i<ModuleList.Length;i++) {

           String moduleSource = ModuleList[i];

           if ((moduleSource != null)&&(moduleSource != "")&&(moduleSource != "System.DBNull")) {

              Control UIModule = Page.LoadControl(moduleSource);

              parent.Controls.Add(new LiteralControl("<tr><td>"));
              parent.Controls.Add(UIModule);
              parent.Controls.Add(new LiteralControl("</td></tr>"));
           }
        }
    }

    private void BuildPaneLinkList(HtmlContainerControl container, int currentPageIndex) {

        String pageNames = UserState["PageNames"];

        if (pageNames == null)
           return;

        String [] pageList = pageNames.Split(new char[] { ';' });

        if (pageList.Length > 2)
        {
            anchorAdd.Visible = false;
            spanAdd.Visible = false;
        }
        else
        {
            anchorAdd.Visible = true;
            spanAdd.Visible = true;
        }

        for (int i=0; i<pageList.Length; i++) {

           if (pageList[i] == null)
              break;

           if (i == currentPageIndex) {

              container.InnerHtml += "<td align=center bgcolor='" + UserState["HeadColor"] + "' width='20%'>";
              container.InnerHtml += "  <table bgcolor='" + UserState["HeadColor"] + "' border=0 width='100%' cellspacing=0 cellpadding=2>";
              container.InnerHtml += "    <tr align=center>";
              container.InnerHtml += "      <td></a><font face=Arial color='white'><b>&nbsp;"+pageList[i]+"</b></font>&nbsp;</td>";
              container.InnerHtml += "    </tr>";
              container.InnerHtml += "  </table>";
              container.InnerHtml += "</td>";
              container.InnerHtml += "<td width='1%'>&nbsp;</td>";
           }
           else {

              container.InnerHtml += "<td align=center bgcolor='" + UserState["SubheadColor"] + "' width='20%'>";
              container.InnerHtml += "  <table bgcolor='" + UserState["SubheadColor"] + "' border=0 width='100%' cellspacing=0 cellpadding=2>";
              container.InnerHtml += "    <tr align=center>";
              container.InnerHtml += "      <td><font face=Arial size=-1>&nbsp;<a href='default.aspx?_PageIndex=" + i + "'>"+pageList[i]+"</a></font>&nbsp;</td>";
              container.InnerHtml += "    </tr>";
              container.InnerHtml += "  </table>";
              container.InnerHtml += "</td>";
              container.InnerHtml += "<td width='1%'>&nbsp;</td>";
           }
        }
    }

    protected void SignOff_Click(Object sender, EventArgs e)
    {
       SetPageIndex("0");
       System.Web.Security.FormsAuthentication.SignOut();
       Response.Redirect("/quickstart/aspplus/samples/portal/CS/default.aspx");
    }

    protected void AddPage_Click(Object sender, EventArgs e) {

        if (String.Compare(UserState["UserId"],"ANONYMOUS") == 0)
        {
            Response.Redirect("/quickstart/aspplus/samples/portal/CS/login.aspx");
        }
        else
        {
            String pageNames = UserState["PageNames"] + ";New Page";
            String[] pageList = pageNames.Split(new char[] { ';' });
            int numPages = pageList.Length - 1;
            SetPageIndex(numPages.ToString());
            UserState["PageNames"] = pageNames;
            Response.Redirect("/quickstart/aspplus/samples/portal/CS/restricted/customize.aspx");
        }
    }

    private void SetPageIndex(String value)
    {
       HttpCookie PageIndex = new HttpCookie("_PageIndex", value);
       PageIndex.Path = "/";
       PageIndex.Expires = new DateTime(2002, 10, 10);
       Response.Cookies.Add(PageIndex);
    }
}


