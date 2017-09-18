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

package SimpleControlSamplesJS {

    public class SimpleInnerContent extends Control {

       protected function Render(output:HtmlTextWriter) : void {
           if ( this.HasControls() && this.Controls[0] instanceof LiteralControl ) {
              output.Write("<H2>" + "Your Message: " + LiteralControl(this.Controls[0]).Text + "</H2>");
           }
       }
    }
}