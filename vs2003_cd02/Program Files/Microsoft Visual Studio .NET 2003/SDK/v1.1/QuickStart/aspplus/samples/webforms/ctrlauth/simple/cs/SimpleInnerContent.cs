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

namespace SimpleControlSamples {

    public class SimpleInnerContent : Control {

       protected override void Render(HtmlTextWriter output) {

           if ( (HasControls()) && (Controls[0] is LiteralControl) ) {
              output.Write("<H2>" + "Your Message: " + ((LiteralControl) Controls[0]).Text + "</H2>");
           }
       }
    }    
}