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
Imports Microsoft.Samples.WinForms.VB.CustomerControl
Imports Microsoft.VisualBasic.ControlChars

Namespace Microsoft.Samples.WinForms.VB.HostApp

    Public Class HostApp
        Inherits System.Windows.Forms.Form

        Public Sub New()

            MyBase.New()

            HostApp = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            CustomerControl1.Customer = Customer.ReadCustomer()

            ' Set the minimum form size to the client size + the height of the title bar
            Me.MinimumSize = New Size(400, (373 + SystemInformation.CaptionHeight))
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
        Private WithEvents buttonCancel As System.Windows.Forms.Button
        Private WithEvents buttonSave As System.Windows.Forms.Button
        Private WithEvents CustomerControl1 As Microsoft.Samples.WinForms.VB.CustomerControl.CustomerControl

        Private WithEvents HostApp As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.buttonSave = New System.Windows.Forms.Button()
            Me.buttonCancel = New System.Windows.Forms.Button()
            Me.CustomerControl1 = New Microsoft.Samples.WinForms.VB.CustomerControl.CustomerControl()

            buttonSave.Anchor = (System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left)
            buttonSave.DialogResult = System.Windows.Forms.DialogResult.OK
            buttonSave.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            buttonSave.Size = New System.Drawing.Size(96, 24)
            buttonSave.TabIndex = 1
            buttonSave.Text = "&Save"
            buttonSave.Location = New System.Drawing.Point(8, 328)

            buttonCancel.Anchor = (System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left)
            buttonCancel.Location = New System.Drawing.Point(120, 328)
            buttonCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel
            buttonCancel.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            buttonCancel.Size = New System.Drawing.Size(96, 24)
            buttonCancel.TabIndex = 2
            buttonCancel.Text = "Cancel"

            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.Text = "Control Example"
            Me.CancelButton = buttonCancel
            Me.AcceptButton = buttonSave
            Me.ClientSize = New System.Drawing.Size(400, 373)

            CustomerControl1.Anchor = (System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left Or System.Windows.Forms.AnchorStyles.Right)
            CustomerControl1.AutoScrollMinSize = New System.Drawing.Size(0, 0)
            CustomerControl1.Size = New System.Drawing.Size(400, 310)
            CustomerControl1.TabIndex = 0
            CustomerControl1.Text = "Hello Windows Forms Control World"

            Me.Controls.Add(buttonCancel)
            Me.Controls.Add(buttonSave)
            Me.Controls.Add(CustomerControl1)

        End Sub

#End Region

        Private Sub buttonCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles buttonCancel.Click
            CustomerControl1.RejectChanges()
        End Sub

        Private Sub buttonSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles buttonSave.Click
            CustomerControl1.AcceptChanges()
            MessageBox.Show("Customer Changes Saved: " & CrLf & CustomerControl1.Customer.ToString)
        End Sub

        <STAThread()> Shared Sub Main()
            Application.Run(New HostApp())
        End Sub

    End Class   'HostApp

End Namespace   'Microsoft.Samples.WinForms.VB.HostApp
