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

Namespace Microsoft.Samples.Windows.Forms.Vb.Update.localhost

    <System.Web.Services.WebServiceBindingAttribute(Name:="UpdateCustomersSoap", [Namespace]:="http://tempuri.org/")> _
    Public Class UpdateCustomers
        Inherits System.Web.Services.Protocols.SoapHttpClientProtocol

        Public Sub New()
            MyBase.New()
            Me.Url = "http://localhost/quickstart/winforms/samples/data/update/vb/UpdateCustomers.asmx"
        End Sub

        <System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/Save", ParameterStyle:=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)> _
        Public Function Save(ByVal customersDataSet As System.Data.DataSet) As System.Data.DataSet
            Dim results() As Object = Me.Invoke("Save", New Object() {customersDataSet})
            Return CType(results(0), System.Data.DataSet)
        End Function

        Public Function BeginSave(ByVal customersDataSet As System.Data.DataSet, ByVal callback As System.AsyncCallback, ByVal asyncState As Object) As System.IAsyncResult
            Return Me.BeginInvoke("Save", New Object() {customersDataSet}, callback, asyncState)
        End Function

        Public Function EndSave(ByVal asyncResult As System.IAsyncResult) As System.Data.DataSet
            Dim results() As Object = Me.EndInvoke(asyncResult)
            Return CType(results(0), System.Data.DataSet)
        End Function
    End Class
End Namespace
