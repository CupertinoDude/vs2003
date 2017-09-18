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
using System.Web.Util;

namespace TemplateControlSamples {

    public class RepeaterItemCollection : ICollection {

        private ArrayList items;

        public RepeaterItemCollection(ArrayList items) {
            this.items = items;
        }
        
        public int Count {
            get {
                return items.Count;
            }
        }

        public bool IsReadOnly {
            get {
                return false;
            }
        }

        public bool IsSynchronized {
            get {
                return false;
            }
        }

        public object SyncRoot {
            get {
                return this;
            }
        }

        public RepeaterItem this[int index] {
            get {
                return (RepeaterItem)items[index];
            }
        }
        
        public void CopyTo(Array array, int index) {
            for (IEnumerator e = this.GetEnumerator(); e.MoveNext();)
                array.SetValue(e.Current, index++);
        }

        public IEnumerator GetEnumerator() {
            return items.GetEnumerator(); 
        }
    }
}