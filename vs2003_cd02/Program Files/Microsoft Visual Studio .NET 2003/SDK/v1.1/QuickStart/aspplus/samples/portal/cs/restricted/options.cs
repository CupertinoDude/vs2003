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

public class Options : PortalModulePage
{
    protected void Colors_Change(Object sender, EventArgs evt)
    {
        HtmlInputRadioButton button = (HtmlInputRadioButton)sender;
        if ((button.Checked) && (String.Compare(UserState["UserId"],"ANONYMOUS") != 0))
        {
            String colorValues = button.Value;
            String[] colorList = colorValues.Split(new char[] { ',' });
            UserState["ColorScheme"] = colorList[0];
            UserState["HeadColor"] = colorList[1];
            UserState["SubheadColor"] = colorList[2];
            UserState["BackColor"] = colorList[3];
            UserState["LeftColor"] = colorList[4];
        }
    }

    protected void Submit_Click(Object sender, EventArgs evt)
    {
        Response.Redirect("/QuickStart/aspplus/samples/portal/CS/default.aspx");  
    }
}