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
Namespace SoapHeadersVB
    
    '<remarks/>
    <System.Diagnostics.DebuggerStepThroughAttribute(),  _
     System.ComponentModel.DesignerCategoryAttribute("code"),  _
     System.Web.Services.WebServiceBindingAttribute(Name:="HeaderServiceSoap", [Namespace]:="http://tempuri.org/")>  _
    Public Class HeaderService
        Inherits System.Web.Services.Protocols.SoapHttpClientProtocol
        
        Public AuthHeaderVBValue As AuthHeaderVB
        
        '<remarks/>
        Public Sub New()
            MyBase.New
            Me.Url = "http://localhost/quickstart/aspplus/samples/services/SoapHeaders/VB/SoapHeaders.a"& _ 
"smx"
        End Sub
        
        '<remarks/>
        <System.Web.Services.Protocols.SoapHeaderAttribute("AuthHeaderVBValue"),  _
         System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/SecureMethod", RequestNamespace:="http://tempuri.org/", ResponseNamespace:="http://tempuri.org/", Use:=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle:=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)>  _
        Public Function SecureMethod() As String
            Dim results() As Object = Me.Invoke("SecureMethod", New Object(-1) {})
            Return CType(results(0),String)
        End Function
        
        '<remarks/>
        Public Function BeginSecureMethod(ByVal callback As System.AsyncCallback, ByVal asyncState As Object) As System.IAsyncResult
            Return Me.BeginInvoke("SecureMethod", New Object(-1) {}, callback, asyncState)
        End Function
        
        '<remarks/>
        Public Function EndSecureMethod(ByVal asyncResult As System.IAsyncResult) As String
            Dim results() As Object = Me.EndInvoke(asyncResult)
            Return CType(results(0),String)
        End Function
    End Class
    
    '<remarks/>
    <System.Xml.Serialization.XmlTypeAttribute([Namespace]:="http://tempuri.org/"),  _
     System.Xml.Serialization.XmlRootAttribute([Namespace]:="http://tempuri.org/", IsNullable:=false)>  _
    Public Class AuthHeaderVB
        Inherits System.Web.Services.Protocols.SoapHeader
        
        '<remarks/>
        Public Username As String
        
        '<remarks/>
        Public Password As String
    End Class
End Namespace