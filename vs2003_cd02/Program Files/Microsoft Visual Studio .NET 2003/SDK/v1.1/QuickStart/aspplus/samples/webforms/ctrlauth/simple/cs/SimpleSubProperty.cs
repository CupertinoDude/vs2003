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

    public class Formater {
        private int            pSize;
        private System.String  pColor;

        public Formater(System.Int32 size, System.String color) {
           this.pSize = size;
           this.pColor = color;
        }
        public String Color {
            get {
                return pColor;
            }
            set {
                pColor = value;
            }
        }
        public int Size {
            get {
                return pSize;
            }
            set {
                pSize = value;
            }
        }
    }

    public class SimpleSubProperty : Control {

       private Formater _format  = new Formater(3, "black");
       private String   _message = null;

       public String Message {
           get {
              return _message;
           }
           set {
              _message = value;
           }
       }

       public Formater Format {
           get {
              return _format;
           }
       }

       protected override void Render(HtmlTextWriter output) {
           output.Write("<font size=" + Format.Size + " color=" + Format.Color + ">");
           output.Write(_message);
           output.Write("</font>");
       }
    }    
}