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
import System.Web.UI.WebControls;

package CompositionSampleControlsJS {

    public class Composition1 extends Control implements INamingContainer {

        public function get Value() : int {
            super.EnsureChildControls();
            return Int32.Parse(TextBox(Controls[1]).Text);
        }
        public function set Value(value:int) {
            super.EnsureChildControls();
            TextBox(Controls[1]).Text = value.ToString();
        }

        protected function CreateChildControls() : void {

            this.Controls.Add(new LiteralControl("<h3>" + "Value: "));

            var box:TextBox = new TextBox();
            box.Text = "0";
            this.Controls.Add(box);

            this.Controls.Add(new LiteralControl("</h3>"));
        }
    }
}