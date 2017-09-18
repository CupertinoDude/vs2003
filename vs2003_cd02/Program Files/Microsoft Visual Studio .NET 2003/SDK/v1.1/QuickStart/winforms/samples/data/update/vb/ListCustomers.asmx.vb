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
Imports Microsoft.Samples.Windows.Forms.Vb.Update.Data

Namespace Microsoft.Samples.Windows.Forms.Vb.Update
    Public Class ListCustomers
        Inherits System.Web.Services.WebService

        <WebMethod()> Public Function GetCustomers() As DataSet
            Dim customersDataSet1 As New CustomersDataSet()
            Dim con As New SqlConnection("server=(local)\NetSDK;database=northwind;Integrated Security=SSPI")
            Dim cmdCustomers As New SqlDataAdapter("Select * from Customers where country='USA'", con)
	    Try
                cmdCustomers.Fill(customersDataSet1, "Customers")
                Return customersDataSet1
	    Catch ex as Exception
    		Throw ex
	    Finally
    		con.Close()
	    End Try

        End Function

    End Class
End Namespace