<%@ WebService Language="VB" Class="DataService" %>

Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Services

Public Class DataService : Inherits WebService

   <WebMethod()> Public Function GetTitleAuthors() As DataSet

        Dim MyConnection As SqlConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
        Dim MyCommand1 As SqlDataAdapter = New SqlDataAdapter("select * from Authors", MyConnection)
        Dim MyCommand2 As SqlDataAdapter = New SqlDataAdapter("select * from Titles", MyConnection)

        Dim DS As New DataSet
        MyCommand1.Fill(DS, "Authors")
        MyCommand2.Fill(DS, "Titles")

        Return DS
   End Function

   <WebMethod()> Public Function PutTitleAuthors(DS As DataSet) As Integer
        Return DS.Tables(0).Rows.Count
   End Function

End Class