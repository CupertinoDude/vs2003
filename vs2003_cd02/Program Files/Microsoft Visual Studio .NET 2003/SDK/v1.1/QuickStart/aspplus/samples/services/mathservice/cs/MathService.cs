﻿//------------------------------------------------------------------------------
// <autogenerated>
//     This code was generated by a tool.
//     Runtime Version: 1.1.4322.573
//
//     Changes to this file may cause incorrect behavior and will be lost if 
//     the code is regenerated.
// </autogenerated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by wsdl, Version=1.1.4322.573.
// 
namespace MathService {
    using System.Diagnostics;
    using System.Xml.Serialization;
    using System;
    using System.Web.Services.Protocols;
    using System.ComponentModel;
    using System.Web.Services;
    
    
    /// <remarks/>
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="MathServiceSoap", Namespace="http://tempuri.org/")]
    public class MathService : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        /// <remarks/>
        public MathService() {
            this.Url = "http://localhost/quickstart/aspplus/samples/services/MathService/CS/MathService.a" +
"smx";
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/Add", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public System.Single Add(System.Single a, System.Single b) {
            object[] results = this.Invoke("Add", new object[] {
                        a,
                        b});
            return ((System.Single)(results[0]));
        }
        
        /// <remarks/>
        public System.IAsyncResult BeginAdd(System.Single a, System.Single b, System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("Add", new object[] {
                        a,
                        b}, callback, asyncState);
        }
        
        /// <remarks/>
        public System.Single EndAdd(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((System.Single)(results[0]));
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/Subtract", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public System.Single Subtract(System.Single a, System.Single b) {
            object[] results = this.Invoke("Subtract", new object[] {
                        a,
                        b});
            return ((System.Single)(results[0]));
        }
        
        /// <remarks/>
        public System.IAsyncResult BeginSubtract(System.Single a, System.Single b, System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("Subtract", new object[] {
                        a,
                        b}, callback, asyncState);
        }
        
        /// <remarks/>
        public System.Single EndSubtract(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((System.Single)(results[0]));
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/Multiply", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public System.Single Multiply(System.Single a, System.Single b) {
            object[] results = this.Invoke("Multiply", new object[] {
                        a,
                        b});
            return ((System.Single)(results[0]));
        }
        
        /// <remarks/>
        public System.IAsyncResult BeginMultiply(System.Single a, System.Single b, System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("Multiply", new object[] {
                        a,
                        b}, callback, asyncState);
        }
        
        /// <remarks/>
        public System.Single EndMultiply(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((System.Single)(results[0]));
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/Divide", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public System.Single Divide(System.Single a, System.Single b) {
            object[] results = this.Invoke("Divide", new object[] {
                        a,
                        b});
            return ((System.Single)(results[0]));
        }
        
        /// <remarks/>
        public System.IAsyncResult BeginDivide(System.Single a, System.Single b, System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("Divide", new object[] {
                        a,
                        b}, callback, asyncState);
        }
        
        /// <remarks/>
        public System.Single EndDivide(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((System.Single)(results[0]));
        }
    }
}
