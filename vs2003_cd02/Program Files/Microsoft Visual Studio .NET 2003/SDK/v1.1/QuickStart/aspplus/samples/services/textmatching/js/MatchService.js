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
package MatchServiceJS {
    
    ///<remarks/>
    public System.Diagnostics.DebuggerStepThroughAttribute() System.ComponentModel.DesignerCategoryAttribute("code") 
    class TestIt extends System.Web.Services.Protocols.HttpGetClientProtocol {
        
        ///<remarks/>
        public function TestIt() {
            this.Url = "http://localhost";
            
        }
        
        ///<remarks/>
        public final System.Web.Services.Protocols.HttpMethodAttribute(System.Web.Services.Protocols.TextReturnReader, System.Web.Services.Protocols.UrlParameterWriter) function TestHeaders() : TestHeadersMatches {
            return TestHeadersMatches(this.Invoke("TestHeaders", (this.Url + "/QuickStart/aspplus/samples/services/TextMatching/JS/MatchServer.html"), new System.Object[0]));
        }
        
        ///<remarks/>
        public final function BeginTestHeaders(callback : System.AsyncCallback, asyncState : System.Object) : System.IAsyncResult {
            return this.BeginInvoke("TestHeaders", (this.Url + "/QuickStart/aspplus/samples/services/TextMatching/JS/MatchServer.html"), new System.Object[0], callback, asyncState);
        }
        
        ///<remarks/>
        public final function EndTestHeaders(asyncResult : System.IAsyncResult) : TestHeadersMatches {
            return TestHeadersMatches(this.EndInvoke(asyncResult));
        }
    }
    
    public class TestHeadersMatches {
        
        public System.Web.Services.Protocols.MatchAttribute("TITLE>(.*?)<") 
        var Title : System.String;
        
        public System.Web.Services.Protocols.MatchAttribute("H1>(.*?)<") 
        var H1 : System.String;
    }
}
