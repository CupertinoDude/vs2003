﻿'------------------------------------------------------------------------------
' <autogenerated>
'     This code was generated by a tool.
'     Runtime Version: 1.1.4322.573
'
'     Changes to this file may cause incorrect behavior and will be lost if 
'     the code is regenerated.
' </autogenerated>
'------------------------------------------------------------------------------

Option Strict Off
Option Explicit On

Imports System
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Xml.Serialization

'
'This source code was auto-generated by wsdl, Version=1.1.4322.573.
'

'<remarks/>
<System.Diagnostics.DebuggerStepThroughAttribute(),  _
 System.ComponentModel.DesignerCategoryAttribute("code"),  _
 System.Web.Services.WebServiceBindingAttribute(Name:="DataTypesServiceSoap", [Namespace]:="http://tempuri.org/")>  _
Public Class DataTypesService
    Inherits System.Web.Services.Protocols.SoapHttpClientProtocol
    
    '<remarks/>
    Public Sub New()
        MyBase.New
        Me.Url = "http://localhost/quickstart/aspplus/samples/vstudio/services/DataTypes/VB/DataTyp"& _ 
"es.asmx"
    End Sub
    
    '<remarks/>
    <System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/SayHello", RequestNamespace:="http://tempuri.org/", ResponseNamespace:="http://tempuri.org/", Use:=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle:=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)>  _
    Public Function SayHello() As String
        Dim results() As Object = Me.Invoke("SayHello", New Object(-1) {})
        Return CType(results(0),String)
    End Function
    
    '<remarks/>
    Public Function BeginSayHello(ByVal callback As System.AsyncCallback, ByVal asyncState As Object) As System.IAsyncResult
        Return Me.BeginInvoke("SayHello", New Object(-1) {}, callback, asyncState)
    End Function
    
    '<remarks/>
    Public Function EndSayHello(ByVal asyncResult As System.IAsyncResult) As String
        Dim results() As Object = Me.EndInvoke(asyncResult)
        Return CType(results(0),String)
    End Function
    
    '<remarks/>
    <System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/SayHelloName", RequestNamespace:="http://tempuri.org/", ResponseNamespace:="http://tempuri.org/", Use:=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle:=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)>  _
    Public Function SayHelloName(ByVal Name As String) As String
        Dim results() As Object = Me.Invoke("SayHelloName", New Object() {Name})
        Return CType(results(0),String)
    End Function
    
    '<remarks/>
    Public Function BeginSayHelloName(ByVal Name As String, ByVal callback As System.AsyncCallback, ByVal asyncState As Object) As System.IAsyncResult
        Return Me.BeginInvoke("SayHelloName", New Object() {Name}, callback, asyncState)
    End Function
    
    '<remarks/>
    Public Function EndSayHelloName(ByVal asyncResult As System.IAsyncResult) As String
        Dim results() As Object = Me.EndInvoke(asyncResult)
        Return CType(results(0),String)
    End Function
    
    '<remarks/>
    <System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetIntArray", RequestNamespace:="http://tempuri.org/", ResponseNamespace:="http://tempuri.org/", Use:=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle:=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)>  _
    Public Function GetIntArray() As Integer()
        Dim results() As Object = Me.Invoke("GetIntArray", New Object(-1) {})
        Return CType(results(0),Integer())
    End Function
    
    '<remarks/>
    Public Function BeginGetIntArray(ByVal callback As System.AsyncCallback, ByVal asyncState As Object) As System.IAsyncResult
        Return Me.BeginInvoke("GetIntArray", New Object(-1) {}, callback, asyncState)
    End Function
    
    '<remarks/>
    Public Function EndGetIntArray(ByVal asyncResult As System.IAsyncResult) As Integer()
        Dim results() As Object = Me.EndInvoke(asyncResult)
        Return CType(results(0),Integer())
    End Function
    
    '<remarks/>
    <System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetMode", RequestNamespace:="http://tempuri.org/", ResponseNamespace:="http://tempuri.org/", Use:=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle:=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)>  _
    Public Function GetMode() As Mode
        Dim results() As Object = Me.Invoke("GetMode", New Object(-1) {})
        Return CType(results(0),Mode)
    End Function
    
    '<remarks/>
    Public Function BeginGetMode(ByVal callback As System.AsyncCallback, ByVal asyncState As Object) As System.IAsyncResult
        Return Me.BeginInvoke("GetMode", New Object(-1) {}, callback, asyncState)
    End Function
    
    '<remarks/>
    Public Function EndGetMode(ByVal asyncResult As System.IAsyncResult) As Mode
        Dim results() As Object = Me.EndInvoke(asyncResult)
        Return CType(results(0),Mode)
    End Function
    
    '<remarks/>
    <System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetOrder", RequestNamespace:="http://tempuri.org/", ResponseNamespace:="http://tempuri.org/", Use:=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle:=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)>  _
    Public Function GetOrder() As Order
        Dim results() As Object = Me.Invoke("GetOrder", New Object(-1) {})
        Return CType(results(0),Order)
    End Function
    
    '<remarks/>
    Public Function BeginGetOrder(ByVal callback As System.AsyncCallback, ByVal asyncState As Object) As System.IAsyncResult
        Return Me.BeginInvoke("GetOrder", New Object(-1) {}, callback, asyncState)
    End Function
    
    '<remarks/>
    Public Function EndGetOrder(ByVal asyncResult As System.IAsyncResult) As Order
        Dim results() As Object = Me.EndInvoke(asyncResult)
        Return CType(results(0),Order)
    End Function
    
    '<remarks/>
    <System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetOrders", RequestNamespace:="http://tempuri.org/", ResponseNamespace:="http://tempuri.org/", Use:=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle:=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)>  _
    Public Function GetOrders() As Order()
        Dim results() As Object = Me.Invoke("GetOrders", New Object(-1) {})
        Return CType(results(0),Order())
    End Function
    
    '<remarks/>
    Public Function BeginGetOrders(ByVal callback As System.AsyncCallback, ByVal asyncState As Object) As System.IAsyncResult
        Return Me.BeginInvoke("GetOrders", New Object(-1) {}, callback, asyncState)
    End Function
    
    '<remarks/>
    Public Function EndGetOrders(ByVal asyncResult As System.IAsyncResult) As Order()
        Dim results() As Object = Me.EndInvoke(asyncResult)
        Return CType(results(0),Order())
    End Function
End Class

'<remarks/>
<System.Xml.Serialization.XmlTypeAttribute([Namespace]:="http://tempuri.org/")>  _
Public Enum Mode
    
    '<remarks/>
    EOn
    
    '<remarks/>
    EOff
End Enum

'<remarks/>
<System.Xml.Serialization.XmlTypeAttribute([Namespace]:="http://tempuri.org/")>  _
Public Class Order
    
    '<remarks/>
    Public OrderID As Integer
    
    '<remarks/>
    Public Price As Double
End Class
