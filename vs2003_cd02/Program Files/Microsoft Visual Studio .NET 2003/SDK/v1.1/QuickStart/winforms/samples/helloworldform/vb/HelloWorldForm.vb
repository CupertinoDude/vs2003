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

Namespace Microsoft.Samples.WinForms.VB.HelloWorldForm

    'Do not load this form into the Windows Form Designer.
    'This QuickStart is an example of a simple hand-written
    'form with controls.
    Public Class HelloWorldForm
        Inherits Form

        Private components As Container

        'Declare the buttons using WithEvents so that we can register declarative
        'event handlers
        Private WithEvents button1 as Button

        Private textBox1 As New TextBox

        'When the application is started show the Form
        <STAThread()> Shared Sub Main()
            System.Windows.Forms.Application.Run(New HelloWorldForm())
        End Sub

        Public Sub New()

            MyBase.New

            'Set up the Form
            Me.Text = "Hello Windows Forms World"
            Me.AutoScaleBaseSize = new Size(5, 13)
            Me.ClientSize = new Size(392, 117)

            'Set the minimum form size to the client size + the height of the title bar
            Me.MinimumSize = new Size(392, (117 + SystemInformation.CaptionHeight))

            'Create button1
            button1 = new Button()
            button1.Location = new Point(56, 64)
            button1.Size = new Size(90, 40)
            button1.TabIndex = 2
            button1.Text = "Click Me!"

            'Create the text box
            textBox1.Text = "Hello Windows Forms World"
            textBox1.TabIndex = 1
            textBox1.Size = new Size(360, 20)
            textBox1.Location = new Point(16, 24)

            'Set the default button on the form
            Me.AcceptButton=button1

            'Add the controls to the form
            Me.Controls.Add(button1)
            Me.Controls.Add(textBox1)

        End Sub

        'Called when the Form closes
        'Note that the MessageBox call is simply to
        'demonstrate that Dispose is called. You
        'should keep your Dispose method code as simple and
        'robust as possible
        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            Try
                MessageBox.Show("Disposed!")
            Catch ex As Exception
            End Try
            MyBase.Dispose(disposing)
        End Sub



        'The event handling method for button2 - registered using Handles
        Private Sub button1_Click(sender As Object, evArgs As EventArgs) Handles button1.Click

            'Disable button1 - we only want to add one button
            button1.Enabled=False

            'Add the new button and add an event handler using AddHandler
            Dim newButton As new Button
            newButton = new Button()
            newButton.Location = new Point(256, 64)
            newButton.Size = new Size(90, 40)
            newButton.TabIndex = 4
            newButton.Text = "Click Me Too!"
            Me.Controls.Add(newButton)

            AddHandler newButton.Click, AddressOf Me.clickNewbutton
        End Sub

        'The event handling method for the new button -  registered using AddHandler
        Private Sub clickNewbutton(sender As Object, evArgs As EventArgs)
            MessageBox.Show("Hello from the new Button")
        End Sub

    End Class

End Namespace









