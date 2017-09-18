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

Namespace Microsoft.Samples.WinForms.VB.Accessible

    Public Class Accessible
        Inherits System.Windows.Forms.Form

        'The main entry point for the application
        <STAThread()> Shared Sub Main()
            Application.Run(New Accessible())
        End Sub

        Public Sub New()
            MyBase.New()

            Accessible = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            'Set the minimum form size to the client size + the height of the title bar
            Me.MinimumSize = New Size(392, (117 + SystemInformation.CaptionHeight))

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

        'Required by the Windows Forms Designer
        Private components As System.ComponentModel.Container
        Private WithEvents button1 As System.Windows.Forms.Button
        Private WithEvents textBox1 As System.Windows.Forms.TextBox

        Private WithEvents Accessible As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.button1 = New System.Windows.Forms.Button()
            Me.textBox1 = New System.Windows.Forms.TextBox()

            Me.Text = "Accessibility"
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.AccessibleRole = System.Windows.Forms.AccessibleRole.Window
            Me.AccessibleName = "AccessibleForm"
            Me.AcceptButton = button1
            Me.AccessibleDescription = "Simple Form that demonstrates accessibility"
            Me.ClientSize = New System.Drawing.Size(392, 117)

            button1.AccessibleDescription = "Once you've entered some text push this button"
            button1.Size = New System.Drawing.Size(120, 40)
            button1.TabIndex = 1
            button1.Anchor = AnchorStyles.Bottom Or AnchorStyles.Right
            button1.Location = New System.Drawing.Point(248, 64)
            button1.Text = "Click Me!"
            button1.AccessibleName = "DefaultAction"

            textBox1.Location = New System.Drawing.Point(16, 24)
            textBox1.Text = "Hello WinForms World"
            textBox1.AccessibleName = "TextEntryField"
            textBox1.TabIndex = 0
            textBox1.AccessibleDescription = "Please enter some text in the box"
            textBox1.Anchor = CType(15, System.Windows.Forms.AnchorStyles)
            textBox1.Size = New System.Drawing.Size(360, 20)

            Me.Controls.Add(textBox1)
            Me.Controls.Add(button1)
        End Sub

#End Region

        Protected Sub button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles button1.Click
            MessageBox.Show("Text is: '" + textBox1.Text + "'")
        End Sub

    End Class

End Namespace
