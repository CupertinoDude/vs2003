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
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public class FavoriteLinks : PortalModuleControl
{
    public HtmlContainerControl mySpan;

    protected  void Page_Load(Object sender, EventArgs e)
    {
        ArrayList dl = new ArrayList();
        String links = UserState["FavoriteLinks_List"];

        if (links != null && links != String.Empty)
        {
            String text;
            String[] linkList = links.Split(new char[] { ',' });

            for (int i=0; i<linkList.Length; i=i+2)
            {
                if (String.Compare(linkList[i],"CATEGORY") == 0)
                {
                  text = "<b><u><p>" + linkList[i+1] + "</b></u><p>";
                }
                else
                {
                  text = "<img src='/QuickStart/aspplus/samples/portal/CS/images/bullet.gif' align='middle'> <a href='" + linkList[i+1] + "'>" + linkList[i] + "</a><br>";
                }
                dl.Add (text);
            }
        }

        String innerHtml = "";
        int cnt = dl.Count / 2 + (dl.Count % 2);

        for (int i=0; i<cnt; i++) {
            innerHtml += dl[i].ToString();
        }

        innerHtml += "</td><td align='left' height='25' valign='top' style='padding:15,15,15,15;"
                +  "border-color:black;border-style:solid;border-right:0;border-top:0;border-bottom:0;border-width:1;' >"
                +  "";

        for (int i=cnt; i<dl.Count; i++) {
            innerHtml += dl[i].ToString();
        }

        innerHtml += "";
        mySpan.InnerHtml = innerHtml;
    }
}