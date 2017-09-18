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

Option Strict Off

Imports System
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Namespace CompositionSampleControls

    Public Class Composition1VB : Inherits Control : Implements INamingContainer

        Public Property Value As Integer
           Get
               Dim Ctrl As TextBox = Controls(1)
               Me.EnsureChildControls()
               Return Int32.Parse(Ctrl.Text)
           End Get
           Set
               Dim Ctrl As TextBox = Controls(1)
               Me.EnsureChildControls()
               Ctrl.Text = Value.ToString()
           End Set
        End Property

        Protected Overrides Sub CreateChildControls()

            Me.Controls.Add(New LiteralControl("<h3>" & "Value: "))

            Dim Box As New TextBox
            Box.Text = "0"
            Me.Controls.Add(box)

            Me.Controls.Add(New LiteralControl("</h3>"))
        End Sub

    End Class

End Namespace