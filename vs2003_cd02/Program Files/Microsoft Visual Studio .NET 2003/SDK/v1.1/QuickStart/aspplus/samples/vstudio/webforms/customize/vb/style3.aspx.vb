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
Imports System.ComponentModel.Design
Imports System.Data
Imports System.Drawing
Imports System.Web
Imports System.Web.SessionState
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports Microsoft.VisualBasic

Namespace Customize.Vb
    Public Class style3
        Inherits System.Web.UI.Page

#Region " Web Forms Designer Generated Code "

        Protected WithEvents MyRadio3 As System.Web.UI.HtmlControls.HtmlInputRadioButton
        Protected WithEvents MyRadio2 As System.Web.UI.HtmlControls.HtmlInputRadioButton
        Protected WithEvents MyRadio1 As System.Web.UI.HtmlControls.HtmlInputRadioButton
        Protected WithEvents MySelect As System.Web.UI.HtmlControls.HtmlSelect
        Protected WithEvents MyText As System.Web.UI.HtmlControls.HtmlInputText
        Protected WithEvents MyButton As System.Web.UI.HtmlControls.HtmlButton
        Protected WithEvents MySpan As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents ColorSelect As System.Web.UI.HtmlControls.HtmlSelect
        Protected WithEvents Message As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents SubmitBtn As System.Web.UI.HtmlControls.HtmlInputButton

        Dim WithEvents style3 As System.Web.UI.Page

        Sub New()
            style3 = Me
            AddHandler style3.Init, New System.EventHandler(AddressOf Me.style3_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            AddHandler style3.Load, New System.EventHandler(AddressOf Me.style3_Load)
            AddHandler SubmitBtn.ServerClick, New System.EventHandler(AddressOf Me.SubmitBtn_Click)
        End Sub

#End Region

        Protected Sub style3_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            Message.InnerHtml &= "<h5>Accessing Styles...</h5>"

            Message.InnerHtml &= "The color of the span is: " & MySpan.Style("color") & "<br>"
            Message.InnerHtml &= "The width of the textbox is: " & MyText.Style("width") & "<p>"

            Message.InnerHtml &= "MySelect's style collection is: <br>"

            Dim Keys As IEnumerator

            Keys = MySelect.Style.Keys.GetEnumerator()

            Do While (Keys.MoveNext())

                Dim Key As String
                Key = Keys.Current.ToString()
                Message.InnerHtml &= "<img src='/quickstart/images/bullet.gif'>&nbsp;&nbsp;"
                Message.InnerHtml &= Key & "=" & MySelect.Style(Key).ToString() & "<br>"
            Loop
        End Sub

        Protected Sub style3_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

        Protected Sub SubmitBtn_Click(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            Message.InnerHtml &= "<h5>Modifying Styles...</h5>"

            MySpan.Style("color") = ColorSelect.Value
            MyText.Style("width") = "600"

            Message.InnerHtml &= "The color of the span is: " & MySpan.Style("color") & "<br>"
            Message.InnerHtml &= "The width of the textbox is: " & MyText.Style("width")
        End Sub

    End Class
End Namespace