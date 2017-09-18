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
Imports System.Drawing
Imports System.Collections
Imports System.ComponentModel
Imports System.Windows.Forms

Namespace Microsoft.Samples.WinForms.Vb.SimplePad
    _


    Public Class OptionsForm
        Inherits System.Windows.Forms.Form
        '/ <summary>
        '/    Required designer variable.
        '/ </summary>
        Private components As System.ComponentModel.Container
        Protected Friend okButton As Button
        Protected Friend grid As PropertyGrid

        Private customizer As Object


        Public Sub New(ByVal customizer As Object)
            '
            ' Required for Windows Form Designer support
            '
            InitializeComponent()

            Me.customizer = customizer
            grid.SelectedObject = customizer
        End Sub 'New


        '/ <summary>
        '/    Clean up any resources being used.
        '/ </summary>
        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub 'Dispose


        '/ <summary>
        '/    Required method for Designer support - do not modify
        '/    the contents of this method with the code editor.
        '/ </summary>
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.okButton = New System.Windows.Forms.Button()
            Me.grid = New System.Windows.Forms.PropertyGrid()
            Me.SuspendLayout()
            '
            'okButton
            '
            Me.okButton.Anchor = (System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Right)
            Me.okButton.DialogResult = System.Windows.Forms.DialogResult.OK
            Me.okButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            Me.okButton.Location = New System.Drawing.Point(232, 297)
            Me.okButton.Name = "okButton"
            Me.okButton.Size = New System.Drawing.Size(75, 23)
            Me.okButton.TabIndex = 0
            Me.okButton.Text = "OK"
            '
            'grid
            '
            Me.grid.Anchor = (((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                        Or System.Windows.Forms.AnchorStyles.Left) _
                        Or System.Windows.Forms.AnchorStyles.Right)
            Me.grid.AutoScrollMinSize = New System.Drawing.Size(0, 0)
            Me.grid.CommandsVisibleIfAvailable = True
            Me.grid.LargeButtons = False
            Me.grid.LineColor = System.Drawing.SystemColors.ScrollBar
            Me.grid.Location = New System.Drawing.Point(8, 8)
            Me.grid.Name = "grid"
            Me.grid.Size = New System.Drawing.Size(312, 281)
            Me.grid.TabIndex = 1
            Me.grid.Text = "PropertyGrid"
            Me.grid.ToolbarVisible = False
            'Me.grid.ViewBackColor = System.Drawing.SystemColors.Window
            'Me.grid.ViewForeColor = System.Drawing.SystemColors.WindowText
            '
            'OptionsForm
            '
            Me.AcceptButton = Me.okButton
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.CancelButton = Me.okButton
            Me.ClientSize = New System.Drawing.Size(328, 325)
            Me.ControlBox = False
            Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.okButton, Me.grid})
            Me.MaximizeBox = False
            Me.MinimizeBox = False
            Me.Name = "OptionsForm"
            Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent
            Me.Text = "SimplePad+ Options"
            Me.ResumeLayout(False)

        End Sub 'InitializeComponent
    End Class 'OptionsForm 
End Namespace 'Microsoft.Samples.WinForms.Vb.SimplePad