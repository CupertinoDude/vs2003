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
import System.Web.Util;

package TemplateControlSamplesJS {

    public class RepeaterItemCollection implements ICollection {

        private var items:ArrayList;

        public function RepeaterItemCollection(items:ArrayList) {
            this.items = items;
        }

        public function get Count() : int {
            return items.Count;
        }

        public function get IsReadOnly() : Boolean {
            return false;
        }

        public function get IsSynchronized() : Boolean {
            return false;
        }

        public function get SyncRoot() : Object {
            return this;
        }

        public function Item(index:int) : RepeaterItem {
            return RepeaterItem(items[index]);
        }

        public function CopyTo(array:System.Array, index:int) : void {
            for (var e:IEnumerator = this.GetEnumerator(); e.MoveNext();)
                array.SetValue(e.Current, index++);
        }

        public function GetEnumerator() : IEnumerator {
            return items.GetEnumerator();
        }
    }
}