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

namespace Acme
{
    using System;
    using System.Web.UI;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Collections;

    public class Content : Control, INamingContainer {
    }

    public class TocSwitch : WebControl {

        private ITemplate tocTemplate    = null;

        [ TemplateContainer(typeof(Content))]
        public ITemplate TocTemplate {
           get { return tocTemplate; }
           set { tocTemplate = value; }
        }

        public bool HideToc {
            get {

                HttpCookie tocCookie = Page.Request.Cookies["tocpref"];
                if ( tocCookie == null || tocCookie.Value == "No" ) {
                    return false;
                } else {
                    return true;
                }
            }
        }

        protected override void CreateChildControls() {

            // Create new container for Content item
            Control content = new Content();

            // Initialize its inner contents
            if (!this.HideToc) {
                tocTemplate.InstantiateIn(content);
                this.Controls.Add(content);
            }
        }
    }
}
