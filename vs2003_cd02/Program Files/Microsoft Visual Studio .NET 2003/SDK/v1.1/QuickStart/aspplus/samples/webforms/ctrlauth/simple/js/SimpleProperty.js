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

    public class SimpleProperty extends Control {

       private var      _message:String;
       private var _messageSize:String;
       private var         _iterations:int = 1;

       public function get Message() : String {
          return _message;
       }
       public function set Message(value:String) {
          _message = value;
       }

       public function get MessageSize() : String {
          return _messageSize;
       }
       public function set MessageSize(value:String) {
          _messageSize = value;
       }

       public function get Iterations() : int {
          return _iterations;
       }
       public function set Iterations(value:int) {
          _iterations = value;
       }

       protected function Render(output:HtmlTextWriter) : void {

           var htmlSize:String;

           if (_messageSize == "Small")
              htmlSize="H5";
           else if (_messageSize == "Medium")
              htmlSize="H3";
           else
              htmlSize="H1";

           for (var i:int=0; i<_iterations; i++) {
              output.Write("<" + htmlSize + ">" + _message + "</" + htmlSize + ">");
           }
       }
    }
}