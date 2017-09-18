<%@ WebService Language="VB" Class="HeaderService" %>

Imports System
Imports System.Web.Services
Imports System.Web.Services.Protocols

    ' AuthHeader class extends from SoapHeader
    Public Class AuthHeaderVB : Inherits SoapHeader
        Public Username As String
        Public Password As String
    End Class

    Public Class HeaderService

        Public sHeader As AuthHeaderVB

        <WebMethod, SoapHeader("sHeader")> Public Function SecureMethod() As String

            If (sHeader Is Nothing)
              Return "ERROR: Please supply credentials"
            End If

            Dim usr As String = sHeader.Username
            Dim pwd As String = sHeader.Password

            If (AuthenticateUser(usr, pwd))
                 Return "SUCCESS: " & usr & "," & pwd

            Else
                 Return "ERROR: Could not authenticate"
            End If

         End Function

        Private Function AuthenticateUser(usr As String, pwd As String) As Boolean

            If (Not (usr Is Nothing) And Not (pwd Is Nothing))
                ' could query a database here for credentials...
                Return true
            End If
            Return false
        End Function

    End Class

