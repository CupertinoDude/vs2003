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
Imports System.Diagnostics
Imports System.Drawing
Imports System.Windows.Forms
Imports System.Resources



Public Class ToolTipCtl
    Inherits System.Windows.Forms.Form

    Private toolTips() As String = {"Open", "New", "Save", "Cut", "Copy", "Paste"}
    Private picts As PictureBox() = Nothing

    Public Sub New()

        MyBase.New()

        ToolTipCtl = Me

        'This call is required by the Windows Forms Designer.
        InitializeComponent()

        picts = New PictureBox(5) {}
        picts(0) = pictureBox1
        picts(1) = pictureBox2
        picts(2) = pictureBox3
        picts(3) = pictureBox4
        picts(4) = pictureBox5
        picts(5) = pictureBox6

        ' Initialize all property ComboBox selections
        cmbAutomaticDelay.SelectedIndex = 1
        cmbAutoPopDelay.SelectedIndex = 1
        cmbInitialDelay.SelectedIndex = 1
        cmbReshowDelay.SelectedIndex = 1

        ' Set the images for the PictureBoxes
        SetImages()

        ' Set the tooltips for the PictureBoxes
        SetToolTips()

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

    Private Sub SetImages()
        Debug.Assert(picts.Length >= imageList1.Images.Count, "Not enough PictureBoxes")
        Dim i As Integer

        For i = 0 To imageList1.Images.Count - 1
            picts(i).Image = imageList1.Images(i)
        Next i

    End Sub

    Private Sub SetToolTips()
        Debug.Assert(toolTips.Length >= picts.Length, "Not enough tooltip text")
        Dim i As Integer

        For i = 0 To picts.Length - 1
            toolTip.SetToolTip(picts(i), toolTips(i))
        Next i

    End Sub

    ' Since rdbActivateTrue and rdbActivateFalse are in the same container in the
    ' form designer, their states will be mutually exclusive.  We can use the same
    ' code to handle their checkedChanged events.
    Private Sub RdbActivate_checkedChanged(ByVal [source] As System.Object, ByVal e As System.EventArgs) Handles rdbActivateFalse.CheckedChanged, rdbActivateTrue.CheckedChanged
        Dim isTrue As Boolean = rdbActivateTrue.Checked
        toolTip.Active = isTrue
    End Sub

    ' Since rdbShowAlwaysTrue and rdbShowAlwaysFalse are in the same container in the
    ' form designer, their states will be mutually exclusive.  We can use the same
    ' code to handle their checkedChanged events.
    Private Sub RdbShowAlways_checkedChanged(ByVal [source] As System.Object, ByVal e As System.EventArgs) Handles rdbShowAlwaysFalse.CheckedChanged, rdbShowAlwaysTrue.CheckedChanged
        Dim isTrue As Boolean = rdbShowAlwaysTrue.Checked
        toolTip.ShowAlways = isTrue
    End Sub

    ' Helper routine to retrieve the integer value of the selected item in
    ' a ComboBox object passed to it.
    Private Shared Function GetCmbIntValue(ByVal combo As Object) As Integer
        Dim cmb As ComboBox = CType(combo, ComboBox)
        Return Integer.Parse(CStr(cmb.SelectedItem))
    End Function

    Private Sub CmbAutomaticDelay_selectedIndexChanged(ByVal [source] As System.Object, ByVal e As System.EventArgs) Handles cmbAutomaticDelay.SelectedIndexChanged
        Try
            toolTip.AutomaticDelay = GetCmbIntValue([source])
        Catch
        End Try
    End Sub

    Private Sub CmbAutoPopDelay_selectedIndexChanged(ByVal [source] As System.Object, ByVal e As System.EventArgs) Handles cmbAutoPopDelay.SelectedIndexChanged
        Try
            toolTip.AutoPopDelay = GetCmbIntValue([source])
        Catch
        End Try
    End Sub

    Private Sub CmbInitialDelay_selectedIndexChanged(ByVal [source] As System.Object, ByVal e As System.EventArgs) Handles cmbInitialDelay.SelectedIndexChanged
        Try
            toolTip.InitialDelay = GetCmbIntValue([source])
        Catch
        End Try
    End Sub

    Private Sub CmbReshowDelay_selectedIndexChanged(ByVal [source] As System.Object, ByVal e As System.EventArgs) Handles cmbReshowDelay.SelectedIndexChanged
        Try
            toolTip.ReshowDelay = GetCmbIntValue([source])
        Catch
        End Try
    End Sub

    Private Sub BtnChange_click(ByVal [source] As System.Object, ByVal e As System.EventArgs) Handles btnChange.Click
        Dim dlg As New ChangeToolTips(imageList1, toolTips)
        Dim res As DialogResult = dlg.ShowDialog()
        If res = DialogResult.Cancel Then

            Return
        Else
            toolTips = dlg.GetToolTips()
            SetToolTips()
        End If
    End Sub
    Private components As System.ComponentModel.IContainer


