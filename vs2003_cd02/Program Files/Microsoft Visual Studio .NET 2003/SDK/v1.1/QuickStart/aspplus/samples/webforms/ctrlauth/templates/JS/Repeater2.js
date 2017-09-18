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


    ParseChildrenAttribute(true)
    public class Repeater2 extends Control implements INamingContainer {

        private var              _itemTemplate:ITemplate    = null;
        private var            _dataSource:ICollection      = null;
        private var _repeaterItems:RepeaterItemCollection   = null;

        public function get DataSource() : ICollection {
            return _dataSource;
        }
        public function set DataSource(value:ICollection) {
                _dataSource = value;
        }

        TemplateContainerAttribute(RepeaterItem)
        public function get ItemTemplate() : ITemplate {
            return _itemTemplate;
        }

        public function set ItemTemplate(value:ITemplate) {
            _itemTemplate = value;
        }

        public function get Items() : RepeaterItemCollection {
            return _repeaterItems;
        }

        // override to prevent literal controls from being added as children
        protected override function AddParsedSubObject(o:Object) : void {
        }

        // override to create repeated items
        protected override function CreateChildControls() : void {
            var o:Object = ViewState["NumItems"];
            if (o != null) {
               // clear any existing child controls
               Controls.Clear();

                var items:ArrayList = new ArrayList();
                var numItems:int = int(o);
                for (var i:int=0; i < numItems; i++) {
                    // create item
                    var item:RepeaterItem = new RepeaterItem(i, null);
                    // initialize item from template
                    ItemTemplate.InstantiateIn(item);
                    // add item to the child controls collection
                    Controls.Add(item);
                    // save item in ArrayList to update the Items collection
                    items.Add(item);
                }
                // update the Items collection with newly added items
                _repeaterItems = new RepeaterItemCollection(items);
            }
        }

        // override to create repeated items from DataSource
        protected override function OnDataBinding(e:EventArgs) : void {
            super.OnDataBinding(e);

            if (DataSource != null) {
                // clear any existing child controls
                Controls.Clear();
                // clear any previous viewstate for existing child controls
                ClearChildViewState();

                var items:ArrayList = new ArrayList();
                // iterate DataSource creating a new item for each data item
                var dataEnum:IEnumerator = DataSource.GetEnumerator();
                var i:int = 0;
                while(dataEnum.MoveNext()) {

                    // create item
                    var item:RepeaterItem = new RepeaterItem(i, dataEnum.Current);
                    // initialize item from template
                    ItemTemplate.InstantiateIn(item);
                    // add item to the child controls collection
                    Controls.Add(item);
                    // save item in ArrayList to update the Items collection
                    items.Add(item);

                    i++;
                }

                // update the Items collection with newly added items
                _repeaterItems = new RepeaterItemCollection(items);
                // prevent child controls from being created again
                ChildControlsCreated = true;
                // store the number of items created in viewstate for postback scenarios
                ViewState["NumItems"] = i;
            }
        }

    }
}