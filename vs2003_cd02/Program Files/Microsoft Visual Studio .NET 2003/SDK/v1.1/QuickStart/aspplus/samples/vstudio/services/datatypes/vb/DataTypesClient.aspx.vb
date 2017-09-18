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

Imports System.Drawing
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls


Namespace DataTypes.Vb
    Public Class DataTypesClient
        Inherits System.Web.UI.Page

        Private components As System.ComponentModel.IContainer

        Protected Message2 As System.Web.UI.HtmlControls.HtmlGenericControl

        Protected Message1 As System.Web.UI.HtmlControls.HtmlGenericControl

        Protected Message3 As System.Web.UI.HtmlControls.HtmlGenericControl

        Protected Message5 As System.Web.UI.HtmlControls.HtmlGenericControl

        Protected Message4 As System.Web.UI.HtmlControls.HtmlGenericControl


#Region " Web Forms Designer Generated Code "

        Dim WithEvents DataTypesClient As System.Web.UI.Page

        Sub New()
            DataTypesClient = Me
            AddHandler DataTypesClient.Init, New System.EventHandler(AddressOf Me.DataTypesClient_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub DataTypesClient_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Protected Sub DataTypesClient_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            Dim D As DataTypes.Vb.DataTypesService = New DataTypes.Vb.DataTypesService()
            Message1.InnerHtml = D.SayHello()
            Message1.InnerHtml &= "<br>" & D.SayHelloName("Bob")

            Message3.InnerHtml &= D.GetMode()

            Dim MyIntArray As Integer() = D.GetIntArray()
            Dim MyString As String = "Contents of the Array:<BR>"
            Dim I As Integer
            For I = 0 To MyIntArray.Length - 1
                MyString &= MyIntArray(I) & "<BR>"
            Next

            Message2.InnerHtml &= MyString

            Dim MyOrder As Order = D.GetOrder()
            Message4.InnerHtml &= "<BR>OrderID: " & MyOrder.OrderID
            Message4.InnerHtml &= "<BR>Price: " & MyOrder.Price

            Dim MyOrders As Order() = D.GetOrders()
            Message5.InnerHtml &= "<BR>OrderID: " & MyOrders(0).OrderID
            Message5.InnerHtml &= "<BR>Price: " & MyOrders(0).Price
        End Sub


        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Load, AddressOf Me.DataTypesClient_Load

        End Sub
    End Class
End Namespace