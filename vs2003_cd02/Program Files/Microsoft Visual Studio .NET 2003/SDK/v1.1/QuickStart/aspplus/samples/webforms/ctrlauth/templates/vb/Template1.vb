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

Namespace TemplateControlSamplesVB

    Public Class TemplateItem : Inherits Control : Implements INamingContainer
        Private _message As String = Nothing

        Public Sub New(Message As String)
            _message = message
        End Sub

        Public Property Message As String
           Get
              Return _message
           End Get
           Set
              _message = Value
           End Set
        End Property
    End Class


    <ParseChildren(true)> Public Class Template1VB : Inherits Control : Implements INamingContainer

        Private _messageTemplate As ITemplate = Nothing
        Private _message As String = Nothing

        Public Property Message As String

           Get
              Return _message
           End Get
           Set
              _message = Value
           End Set
        End Property


        <TemplateContainer(GetType(TemplateItem))> Public Property MessageTemplate As ITemplate

           Get
              Return _messageTemplate
           End Get
           Set
              _messageTemplate = Value
           End Set
        End Property

        Public Overrides Sub DataBind()
        	EnsureChildControls()
		    MyBase.DataBind()
	    End Sub

        Protected Overrides Sub CreateChildControls()

           ' If a template has been specified, use it to create children.
           ' Otherwise, create a single literalcontrol with message value

           If Not (MessageTemplate Is Nothing)
              Controls.Clear()
              Dim I As New TemplateItem(Me.Message)
              MessageTemplate.InstantiateIn(I)
              Controls.Add(I)
           Else
              Me.Controls.Add(New LiteralControl(Me.Message))
           End If
        End Sub

    End Class

End Namespace