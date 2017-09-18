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
Imports System.Drawing
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls

Namespace Services.MathService.Vb
    Public Class MathServiceClient
        Inherits System.Web.UI.Page

        Private components As System.ComponentModel.IContainer

        Protected Operand1 As System.Web.UI.WebControls.TextBox
        Protected Operand2 As System.Web.UI.WebControls.TextBox
        Protected Add As System.Web.UI.HtmlControls.HtmlInputButton
        Protected Subtract As System.Web.UI.HtmlControls.HtmlInputButton
        Protected Multiply As System.Web.UI.HtmlControls.HtmlInputButton
        Protected Divide As System.Web.UI.HtmlControls.HtmlInputButton
        Protected Result As System.Web.UI.WebControls.Label

#Region " Web Forms Designer Generated Code "

        Dim WithEvents MathServiceClient As System.Web.UI.Page

        Sub New()
            MathServiceClient = Me
            AddHandler MathServiceClient.Init, New System.EventHandler(AddressOf MathServiceClient_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub MathServiceClient_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Load, AddressOf Me.MathServiceClient_Load
            AddHandler Me.Add.ServerClick, AddressOf Me.Submit_Click
            AddHandler Me.Subtract.ServerClick, AddressOf Me.Submit_Click
            AddHandler Me.Multiply.ServerClick, AddressOf Me.Submit_Click
            AddHandler Me.Divide.ServerClick, AddressOf Me.Submit_Click
        End Sub

        Protected Sub MathServiceClient_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)

        End Sub

        Public Sub Submit_Click(ByVal Sender As Object, ByVal E As EventArgs)

            Dim Op1 As Integer = 0
            Dim Op2 As Integer = 0

            Try

                Op1 = Integer.Parse(Operand1.Text)
                Op2 = Integer.Parse(Operand2.Text)

            Catch Exp As Exception
                ' Ignored
            End Try

            Dim Service As MathService = New MathService()


            Result.Text = "<b>Result</b> = "

            Select Case (CType(Sender, Control).ID)

                Case "Add"
                    Result.Text &= Service.Add(Op1, Op2).ToString()

                Case "Subtract"
                    Result.Text &= Service.Subtract(Op1, Op2).ToString()

                Case "Multiply"
                    Result.Text &= Service.Multiply(Op1, Op2).ToString()

                Case "Divide"
                    Result.Text &= Service.Divide(Op1, Op2).ToString()

            End Select
        End Sub

    End Class
End Namespace