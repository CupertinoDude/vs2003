<%@ WebService Language="VB" Class="SessionService1" %>

Imports System
Imports System.Web.Services

Public Class SessionService1 : Inherits WebService

    <WebMethod(EnableSession:=true)> Public Function UpdateHitCounter() As String

        If Session("HitCounter") Is Nothing
            Session("HitCounter") = 1
        Else
            Session("HitCounter") = Cint(Session("HitCounter")) + 1
        End If

        Return "You have accessed this service " & Session("HitCounter").ToString() & " times."
   End Function

   <WebMethod(EnableSession:=false)> Public Function UpdateAppCounter() As String

        If Application("HitCounter") Is Nothing
            Application("HitCounter") = 1
        Else
            Application("HitCounter") = CInt(Application("HitCounter")) + 1
        End If

        Return "This service has been accessed " & Application("HitCounter").ToString() & " times."
   End Function

End Class