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


    Public Class GotoForm
        Inherits System.Windows.Forms.Form
        '/ <summary>
        '/    Required designer variable.
        '/ </summary>
        Private components As System.ComponentModel.Container
        Protected Friend button1 As Button
        Protected Friend edit1 As TextBox

        Private initSize As Size


        Public Sub New()
            '
            ' Required for Windows Form Designer support
            '
            InitializeComponent()

            initSize = Size
        End Sub 'New


        Public Property Line() As Integer
            Get
                Dim retVal As Int32
                Try
                    retVal = Integer.Parse(edit1.Text)
                Catch ex As FormatException
                    retVal = -1
                End Try
                Return retVal
            End Get
            Set(ByVal Value As Integer)
                edit1.Text = Convert.ToString(Value)
            End Set
        End Property


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
            Me.button1 = New System.Windows.Forms.Button()
            Me.edit1 = New System.Windows.Forms.TextBox()
            Me.SuspendLayout()
            '
            'button1
            '
            Me.button1.Anchor = ((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                        Or System.Windows.Forms.AnchorStyles.Right)
            Me.button1.DialogResult = System.Windows.Forms.DialogResult.OK
            Me.button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            Me.button1.Location = New System.Drawing.Point(120, 8)
            Me.button1.Name = "button1"
            Me.button1.Size = New System.Drawing.Size(48, 24)
            Me.button1.TabIndex = 1
            Me.button1.Text = "Go"
            '
            'edit1
            '
            Me.edit1.Anchor = (((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                        Or System.Windows.Forms.AnchorStyles.Left) _
                        Or System.Windows.Forms.AnchorStyles.Right)
            Me.edit1.Location = New System.Drawing.Point(8, 8)
            Me.edit1.Name = "edit1"
            Me.edit1.Size = New System.Drawing.Size(104, 23)
            Me.edit1.TabIndex = 0
            Me.edit1.Text = ""
            '
            'GotoForm
            '
            Me.AcceptButton = Me.button1
            Me.AutoScaleBaseSize = New System.Drawing.Size(6, 16)
            Me.ClientSize = New System.Drawing.Size(184, 36)
            Me.ControlBox = False
            Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.button1, Me.edit1})
            Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.SizableToolWindow
            Me.MaximizeBox = False
            Me.MinimizeBox = False
            Me.Name = "GotoForm"
            Me.ShowInTaskbar = False
            Me.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Show
            Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent
            Me.Text = "Go To"
            Me.ResumeLayout(False)

        End Sub 'InitializeComponent
    End Class 'GotoForm
End Namespace 'Microsoft.Samples.WinForms.Vb.SimplePad