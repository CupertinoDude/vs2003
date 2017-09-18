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

Namespace Microsoft.Samples.Windows.Forms.Vb.DateTimePickerCtl

    ' <doc>
    ' <desc>
    '     This form is used to customise the DateTime picker
    '     It demonstrates how to use the common color dialog
    ' </desc>
    ' </doc>
    '
    Public Class ChangeColorDlg
        Inherits System.Windows.Forms.Form
        Private dtp As DateTimePicker


        ' <doc>
        ' <desc>
        '     Public Constructor
        ' </desc>
        ' </doc>
        '
        Public Sub New(ByVal parent As DateTimePickerCtl)

            MyBase.New()

            ChangeColorDlg = Me

            ' This call is required for support of the Windows Forms Form Designer.
            InitializeComponent()

            dtp = parent.DTPicker

            SynchronizePanelColors()
        End Sub 'New


        ' <doc>
        ' <desc>
        '     Make sure that the color display panels are displaying the
        '     Color used by the date time picker
        ' </desc>
        ' </doc>
        '
        Private Sub SynchronizePanelColors()
            pnlForeColor.BackColor = dtp.CalendarForeColor
            pnlMonthBackground.BackColor = dtp.CalendarMonthBackground
            pnlTitleBackColor.BackColor = dtp.CalendarTitleBackColor
            pnlTitleForeColor.BackColor = dtp.CalendarTitleForeColor
            pnlTrailingForeColor.BackColor = dtp.CalendarTrailingForeColor
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



        Protected Sub btnForeColor_Click(ByVal sender As Object, ByVal e As EventArgs)
            colorDialog1.Color = dtp.CalendarForeColor
            Dim res As DialogResult = colorDialog1.ShowDialog()
            If res = DialogResult.OK Then
                dtp.CalendarForeColor = colorDialog1.Color
                SynchronizePanelColors()
            End If
        End Sub


        Protected Sub btnMonthBackground_Click(ByVal sender As Object, ByVal e As EventArgs)
            colorDialog1.Color = dtp.CalendarMonthBackground
            Dim res As DialogResult = colorDialog1.ShowDialog()
            If res = DialogResult.OK Then
                dtp.CalendarMonthBackground = colorDialog1.Color
                SynchronizePanelColors()
            End If
        End Sub


        Protected Sub btnTitleBackColor_Click(ByVal sender As Object, ByVal e As EventArgs)
            colorDialog1.Color = dtp.CalendarTitleBackColor
            Dim res As DialogResult = colorDialog1.ShowDialog()
            If res = DialogResult.OK Then
                dtp.CalendarTitleBackColor = colorDialog1.Color
                SynchronizePanelColors()
            End If
        End Sub


        Protected Sub btnTitleForeColor_Click(ByVal sender As Object, ByVal e As EventArgs)
            colorDialog1.Color = dtp.CalendarTitleForeColor
            Dim res As DialogResult = colorDialog1.ShowDialog()
            If res = DialogResult.OK Then
                dtp.CalendarTitleForeColor = colorDialog1.Color
                SynchronizePanelColors()
            End If
        End Sub


        Protected Sub btnTrailingForeColor_Click(ByVal sender As Object, ByVal e As EventArgs)
            colorDialog1.Color = dtp.CalendarTrailingForeColor
            Dim res As DialogResult = colorDialog1.ShowDialog()
            If res = DialogResult.OK Then
                dtp.CalendarTrailingForeColor = colorDialog1.Color
                SynchronizePanelColors()
            End If
        End Sub


