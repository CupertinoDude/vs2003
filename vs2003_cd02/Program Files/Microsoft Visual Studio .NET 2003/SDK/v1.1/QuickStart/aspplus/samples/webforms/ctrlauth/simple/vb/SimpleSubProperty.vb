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

    Public Class FormatterVB
        Private _size As Integer
        Private _color As String

        Public Sub New(Size As Integer, Color As String)
           MyBase.New
           Me._size = Size
           Me._color = Color
        End Sub
        
        Public Property Color As String
            Get
                Return _color
            End Get
            Set
                _color = Value
            End Set
        End Property

        Public Property Size As Integer
            Get
                Return _size
            End Get
            Set
                _size = Value
            End Set
        End Property
    End Class

    Public Class SimpleSubPropertyVB : Inherits Control

       Private _format  As FormatterVB = new FormatterVB(3, "black")
       Private _message As String = Nothing

       Public Property Message As String
           Get
              Return _message
           End Get
           Set
              _message = Value
           End Set
       End Property

       Public ReadOnly Property Format As FormatterVB
           Get
              Return _format
           End Get
       End Property

       Protected Overrides Sub Render(Output As HtmlTextWriter)

           Output.Write("<font size=" & Format.Size & " color=" & Format.Color & ">")
           Output.Write(_message)
           Output.Write("</font>")
       End Sub

    End Class

End Namespace
