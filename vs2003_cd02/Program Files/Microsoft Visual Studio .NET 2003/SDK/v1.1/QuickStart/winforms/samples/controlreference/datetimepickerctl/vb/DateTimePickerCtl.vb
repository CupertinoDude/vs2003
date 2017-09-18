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
    '     This sample control demonstrates various properties and
    '     methods for the DateTimePicker control.  Users should
    '     play with the various controls and then look at the code
    '     behind the behaviors that are most interesting.
    ' </desc>
    ' </doc>
    '
    Public Class DateTimePickerCtl
        Inherits System.Windows.Forms.Form

        ' <doc>
        ' <desc>
        '     Public Constructor
        ' </desc>
        ' </doc>
        Public Sub New()

            MyBase.New()

            DateTimePickerCtl = Me

            ' This call is required for support of the Windows Forms Form Designer.
            InitializeComponent()

            ' Make sure that we are starting in Long date format
            dateTimePicker.Format = DateTimePickerFormat.Long

            cmbFormat.SelectedIndex = 0

            Dim now As Date = Date.Now

            ' Initialize the control values
            dateTimePicker.Value = now
            dtpMaxDate.Value = now.AddDays(30)
            dtpMinDate.Value = now.AddDays(-30)
            dateTimePicker.MaxDate = dtpMaxDate.Value
            dateTimePicker.MinDate = dtpMinDate.Value

            'Set the minimum form size to the client size + the height of the title bar
            Me.MinimumSize = New Size(504, 293 + SystemInformation.CaptionHeight)
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



        ' <doc>
        ' <desc>
        '     Return the DateTimePicker control - used by the
        '     ChangeColorDlg
        ' </desc>
        ' </doc>
        Friend ReadOnly Property DTPicker() As dateTimePicker
            Get
                Return DateTimePicker
            End Get
        End Property


        Protected Sub btnChangeFont_Click(ByVal sender As Object, ByVal e As EventArgs)
            FontDialog.ShowDialog()
            Dim newFont As Font = FontDialog.Font
            DateTimePicker.Font = newFont
        End Sub


        Protected Sub btnChangeColor_Click(ByVal sender As Object, ByVal e As EventArgs)
            Dim dlg As New ChangeColorDlg(Me)
            dlg.ShowDialog()
        End Sub


        Protected Sub dtpMinDate_ValueChanged(ByVal sender As Object, ByVal e As EventArgs)
            If dtpMinDate.Value < dtpMaxDate.Value Then

                errorMin.SetError(dtpMinDate, "")
                DateTimePicker.MinDate = dtpMinDate.Value
            Else
                dtpMinDate.Value = DateTimePicker.MinDate
                errorMin.SetError(dtpMinDate, "Max Date must be greater than Min Date")
            End If
        End Sub


        Protected Sub dtpMaxDate_ValueChanged(ByVal sender As Object, ByVal e As EventArgs)
            If dtpMaxDate.Value > dtpMinDate.Value Then
                DateTimePicker.MaxDate = dtpMaxDate.Value
                errorMax.SetError(dtpMaxDate, "")
            Else
                dtpMaxDate.Value = DateTimePicker.MaxDate
                errorMax.SetError(dtpMaxDate, "Max Date must be greater than Min Date")
            End If

        End Sub


        Protected Sub cmbFormat_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
            If cmbFormat.SelectedIndex < 0 Then
                Return

            End If
            Dim firstChar As Char = cmbFormat.SelectedItem.ToString().Chars(0)
            Dim format As DateTimePickerFormat
            Select Case firstChar
                Case "S"c
                    format = DateTimePickerFormat.Short
                Case "T"c
                    format = DateTimePickerFormat.Time
                Case "C"c
                    format = DateTimePickerFormat.Custom
                Case Else
                    format = DateTimePickerFormat.Long
            End Select
            DateTimePicker.Format = format
        End Sub


        Protected Sub chkShowUpDown_Click(ByVal sender As Object, ByVal e As EventArgs)
            Dim showUpDown As Boolean = chkShowUpDown.Checked
            Me.dateTimePicker.ShowUpDown = showUpDown
        End Sub


