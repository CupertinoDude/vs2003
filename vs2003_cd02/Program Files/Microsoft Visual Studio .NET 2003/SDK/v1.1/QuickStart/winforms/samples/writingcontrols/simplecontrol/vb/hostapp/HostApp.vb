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
Imports Microsoft.Samples.WinForms.VB.SimpleControl


Namespace Microsoft.Samples.WinForms.VB.HostApp

    Public Class HostApp
        Inherits System.Windows.Forms.Form

        Public Sub New()

            MyBase.New()

            HostApp = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            simpleControl1.Font = new Font(Control.DefaultFont.FontFamily, 14, FontStyle.Bold)

        End Sub


        Private Sub radioButton3_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles radioButton3.CheckedChanged
            If (radioButton3.Checked) Then
                simpleControl1.DrawingMode = DrawingModeStyle.Angry
            End If
        End Sub

        Private Sub radioButton2_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles radioButton2.CheckedChanged
            If (radioButton2.Checked) Then
                simpleControl1.DrawingMode = DrawingModeStyle.Sad
            End If
        End Sub

        Private Sub radioButton1_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles radioButton1.CheckedChanged
            If (radioButton1.Checked) Then
                simpleControl1.DrawingMode = DrawingModeStyle.Happy
            End If
        End Sub

        Private Sub simpleControl1_DrawingModeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles simpleControl1.DrawingModeChanged

            Select Case (simpleControl1.DrawingMode)

                Case DrawingModeStyle.Happy
                    MessageBox.Show("Well that's good to know")

                Case DrawingModeStyle.Sad
                    MessageBox.Show("Come on cheer up!")

                Case DrawingModeStyle.Angry
                    MessageBox.Show("Well calm down then!")

                Case Else
                    MessageBox.Show("Please make up your mind")

            End Select

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
        Private WithEvents radioButton3 As System.Windows.Forms.RadioButton
        Private WithEvents radioButton2 As System.Windows.Forms.RadioButton
        Private WithEvents radioButton1 As System.Windows.Forms.RadioButton
        Private WithEvents groupBox1 As System.Windows.Forms.GroupBox
        Private WithEvents simpleControl1 As Microsoft.Samples.WinForms.VB.SimpleControl.SimpleControl

        Private WithEvents HostApp As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.radioButton1 = New System.Windows.Forms.RadioButton()
            Me.radioButton3 = New System.Windows.Forms.RadioButton()
            Me.groupBox1 = New System.Windows.Forms.GroupBox()
            Me.simpleControl1 = New Microsoft.Samples.WinForms.VB.SimpleControl.SimpleControl()
            Me.radioButton2 = New System.Windows.Forms.RadioButton()

            radioButton1.Location = New System.Drawing.Point(24, 24)
            radioButton1.Size = New System.Drawing.Size(128, 24)
            radioButton1.TabIndex = 0
            radioButton1.TabStop = True
            radioButton1.Text = "Happy"
            radioButton1.Checked = True

            radioButton3.Location = New System.Drawing.Point(24, 104)
            radioButton3.Size = New System.Drawing.Size(128, 24)
            radioButton3.TabIndex = 2
            radioButton3.Text = "Angry"

            groupBox1.Size = New System.Drawing.Size(192, 152)
            groupBox1.TabIndex = 1
            groupBox1.TabStop = False
            groupBox1.Text = "I am"
            groupBox1.Location = New System.Drawing.Point(320, 16)

            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.Text = "Control Example"
            Me.ClientSize = New System.Drawing.Size(528, 325)

            simpleControl1.Size = New System.Drawing.Size(304, 328)
            simpleControl1.TabIndex = 0
            simpleControl1.Text = "Windows Forms Mood Control"

            radioButton2.Location = New System.Drawing.Point(24, 64)
            radioButton2.Size = New System.Drawing.Size(128, 24)
            radioButton2.TabIndex = 1
            radioButton2.Text = "Sad"

            Me.Controls.Add(groupBox1)
            Me.Controls.Add(simpleControl1)
            groupBox1.Controls.Add(radioButton3)
            groupBox1.Controls.Add(radioButton2)
            groupBox1.Controls.Add(radioButton1)

        End Sub

#End Region


        'The main entry point for the application
        <STAThread()> Shared Sub Main()
            System.Windows.Forms.Application.Run(New HostApp())
        End Sub

    End Class

End Namespace










