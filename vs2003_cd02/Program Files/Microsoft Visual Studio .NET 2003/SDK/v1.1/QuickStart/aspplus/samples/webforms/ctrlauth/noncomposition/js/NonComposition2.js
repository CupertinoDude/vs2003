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
import System.Collections;
import System.Collections.Specialized;
import System.Web.UI.WebControls;

package NonCompositionSampleControlsJS {

    public class NonComposition2 extends Control implements IPostBackDataHandler, IPostBackEventHandler {

        private var _value:int = 0;

        public function get Value() : int {
               return _value;
        }
        public function set Value(value:int) {
               _value = value;
        }

        public function LoadPostData(postDataKey:String, values:NameValueCollection) : Boolean {

           _value = Int32.Parse(values[this.UniqueID]);
           return false;
        }

        public function RaisePostDataChangedEvent() : void {

           // Part of the IPostBackDataHandler contract.  Invoked if we ever returned true from the
           // LoadPostData method (indicates that we want a change notification raised).  Since we
           // always return false, this method is just a no-op.
        }

        public function RaisePostBackEvent(eventArgument:String) : void {

           if (eventArgument == "Add") {
              this.Value++;
           }
           else {
              this.Value--;
           }
        }

        protected function OnPreRender(e:EventArgs) : void {
        }

        protected function Render(output:HtmlTextWriter) : void {
           output.Write("<h3>Value: <input name=" + this.UniqueID + " type=text value=" + this.Value + "> </h3>");
           output.Write("<input type=button value=Add OnClick=\"jscript:"+ Page.GetPostBackEventReference(this, "Add")+ "\"> |");
           output.Write("<input type=button value=Subtract OnClick=\"jscript:"+ Page.GetPostBackEventReference(this, "Subtract")+ "\">");
        }
    }
}