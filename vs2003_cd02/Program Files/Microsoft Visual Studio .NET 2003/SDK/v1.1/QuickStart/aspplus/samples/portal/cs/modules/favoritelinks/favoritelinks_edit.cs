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

public class FavoriteLinksEdit : PortalModulePage
{
    public int          selectSize = 5;
    public HtmlSelect   mySelect;

    protected  void Page_Load(Object sender, EventArgs e) {

        String statefield = "FavoriteLinks" + Request.QueryString["side"] + "_List"; // <empty> or "Left"

        if ( string.Compare(Request.HttpMethod,"Post" , true) != 0 )
        {
            //populate items in select control
            String links = UserState[statefield];

            if (links != null && links != String.Empty)
            {
                String value, text;
                String[] linkList = links.Split(new char[] { ',' });
                selectSize = linkList.Length / 2 < 17 ? linkList.Length / 2 : 16;

                for (int i=0; i<linkList.Length; i=i+2)
                {
                    if (String.Compare(linkList[i],"CATEGORY") == 0)
                    {
                        value = "CATEGORY," + linkList[i+1];
                        text = "---" + linkList[i+1] + "---";
                    }
                    else
                    {
                        value = linkList[i] + "," + linkList[i+1];
                        text = linkList[i];
                    }
                    mySelect.Items.Add (new ListItem(text, value));
                }
            }
        }
        else if(! IsPostBack)
        {
            String links = Request.Form["mySelect"];
            if ( links == null ) {
                UserState[statefield] = String.Empty;
            } else {
                UserState[statefield] = links;
            }
            Response.Redirect("/quickstart/aspplus/samples/portal/CS/default.aspx");
        }
    }
}