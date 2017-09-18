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

    public class LangSwitch: WebControl {

        private ITemplate csTemplate    = null;
        private ITemplate vbTemplate    = null;
        private ITemplate jsTemplate    = null;
	private ITemplate cpTemplate    = null;
        private string showCodeLang     = null;

        [ TemplateContainer(typeof(Content))]
        public ITemplate CsTemplate {
           get { return csTemplate; }
           set { csTemplate = value; }
        }

        [ TemplateContainer(typeof(Content))]
        public ITemplate VBTemplate {
           get { return vbTemplate; }
           set { vbTemplate = value; }
        }

        [ TemplateContainer(typeof(Content))]
        public ITemplate JsTemplate {
           get { return jsTemplate; }
           set { jsTemplate = value; }
        }

	[ TemplateContainer(typeof(Content))]
        public ITemplate CpTemplate {
           get { return cpTemplate; }
           set { cpTemplate = value; }
        }

        public string Language {
            get {

                //If lang type is not set explicitly then look for the cookie
                //If no cookie default to VB
                string retval = showCodeLang;
                if (null == retval) {
                    HttpCookie langCookie = Page.Request.Cookies["langpref"];
                    if (null != langCookie) {
                        retval = langCookie.Value;
                    }

                    if (null == retval) {
                        retval = "VB";
                    }
                }
                Page.Trace.Write("LangSwitch", "Language is " + retval);
                return retval  ;
            }
            set { showCodeLang = value ;}
        }

        protected override void CreateChildControls() {

            // Create new container for Content item
            Control content = new Content();

            // Initialize its inner contents

            string lang = this.Language;

            Page.Trace.Write("LangSwitch", "Language is " + lang);

            if ((lang=="VB")&&(null != vbTemplate))
                vbTemplate.InstantiateIn(content);
            else if ((lang=="JScript")&&(null != jsTemplate))
                jsTemplate.InstantiateIn(content);
            else if ((lang=="C++")&&(null != cpTemplate))
                cpTemplate.InstantiateIn(content);
            else if (null != csTemplate)
                csTemplate.InstantiateIn(content);
            else
                content = new LiteralControl("<div><b>Error: Content not available</b></div>");

            // Add it to the child collection
            this.Controls.Add(content);
        }

    }
}
