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
using System.Collections;
using System.Collections.Specialized;
using System.Web.UI.WebControls;

namespace NonCompositionSampleControls {

    public class NonComposition1 : Control, IPostBackDataHandler {

        private int _value = 0;

        public int Value {

           get {
               return _value;
           }
           set {
               _value = value;
           }
        }

        public bool LoadPostData(String postDataKey, NameValueCollection values) {

           _value = Int32.Parse(values[this.UniqueID]);
           return false;
        }

        public void RaisePostDataChangedEvent() {

           // Part of the IPostBackDataHandler contract.  Invoked if we ever returned true from the
           // LoadPostData method (indicates that we want a change notification raised).  Since we
           // always return false, this method is just a no-op.
        }

        protected override void Render(HtmlTextWriter output) {
           output.Write("<h3>Value: <input name=" + this.UniqueID + " type=text value=" + this.Value + "> </h3>");
        }
    }    
}