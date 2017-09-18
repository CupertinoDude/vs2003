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
Imports System.ComponentModel
Imports System.Drawing
Imports System.Windows.Forms
Imports System.Threading

Namespace Microsoft.Samples.WinForms.Vb.ErrorHandler

    Public Class ErrorHandler
        Inherits System.Windows.Forms.Form

        Public Sub New()
            MyBase.New()

            ErrorHandler = Me

            ' Required by the Win Forms Designer
            InitializeComponent()

        End Sub

        'Form overrides dispose to clean up the component list.
        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub


#Region " Windows Form Designer generated code "

        'Required by the Windows Form Designer
        Private components As System.ComponentModel.Container
        Private WithEvents button1 As System.Windows.Forms.Button

        Private WithEvents ErrorHandler As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.button1 = New System.Windows.Forms.Button()
            Me.components = New System.ComponentModel.Container()
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.Text = "Exception Handling Sample"
            Me.ClientSize = New System.Drawing.Size(392, 117)
            Me.Text = "Exception Handling Sample"
            button1.Size = New System.Drawing.Size(120, 40)
            button1.TabIndex = 1
            button1.Font = New System.Drawing.Font("TAHOMA", 8F, System.Drawing.FontStyle.Bold)
            button1.Text = "Click Me!"
            button1.Location = New System.Drawing.Point(256, 64)
            AddHandler button1.Click, AddressOf button1_Click
            button1.Location = New System.Drawing.Point(256, 64)
            Me.Controls.Add(button1)
        End Sub

#End Region

        Private Sub button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Throw New ArgumentException("The parameter was invalid")
        End Sub

        'The application's main entry point.
        Public Shared Sub Main()
            'Explicitly set apartment state to Single Thread Apartment (STA)
            System.Threading.Thread.CurrentThread.ApartmentState = System.Threading.ApartmentState.STA
            Dim eh As New CustomExceptionHandler()
            AddHandler Application.ThreadException, AddressOf eh.OnThreadException
            Application.Run(New ErrorHandler())
        End Sub

    End Class

End Namespace
