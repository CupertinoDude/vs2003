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
Imports AxSHDocVw

Namespace Microsoft.Samples.WinForms.VB.AxHosting

    Public Class Document
        Inherits System.Windows.Forms.Form

        'Required by the Windows Forms Designer
        Private components As System.ComponentModel.Container
        Private label1 As System.Windows.Forms.Label
        Private panel1 As System.Windows.Forms.Panel
        Private textBox1 As System.Windows.Forms.TextBox
        Private AxWebBrowser1 As AxSHDocVw.AxWebBrowser
        Private buttonGo As System.Windows.Forms.Button

        Public Sub New()
           MyBase.New

           'This call is required by the Windows Forms Designer.
           InitializeComponent

           Me.components = New System.ComponentModel.Container
           Me.textBox1 = New System.Windows.Forms.TextBox
           Me.panel1 = New System.Windows.Forms.Panel
           Me.label1 = New System.Windows.Forms.Label
           Me.AxWebBrowser1 = New AxSHDocVw.AxWebBrowser
           Me.buttonGo = New System.Windows.Forms.Button

           AxWebBrowser1.BeginInit()

           textBox1.Location = New System.Drawing.Point(56, 1)
           textBox1.Text = "http://localhost/quickstart/"
           textBox1.Anchor = AnchorStyles.Left Or AnchorStyles.Right
           textBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
           textBox1.TabIndex = 1
           textBox1.Size = New System.Drawing.Size(504, 20)

           panel1.Dock = System.Windows.Forms.DockStyle.Top
           panel1.Size = New System.Drawing.Size(650, 24)
           panel1.TabIndex = 0
           panel1.Text = "panel1"

           label1.Location = New System.Drawing.Point(0, 4)
           label1.Text = "Address:"
           label1.Anchor = System.Windows.Forms.AnchorStyles.Left
           label1.Size = New System.Drawing.Size(64, 16)
           label1.TabIndex = 0

           Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
           Me.AcceptButton = buttonGo
           Me.ClientSize = New System.Drawing.Size(650, 480)

           AxWebBrowser1.Location = New System.Drawing.Point(0, 24)
           AxWebBrowser1.Size = New System.Drawing.Size(650, 456)
           AxWebBrowser1.Dock = System.Windows.Forms.DockStyle.Fill
           AxWebBrowser1.TabIndex = 3

           buttonGo.Location = New System.Drawing.Point(562, 0)
           buttonGo.FlatStyle = System.Windows.Forms.FlatStyle.Flat
           buttonGo.Size = New System.Drawing.Size(88, 24)
           buttonGo.TabIndex = 2
           buttonGo.Anchor = System.Windows.Forms.AnchorStyles.Right
           buttonGo.Text = "&Go"
           AddHandler buttonGo.Click, AddressOf buttonGo_Click

           Me.Controls.Add(AxWebBrowser1)
           Me.Controls.Add(panel1)
           panel1.Controls.Add(textBox1)
           panel1.Controls.Add(buttonGo)
           panel1.Controls.Add(label1)

           AxWebBrowser1.EndInit()

           Me.Text = "New Web Browser"

           'Handle the Title Change event so that we can update the caption and the
           'status bar on our parent

           AddHandler AxWebBrowser1.TitleChange, AddressOf Me.AxWebBrowser1_TitleChanged

           'Once the Browser Control has been created we can interact with it
           'So hook the handle created event and use  this to navigate
           'to the start page
           AddHandler AxWebBrowser1.HandleCreated, AddressOf Me.AxWebBrowser1_Created

           'Set the minimum form size
           Me.MinimumSize = new Size(100, 100)
        End Sub

        'The WebBrowser has been created so complete initialisation
      Private Sub AxWebBrowser1_Created(sender As object, evArgs As EventArgs)

           'Navigate to the starting page
         buttonGo_Click(buttonGo, EventArgs.Empty)

           'Don't need this event handler any more so remove it
           RemoveHandler AxWebBrowser1.HandleCreated, AddressOf Me.AxWebBrowser1_Created

      End Sub


        'Handle the title changed event
        Private Sub AxWebBrowser1_TitleChanged(sender As object, e As DWebBrowserEvents2_TitleChangeEvent)
            Me.Text =  e.text
            Dim f As MainForm = CType(Me.MDIParent,MainForm)
            f.statusBar1.Text=Me.Text
        End Sub


        'Handle the click of the go button
        Private Sub buttonGo_Click(sender As object, evArgs As EventArgs)

            Dim currentCursor As Cursor = Cursor.Current
            Try
                Cursor.Current = Cursors.WaitCursor

                AxWebBrowser1.Navigate(textBox1.Text)

            Finally
                Cursor.Current = currentCursor
            End Try

        End Sub


        'Clean up any resources being used
        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub



        'NOTE: The following procedure is required by the Windows Forms Designer
        'Do not modify it.
        Private Sub InitializeComponent()

        End Sub

    End Class

End Namespace










