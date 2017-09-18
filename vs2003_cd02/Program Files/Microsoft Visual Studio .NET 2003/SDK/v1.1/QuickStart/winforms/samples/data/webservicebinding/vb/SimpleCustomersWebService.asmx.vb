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

Imports System
Imports System.Web.Services
Imports System.Data
Imports System.Data.SqlClient
Imports Microsoft.Samples.Windows.Forms.Vb.WebServiceBinding.Data

Namespace Microsoft.Samples.Windows.Forms.Vb.WebServiceBinding
    Public Class CustomersList
        Inherits WebService

        <WebMethod()> Public Function GetCustomers() As DataSet
            Dim customersAndOrdersDataSet1 As New CustomersAndOrdersDataSet()
            Dim con As SqlConnection = New SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind;")
            Dim cmdCustomers As SqlDataAdapter = New SqlDataAdapter("Select * from Customers", con)
            Dim cmdOrders As SqlDataAdapter = New SqlDataAdapter("Select * from Orders", con)
	    Try
           	cmdCustomers.Fill(customersAndOrdersDataSet1, "Customers")
            	cmdOrders.Fill(customersAndOrdersDataSet1, "Orders")
            	Return customersAndOrdersDataSet1
	    Catch ex as Exception
	        Throw ex
	    Finally
	        con.Close()
	    End Try
        End Function

    End Class
End Namespace