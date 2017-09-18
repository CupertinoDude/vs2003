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

Namespace Microsoft.Samples.WinForms.VB.Anchoring

    Public Class Anchoring
        Inherits System.Windows.Forms.Form

        Public Sub New()

            MyBase.New()

            Anchoring = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            'Set minimum size of form
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


        'The main entry point for the application
        <STAThread()> Shared Sub Main()
            System.Windows.Forms.Application.Run(New Anchoring())
        End Sub

#Region " Windows Form Designer generated code "

        'Required by the Windows Form Designer
        Private components As System.ComponentModel.Container
        Private WithEvents button1 As System.Windows.Forms.Button
        Private WithEvents textBox1 As System.Windows.Forms.TextBox

        Private WithEvents Anchoring As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.button1 = New System.Windows.Forms.Button()
            Me.textBox1 = New System.Windows.Forms.TextBox()
            Me.Text = "Anchoring Sample"
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.ClientSize = New System.Drawing.Size(392, 117)

            button1.Size = New System.Drawing.Size(120, 40)
            button1.TabIndex = 1
            button1.Anchor = AnchorStyles.Bottom Or AnchorStyles.Right
            button1.Location = New System.Drawing.Point(256, 64)
            button1.Text = "Click Me!"

            textBox1.Location = New System.Drawing.Point(16, 24)
            textBox1.Text = "Hello Windows Forms World"
            textBox1.TabIndex = 0
            textBox1.Anchor = AnchorStyles.Top Or AnchorStyles.Left Or AnchorStyles.Right
            textBox1.Size = New System.Drawing.Size(360, 20)
            Me.Controls.Add(textBox1)
            Me.Controls.Add(button1)
        End Sub

#End Region

        Private Sub button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles button1.Click
            MessageBox.Show("Text is: '" + textBox1.Text + "'")
        End Sub

    End Class

End Namespace