#Region " Windows Form Designer generated code "

        'Required by the Windows Form Designer
        Private components As System.ComponentModel.Container
        Private WithEvents groupBox1 As System.Windows.Forms.GroupBox
        Private WithEvents label1 As System.Windows.Forms.Label
        Private WithEvents label2 As System.Windows.Forms.Label
        Private WithEvents label4 As System.Windows.Forms.Label
        Private WithEvents dateTimePicker As System.Windows.Forms.DateTimePicker
        Private WithEvents dtpMinDate As System.Windows.Forms.DateTimePicker
        Private WithEvents dtpMaxDate As System.Windows.Forms.DateTimePicker
        Private WithEvents chkShowUpDown As System.Windows.Forms.CheckBox
        Private WithEvents cmbFormat As System.Windows.Forms.ComboBox
        Private WithEvents btnChangeFont As System.Windows.Forms.Button
        Private WithEvents btnChangeColor As System.Windows.Forms.Button
        Private WithEvents fontDialog As System.Windows.Forms.FontDialog
        Private toolTip1 As System.Windows.Forms.ToolTip
        Private errorMax As System.Windows.Forms.ErrorProvider
        Private errorMin As System.Windows.Forms.ErrorProvider

        Private WithEvents DateTimePickerCtl As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.label4 = New System.Windows.Forms.Label()
            Me.errorMin = New System.Windows.Forms.ErrorProvider()
            Me.cmbFormat = New System.Windows.Forms.ComboBox()
            Me.dtpMinDate = New System.Windows.Forms.DateTimePicker()
            Me.label2 = New System.Windows.Forms.Label()
            Me.groupBox1 = New System.Windows.Forms.GroupBox()
            Me.label1 = New System.Windows.Forms.Label()
            Me.fontDialog = New System.Windows.Forms.FontDialog()
            Me.toolTip1 = New System.Windows.Forms.ToolTip(components)
            Me.btnChangeFont = New System.Windows.Forms.Button()
            Me.dateTimePicker = New System.Windows.Forms.DateTimePicker()
            Me.btnChangeColor = New System.Windows.Forms.Button()
            Me.errorMax = New System.Windows.Forms.ErrorProvider()
            Me.dtpMaxDate = New System.Windows.Forms.DateTimePicker()
            Me.chkShowUpDown = New System.Windows.Forms.CheckBox()
            Me.Text = "DateTimePicker"
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.ClientSize = New System.Drawing.Size(504, 293)

            label4.Location = New System.Drawing.Point(16, 80)
            label4.Text = "Format:"
            label4.Size = New System.Drawing.Size(64, 16)
            label4.TabIndex = 0

            errorMin.DataMember = ""
            errorMin.DataSource = Nothing
            errorMin.ContainerControl = Nothing

            cmbFormat.Location = New System.Drawing.Point(128, 72)
            cmbFormat.Size = New System.Drawing.Size(104, 21)
            cmbFormat.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            toolTip1.SetToolTip(cmbFormat, "A value indicating the whether the control displays date and time information in long date Format(for example, ""Wednesday, April 7, 1999""),short date Format(for example, ""4/7/99""), time Format(for example, ""5:31:34 PM:""), or custom format.")
            cmbFormat.TabIndex = 7
            AddHandler cmbFormat.SelectedIndexChanged, New System.EventHandler(AddressOf cmbFormat_SelectedIndexChanged)
            cmbFormat.Items.AddRange(New Object() {"Long", "Short", "Time", "Custom"})

            dtpMinDate.Location = New System.Drawing.Point(128, 24)
            dtpMinDate.Size = New System.Drawing.Size(104, 20)
            dtpMinDate.CalendarForeColor = System.Drawing.SystemColors.WindowText
            dtpMinDate.Checked = True
            dtpMinDate.ForeColor = System.Drawing.SystemColors.WindowText
            dtpMinDate.Format = System.Windows.Forms.DateTimePickerFormat.Short
            toolTip1.SetToolTip(dtpMinDate, "The value indicating the first date that the control allows the user to select")
            dtpMinDate.TabIndex = 6
            dtpMinDate.BackColor = System.Drawing.SystemColors.Window
            AddHandler dtpMinDate.ValueChanged, New System.EventHandler(AddressOf dtpMinDate_ValueChanged)

            label2.Location = New System.Drawing.Point(16, 56)
            label2.Text = "MaxDate:"
            label2.Size = New System.Drawing.Size(96, 16)
            label2.TabIndex = 1

            groupBox1.Location = New System.Drawing.Point(248, 16)
            groupBox1.ImeMode = System.Windows.Forms.ImeMode.Disable
            groupBox1.TabIndex = 0
            groupBox1.TabStop = False
            groupBox1.Text = "DateTimePicker"
            groupBox1.Size = New System.Drawing.Size(248, 264)

            label1.Location = New System.Drawing.Point(16, 32)
            label1.Text = "MinDate:"
            label1.Size = New System.Drawing.Size(80, 16)
            label1.TabIndex = 3

            toolTip1.Active = True

            btnChangeFont.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            btnChangeFont.Location = New System.Drawing.Point(16, 216)
            btnChangeFont.Text = "Change &Font"
            btnChangeFont.Size = New System.Drawing.Size(104, 32)
            btnChangeFont.TabIndex = 5
            AddHandler btnChangeFont.Click, New System.EventHandler(AddressOf btnChangeFont_Click)

            DateTimePicker.Location = New System.Drawing.Point(24, 24)
            DateTimePicker.Size = New System.Drawing.Size(200, 20)
            DateTimePicker.CalendarForeColor = System.Drawing.SystemColors.WindowText
            DateTimePicker.Checked = True
            DateTimePicker.ForeColor = System.Drawing.SystemColors.WindowText
            DateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.Custom
            DateTimePicker.TabIndex = 1
            DateTimePicker.BackColor = System.Drawing.SystemColors.Window
            DateTimePicker.CustomFormat = "'The date is: 'yy MM d - HH':'mm':'s ddd"
            btnChangeColor.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            btnChangeColor.Location = New System.Drawing.Point(128, 216)
            btnChangeColor.Text = "Change &Color"
            btnChangeColor.Size = New System.Drawing.Size(104, 32)
            btnChangeColor.TabIndex = 2
            AddHandler btnChangeColor.Click, New System.EventHandler(AddressOf btnChangeColor_Click)

            errorMax.DataMember = ""
            errorMax.DataSource = Nothing
            errorMax.ContainerControl = Nothing

            dtpMaxDate.Location = New System.Drawing.Point(128, 48)
            dtpMaxDate.Size = New System.Drawing.Size(104, 20)
            dtpMaxDate.CalendarForeColor = System.Drawing.SystemColors.WindowText
            dtpMaxDate.Checked = True
            dtpMaxDate.ForeColor = System.Drawing.SystemColors.WindowText
            dtpMaxDate.Format = System.Windows.Forms.DateTimePickerFormat.Short
            toolTip1.SetToolTip(dtpMaxDate, "The value indicating the last date that the control allows the user to select")
            dtpMaxDate.TabIndex = 4
            dtpMaxDate.BackColor = System.Drawing.SystemColors.Window
            AddHandler dtpMaxDate.ValueChanged, New System.EventHandler(AddressOf dtpMaxDate_ValueChanged)

            chkShowUpDown.Location = New System.Drawing.Point(16, 104)
            chkShowUpDown.Text = "ShowUpDown:"
            chkShowUpDown.CheckAlign = System.Drawing.ContentAlignment.MiddleRight
            chkShowUpDown.Size = New System.Drawing.Size(100, 23)
            chkShowUpDown.AccessibleRole = System.Windows.Forms.AccessibleRole.CheckButton
            chkShowUpDown.TabIndex = 8
            AddHandler chkShowUpDown.Click, New System.EventHandler(AddressOf chkShowUpDown_Click)

            groupBox1.Controls.Add(chkShowUpDown)
            groupBox1.Controls.Add(btnChangeFont)
            groupBox1.Controls.Add(btnChangeColor)
            groupBox1.Controls.Add(dtpMaxDate)
            groupBox1.Controls.Add(dtpMinDate)
            groupBox1.Controls.Add(label4)
            groupBox1.Controls.Add(label2)
            groupBox1.Controls.Add(label1)
            groupBox1.Controls.Add(cmbFormat)
            Me.Controls.Add(DateTimePicker)
            Me.Controls.Add(groupBox1)
        End Sub

#End Region

        ' The main entry point for the application.
        <STAThread()> Public Shared Sub Main()
            Application.Run(New DateTimePickerCtl())
        End Sub

    End Class

End Namespace
