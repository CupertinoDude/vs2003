<%@ WebService Language="VB" Class="DataTypes" %>

Imports System
Imports System.Web.Services

Namespace DataTypesVB.Enumerations
    Public Enum Mode

        EOn = 1
        EOff = 2

    End Enum

    Public Class Order

       Public OrderID As Integer
       Public Price As Double
    End Class

End Namespace

Public Class DataTypes : Inherits WebService

   <WebMethod()> Public Function SayHello() As String

       Return "Hello World!"
   End Function

   <WebMethod()> Public Function SayHelloName(Name As String) As String

       Return "Hello" & Name
   End Function

   <WebMethod()> Public Function GetIntArray() As Integer()

       Dim I As Integer
       Dim A(4) As Integer
       For I = 0 to 4
           A(I) = I*10
       Next
       Return A
   End Function

   <WebMethod()> Public Function GetMode() As DataTypesVB.Enumerations.Mode

       Return DataTypesVB.Enumerations.Mode.EOff
   End Function

   <WebMethod()> Public Function GetOrder() As DataTypesVB.Enumerations.Order

      Dim MyOrder As New DataTypesVB.Enumerations.Order

      MyOrder.Price=34.5
      MyOrder.OrderID = 323232

      Return MyOrder
   End Function

   <WebMethod()> Public Function GetOrders() As DataTypesVB.Enumerations.Order()

      Dim MyOrder(2) As DataTypesVB.Enumerations.Order

      MyOrder(0) = New DataTypesVB.Enumerations.Order()
      MyOrder(0).Price=34.5
      MyOrder(0).OrderID = 323232
      MyOrder(1) = New DataTypesVB.Enumerations.Order()
      MyOrder(1).Price=99.4
      MyOrder(1).OrderID = 645645

      Return MyOrder
   End Function

End Class
