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
using System.Diagnostics;
using System.Xml.Serialization;
using System;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Web.Services;


/// <remarks/>
[System.Diagnostics.DebuggerStepThroughAttribute()]
[System.ComponentModel.DesignerCategoryAttribute("code")]
[System.Web.Services.WebServiceBindingAttribute(Name="DataTypesServiceSoap", Namespace="http://tempuri.org/")]
public class DataTypesService : System.Web.Services.Protocols.SoapHttpClientProtocol {
    
    /// <remarks/>
    public DataTypesService() {
        this.Url = "http://localhost/quickstart/aspplus/samples/vstudio/services/DataTypes/CS/DataTyp" +
"es.asmx";
    }
    
    /// <remarks/>
    [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/SayHello", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
    public string SayHello() {
        object[] results = this.Invoke("SayHello", new object[0]);
        return ((string)(results[0]));
    }
    
    /// <remarks/>
    public System.IAsyncResult BeginSayHello(System.AsyncCallback callback, object asyncState) {
        return this.BeginInvoke("SayHello", new object[0], callback, asyncState);
    }
    
    /// <remarks/>
    public string EndSayHello(System.IAsyncResult asyncResult) {
        object[] results = this.EndInvoke(asyncResult);
        return ((string)(results[0]));
    }
    
    /// <remarks/>
    [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/SayHelloName", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
    public string SayHelloName(string name) {
        object[] results = this.Invoke("SayHelloName", new object[] {
                    name});
        return ((string)(results[0]));
    }
    
    /// <remarks/>
    public System.IAsyncResult BeginSayHelloName(string name, System.AsyncCallback callback, object asyncState) {
        return this.BeginInvoke("SayHelloName", new object[] {
                    name}, callback, asyncState);
    }
    
    /// <remarks/>
    public string EndSayHelloName(System.IAsyncResult asyncResult) {
        object[] results = this.EndInvoke(asyncResult);
        return ((string)(results[0]));
    }
    
    /// <remarks/>
    [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetIntArray", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
    public int[] GetIntArray() {
        object[] results = this.Invoke("GetIntArray", new object[0]);
        return ((int[])(results[0]));
    }
    
    /// <remarks/>
    public System.IAsyncResult BeginGetIntArray(System.AsyncCallback callback, object asyncState) {
        return this.BeginInvoke("GetIntArray", new object[0], callback, asyncState);
    }
    
    /// <remarks/>
    public int[] EndGetIntArray(System.IAsyncResult asyncResult) {
        object[] results = this.EndInvoke(asyncResult);
        return ((int[])(results[0]));
    }
    
    /// <remarks/>
    [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetMode", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
    public Mode GetMode() {
        object[] results = this.Invoke("GetMode", new object[0]);
        return ((Mode)(results[0]));
    }
    
    /// <remarks/>
    public System.IAsyncResult BeginGetMode(System.AsyncCallback callback, object asyncState) {
        return this.BeginInvoke("GetMode", new object[0], callback, asyncState);
    }
    
    /// <remarks/>
    public Mode EndGetMode(System.IAsyncResult asyncResult) {
        object[] results = this.EndInvoke(asyncResult);
        return ((Mode)(results[0]));
    }
    
    /// <remarks/>
    [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetOrder", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
    public Order GetOrder() {
        object[] results = this.Invoke("GetOrder", new object[0]);
        return ((Order)(results[0]));
    }
    
    /// <remarks/>
    public System.IAsyncResult BeginGetOrder(System.AsyncCallback callback, object asyncState) {
        return this.BeginInvoke("GetOrder", new object[0], callback, asyncState);
    }
    
    /// <remarks/>
    public Order EndGetOrder(System.IAsyncResult asyncResult) {
        object[] results = this.EndInvoke(asyncResult);
        return ((Order)(results[0]));
    }
    
    /// <remarks/>
    [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetOrders", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
    public Order[] GetOrders() {
        object[] results = this.Invoke("GetOrders", new object[0]);
        return ((Order[])(results[0]));
    }
    
    /// <remarks/>
    public System.IAsyncResult BeginGetOrders(System.AsyncCallback callback, object asyncState) {
        return this.BeginInvoke("GetOrders", new object[0], callback, asyncState);
    }
    
    /// <remarks/>
    public Order[] EndGetOrders(System.IAsyncResult asyncResult) {
        object[] results = this.EndInvoke(asyncResult);
        return ((Order[])(results[0]));
    }
}

/// <remarks/>
[System.Xml.Serialization.XmlTypeAttribute(Namespace="http://tempuri.org/")]
public enum Mode {
    
    /// <remarks/>
    On,
    
    /// <remarks/>
    Off,
}

/// <remarks/>
[System.Xml.Serialization.XmlTypeAttribute(Namespace="http://tempuri.org/")]
public class Order {
    
    /// <remarks/>
    public int OrderID;
    
    /// <remarks/>
    public System.Double Price;
}
