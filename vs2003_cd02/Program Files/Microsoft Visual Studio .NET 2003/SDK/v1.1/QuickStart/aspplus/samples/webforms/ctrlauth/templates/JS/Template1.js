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
import System.Web;
import System.Web.UI;

package TemplateControlSamplesJS {

    public class TemplateItem extends Control implements INamingContainer {
        private var     _message:String         = null;

        public function TemplateItem(message:String) {
            _message = message;
        }

        public function get Message() : String {
            return _message;
        }
        public function set Message(value:String) {
            _message = value;
        }
    }

    ParseChildrenAttribute(true)
    public class Template1 extends Control implements INamingContainer {

        private var  _messageTemplate:ITemplate = null;
        private var     _message:String         = null;

        public function get Message() : String {
            return _message;
        }
        public function set Message(value:String) {
            _message = value;
        }

        PersistenceModeAttribute(PersistenceMode.InnerProperty)
        TemplateContainerAttribute(TemplateItem)
        public function get MessageTemplate() : ITemplate {
            return _messageTemplate;
        }

        public function set MessageTemplate(value:ITemplate) {
            _messageTemplate = value;
        }

        override function DataBind() : void {
        	EnsureChildControls();
		    super.DataBind();
	    }

        protected override function CreateChildControls() : void {
            // If a template has been specified, use it to create children.
            // Otherwise, create a single literalcontrol with message value
            if (MessageTemplate != null) {
                Controls.Clear();
                var i:TemplateItem = new TemplateItem(this.Message);
                MessageTemplate.InstantiateIn(i);
                Controls.Add(i);
            } else {
                this.Controls.Add(new LiteralControl(this.Message));
            }
        }
    }
}