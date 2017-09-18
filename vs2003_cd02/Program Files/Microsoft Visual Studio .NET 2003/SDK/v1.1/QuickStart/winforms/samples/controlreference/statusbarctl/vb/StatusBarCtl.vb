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
Imports System.Collections
Imports System.ComponentModel
Imports System.Drawing
Imports System.Resources
Imports System.Windows.Forms

    ' <doc>
    ' <desc>
    '     This class demonstrates the StatusBar control.
    ' </desc>
    ' </doc>
    Public Class StatusBarCtl
        Inherits System.Windows.Forms.Form

        Public Sub New()

            MyBase.New()

            StatusBarCtl = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            comboBox1.SelectedIndex = 0
            comboBox2.SelectedIndex = 1
            trackBar.Maximum = panel1.Width
            trackBar.Minimum = CType(panel1.Width / 2, Integer)
            trackBar.Value = panel1.Width

            'Set the initial state of the Keyboard Status StatusBarPanel
            Me.sbPnlInsOvr.Text = "OVR"
        End Sub


        'Form overrides dispose to clean up the component list.
        Protected Overloads Overrides Sub Dispose(ByVal disposing as Boolean)
            If (disposing) Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub

        Private Sub chkSizingGrip_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles chkSizingGrip.Click
            statusBar.SizingGrip = chkSizingGrip.Checked
        End Sub

        Private Sub chkShowPanels_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles chkShowPanels.Click
            statusBar.ShowPanels = chkShowPanels.Checked
        End Sub

        Private Sub trackBar1_Scroll(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TrackBar.Scroll
            panel1.Width = trackBar.Value
        End Sub

        Private Sub comboBox1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles comboBox1.SelectedIndexChanged
            Me.statusBarPanel1.BorderStyle = CType(comboBox1.SelectedIndex + 1, StatusBarPanelBorderStyle)
        End Sub

        Private Sub statusBarSample_KeyUp(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles chkSizingGrip.KeyUp, TrackBar.KeyUp, comboBox1.KeyUp, chkShowPanels.KeyUp, MyBase.KeyUp
            If e.KeyCode = Keys.Insert Then
                Dim s As String = Me.sbPnlInsOvr.Text
                If s.Equals("INS") Then
                    Me.sbPnlInsOvr.Text = "OVR"
                Else
                    Me.sbPnlInsOvr.Text = "INS"
                End If
            End If

        End Sub

        Private Sub comboBox2_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles comboBox2.SelectedIndexChanged
            sbPnlTime.AutoSize = CType(comboBox2.SelectedIndex + 1, StatusBarPanelAutoSize)
        End Sub

        Private Sub timer1_Timer(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles timer1.Tick
            Dim t As Date = Date.Now
            Dim s As String = t.ToLongTimeString()
            sbPnlTime.Text = s
        End Sub
        Private components As System.ComponentModel.IContainer


#Region " Windows Form Designer generated code "

        'Required by the Windows Form Designer
        Protected WithEvents panel1 As System.Windows.Forms.Panel
        Protected WithEvents groupBox1 As System.Windows.Forms.GroupBox
        Protected WithEvents groupBox2 As System.Windows.Forms.GroupBox
        Protected WithEvents statusBar As System.Windows.Forms.StatusBar
        Protected WithEvents chkSizingGrip As System.Windows.Forms.CheckBox
        Protected statusBarPanel1 As System.Windows.Forms.StatusBarPanel
        Protected WithEvents trackBar As System.Windows.Forms.trackBar
        Protected WithEvents chkShowPanels As System.Windows.Forms.CheckBox
        Protected WithEvents label1 As System.Windows.Forms.Label
        Protected WithEvents label2 As System.Windows.Forms.Label
        Protected WithEvents label4 As System.Windows.Forms.Label
        Protected WithEvents comboBox1 As System.Windows.Forms.ComboBox
        Protected WithEvents groupBox3 As System.Windows.Forms.GroupBox
        Protected WithEvents comboBox2 As System.Windows.Forms.ComboBox
        Protected WithEvents toolTip1 As System.Windows.Forms.ToolTip
        Protected WithEvents timer1 As System.Windows.Forms.Timer
        Protected WithEvents label3 As System.Windows.Forms.Label
        Protected WithEvents label6 As System.Windows.Forms.Label
        Friend sbPnlTime As System.Windows.Forms.StatusBarPanel
        Friend sbPnlInsOvr As System.Windows.Forms.StatusBarPanel

        Private WithEvents StatusBarCtl As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(StatusBarCtl))
        Me.label3 = New System.Windows.Forms.Label()
        Me.chkSizingGrip = New System.Windows.Forms.CheckBox()
        Me.comboBox1 = New System.Windows.Forms.ComboBox()
        Me.timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.trackBar = New System.Windows.Forms.TrackBar()
        Me.comboBox2 = New System.Windows.Forms.ComboBox()
        Me.statusBar = New System.Windows.Forms.StatusBar()
        Me.sbPnlTime = New System.Windows.Forms.StatusBarPanel()
        Me.sbPnlInsOvr = New System.Windows.Forms.StatusBarPanel()
        Me.toolTip1 = New System.Windows.Forms.ToolTip(Me.components)
        Me.chkShowPanels = New System.Windows.Forms.CheckBox()
        Me.groupBox1 = New System.Windows.Forms.GroupBox()
        Me.label6 = New System.Windows.Forms.Label()
        Me.label4 = New System.Windows.Forms.Label()
        Me.groupBox3 = New System.Windows.Forms.GroupBox()
        Me.label2 = New System.Windows.Forms.Label()
        Me.groupBox2 = New System.Windows.Forms.GroupBox()
        Me.label1 = New System.Windows.Forms.Label()
        Me.panel1 = New System.Windows.Forms.Panel()
        Me.statusBarPanel1 = New System.Windows.Forms.StatusBarPanel()
        CType(Me.trackBar, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.sbPnlTime, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.sbPnlInsOvr, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.groupBox1.SuspendLayout()
        Me.panel1.SuspendLayout()
        CType(Me.statusBarPanel1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'label3
        '
        Me.label3.AutoSize = True
        Me.label3.Location = New System.Drawing.Point(26, 64)
        Me.label3.Name = "label3"
        Me.label3.Size = New System.Drawing.Size(122, 13)
        Me.label3.TabIndex = 6
        Me.label3.Text = "Ready StatusBarPanel "
        '
        'chkSizingGrip
        '
        Me.chkSizingGrip.Checked = True
        Me.chkSizingGrip.CheckState = System.Windows.Forms.CheckState.Checked
        Me.chkSizingGrip.Location = New System.Drawing.Point(16, 16)
        Me.chkSizingGrip.Name = "chkSizingGrip"
        Me.chkSizingGrip.Size = New System.Drawing.Size(100, 16)
        Me.chkSizingGrip.TabIndex = 8
        Me.chkSizingGrip.Text = "Sizing&Grip"
        Me.toolTip1.SetToolTip(Me.chkSizingGrip, "Determines whether a status bar has a sizing grip.")
        '
        'comboBox1
        '
        Me.comboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.comboBox1.DropDownWidth = 104
        Me.comboBox1.ForeColor = System.Drawing.SystemColors.WindowText
        Me.comboBox1.Items.AddRange(New Object() {"None", "Raised", "Sunken"})
        Me.comboBox1.Location = New System.Drawing.Point(128, 88)
        Me.comboBox1.Name = "comboBox1"
        Me.comboBox1.Size = New System.Drawing.Size(104, 21)
        Me.comboBox1.TabIndex = 3
        Me.toolTip1.SetToolTip(Me.comboBox1, "Determines what type of border a panel has.")
        '
        'timer1
        '
        Me.timer1.Enabled = True
        Me.timer1.Interval = 1000
        '
        'trackBar
        '
        Me.trackBar.BackColor = System.Drawing.SystemColors.Control
        Me.trackBar.Location = New System.Drawing.Point(16, 208)
        Me.trackBar.Name = "trackBar"
        Me.trackBar.Size = New System.Drawing.Size(216, 42)
        Me.trackBar.SmallChange = 10
        Me.trackBar.TabIndex = 10
        Me.trackBar.TabStop = False
        Me.trackBar.Text = "trackBar"
        Me.trackBar.TickFrequency = 10
        '
        'comboBox2
        '
        Me.comboBox2.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.comboBox2.DropDownWidth = 104
        Me.comboBox2.ForeColor = System.Drawing.SystemColors.WindowText
        Me.comboBox2.Items.AddRange(New Object() {"None", "Spring", "Contents"})
        Me.comboBox2.Location = New System.Drawing.Point(128, 144)
        Me.comboBox2.Name = "comboBox2"
        Me.comboBox2.Size = New System.Drawing.Size(104, 21)
        Me.comboBox2.TabIndex = 5
        Me.toolTip1.SetToolTip(Me.comboBox2, "Determines how a panel will resize when the prent changes size.")
        '
        'statusBar
        '
        Me.statusBar.Location = New System.Drawing.Point(0, 216)
        Me.statusBar.Name = "statusBar"
        Me.statusBar.Panels.AddRange(New System.Windows.Forms.StatusBarPanel() {Me.statusBarPanel1, Me.sbPnlTime, Me.sbPnlInsOvr})
        Me.statusBar.ShowPanels = True
        Me.statusBar.Size = New System.Drawing.Size(212, 20)
        Me.statusBar.TabIndex = 0
        Me.statusBar.Text = "StatusBar"
        '
        'sbPnlTime
        '
        Me.sbPnlTime.Text = "sbPnlTime"
        '
        'sbPnlInsOvr
        '
        Me.sbPnlInsOvr.Text = "sbPnlInsOvr"
        '
        'chkShowPanels
        '
        Me.chkShowPanels.Checked = True
        Me.chkShowPanels.CheckState = System.Windows.Forms.CheckState.Checked
        Me.chkShowPanels.Location = New System.Drawing.Point(16, 40)
        Me.chkShowPanels.Name = "chkShowPanels"
        Me.chkShowPanels.Size = New System.Drawing.Size(96, 16)
        Me.chkShowPanels.TabIndex = 9
        Me.chkShowPanels.Text = "Show&Panels"
        Me.toolTip1.SetToolTip(Me.chkShowPanels, "Determines if a status bar displays panels, or if it displays a single line of te" & _
        "xt.")
        '
        'groupBox1
        '
        Me.groupBox1.Controls.AddRange(New System.Windows.Forms.Control() {Me.trackBar, Me.label6, Me.label3, Me.comboBox2, Me.label4, Me.groupBox3, Me.comboBox1, Me.label2, Me.groupBox2, Me.label1, Me.chkShowPanels, Me.chkSizingGrip})
        Me.groupBox1.Location = New System.Drawing.Point(248, 16)
        Me.groupBox1.Name = "groupBox1"
        Me.groupBox1.Size = New System.Drawing.Size(248, 264)
        Me.groupBox1.TabIndex = 1
        Me.groupBox1.TabStop = False
        Me.groupBox1.Text = "StatusBar"
        '
        'label6
        '
        Me.label6.AutoSize = True
        Me.label6.Location = New System.Drawing.Point(26, 120)
        Me.label6.Name = "label6"
        Me.label6.Size = New System.Drawing.Size(111, 13)
        Me.label6.TabIndex = 4
        Me.label6.Text = "Time StatusBarPanel"
        '
        'label4
        '
        Me.label4.Location = New System.Drawing.Point(16, 144)
        Me.label4.Name = "label4"
        Me.label4.Size = New System.Drawing.Size(72, 16)
        Me.label4.TabIndex = 7
        Me.label4.Text = "&AutoSize"
        '
        'groupBox3
        '
        Me.groupBox3.Location = New System.Drawing.Point(16, 120)
        Me.groupBox3.Name = "groupBox3"
        Me.groupBox3.Size = New System.Drawing.Size(216, 8)
        Me.groupBox3.TabIndex = 2
        Me.groupBox3.TabStop = False
        '
        'label2
        '
        Me.label2.Location = New System.Drawing.Point(16, 88)
        Me.label2.Name = "label2"
        Me.label2.Size = New System.Drawing.Size(64, 16)
        Me.label2.TabIndex = 0
        Me.label2.Text = "&BorderStyle"
        '
        'groupBox2
        '
        Me.groupBox2.Location = New System.Drawing.Point(16, 64)
        Me.groupBox2.Name = "groupBox2"
        Me.groupBox2.Size = New System.Drawing.Size(216, 8)
        Me.groupBox2.TabIndex = 11
        Me.groupBox2.TabStop = False
        '
        'label1
        '
        Me.label1.Location = New System.Drawing.Point(16, 184)
        Me.label1.Name = "label1"
        Me.label1.Size = New System.Drawing.Size(72, 16)
        Me.label1.TabIndex = 1
        Me.label1.Text = "Panel Width:"
        '
        'panel1
        '
        Me.panel1.BackColor = System.Drawing.SystemColors.Window
        Me.panel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.panel1.Controls.AddRange(New System.Windows.Forms.Control() {Me.statusBar})
        Me.panel1.Location = New System.Drawing.Point(16, 24)
        Me.panel1.Name = "panel1"
        Me.panel1.Size = New System.Drawing.Size(216, 240)
        Me.panel1.TabIndex = 0
        Me.panel1.Text = "Panel1"
        '
        'statusBarPanel1
        '
        Me.statusBarPanel1.AutoSize = System.Windows.Forms.StatusBarPanelAutoSize.Contents
        Me.statusBarPanel1.BorderStyle = System.Windows.Forms.StatusBarPanelBorderStyle.None
        Me.statusBarPanel1.Icon = CType(resources.GetObject("statusBarPanel1.Icon"), System.Drawing.Icon)
        Me.statusBarPanel1.Text = "Ready"
        Me.statusBarPanel1.Width = 62
        '
        'StatusBarCtl
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(504, 293)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.groupBox1, Me.panel1})
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "StatusBarCtl"
        Me.Text = "StatusBar"
        CType(Me.trackBar, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.sbPnlTime, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.sbPnlInsOvr, System.ComponentModel.ISupportInitialize).EndInit()
        Me.groupBox1.ResumeLayout(False)
        Me.panel1.ResumeLayout(False)
        CType(Me.statusBarPanel1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

#End Region


        ' The main entry point for the application.
        <STAThread()> Public Shared Sub Main()
            Application.Run(New StatusBarCtl())
        End Sub


    End Class


