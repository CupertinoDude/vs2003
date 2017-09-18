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

package TemplateControlSamplesJS {

    public class RepeaterItem extends Control implements INamingContainer {

        private var itemIndex:int;
        private var dataItem:Object;

        public function RepeaterItem(itemIndex:int, dataItem:Object) {
            this.itemIndex = itemIndex;
            this.dataItem = dataItem;
        }

        public function get DataItem() : Object {
            return dataItem;
        }

        public function get ItemIndex() : int {
            return itemIndex;
        }
    }
}