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

namespace Microsoft.Samples.Windows.Forms.Cs.Update.localhost {
    using System.Xml.Serialization;
    using System.Web.Services.Protocols;
    using System.Web.Services;
    
    
    [System.Web.Services.WebServiceBindingAttribute(Name="ListCustomersSoap", Namespace="http://tempuri.org/")]
    public class ListCustomers : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        public ListCustomers() {
            this.Url = "http://localhost/quickstart/winforms/samples/data/update/cs/ListCustomers.asmx";
        }
        
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetCustomers", ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public System.Data.DataSet GetCustomers() {
            object[] results = this.Invoke("GetCustomers", new object[0]);
            return ((System.Data.DataSet)(results[0]));
        }
        
        public System.IAsyncResult BeginGetCustomers(System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("GetCustomers", new object[0], callback, asyncState);
        }
        
        public System.Data.DataSet EndGetCustomers(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((System.Data.DataSet)(results[0]));
        }
    }
}
