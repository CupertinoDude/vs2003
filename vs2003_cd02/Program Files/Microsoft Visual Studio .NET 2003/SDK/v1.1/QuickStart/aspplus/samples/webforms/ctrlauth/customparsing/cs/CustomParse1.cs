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
using System.Collections;
using System.Web;
using System.Web.UI;

namespace CustomParsingControlSamples {

    public class CustomParse1 : Control {

       private ArrayList _items         = new ArrayList();
       private int       _selectedIndex = 0;

       public int SelectedIndex { 
           get {
              return _selectedIndex;
           }
           set {
              _selectedIndex = value;
           }
       }

       protected override void AddParsedSubObject(Object obj) {

           if (obj is Item) {
              _items.Add(obj);
           }
       }

       protected override void Render(HtmlTextWriter output) {

           if (SelectedIndex < _items.Count) {
              output.Write( ((Item) _items[SelectedIndex]).Message );
           }
       }
    }    
}