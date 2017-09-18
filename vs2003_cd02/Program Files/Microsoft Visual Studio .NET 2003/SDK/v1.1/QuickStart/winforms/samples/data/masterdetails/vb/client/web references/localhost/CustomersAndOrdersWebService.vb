'-----------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
' 
'  Copyright (C) Microsoft Corporation.  All rights reserved.
' 
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
' 
'THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'-----------------------------------------------------------------------

Imports System.Xml.Serialization
Imports System.Web.Services.Protocols
Imports System.Web.Services

Namespace Microsoft.Samples.Windows.Forms.Vb.MasterDetails.localhost

    <System.Web.Services.WebServiceBindingAttribute(Name:="CustomersAndOrdersSoap", [Namespace]:="http://tempuri.org/")> _
    Public Class CustomersAndOrders
        Inherits System.Web.Services.Protocols.SoapHttpClientProtocol

        Public Sub New()
            MyBase.New()
            Me.Url = "http://localhost/quickstart/winforms/samples/data/MasterDetails/vb/CustomersAndOr" & _
    "dersWebService.asmx"
        End Sub

        <System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetCustomersAndOrders", ParameterStyle:=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)> _
                Public Function GetCustomersAndOrders() As System.Data.DataSet
            Dim results() As Object = Me.Invoke("GetCustomersAndOrders", New Object(0) {})
            Return CType(results(0), System.Data.DataSet)
        End Function

        Public Function BeginGetCustomersAndOrders(ByVal callback As System.AsyncCallback, ByVal asyncState As Object) As System.IAsyncResult
            Return Me.BeginInvoke("GetCustomersAndOrders", New Object(0) {}, callback, asyncState)
        End Function

        Public Function EndGetCustomersAndOrders(ByVal asyncResult As System.IAsyncResult) As System.Data.DataSet
            Dim results() As Object = Me.EndInvoke(asyncResult)
            Return CType(results(0), System.Data.DataSet)
        End Function

        <System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/UpdateCustomersAndOrders", ParameterStyle:=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)> _
        Public Function UpdateCustomersAndOrders(ByVal ds As System.Data.DataSet) As System.Data.DataSet
            Dim results() As Object = Me.Invoke("UpdateCustomersAndOrders", New Object() {ds})
            Return CType(results(0), System.Data.DataSet)
        End Function

        Public Function BeginUpdateCustomersAndOrders(ByVal ds As System.Data.DataSet, ByVal callback As System.AsyncCallback, ByVal asyncState As Object) As System.IAsyncResult
            Return Me.BeginInvoke("UpdateCustomersAndOrders", New Object() {ds}, callback, asyncState)
        End Function

        Public Function EndUpdateCustomersAndOrders(ByVal asyncResult As System.IAsyncResult) As System.Data.DataSet
            Dim results() As Object = Me.EndInvoke(asyncResult)
            Return CType(results(0), System.Data.DataSet)
        End Function
    End Class
End Namespace
