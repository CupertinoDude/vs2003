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

    public class Formater {
        private var pSize:int;
        private var pColor:System.String;

        public function Formater(size:System.Int32, color:System.String ) {
           this.pSize = size;
           this.pColor = color;
        }
        public function get Color() : String {
            return pColor;
        }
        public function set Color(value:String) {
            pColor = value;
        }
        public function get Size() : int {
            return pSize;
        }
        public function set Size(value:int) {
            pSize = value;
        }
    }

    public class SimpleSubProperty extends Control {

       private var _format:Formater  = new Formater(3, "black");
       private var   _message:String = null;

       public function get Message() : String {
          return _message;
       }
       public function set Message(value:String) {
          _message = value;
       }

       public function get Format() : Formater {
          return _format;
       }

       protected function Render(output:HtmlTextWriter) : void {
           output.Write("<font size=" + Format.Size + " color=" + Format.Color + ">");
           output.Write(_message);
           output.Write("</font>");
       }
    }
}