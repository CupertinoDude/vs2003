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
using System.Web.UI.WebControls;

namespace CompositionSampleControls {

    public class Composition3 : Control, INamingContainer {

        public event EventHandler Change;

        public int Value {
           get {
               this.EnsureChildControls();
               return Int32.Parse(((TextBox)Controls[1]).Text);
           }
           set {
               this.EnsureChildControls();
               ((TextBox)Controls[1]).Text = value.ToString();
           }
        }

        protected void OnChange(EventArgs e) {
              Change(this, e);
        }

        protected override void CreateChildControls() {

           // Add Literal Control

           this.Controls.Add(new LiteralControl("<h3>" + "Value: "));

           // Add Textbox

           TextBox box = new TextBox();
           box.Text = "0";
           box.TextChanged += new EventHandler(this.TextBox_Change);
           this.Controls.Add(box);

           // Add Literal Control

           this.Controls.Add(new LiteralControl("</h3>"));

           // Add "Add" Button

           Button addButton = new Button();
           addButton.Text = "Add";
           addButton.Click += new EventHandler(this.AddBtn_Click);
           this.Controls.Add(addButton);

           // Add Literal Control

           this.Controls.Add(new LiteralControl(" | "));

           // Add "Subtract" Button

           Button subtractButton = new Button();
           subtractButton.Text = "Subtract";
           subtractButton.Click += new EventHandler(this.SubtractBtn_Click);
           this.Controls.Add(subtractButton);

        }

        private void TextBox_Change(Object sender, EventArgs e) {
           OnChange(EventArgs.Empty);
        }

        private void AddBtn_Click(Object sender, EventArgs e) {
           this.Value++;
           OnChange(EventArgs.Empty);
        }

        private void SubtractBtn_Click(Object sender, EventArgs e) {
           this.Value--;
           OnChange(EventArgs.Empty);
        }
    }
}