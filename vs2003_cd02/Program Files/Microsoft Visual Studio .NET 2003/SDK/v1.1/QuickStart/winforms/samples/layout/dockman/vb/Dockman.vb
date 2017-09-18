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


Namespace Microsoft.Samples.WinForms.VB.DockMan

    Public Class DockMan
        Inherits System.Windows.Forms.Form

        'rdbSet keeps track of which radio button is checked
        Private rdbSet As System.Windows.Forms.RadioButton

        Public Sub New()

            MyBase.New()

            DockMan = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            ' Complete intialization of the form
            rdbSet = rdbNone
            ApplyChanges()

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
            System.Windows.Forms.Application.Run(New DockMan())
        End Sub

        Private Sub ApplyChanges()

            'Apply Anchoring Settings - maybe multiple
            Dim nSettings As AnchorStyles
            nSettings = AnchorStyles.None

            If chkTop.Checked Then
                nSettings = nSettings Or AnchorStyles.Top
            End If

            If chkLeft.Checked Then
                nSettings = nSettings Or AnchorStyles.Left
            End If

            If chkBottom.Checked Then
                nSettings = nSettings Or AnchorStyles.Bottom
            End If

            If chkRight.Checked Then
                nSettings = nSettings Or AnchorStyles.Right
            End If

            btnDemo.Anchor = nSettings

            'Apply Docking settings - one only
            If rdbSet Is rdbNone Then
                btnDemo.Dock = System.Windows.Forms.DockStyle.None
            ElseIf rdbSet Is rdbTop Then
                btnDemo.Dock = System.Windows.Forms.DockStyle.Top
            ElseIf rdbSet Is rdbLeft Then
                btnDemo.Dock = System.Windows.Forms.DockStyle.Left
            ElseIf rdbSet Is rdbBottom Then
                btnDemo.Dock = System.Windows.Forms.DockStyle.Bottom
            ElseIf rdbSet Is rdbRight Then
                btnDemo.Dock = System.Windows.Forms.DockStyle.Right
            Else ' The default is: if (rdbSet is rbFill)
                btnDemo.Dock = System.Windows.Forms.DockStyle.Fill
            End If

        End Sub

