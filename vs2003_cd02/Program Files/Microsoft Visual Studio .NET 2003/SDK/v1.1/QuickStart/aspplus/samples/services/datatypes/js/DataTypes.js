﻿//------------------------------------------------------------------------------
/// <autogenerated>
///     This code was generated by a tool.
///     Runtime Version: 1.1.4322.573
///
///     Changes to this file may cause incorrect behavior and will be lost if 
///     the code is regenerated.
/// </autogenerated>
//------------------------------------------------------------------------------

//@cc_on
//@set @debug(off)

import System.Diagnostics;
import System.Xml.Serialization;
import System;
import System.Web.Services.Protocols;
import System.ComponentModel;
import System.Web.Services;

//
//This source code was auto-generated by wsdl, Version=1.1.4322.573.
//
package DataTypesJS {
    
    ///<remarks/>
    public System.Diagnostics.DebuggerStepThroughAttribute() System.ComponentModel.DesignerCategoryAttribute("code") System.Web.Services.WebServiceBindingAttribute(Name="DataTypesSoap", Namespace="http://tempuri.org/") 
    class DataTypes extends System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        ///<remarks/>
        public function DataTypes() {
            this.Url = "http://localhost/quickstart/aspplus/samples/services/DataTypes/JS/DataTypes.asmx";
            
        }
        
        ///<remarks/>
        public final System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetOrders", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped) function GetOrders() : Order[] {
            var results : System.Object[] = this.Invoke("GetOrders", new System.Object[0]);
            return Order[](results[0]);
        }
        
        ///<remarks/>
        public final function BeginGetOrders(callback : System.AsyncCallback, asyncState : System.Object) : System.IAsyncResult {
            return this.BeginInvoke("GetOrders", new System.Object[0], callback, asyncState);
        }
        
        ///<remarks/>
        public final function EndGetOrders(asyncResult : System.IAsyncResult) : Order[] {
            var results : System.Object[] = this.EndInvoke(asyncResult);
            return Order[](results[0]);
        }
        
        ///<remarks/>
        public final System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetOrder", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped) function GetOrder() : Order {
            var results : System.Object[] = this.Invoke("GetOrder", new System.Object[0]);
            return Order(results[0]);
        }
        
        ///<remarks/>
        public final function BeginGetOrder(callback : System.AsyncCallback, asyncState : System.Object) : System.IAsyncResult {
            return this.BeginInvoke("GetOrder", new System.Object[0], callback, asyncState);
        }
        
        ///<remarks/>
        public final function EndGetOrder(asyncResult : System.IAsyncResult) : Order {
            var results : System.Object[] = this.EndInvoke(asyncResult);
            return Order(results[0]);
        }
        
        ///<remarks/>
        public final System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetMode", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped) function GetMode() : int {
            var results : System.Object[] = this.Invoke("GetMode", new System.Object[0]);
            return int(results[0]);
        }
        
        ///<remarks/>
        public final function BeginGetMode(callback : System.AsyncCallback, asyncState : System.Object) : System.IAsyncResult {
            return this.BeginInvoke("GetMode", new System.Object[0], callback, asyncState);
        }
        
        ///<remarks/>
        public final function EndGetMode(asyncResult : System.IAsyncResult) : int {
            var results : System.Object[] = this.EndInvoke(asyncResult);
            return int(results[0]);
        }
        
        ///<remarks/>
        public final System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetIntArray", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped) function GetIntArray() : int[] {
            var results : System.Object[] = this.Invoke("GetIntArray", new System.Object[0]);
            return int[](results[0]);
        }
        
        ///<remarks/>
        public final function BeginGetIntArray(callback : System.AsyncCallback, asyncState : System.Object) : System.IAsyncResult {
            return this.BeginInvoke("GetIntArray", new System.Object[0], callback, asyncState);
        }
        
        ///<remarks/>
        public final function EndGetIntArray(asyncResult : System.IAsyncResult) : int[] {
            var results : System.Object[] = this.EndInvoke(asyncResult);
            return int[](results[0]);
        }
        
        ///<remarks/>
        public final System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/SayHelloName", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped) function SayHelloName(name : System.String) : System.String {
            var results : System.Object[] = this.Invoke("SayHelloName", [name]);
            return System.String(results[0]);
        }
        
        ///<remarks/>
        public final function BeginSayHelloName(name : System.String, callback : System.AsyncCallback, asyncState : System.Object) : System.IAsyncResult {
            return this.BeginInvoke("SayHelloName", [name], callback, asyncState);
        }
        
        ///<remarks/>
        public final function EndSayHelloName(asyncResult : System.IAsyncResult) : System.String {
            var results : System.Object[] = this.EndInvoke(asyncResult);
            return System.String(results[0]);
        }
        
        ///<remarks/>
        public final System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/SayHello", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped) function SayHello() : System.String {
            var results : System.Object[] = this.Invoke("SayHello", new System.Object[0]);
            return System.String(results[0]);
        }
        
        ///<remarks/>
        public final function BeginSayHello(callback : System.AsyncCallback, asyncState : System.Object) : System.IAsyncResult {
            return this.BeginInvoke("SayHello", new System.Object[0], callback, asyncState);
        }
        
        ///<remarks/>
        public final function EndSayHello(asyncResult : System.IAsyncResult) : System.String {
            var results : System.Object[] = this.EndInvoke(asyncResult);
            return System.String(results[0]);
        }
    }
    
    ///<remarks/>
    public System.Xml.Serialization.XmlTypeAttribute(Namespace="http://tempuri.org/") 
    class Order {
        
        ///<remarks/>
        public var OrderID : int;
        
        ///<remarks/>
        public var Price : double;
    }
}
