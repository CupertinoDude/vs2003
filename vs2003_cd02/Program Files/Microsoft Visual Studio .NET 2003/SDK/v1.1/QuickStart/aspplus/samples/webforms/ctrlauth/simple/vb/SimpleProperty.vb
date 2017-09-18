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

Namespace SimpleControlSamples

    Public Enum MsgSize

        Small = 0
        Medium = 1
        Large = 2

     End Enum    

    Public Class SimplePropertyVB : Inherits Control

       Private _message As String
       Private _messageSize As MsgSize
       Private _iterations As Integer = 1

       Public Property Message As String
           Get
              Return _message
           End Get
           Set
              _message = Value
           End Set
       End Property

       Public Property MessageSize As MsgSize
           Get
              Return _messageSize
           End Get
           Set
              _messageSize = Value
           End Set
       End Property

       Public Property Iterations As Integer
           Get
              Return _iterations
           End Get
           Set
              _iterations = Value
           End Set
       End Property

       Protected Overrides Sub Render(Output As HtmlTextWriter)

           Dim HtmlSize As String

           If _messageSize = MsgSize.Small
              HtmlSize="H5"
           Else if _messageSize = MsgSize.Medium
              HtmlSize="H3"
           Else
              HtmlSize="H1"
           End If

           Dim I As Integer
           For I = 0 To _iterations - 1
              Output.Write("<" & htmlSize & ">" & _message & "</" & htmlSize & ">")
           Next
       End Sub

    End Class

End Namespace