#Region " Windows Form Designer generated code "

        'Required by the Windows Form Designer
        Private components As System.ComponentModel.Container
        Private WithEvents panel1 As System.Windows.Forms.Panel
        Private WithEvents panel2 As System.Windows.Forms.Panel
        Private WithEvents groupBox1 As System.Windows.Forms.GroupBox
        Private WithEvents groupBox2 As System.Windows.Forms.GroupBox
        Private toolTip1 As System.Windows.Forms.ToolTip
        Private WithEvents btnDemo As System.Windows.Forms.Button
        Private WithEvents rdbNone As System.Windows.Forms.RadioButton
        Private WithEvents rdbTop As System.Windows.Forms.RadioButton
        Private WithEvents rdbLeft As System.Windows.Forms.RadioButton
        Private WithEvents rdbBottom As System.Windows.Forms.RadioButton
        Private WithEvents rdbRight As System.Windows.Forms.RadioButton
        Private WithEvents rdbFill As System.Windows.Forms.RadioButton
        Private WithEvents chkTop As System.Windows.Forms.CheckBox
        Private WithEvents chkLeft As System.Windows.Forms.CheckBox
        Private WithEvents chkBottom As System.Windows.Forms.CheckBox
        Private WithEvents chkRight As System.Windows.Forms.CheckBox

        Private WithEvents DockMan As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.rdbRight = New System.Windows.Forms.RadioButton()
            Me.groupBox1 = New System.Windows.Forms.GroupBox()
            Me.chkBottom = New System.Windows.Forms.CheckBox()

            Me.rdbNone = New System.Windows.Forms.RadioButton()
            Me.groupBox2 = New System.Windows.Forms.GroupBox()
            Me.btnDemo = New System.Windows.Forms.Button()
            Me.rdbSet = New System.Windows.Forms.RadioButton()
            Me.toolTip1 = New System.Windows.Forms.ToolTip(components)
            Me.rdbBottom = New System.Windows.Forms.RadioButton()
            Me.rdbTop = New System.Windows.Forms.RadioButton()
            Me.rdbLeft = New System.Windows.Forms.RadioButton()
            Me.chkLeft = New System.Windows.Forms.CheckBox()
            Me.chkTop = New System.Windows.Forms.CheckBox()
            Me.rdbFill = New System.Windows.Forms.RadioButton()
            Me.chkRight = New System.Windows.Forms.CheckBox()
            Me.panel1 = New System.Windows.Forms.Panel()
            Me.panel2 = New System.Windows.Forms.Panel()
            Me.Text = "Docking and Anchoring Example"
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Show
            Me.Location = New System.Drawing.Point(100, 100)
            Me.ClientSize = New System.Drawing.Size(448, 400)

            rdbRight.Location = New System.Drawing.Point(8, 120)
            rdbRight.Size = New System.Drawing.Size(72, 24)
            rdbRight.TabIndex = 4
            rdbRight.Text = "&Right"

            groupBox1.Location = New System.Drawing.Point(16, 16)
            groupBox1.Size = New System.Drawing.Size(88, 128)
            groupBox1.TabIndex = 0
            groupBox1.TabStop = False
            groupBox1.Text = "A&nchor"

            chkBottom.Location = New System.Drawing.Point(8, 72)
            chkBottom.Size = New System.Drawing.Size(72, 24)
            chkBottom.TabIndex = 3
            chkBottom.Text = "&Bottom"

            rdbNone.Location = New System.Drawing.Point(8, 24)
            rdbNone.Size = New System.Drawing.Size(72, 24)
            rdbNone.TabIndex = 5
            rdbNone.TabStop = True
            rdbNone.Text = "&None"
            rdbNone.Checked = True

            groupBox2.Location = New System.Drawing.Point(16, 152)
            groupBox2.Size = New System.Drawing.Size(88, 176)
            groupBox2.TabIndex = 1
            groupBox2.TabStop = False
            groupBox2.Text = "&Dock"

            btnDemo.BackColor = System.Drawing.SystemColors.Control
            toolTip1.SetToolTip(btnDemo, "Nothing happens if you click Me button.")
            btnDemo.FlatStyle = System.Windows.Forms.FlatStyle.Popup
            btnDemo.Size = New System.Drawing.Size(120, 24)
            btnDemo.TabIndex = 0
            btnDemo.Anchor = System.Windows.Forms.AnchorStyles.None
            btnDemo.Location = New System.Drawing.Point(64, 72)
            btnDemo.Text = "Demo Button"

            rdbSet.Size = New System.Drawing.Size(100, 23)
            rdbSet.TabIndex = 0
            rdbSet.Text = "rdbSet"
            toolTip1.Active = True

            rdbBottom.Location = New System.Drawing.Point(8, 96)
            rdbBottom.Size = New System.Drawing.Size(72, 24)
            rdbBottom.TabIndex = 1
            rdbBottom.Text = "&Bottom"

            rdbTop.Location = New System.Drawing.Point(8, 48)
            rdbTop.Size = New System.Drawing.Size(72, 24)
            rdbTop.TabIndex = 0
            rdbTop.Text = "&Top"

            rdbLeft.Location = New System.Drawing.Point(8, 72)
            rdbLeft.Size = New System.Drawing.Size(72, 24)
            rdbLeft.TabIndex = 3
            rdbLeft.Text = "&Left"

            chkLeft.Location = New System.Drawing.Point(8, 48)
            chkLeft.Size = New System.Drawing.Size(72, 24)
            chkLeft.TabIndex = 2
            chkLeft.Text = "&Left"

            chkTop.Location = New System.Drawing.Point(8, 24)
            chkTop.Size = New System.Drawing.Size(72, 24)
            chkTop.TabIndex = 0
            chkTop.Text = "&Top"

            rdbFill.Location = New System.Drawing.Point(8, 144)
            rdbFill.Size = New System.Drawing.Size(72, 24)
            rdbFill.TabIndex = 2
            rdbFill.Text = "&Fill"

            chkRight.Location = New System.Drawing.Point(8, 96)
            chkRight.Size = New System.Drawing.Size(72, 24)
            chkRight.TabIndex = 1
            chkRight.Text = "&Right"

            panel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
            panel1.BackColor = System.Drawing.Color.Green
            panel1.Dock = System.Windows.Forms.DockStyle.Fill
            panel1.Size = New System.Drawing.Size(448, 400)
            panel1.TabIndex = 1
            panel1.Text = "ButtonPanel"

            panel2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
            panel2.Dock = System.Windows.Forms.DockStyle.Right
            toolTip1.SetToolTip(panel2, "Resize the form to see the layout effects.")
            panel2.Location = New System.Drawing.Point(328, 0)
            panel2.Size = New System.Drawing.Size(120, 400)
            panel2.TabIndex = 0
            panel2.Text = "ControlsPanel"
            Me.Controls.Add(panel1)
            Me.Controls.Add(panel2)
            panel1.Controls.Add(btnDemo)
            panel2.Controls.Add(groupBox1)
            panel2.Controls.Add(groupBox2)
            groupBox1.Controls.Add(chkRight)
            groupBox1.Controls.Add(chkBottom)
            groupBox1.Controls.Add(chkLeft)
            groupBox1.Controls.Add(chkTop)
            groupBox2.Controls.Add(rdbBottom)
            groupBox2.Controls.Add(rdbLeft)
            groupBox2.Controls.Add(rdbNone)
            groupBox2.Controls.Add(rdbRight)
            groupBox2.Controls.Add(rdbFill)
            groupBox2.Controls.Add(rdbTop)
        End Sub

#End Region

        'Whenever a checkbox is clicked, apply the changes from all
        'controls.  Note all checkboxes use Me saMe handler.
        Private Sub checkbox_Click(ByVal sender As Object, ByVal e As EventArgs) Handles chkBottom.Click, chkLeft.Click, chkRight.Click, chkTop.Click
            ApplyChanges()
        End Sub

        'Save the radio button that was clicked so we know which one is
        'checked when we apply the changes.  Note, all radio buttons use
        'Me saMe click handler.
        Private Sub radiobutton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles rdbBottom.Click, rdbFill.Click, rdbLeft.Click, rdbRight.Click, rdbTop.Click, rdbNone.Click
            rdbSet = CType(sender, RadioButton)
            ApplyChanges()
        End Sub

    End Class

End Namespace





