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

Imports System.Xml.Serialization

'
'This source code was auto-generated by xsd, Version=1.1.4322.573.
'
Namespace XmlSerializationHowTo
    
    '<remarks/>
    <System.Xml.Serialization.XmlRootAttribute("purchaseOrder", [Namespace]:="", IsNullable:=false)>  _
    Public Class PurchaseOrder
        
        '<remarks/>
        Public shipTo As USAddress
        
        '<remarks/>
        Public billTo As USAddress
        
        '<remarks/>
        Public comment As String
        
        '<remarks/>
        <System.Xml.Serialization.XmlArrayItemAttribute("item", IsNullable:=false)>  _
        Public items() As ItemsItem
        
        '<remarks/>
        <System.Xml.Serialization.XmlAttributeAttribute(DataType:="date")>  _
        Public orderDate As Date
        
        '<remarks/>
        <System.Xml.Serialization.XmlIgnoreAttribute()>  _
        Public orderDateSpecified As Boolean
    End Class
    
    '<remarks/>
    Public Class USAddress
        
        '<remarks/>
        Public name As String
        
        '<remarks/>
        Public street As String
        
        '<remarks/>
        Public city As String
        
        '<remarks/>
        Public state As String
        
        '<remarks/>
        Public zip As Decimal
        
        '<remarks/>
        <System.Xml.Serialization.XmlAttributeAttribute(DataType:="NMTOKEN")>  _
        Public country As String
    End Class
    
    '<remarks/>
    Public Class ItemsItem
        
        '<remarks/>
        Public productName As String
        
        '<remarks/>
        <System.Xml.Serialization.XmlElementAttribute(DataType:="positiveInteger")>  _
        Public quantity As String
        
        '<remarks/>
        Public USPrice As Decimal
        
        '<remarks/>
        Public comment As String
        
        '<remarks/>
        <System.Xml.Serialization.XmlElementAttribute(DataType:="date")>  _
        Public shipDate As Date
        
        '<remarks/>
        <System.Xml.Serialization.XmlIgnoreAttribute()>  _
        Public shipDateSpecified As Boolean
        
        '<remarks/>
        <System.Xml.Serialization.XmlAttributeAttribute()>  _
        Public partNum As String
    End Class
End Namespace
