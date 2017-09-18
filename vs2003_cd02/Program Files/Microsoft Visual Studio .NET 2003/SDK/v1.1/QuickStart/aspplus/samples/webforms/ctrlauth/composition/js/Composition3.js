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

    public class Composition3 extends Control implements INamingContainer {

        // public event EventHandler Change;

        public function get Value() : int {
           super.EnsureChildControls();
           return Int32.Parse(TextBox(Controls[1]).Text);
        }
        public function set Value(value:int) {
           super.EnsureChildControls();
           TextBox(Controls[1]).Text = value.ToString();
        }

        // protected void OnChange(EventArgs e) {
        //       Change(this, e);
        // }

        protected function CreateChildControls() : void {
           // Add Literal Control
           this.Controls.Add(new LiteralControl("<h3>" + "Value: "));

           // Add Textbox
           var box:TextBox = new TextBox();
           box.Text = "0";
           box.add_TextChanged(TextBox_Change);
           this.Controls.Add(box);

           // Add Literal Control
           this.Controls.Add(new LiteralControl("</h3>"));

           // Add "Add" Button
           var addButton:Button = new Button();
           addButton.Text = "Add";
           addButton.add_Click(AddBtn_Click);
           this.Controls.Add(addButton);

           // Add Literal Control
           this.Controls.Add(new LiteralControl(" | "));

           // Add "Subtract" Button
           var subtractButton:Button = new Button();
           subtractButton.Text = "Subtract";
           subtractButton.add_Click(SubtractBtn_Click);
           this.Controls.Add(subtractButton);

        }

        private function TextBox_Change(sender:Object, e:EventArgs) : void {
           // OnChange(EventArgs.Empty);
        }

        private function AddBtn_Click(sender:Object, e:EventArgs) : void {
           this.Value++;
           // OnChange(EventArgs.Empty);
        }

        private function SubtractBtn_Click(sender:Object, e:EventArgs) : void {
           this.Value--;
           // OnChange(EventArgs.Empty);
        }
    }
}