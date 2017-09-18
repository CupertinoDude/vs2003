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
import System.Web;
import System.Web.UI;
import CustomParsingControlSamplesJS;

package CustomParsingControlSamplesJS {

    public class CustomParse1 extends Control {

       private var _items:ArrayList   = new ArrayList();
       private var _selectedIndex:int = 0;

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