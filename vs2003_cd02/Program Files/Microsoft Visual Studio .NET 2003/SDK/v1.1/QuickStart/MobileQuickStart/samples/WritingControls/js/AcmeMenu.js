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

import System;
import System.Web.UI.MobileControls;
package Acme.CustomControlsJS
{
    public class Menu extends System.Web.UI.MobileControls.List
    {
        protected override function OnLoad( e:EventArgs)
        {
            if (!Page.IsPostBack)
            {
                super.OnLoad(e);
                var thisForm : System.Web.UI.MobileControls.Form = this.Form;
                for (var form : System.Web.UI.MobileControls.Form in MobilePage.Forms)
                {
                    if (form != thisForm)
                    {
                        var item : MobileListItem = new MobileListItem();
                        var formTitle : String = form.Title;
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
			this.add_ItemCommand(this.HandleCommand);
        }

        protected function HandleCommand(sender:Object , e:ListCommandEventArgs )
        {
            var form : System.Web.UI.MobileControls.Form = MobilePage.FindControl(e.ListItem.Value); 
            if (form != null)
            {
                MobilePage.ActiveForm = form;
            }
        }
    }
}
