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

public class DeletePage : PortalModulePage
{
    public String       pageName;

    private int         pageIndex;
    private String []   pageList;

    protected void Page_Load(Object sender, EventArgs e)
    {
        pageIndex = Int32.Parse(Request.Cookies["_PageIndex"].Value);

        String pageNames = UserState["PageNames"];
        pageList = pageNames.Split(new char[] { ';' });
        pageName = pageList[pageIndex];
    }
        
    public void Submit_Click(Object sender, EventArgs evt) 
    {
        String s = "";
        for (int i=0; i<pageList.Length; i++)
        {
            if (i != pageIndex)
            {
                s += pageList[i] + ";";
            }
        }
        char[] semi = {';'};

        // Note: if we increase page max, need to modify also this
        UserState["PageModules_" + pageIndex + "L"] = "";
        UserState["PageModules_" + pageIndex + "R"] = "";

        if (pageIndex == 1) { 
            UserState["PageModules_1L"] = UserState["PageModules_2L"];
            UserState["PageModules_1R"] = UserState["PageModules_2R"];
            UserState["PageModules_2L"] = "";
            UserState["PageModules_2R"] = "";
        }

        UserState["PageNames"] = s.TrimEnd(semi);

        HttpCookie PageIndex = new HttpCookie("_PageIndex", "0");
        PageIndex.Path = "/";
        PageIndex.Expires = new DateTime(2002, 10, 10);
        Response.Cookies.Add(PageIndex);

        Response.Redirect("/quickstart/aspplus/samples/portal/CS/default.aspx"); 
    }

    public void Cancel_Click(Object sender, EventArgs evt) 
    {
        Response.Redirect("/quickstart/aspplus/samples/portal/CS/default.aspx");
    }
}