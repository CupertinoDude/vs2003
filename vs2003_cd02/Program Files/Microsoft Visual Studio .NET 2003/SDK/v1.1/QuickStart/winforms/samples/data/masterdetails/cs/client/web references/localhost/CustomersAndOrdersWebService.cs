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

namespace Microsoft.Samples.Windows.Forms.Cs.MasterDetails.localhost {
    using System.Xml.Serialization;
    using System.Web.Services.Protocols;
    using System.Web.Services;
    
    
    [System.Web.Services.WebServiceBindingAttribute(Name="CustomersAndOrdersSoap", Namespace="http://tempuri.org/")]
    public class CustomersAndOrders : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        public CustomersAndOrders() {
            this.Url = "http://localhost/quickstart/winforms/samples/data/masterdetails/cs/CustomersAndOr" +
"dersWebService.asmx";
        }
        
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetCustomersAndOrders", ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public System.Data.DataSet GetCustomersAndOrders() {
            object[] results = this.Invoke("GetCustomersAndOrders", new object[0]);
            return ((System.Data.DataSet)(results[0]));
        }
        
        public System.IAsyncResult BeginGetCustomersAndOrders(System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("GetCustomersAndOrders", new object[0], callback, asyncState);
        }
        
        public System.Data.DataSet EndGetCustomersAndOrders(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((System.Data.DataSet)(results[0]));
        }
        
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/UpdateCustomersAndOrders", ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public System.Data.DataSet UpdateCustomersAndOrders(System.Data.DataSet ds) {
            object[] results = this.Invoke("UpdateCustomersAndOrders", new object[] {ds});
            return ((System.Data.DataSet)(results[0]));
        }
        
        public System.IAsyncResult BeginUpdateCustomersAndOrders(System.Data.DataSet ds, System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("UpdateCustomersAndOrders", new object[] {ds}, callback, asyncState);
        }
        
        public System.Data.DataSet EndUpdateCustomersAndOrders(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((System.Data.DataSet)(results[0]));
        }
    }
}
