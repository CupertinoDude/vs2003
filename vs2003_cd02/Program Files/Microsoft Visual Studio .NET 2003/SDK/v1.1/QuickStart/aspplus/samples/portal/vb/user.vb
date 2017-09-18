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
Imports System.Collections
Imports System.Collections.Specialized
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Data
Imports System.Data.SqlClient
Imports PortalModulePage

Public Class User : Inherits PortalModulePage

  Public userid As TextBox
  Public passwd As TextBox
  Public fn As TextBox
  Public ln As TextBox
  Public address As TextBox
  Public city As TextBox
  Public adrstate As TextBox
  Public zip As TextBox
  Public phone As TextBox
  Public err as Label

    Protected Sub Cancel_Click(sender As Object, e As EventArgs)
         Response.Redirect("default.aspx")
    End Sub

    Public Sub Create_User(sender As Object, e As EventArgs)

    If (Not Page.IsValid) Then Return

    Dim hshTable as NameValueCollection = CType(Context.GetConfig("system.web/dsnstore"), NameValueCollection)
    Dim dsn as String = CType(hshTable.Item("portaldb"), String)

    Dim myCommand As SqlCommand = new SqlCommand()
    myCommand.Connection = new SqlConnection(dsn)
    myCommand.Connection.Open()
    myCommand.CommandType = CommandType.StoredProcedure
    myCommand.CommandText = "sp_CreateProfile"

    Dim myUserId As SQLParameter = new SQLParameter("@UserId", SqlDbType.NVarChar, 20)
    myUserId.Value =  userid.Text
    myCommand.Parameters.Add(myUserId)

    Dim myPassword As SQLParameter = new SQLParameter("@Password",SqlDbType.NVarChar, 15)
    myPassword.Value = passwd.Text
    myCommand.Parameters.Add(myPassword)

    Dim myFName As SQLParameter = new SQLParameter("@FirstName",SqlDbType.NVarChar, 15)
    myFName.Value = fn.Text
    myCommand.Parameters.Add(myFName)

    Dim myLName As SQLParameter = new SQLParameter("@LastName",SqlDbType.NVarChar, 15)
    myLName.Value = ln.Text
    myCommand.Parameters.Add(myLName)

    Dim myAddress As SQLParameter =new SQLParameter("@Address",SqlDbType.NVarChar, 50)
    myAddress.Value = address.Text
    myCommand.Parameters.Add(myAddress)

    Dim myCity As SQLParameter = new SQLParameter("@City",SqlDbType.NVarChar, 50)
    myCity.Value = city.Text
    myCommand.Parameters.Add(myCity)

    Dim myState As SQLParameter = new SQLParameter("@State",SqlDbType.NVarChar, 2)
    myState.Value = adrstate.Text
    myCommand.Parameters.Add(myState)

    Dim myZip As SQLParameter = new SQLParameter("@Zip",SqlDbType.NVarChar,5)
    myZip.Value = zip.Text
    myCommand.Parameters.Add(myZip)

    Dim myPhone As SQLParameter = new SQLParameter("@Phone",SqlDbType.NVarChar, 15 )
    myPhone.Value = phone.Text
    myCommand.Parameters.Add(myPhone)

    Try
      myCommand.ExecuteNonQuery()
      System.Web.Security.FormsAuthentication.SetAuthCookie(userid.Text, True)
      Response.Redirect("congrats.aspx")
    Catch ex As SQLException
       Err.Visible=true
    Finally
       myCommand.Connection.Close()		
    End Try

    End Sub

End Class