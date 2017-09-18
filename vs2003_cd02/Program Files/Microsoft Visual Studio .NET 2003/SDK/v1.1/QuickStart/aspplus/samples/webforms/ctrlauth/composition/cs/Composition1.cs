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

    public class Composition1 : Control, INamingContainer {

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

        protected override void CreateChildControls() {

            this.Controls.Add(new LiteralControl("<h3>" + "Value: "));

            TextBox box = new TextBox();
            box.Text = "0";
            this.Controls.Add(box);

            this.Controls.Add(new LiteralControl("</h3>"));
        }
    }
}