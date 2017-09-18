<%@ WebService Language="VB" Class="MathService" %>

Imports System
Imports System.Web.Services

Public Class MathService : Inherits WebService

   <WebMethod()> Public Function Add(A As System.Single, B As System.Single) As System.Single

       Return A + B
   End Function

   <WebMethod()> Public Function Subtract(A As System.Single, B As System.Single) As System.Single

       Return A - B
   End Function

   <WebMethod()> Public Function Multiply(A As System.Single, B As System.Single) As System.Single

       Return A * B
   End Function

   <WebMethod()> Public Function Divide(A As System.Single, B As System.Single) As System.Single

       If B = 0
          Return -1
       End If
       Return Convert.ToSingle(A / B)
   End Function

End Class