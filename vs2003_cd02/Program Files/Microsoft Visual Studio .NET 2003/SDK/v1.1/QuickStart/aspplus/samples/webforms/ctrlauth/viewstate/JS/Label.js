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

package ViewStateControlSamplesJS {

    public class Label extends Control {

       public function get Text() : String {
          return String(ViewState["Text"]);
       }
       public function set Text(value:String) {
          ViewState["Text"] = value;
       }

       public function get FontSize() : int {
          return ViewState["FontSize"];
       }
       public function set FontSize(value:int) {
          ViewState["FontSize"] = value;
       }

       protected function Render(output:HtmlTextWriter) : void {
           output.Write("<font size=" + this.FontSize + ">" + this.Text + "</font>");
       }
    }
}