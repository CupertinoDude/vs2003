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
using System.Web.UI.MobileControls;

namespace Acme.CustomControlsCS
{
    public class Menu : System.Web.UI.MobileControls.List
    {
        protected override void OnLoad(EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                base.OnLoad(e);
                Form thisForm = Form;
                foreach (Form form in MobilePage.Forms)
                {
                    if (form != thisForm)
                    {
                        MobileListItem item = new MobileListItem();
                        String formTitle = form.Title;
                        if (formTitle.Length > 0)
                        {
                            item.Text = formTitle;
                        }
                        else
                        {
                            item.Text = form.ID;
                        }
                        item.Value = form.UniqueID;
                        Items.Add(item);
                    }
                }
            }

            this.ItemCommand += new ListCommandEventHandler(HandleCommand);
        }

        protected void HandleCommand(Object sender, ListCommandEventArgs e)
        {
            Form form = MobilePage.FindControl(e.ListItem.Value) as Form; 
            if (form != null)
            {
                MobilePage.ActiveForm = form;
            }
        }
    }
}
