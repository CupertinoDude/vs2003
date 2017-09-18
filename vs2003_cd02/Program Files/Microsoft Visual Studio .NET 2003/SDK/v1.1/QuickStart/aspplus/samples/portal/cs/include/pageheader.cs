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

public class PageHeader : PortalModuleControl
{
    private bool _showsignout = true;

    public bool ShowSignOut {
        get {
            return _showsignout;
        }
        set {
            _showsignout = value;
        }
    }

    protected void SignOff_Click(Object sender, EventArgs e) {
       HttpCookie PageIndex = new HttpCookie("_PageIndex", "0");
       PageIndex.Path = "/";
       PageIndex.Expires = new DateTime(2002, 10, 10);
       Response.Cookies.Add(PageIndex);
       System.Web.Security.FormsAuthentication.SignOut();
       Response.Redirect("/quickstart/aspplus/samples/portal/CS/default.aspx");
    }
}