#Region " Windows Form Designer generated code "

        'Required by the Windows Form Designer
        Private components As System.ComponentModel.Container
        Private WithEvents colorDialog1 As System.Windows.Forms.ColorDialog
        Private WithEvents label1 As System.Windows.Forms.Label
        Private WithEvents label2 As System.Windows.Forms.Label
        Private WithEvents label3 As System.Windows.Forms.Label
        Private WithEvents label4 As System.Windows.Forms.Label
        Private WithEvents label5 As System.Windows.Forms.Label
        Private WithEvents btnOK As System.Windows.Forms.Button
        Private WithEvents pnlForeColor As System.Windows.Forms.Panel
        Private WithEvents pnlMonthBackground As System.Windows.Forms.Panel
        Private WithEvents pnlTitleBackColor As System.Windows.Forms.Panel
        Private WithEvents pnlTitleForeColor As System.Windows.Forms.Panel
        Private WithEvents pnlTrailingForeColor As System.Windows.Forms.Panel
        Private WithEvents btnForeColor As System.Windows.Forms.Button
        Private WithEvents btnMonthBackground As System.Windows.Forms.Button
        Private WithEvents btnTitleBackColor As System.Windows.Forms.Button
        Private WithEvents btnTitleForeColor As System.Windows.Forms.Button
        Private WithEvents btnTrailingForeColor As System.Windows.Forms.Button

        Private WithEvents ChangeColorDlg As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.btnTrailingForeColor = New System.Windows.Forms.Button()
            Me.btnOK = New System.Windows.Forms.Button()
            Me.pnlMonthBackground = New System.Windows.Forms.Panel()
            Me.btnTitleBackColor = New System.Windows.Forms.Button()
            Me.pnlForeColor = New System.Windows.Forms.Panel()
            Me.pnlTitleForeColor = New System.Windows.Forms.Panel()
            Me.btnMonthBackground = New System.Windows.Forms.Button()
            Me.pnlTitleBackColor = New System.Windows.Forms.Panel()
            Me.btnTitleForeColor = New System.Windows.Forms.Button()
            Me.label5 = New System.Windows.Forms.Label()
            Me.btnForeColor = New System.Windows.Forms.Button()
            Me.pnlTrailingForeColor = New System.Windows.Forms.Panel()
            Me.label4 = New System.Windows.Forms.Label()
            Me.colorDialog1 = New System.Windows.Forms.ColorDialog()
            Me.label2 = New System.Windows.Forms.Label()
            Me.label3 = New System.Windows.Forms.Label()
            Me.label1 = New System.Windows.Forms.Label()

            Me.Text = "Change Color"
            Me.MaximizeBox = False
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
            Me.MinimizeBox = False
            Me.ClientSize = New System.Drawing.Size(406, 194)

            btnTrailingForeColor.Location = New System.Drawing.Point(232, 112)
            btnTrailingForeColor.Size = New System.Drawing.Size(75, 23)
            btnTrailingForeColor.TabIndex = 12
            btnTrailingForeColor.Text = "Change"
            AddHandler btnTrailingForeColor.Click, New System.EventHandler(AddressOf btnTrailingForeColor_Click)

            btnOK.Location = New System.Drawing.Point(320, 160)
            btnOK.DialogResult = System.Windows.Forms.DialogResult.OK
            btnOK.Size = New System.Drawing.Size(75, 23)
            btnOK.TabIndex = 9
            btnOK.Text = "&OK"

            pnlMonthBackground.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
            pnlMonthBackground.Location = New System.Drawing.Point(160, 43)
            pnlMonthBackground.Size = New System.Drawing.Size(48, 16)
            pnlMonthBackground.TabIndex = 3
            pnlMonthBackground.Text = "panel1"

            btnTitleBackColor.Location = New System.Drawing.Point(232, 64)
            btnTitleBackColor.Size = New System.Drawing.Size(75, 23)
            btnTitleBackColor.TabIndex = 14
            btnTitleBackColor.Text = "Change"
            AddHandler btnTitleBackColor.Click, New System.EventHandler(AddressOf btnTitleBackColor_Click)

            pnlForeColor.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
            pnlForeColor.Location = New System.Drawing.Point(160, 19)
            pnlForeColor.Size = New System.Drawing.Size(48, 16)
            pnlForeColor.TabIndex = 10
            pnlForeColor.Text = "panel1"

            pnlTitleForeColor.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
            pnlTitleForeColor.Location = New System.Drawing.Point(160, 91)
            pnlTitleForeColor.Size = New System.Drawing.Size(48, 16)
            pnlTitleForeColor.TabIndex = 1
            pnlTitleForeColor.Text = "panel1"

            btnMonthBackground.Location = New System.Drawing.Point(232, 40)
            btnMonthBackground.Size = New System.Drawing.Size(75, 23)
            btnMonthBackground.TabIndex = 15
            btnMonthBackground.Text = "Change"
            AddHandler btnMonthBackground.Click, New System.EventHandler(AddressOf btnMonthBackground_Click)

            pnlTitleBackColor.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
            pnlTitleBackColor.Location = New System.Drawing.Point(160, 67)
            pnlTitleBackColor.Size = New System.Drawing.Size(48, 16)
            pnlTitleBackColor.TabIndex = 2
            pnlTitleBackColor.Text = "panel1"

            btnTitleForeColor.Location = New System.Drawing.Point(232, 88)
            btnTitleForeColor.Size = New System.Drawing.Size(75, 23)
            btnTitleForeColor.TabIndex = 13
            btnTitleForeColor.Text = "Change"
            AddHandler btnTitleForeColor.Click, New System.EventHandler(AddressOf btnTitleForeColor_Click)

            label5.Location = New System.Drawing.Point(16, 115)
            label5.Text = "CalendarTrailingForeColor:"
            label5.Size = New System.Drawing.Size(136, 16)
            label5.TabIndex = 4

            btnForeColor.Location = New System.Drawing.Point(232, 16)
            btnForeColor.Size = New System.Drawing.Size(75, 23)
            btnForeColor.TabIndex = 11
            btnForeColor.Text = "Change"
            AddHandler btnForeColor.Click, New System.EventHandler(AddressOf btnForeColor_Click)

            pnlTrailingForeColor.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
            pnlTrailingForeColor.Location = New System.Drawing.Point(160, 115)
            pnlTrailingForeColor.Size = New System.Drawing.Size(48, 16)
            pnlTrailingForeColor.TabIndex = 0
            pnlTrailingForeColor.Text = "panel1"

            label4.Location = New System.Drawing.Point(16, 91)
            label4.Text = "CalendarTitleForeColor:"
            label4.Size = New System.Drawing.Size(136, 16)
            label4.TabIndex = 5

            label2.Location = New System.Drawing.Point(16, 43)
            label2.Text = "CalendarMonthBackground:"
            label2.Size = New System.Drawing.Size(144, 16)
            label2.TabIndex = 7

            label3.Location = New System.Drawing.Point(16, 67)
            label3.Text = "CalendarTitleBackColor:"
            label3.Size = New System.Drawing.Size(136, 16)
            label3.TabIndex = 6

            label1.Location = New System.Drawing.Point(16, 19)
            label1.Text = "CalendarForeColor:"
            label1.Size = New System.Drawing.Size(136, 16)
            label1.TabIndex = 8
            Me.Controls.Add(btnTrailingForeColor)
            Me.Controls.Add(btnTitleForeColor)
            Me.Controls.Add(btnTitleBackColor)
            Me.Controls.Add(btnMonthBackground)
            Me.Controls.Add(btnForeColor)
            Me.Controls.Add(pnlTrailingForeColor)
            Me.Controls.Add(pnlTitleForeColor)
            Me.Controls.Add(pnlTitleBackColor)
            Me.Controls.Add(pnlMonthBackground)
            Me.Controls.Add(pnlForeColor)
            Me.Controls.Add(btnOK)
            Me.Controls.Add(label5)
            Me.Controls.Add(label4)
            Me.Controls.Add(label3)
            Me.Controls.Add(label2)
            Me.Controls.Add(label1)
        End Sub

#End Region

    End Class

End Namespace
