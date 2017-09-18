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
import System.Collections;
import System.Globalization;
import System.Web;
import System.Web.UI;
import CustomParsingControlSamplesJS;

package CustomParsingControlSamplesJS {

    public class CustomParse2ControlBuilder extends ControlBuilder {

       public function GetChildControlType(tagName:String, attributes:IDictionary) : Type {

          if (String.Compare(tagName, "customitem", true, CultureInfo.InvariantCulture) == 0) {
             return (new Item()).GetType();
          }

          return null;
       }
    }

    ControlBuilderAttribute(CustomParse2ControlBuilder)
    public class CustomParse2 extends Control {

       private var _items:ArrayList        = new ArrayList();
       private var      _selectedIndex:int = 0;

       public function get SelectedIndex() : int {
           return _selectedIndex;
       }
       public function set SelectedIndex(value:int) {
           _selectedIndex = value;
       }

       protected function AddParsedSubObject(obj:Object) : void {

           if (obj instanceof Item) {
              _items.Add(obj);
           }
       }

       protected function Render(output:HtmlTextWriter) : void {

           if (SelectedIndex < _items.Count) {
              output.Write( Item(_items[SelectedIndex]).Message );
           }
       }
    }
}