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

    public class NonComposition1 extends Control implements IPostBackDataHandler {

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

        protected function Render(output:HtmlTextWriter) : void {
           output.Write("<h3>Value: <input name=" + this.UniqueID + " type=text value=" + this.Value + "> </h3>");
        }
    }
}