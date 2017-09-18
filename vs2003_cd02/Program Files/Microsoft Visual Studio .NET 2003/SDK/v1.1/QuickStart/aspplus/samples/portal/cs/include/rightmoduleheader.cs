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

public class RightModuleHeader : PortalModuleControl
{
    public String       Title = "Right Module";
    public String       EditPage = "#edit";
    private bool         _showeditbutton = true;
    private bool         _showclosebutton = true;
    public String       ModuleSource = "";
    public String       CustomHtml = "";
    public HtmlAnchor   anchorEditPage;

    public bool ShowEditButton {
        get {
            return _showeditbutton;
        }
        set {
            _showeditbutton = value;
        }
    }

    public bool ShowCloseButton {
        get {
            return _showclosebutton;
        }
        set {
            _showclosebutton = value;
        }
    }

    protected  void Page_Load(Object sender, EventArgs e)
    {
        if (String.Compare(UserState["UserId"],"ANONYMOUS") == 0)
        {
            EditPage = "/QuickStart/aspplus/samples/portal/CS/login.aspx";
        }
        anchorEditPage.Attributes["style"] = "color:" + UserState["HeadColor"];
        DataBind();
    }

    protected void CloseButton_Click(Object sender, EventArgs evt)
    {
        if (String.Compare(UserState["UserId"],"ANONYMOUS") != 0)
        {
            int pageIndex = 0;
            if (Request.Cookies["_PageIndex"] != null)
                pageIndex = Int32.Parse(Request.Cookies["_PageIndex"].Value);

            String rightModules = UserState["PageModules_" + pageIndex + "R"];
            String[] moduleList = rightModules.Split(new char[] { ';' });

            String s = "";
            for (int i=0; i<moduleList.Length; i++)
            {
                if (String.Compare(ModuleSource, moduleList[i]) != 0)
                    s += moduleList[i] + ";";
            }

            char[] semi = {';'};
            UserState["PageModules_" + pageIndex + "R"] = s.TrimEnd(semi);

            Response.Redirect("/QuickStart/aspplus/samples/portal/CS/default.aspx");
        }
        else
        {
            Response.Redirect("/QuickStart/aspplus/samples/portal/CS/login.aspx");
        }
    }
}

