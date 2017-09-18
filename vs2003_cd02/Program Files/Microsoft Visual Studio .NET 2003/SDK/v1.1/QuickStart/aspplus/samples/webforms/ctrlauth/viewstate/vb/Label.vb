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
Imports System.Web
Imports System.Web.UI

Namespace ViewStateControlSamples

    Public Class LabelVB : Inherits Control

       Public Property [Text] As String
          Get
              Return CStr(ViewState("Text"))
          End Get
          Set
              ViewState("Text") = Value
          End Set
       End Property

       Public Property FontSize As Integer
          Get
              Return CInt(ViewState("FontSize"))
          End Get
          Set 
              ViewState("FontSize") = Value
          End Set 
       End Property

       Protected Overrides Sub Render(Output As HtmlTextWriter)
           Output.Write("<font size=" & Me.FontSize & ">" & Me.Text & "</font>")
       End Sub

    End Class

End Namespace