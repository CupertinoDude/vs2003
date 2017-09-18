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
using System.Web.UI;

namespace TemplateControlSamples {

    public class TemplateItem : Control, INamingContainer {
        private String     _message         = null;

        public TemplateItem(String message) {
            _message = message;
        }

        public String Message {

           get {
              return _message;
           }
           set {
              _message = value;
           }
        }
    }

    [
        ParseChildren(true)
    ]
    public class Template1 : Control, INamingContainer {

        private ITemplate  _messageTemplate = null;
        private String     _message         = null;

        public String Message {

           get {
              return _message;
           }
           set {
              _message = value;
           }
        }

        [
            PersistenceMode(PersistenceMode.InnerProperty),
            TemplateContainer(typeof(TemplateItem))
        ]
        public ITemplate MessageTemplate {
           get {
              return _messageTemplate;
           }
           set {
              _messageTemplate = value;
           }
        }

        public override void DataBind() {
        	EnsureChildControls();
		    base.DataBind();
	    }


        protected override void CreateChildControls() {

           // If a template has been specified, use it to create children.
           // Otherwise, create a single literalcontrol with message value

           if (MessageTemplate != null) {
              Controls.Clear();
              TemplateItem i = new TemplateItem(this.Message);
              MessageTemplate.InstantiateIn(i);
              Controls.Add(i);
           }
           else {
              this.Controls.Add(new LiteralControl(this.Message));
           }
        }
    }
}