#Region " Windows Form Designer generated code "

    'Required by the Windows Form Designer
    Protected WithEvents toolTip As System.Windows.Forms.ToolTip
    Protected WithEvents groupBox1 As System.Windows.Forms.GroupBox
    Protected WithEvents rdbActivateTrue As System.Windows.Forms.RadioButton
    Protected WithEvents rdbActivateFalse As System.Windows.Forms.RadioButton
    Protected WithEvents grpActivate As System.Windows.Forms.GroupBox
    Protected WithEvents grpShowAlways As System.Windows.Forms.GroupBox
    Protected WithEvents rdbShowAlwaysFalse As System.Windows.Forms.RadioButton
    Protected WithEvents rdbShowAlwaysTrue As System.Windows.Forms.RadioButton
    Protected WithEvents label1 As System.Windows.Forms.Label
    Protected WithEvents label2 As System.Windows.Forms.Label
    Protected WithEvents label3 As System.Windows.Forms.Label
    Protected WithEvents label4 As System.Windows.Forms.Label
    Protected WithEvents cmbAutomaticDelay As System.Windows.Forms.ComboBox
    Protected WithEvents cmbAutoPopDelay As System.Windows.Forms.ComboBox
    Protected WithEvents cmbInitialDelay As System.Windows.Forms.ComboBox
    Protected WithEvents cmbReshowDelay As System.Windows.Forms.ComboBox
    Protected WithEvents panel As System.Windows.Forms.Panel
    Protected toolBarButton1 As System.Windows.Forms.ToolBarButton
    Protected toolBarButton2 As System.Windows.Forms.ToolBarButton
    Protected toolBarButton3 As System.Windows.Forms.ToolBarButton
    Protected toolBarButton4 As System.Windows.Forms.ToolBarButton
    Protected toolBarButton5 As System.Windows.Forms.ToolBarButton
    Protected WithEvents pictureBox1 As System.Windows.Forms.PictureBox
    Protected WithEvents pictureBox2 As System.Windows.Forms.PictureBox
    Protected WithEvents pictureBox3 As System.Windows.Forms.PictureBox
    Protected WithEvents pictureBox4 As System.Windows.Forms.PictureBox
    Protected WithEvents pictureBox5 As System.Windows.Forms.PictureBox
    Protected WithEvents imageList1 As System.Windows.Forms.ImageList
    Protected WithEvents pictureBox6 As System.Windows.Forms.PictureBox
    Protected WithEvents propertyTips As System.Windows.Forms.ToolTip
    Protected WithEvents btnChange As System.Windows.Forms.Button

    Private WithEvents ToolTipCtl As System.Windows.Forms.Form

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.
    'Do not modify it using the code editor.
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(ToolTipCtl))
        Me.groupBox1 = New System.Windows.Forms.GroupBox()
        Me.cmbReshowDelay = New System.Windows.Forms.ComboBox()
        Me.cmbInitialDelay = New System.Windows.Forms.ComboBox()
        Me.cmbAutoPopDelay = New System.Windows.Forms.ComboBox()
        Me.cmbAutomaticDelay = New System.Windows.Forms.ComboBox()
        Me.label4 = New System.Windows.Forms.Label()
        Me.label3 = New System.Windows.Forms.Label()
        Me.label2 = New System.Windows.Forms.Label()
        Me.label1 = New System.Windows.Forms.Label()
        Me.grpShowAlways = New System.Windows.Forms.GroupBox()
        Me.rdbShowAlwaysFalse = New System.Windows.Forms.RadioButton()
        Me.rdbShowAlwaysTrue = New System.Windows.Forms.RadioButton()
        Me.grpActivate = New System.Windows.Forms.GroupBox()
        Me.rdbActivateFalse = New System.Windows.Forms.RadioButton()
        Me.rdbActivateTrue = New System.Windows.Forms.RadioButton()
        Me.toolTip = New System.Windows.Forms.ToolTip(Me.components)
        Me.panel = New System.Windows.Forms.Panel()
        Me.pictureBox6 = New System.Windows.Forms.PictureBox()
        Me.pictureBox5 = New System.Windows.Forms.PictureBox()
        Me.pictureBox4 = New System.Windows.Forms.PictureBox()
        Me.pictureBox3 = New System.Windows.Forms.PictureBox()
        Me.pictureBox2 = New System.Windows.Forms.PictureBox()
        Me.pictureBox1 = New System.Windows.Forms.PictureBox()
        Me.toolBarButton3 = New System.Windows.Forms.ToolBarButton()
        Me.propertyTips = New System.Windows.Forms.ToolTip(Me.components)
        Me.toolBarButton2 = New System.Windows.Forms.ToolBarButton()
        Me.btnChange = New System.Windows.Forms.Button()
        Me.toolBarButton1 = New System.Windows.Forms.ToolBarButton()
        Me.toolBarButton5 = New System.Windows.Forms.ToolBarButton()
        Me.imageList1 = New System.Windows.Forms.ImageList(Me.components)
        Me.toolBarButton4 = New System.Windows.Forms.ToolBarButton()
        Me.groupBox1.SuspendLayout()
        Me.grpShowAlways.SuspendLayout()
        Me.grpActivate.SuspendLayout()
        Me.panel.SuspendLayout()
        Me.SuspendLayout()
        '
        'groupBox1
        '
        Me.groupBox1.Controls.AddRange(New System.Windows.Forms.Control() {Me.cmbReshowDelay, Me.cmbInitialDelay, Me.cmbAutoPopDelay, Me.cmbAutomaticDelay, Me.label4, Me.label3, Me.label2, Me.label1, Me.grpShowAlways, Me.grpActivate})
        Me.groupBox1.Location = New System.Drawing.Point(248, 16)
        Me.groupBox1.Name = "groupBox1"
        Me.groupBox1.Size = New System.Drawing.Size(248, 264)
        Me.groupBox1.TabIndex = 2
        Me.groupBox1.TabStop = False
        Me.groupBox1.Text = "ToolTip"
        '
        'cmbReshowDelay
        '
        Me.cmbReshowDelay.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cmbReshowDelay.ForeColor = System.Drawing.SystemColors.WindowText
        Me.cmbReshowDelay.Items.AddRange(New Object() {"50", "100", "200", "300", "500", "1000"})
        Me.cmbReshowDelay.Location = New System.Drawing.Point(112, 184)
        Me.cmbReshowDelay.Name = "cmbReshowDelay"
        Me.cmbReshowDelay.Size = New System.Drawing.Size(121, 21)
        Me.cmbReshowDelay.TabIndex = 9
        Me.toolTip.SetToolTip(Me.cmbReshowDelay, "The period, in milliseconds, that must transpire before subsequent tooltip window" & _
        "s appear as the mouse pointer moves from one tooltip region to another")
        '
        'cmbInitialDelay
        '
        Me.cmbInitialDelay.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cmbInitialDelay.ForeColor = System.Drawing.SystemColors.WindowText
        Me.cmbInitialDelay.Items.AddRange(New Object() {"250", "500", "750", "1000", "5000"})
        Me.cmbInitialDelay.Location = New System.Drawing.Point(112, 160)
        Me.cmbInitialDelay.Name = "cmbInitialDelay"
        Me.cmbInitialDelay.Size = New System.Drawing.Size(121, 21)
        Me.cmbInitialDelay.TabIndex = 7
        Me.toolTip.SetToolTip(Me.cmbInitialDelay, "The period of time, in milliseconds, that the mouse pointer must remain stationar" & _
        "y within the tooltip region before the tooltip text is displayed")
        '
        'cmbAutoPopDelay
        '
        Me.cmbAutoPopDelay.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cmbAutoPopDelay.ForeColor = System.Drawing.SystemColors.WindowText
        Me.cmbAutoPopDelay.Items.AddRange(New Object() {"2500", "5000", "7500", "10000"})
        Me.cmbAutoPopDelay.Location = New System.Drawing.Point(112, 136)
        Me.cmbAutoPopDelay.Name = "cmbAutoPopDelay"
        Me.cmbAutoPopDelay.Size = New System.Drawing.Size(121, 21)
        Me.cmbAutoPopDelay.TabIndex = 4
        Me.toolTip.SetToolTip(Me.cmbAutoPopDelay, "The period of time, in milliseconds, that the tooltip remains visible when the mo" & _
        "use pointer is stationary within the tooltip region")
        '
        'cmbAutomaticDelay
        '
        Me.cmbAutomaticDelay.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cmbAutomaticDelay.ForeColor = System.Drawing.SystemColors.WindowText
        Me.cmbAutomaticDelay.Items.AddRange(New Object() {"250", "500", "750", "1000"})
        Me.cmbAutomaticDelay.Location = New System.Drawing.Point(112, 112)
        Me.cmbAutomaticDelay.Name = "cmbAutomaticDelay"
        Me.cmbAutomaticDelay.Size = New System.Drawing.Size(121, 21)
        Me.cmbAutomaticDelay.TabIndex = 3
        Me.toolTip.SetToolTip(Me.cmbAutomaticDelay, "The amount of time in milliseconds that passes before the tooltip is displayed")
        '
        'label4
        '
        Me.label4.Location = New System.Drawing.Point(16, 186)
        Me.label4.Name = "label4"
        Me.label4.Size = New System.Drawing.Size(88, 16)
        Me.label4.TabIndex = 8
        Me.label4.Text = "reshowDelay:"
        '
        'label3
        '
        Me.label3.Location = New System.Drawing.Point(16, 162)
        Me.label3.Name = "label3"
        Me.label3.Size = New System.Drawing.Size(88, 16)
        Me.label3.TabIndex = 6
        Me.label3.Text = "initialDelay"
        '
        'label2
        '
        Me.label2.Location = New System.Drawing.Point(16, 138)
        Me.label2.Name = "label2"
        Me.label2.Size = New System.Drawing.Size(88, 16)
        Me.label2.TabIndex = 5
        Me.label2.Text = "autoPopDelay"
        '
        'label1
        '
        Me.label1.Location = New System.Drawing.Point(16, 114)
        Me.label1.Name = "label1"
        Me.label1.Size = New System.Drawing.Size(88, 16)
        Me.label1.TabIndex = 2
        Me.label1.Text = "automaticDelay:"
        '
        'grpShowAlways
        '
        Me.grpShowAlways.Controls.AddRange(New System.Windows.Forms.Control() {Me.rdbShowAlwaysFalse, Me.rdbShowAlwaysTrue})
        Me.grpShowAlways.Location = New System.Drawing.Point(16, 58)
        Me.grpShowAlways.Name = "grpShowAlways"
        Me.grpShowAlways.Size = New System.Drawing.Size(216, 40)
        Me.grpShowAlways.TabIndex = 1
        Me.grpShowAlways.TabStop = False
        Me.grpShowAlways.Text = "showAlways"
        '
        'rdbShowAlwaysFalse
        '
        Me.rdbShowAlwaysFalse.Checked = True
        Me.rdbShowAlwaysFalse.Location = New System.Drawing.Point(112, 16)
        Me.rdbShowAlwaysFalse.Name = "rdbShowAlwaysFalse"
        Me.rdbShowAlwaysFalse.Size = New System.Drawing.Size(80, 16)
        Me.rdbShowAlwaysFalse.TabIndex = 1
        Me.rdbShowAlwaysFalse.TabStop = True
        Me.rdbShowAlwaysFalse.Text = "false"
        Me.toolTip.SetToolTip(Me.rdbShowAlwaysFalse, "Indicates whether the tooltip window is displayed even when its parent control is" & _
        " not active")
        '
        'rdbShowAlwaysTrue
        '
        Me.rdbShowAlwaysTrue.Location = New System.Drawing.Point(8, 16)
        Me.rdbShowAlwaysTrue.Name = "rdbShowAlwaysTrue"
        Me.rdbShowAlwaysTrue.Size = New System.Drawing.Size(88, 16)
        Me.rdbShowAlwaysTrue.TabIndex = 0
        Me.rdbShowAlwaysTrue.Text = "true"
        Me.toolTip.SetToolTip(Me.rdbShowAlwaysTrue, "Indicates whether the tooltip window is displayed even when its parent control is" & _
        " not active")
        '
        'grpActivate
        '
        Me.grpActivate.Controls.AddRange(New System.Windows.Forms.Control() {Me.rdbActivateFalse, Me.rdbActivateTrue})
        Me.grpActivate.Location = New System.Drawing.Point(16, 16)
        Me.grpActivate.Name = "grpActivate"
        Me.grpActivate.Size = New System.Drawing.Size(216, 40)
        Me.grpActivate.TabIndex = 0
        Me.grpActivate.TabStop = False
        Me.grpActivate.Text = "Active"
        '
        'rdbActivateFalse
        '
        Me.rdbActivateFalse.Location = New System.Drawing.Point(112, 16)
        Me.rdbActivateFalse.Name = "rdbActivateFalse"
        Me.rdbActivateFalse.Size = New System.Drawing.Size(80, 16)
        Me.rdbActivateFalse.TabIndex = 1
        Me.rdbActivateFalse.Text = "false"
        Me.toolTip.SetToolTip(Me.rdbActivateFalse, "Indicates whether the ToolTip control is currently active")
        '
        'rdbActivateTrue
        '
        Me.rdbActivateTrue.Checked = True
        Me.rdbActivateTrue.Location = New System.Drawing.Point(8, 16)
        Me.rdbActivateTrue.Name = "rdbActivateTrue"
        Me.rdbActivateTrue.Size = New System.Drawing.Size(88, 16)
        Me.rdbActivateTrue.TabIndex = 0
        Me.rdbActivateTrue.TabStop = True
        Me.rdbActivateTrue.Text = "true"
        Me.toolTip.SetToolTip(Me.rdbActivateTrue, "Indicates whether the ToolTip control is currently active")
        '
        'panel
        '
        Me.panel.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.panel.Controls.AddRange(New System.Windows.Forms.Control() {Me.pictureBox6, Me.pictureBox5, Me.pictureBox4, Me.pictureBox3, Me.pictureBox2, Me.pictureBox1})
        Me.panel.Location = New System.Drawing.Point(24, 24)
        Me.panel.Name = "panel"
        Me.panel.Size = New System.Drawing.Size(208, 40)
        Me.panel.TabIndex = 0
        Me.panel.Text = "panel1"
        '
        'pictureBox6
        '
        Me.pictureBox6.Location = New System.Drawing.Point(108, 7)
        Me.pictureBox6.Name = "pictureBox6"
        Me.pictureBox6.Size = New System.Drawing.Size(20, 20)
        Me.pictureBox6.TabIndex = 0
        Me.pictureBox6.TabStop = False
        Me.pictureBox6.Text = "pictureBox1"
        '
        'pictureBox5
        '
        Me.pictureBox5.Location = New System.Drawing.Point(88, 7)
        Me.pictureBox5.Name = "pictureBox5"
        Me.pictureBox5.Size = New System.Drawing.Size(20, 20)
        Me.pictureBox5.TabIndex = 1
        Me.pictureBox5.TabStop = False
        Me.pictureBox5.Text = "pictureBox1"
        '
        'pictureBox4
        '
        Me.pictureBox4.Location = New System.Drawing.Point(68, 7)
        Me.pictureBox4.Name = "pictureBox4"
        Me.pictureBox4.Size = New System.Drawing.Size(20, 20)
        Me.pictureBox4.TabIndex = 2
        Me.pictureBox4.TabStop = False
        Me.pictureBox4.Text = "pictureBox1"
        '
        'pictureBox3
        '
        Me.pictureBox3.Location = New System.Drawing.Point(48, 7)
        Me.pictureBox3.Name = "pictureBox3"
        Me.pictureBox3.Size = New System.Drawing.Size(20, 20)
        Me.pictureBox3.TabIndex = 3
        Me.pictureBox3.TabStop = False
        Me.pictureBox3.Text = "pictureBox1"
        '
        'pictureBox2
        '
        Me.pictureBox2.Location = New System.Drawing.Point(28, 7)
        Me.pictureBox2.Name = "pictureBox2"
        Me.pictureBox2.Size = New System.Drawing.Size(20, 20)
        Me.pictureBox2.TabIndex = 4
        Me.pictureBox2.TabStop = False
        Me.pictureBox2.Text = "pictureBox1"
        '
        'pictureBox1
        '
        Me.pictureBox1.Location = New System.Drawing.Point(8, 7)
        Me.pictureBox1.Name = "pictureBox1"
        Me.pictureBox1.Size = New System.Drawing.Size(20, 20)
        Me.pictureBox1.TabIndex = 5
        Me.pictureBox1.TabStop = False
        Me.pictureBox1.Text = "pictureBox1"
        '
        'toolBarButton3
        '
        Me.toolBarButton3.ImageIndex = 2
        Me.toolBarButton3.Text = "toolBarButton3"
        '
        'toolBarButton2
        '
        Me.toolBarButton2.ImageIndex = 1
        Me.toolBarButton2.Text = "toolBarButton2"
        '
        'btnChange
        '
        Me.btnChange.Location = New System.Drawing.Point(264, 240)
        Me.btnChange.Name = "btnChange"
        Me.btnChange.Size = New System.Drawing.Size(120, 23)
        Me.btnChange.TabIndex = 1
        Me.btnChange.Text = "&Change ToolTips..."
        '
        'toolBarButton1
        '
        Me.toolBarButton1.ImageIndex = 0
        Me.toolBarButton1.Text = "toolBarButton1"
        '
        'toolBarButton5
        '
        Me.toolBarButton5.ImageIndex = 5
        Me.toolBarButton5.Text = "toolBarButton5"
        '
        'imageList1
        '
        Me.imageList1.ColorDepth = System.Windows.Forms.ColorDepth.Depth8Bit
        Me.imageList1.ImageSize = New System.Drawing.Size(16, 15)
        Me.imageList1.ImageStream = CType(resources.GetObject("imageList1.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.imageList1.TransparentColor = System.Drawing.Color.Transparent
        '
        'toolBarButton4
        '
        Me.toolBarButton4.ImageIndex = 3
        Me.toolBarButton4.Text = "toolBarButton4"
        '
        'ToolTipCtl
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(504, 273)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.btnChange, Me.panel, Me.groupBox1})
        Me.Name = "ToolTipCtl"
        Me.Text = "ToolTip"
        Me.groupBox1.ResumeLayout(False)
        Me.grpShowAlways.ResumeLayout(False)
        Me.grpActivate.ResumeLayout(False)
        Me.panel.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region


    ' The main entry point for the application.
    <STAThread()> Public Shared Sub Main()
        Application.Run(New ToolTipCtl())
    End Sub


End Class

