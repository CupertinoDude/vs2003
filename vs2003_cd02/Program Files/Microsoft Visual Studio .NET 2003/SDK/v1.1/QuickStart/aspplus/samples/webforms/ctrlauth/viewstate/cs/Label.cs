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

namespace ViewStateControlSamples {

    public class Label: Control {

       public String Text {
          get {
              return (String) ViewState["Text"];
          }
          set {
              ViewState["Text"] = value;
          }
       }

       public int FontSize {
          get {
              return (int) ViewState["FontSize"];
          }
          set {
              ViewState["FontSize"] = value;
          }
       }

       protected override void Render(HtmlTextWriter output) {
           output.Write("<font size=" + this.FontSize + ">" + this.Text + "</font>");
       }
    }    
}