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
Imports System.Windows.Forms
Imports System.Resources

    ' <doc>
    ' <desc>
    '     This class demonstrates the TabControl control.
    '
    '     Typically the contents of each page are encapsulated
    '     in a UserControl however for this simple example the
    '     contents of all pages are defined directly in this
    '     form.
    '
    '     TabPages can either be added at designtime or runtime
    '     The main MiscUI file shows an example of how to add pages
    '     dynamically at runtime
    '
    ' </desc>
    ' </doc>
    '
    Public Class TabControlCtl
        Inherits System.Windows.Forms.Form

        Public Sub New()

            MyBase.New()

            TabControlCtl = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            appearanceComboBox.SelectedIndex = 0
            alignmentComboBox.SelectedIndex = 0
            sizeModeComboBox.SelectedIndex = 0
            tabControl1.ImageList = Nothing

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

    Protected Sub checkBox1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles checkBox1.Click
        Me.tabControl1.Multiline = checkBox1.Checked
        alignmentComboBox_SelectedIndexChanged(Nothing, EventArgs.Empty)
    End Sub

    Protected Sub checkBox2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles checkBox2.Click
        Me.tabControl1.HotTrack = checkBox2.Checked
    End Sub

    Protected Sub checkBox3_Click(ByVal sender As Object, ByVal e As EventArgs) Handles checkBox3.Click
        If checkBox3.Checked Then
            tabControl1.ImageList = imageList1
        Else
            tabControl1.ImageList = Nothing
        End If

    End Sub

    Protected Sub appearanceComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles appearanceComboBox.SelectedIndexChanged
        Dim index As Integer = appearanceComboBox.SelectedIndex
        If index = 0 Then
            tabControl1.Appearance = TabAppearance.Normal
        Else
            If index = 1 Then
                tabControl1.Appearance = TabAppearance.Buttons
            Else
                tabControl1.Appearance = TabAppearance.FlatButtons
            End If
        End If
        tabControl1.PerformLayout()

    End Sub

    Protected Sub alignmentComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles alignmentComboBox.SelectedIndexChanged
        Dim index As Integer = alignmentComboBox.SelectedIndex
        If index = 0 Then
            tabControl1.Alignment = TabAlignment.Top
        Else
            If index = 1 Then
                tabControl1.Alignment = TabAlignment.Bottom
            Else
                If index = 2 Then
                    tabControl1.Alignment = TabAlignment.Left
                Else
                    tabControl1.Alignment = TabAlignment.Right
                End If

            End If
        End If
    End Sub

    Protected Sub sizeModeComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles sizeModeComboBox.SelectedIndexChanged
        Dim index As Integer = sizeModeComboBox.SelectedIndex
        If index = 0 Then
            tabControl1.SizeMode = TabSizeMode.Normal
        Else
            If index = 1 Then
                tabControl1.SizeMode = TabSizeMode.FillToRight
            Else
                tabControl1.SizeMode = TabSizeMode.Fixed

            End If
        End If

    End Sub

    Protected Sub trackBar_Scroll(ByVal sender As Object, ByVal e As EventArgs) Handles trackBar.Scroll
        tabControl1.Width = trackBar.Value
    End Sub
    Private components As System.ComponentModel.IContainer


#Region " Windows Form Designer generated code "

    'Required by the Windows Form Designer
    Protected WithEvents tp5DomainUpDown1 As System.Windows.Forms.DomainUpDown
    Protected WithEvents tp5GroupBox1 As System.Windows.Forms.GroupBox
    Protected WithEvents tp4ComboBox1 As System.Windows.Forms.ComboBox
    Protected WithEvents tp4UpDown1 As System.Windows.Forms.NumericUpDown
    Protected WithEvents tp4GroupBox1 As System.Windows.Forms.GroupBox
    Protected WithEvents tp3ComboBox1 As System.Windows.Forms.ComboBox
    Protected WithEvents tp3RadioButton1 As System.Windows.Forms.RadioButton
    Protected WithEvents tp3RadioButton2 As System.Windows.Forms.RadioButton
    Protected WithEvents tp3ComboBox2 As System.Windows.Forms.ComboBox
    Protected WithEvents tp3Label1 As System.Windows.Forms.Label
    Protected WithEvents tp3Button1 As System.Windows.Forms.Button
    Protected WithEvents tp3GroupBox1 As System.Windows.Forms.GroupBox
    Protected WithEvents tabPage5 As System.Windows.Forms.TabPage
    Protected WithEvents tabPage4 As System.Windows.Forms.TabPage
    Protected WithEvents tabPage3 As System.Windows.Forms.TabPage
    Protected WithEvents tp2ComboBox1 As System.Windows.Forms.ComboBox
    Protected WithEvents tp2RadioButton1 As System.Windows.Forms.RadioButton
    Protected WithEvents tp2RadioButton2 As System.Windows.Forms.RadioButton
    Protected WithEvents tp2GroupBox1 As System.Windows.Forms.GroupBox
    Protected WithEvents tabPage2 As System.Windows.Forms.TabPage
    Protected WithEvents tabPage1 As System.Windows.Forms.TabPage
    Protected WithEvents groupBox1 As System.Windows.Forms.GroupBox
    Protected WithEvents appearanceComboBox As System.Windows.Forms.ComboBox
    Protected WithEvents checkBox1 As System.Windows.Forms.CheckBox
    Protected WithEvents tabControl1 As System.Windows.Forms.TabControl
    Protected WithEvents alignmentComboBox As System.Windows.Forms.ComboBox
    Protected WithEvents checkBox2 As System.Windows.Forms.CheckBox
    Protected WithEvents sizeModeComboBox As System.Windows.Forms.ComboBox
    Protected WithEvents label1 As System.Windows.Forms.Label
    Protected WithEvents label2 As System.Windows.Forms.Label
    Protected WithEvents label3 As System.Windows.Forms.Label
    Protected WithEvents trackBar As System.Windows.Forms.TrackBar
    Protected WithEvents label4 As System.Windows.Forms.Label
    Protected WithEvents pictureBox1 As System.Windows.Forms.PictureBox
    Protected WithEvents toolTip1 As System.Windows.Forms.ToolTip
    Protected WithEvents imageList1 As System.Windows.Forms.ImageList
    Protected WithEvents checkBox3 As System.Windows.Forms.CheckBox
    Protected WithEvents tp1ComboBox1 As System.Windows.Forms.ComboBox
    Protected WithEvents tp1Label1 As System.Windows.Forms.Label
    Protected WithEvents tp1Label2 As System.Windows.Forms.Label
    Protected WithEvents tp1Button1 As System.Windows.Forms.Button
    Protected WithEvents tp1GroupBox1 As System.Windows.Forms.GroupBox

    Private WithEvents TabControlCtl As System.Windows.Forms.Form

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.
    'Do not modify it using the code editor.
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(TabControlCtl))
        Me.label2 = New System.Windows.Forms.Label
        Me.label1 = New System.Windows.Forms.Label
        Me.tp3RadioButton1 = New System.Windows.Forms.RadioButton
        Me.tp5DomainUpDown1 = New System.Windows.Forms.DomainUpDown
        Me.alignmentComboBox = New System.Windows.Forms.ComboBox
        Me.tp1Label2 = New System.Windows.Forms.Label
        Me.tp1Label1 = New System.Windows.Forms.Label
        Me.tp1GroupBox1 = New System.Windows.Forms.GroupBox
        Me.tp1Button1 = New System.Windows.Forms.Button
        Me.tp1ComboBox1 = New System.Windows.Forms.ComboBox
        Me.tp3RadioButton2 = New System.Windows.Forms.RadioButton
        Me.trackBar = New System.Windows.Forms.TrackBar
        Me.tp2ComboBox1 = New System.Windows.Forms.ComboBox
        Me.tp2RadioButton2 = New System.Windows.Forms.RadioButton
        Me.label4 = New System.Windows.Forms.Label
        Me.imageList1 = New System.Windows.Forms.ImageList(Me.components)
        Me.tp4GroupBox1 = New System.Windows.Forms.GroupBox
        Me.tp4ComboBox1 = New System.Windows.Forms.ComboBox
        Me.tp4UpDown1 = New System.Windows.Forms.NumericUpDown
        Me.sizeModeComboBox = New System.Windows.Forms.ComboBox
        Me.toolTip1 = New System.Windows.Forms.ToolTip(Me.components)
        Me.checkBox2 = New System.Windows.Forms.CheckBox
        Me.appearanceComboBox = New System.Windows.Forms.ComboBox
        Me.checkBox1 = New System.Windows.Forms.CheckBox
        Me.groupBox1 = New System.Windows.Forms.GroupBox
        Me.checkBox3 = New System.Windows.Forms.CheckBox
        Me.label3 = New System.Windows.Forms.Label
        Me.tabPage1 = New System.Windows.Forms.TabPage
        Me.tp2RadioButton1 = New System.Windows.Forms.RadioButton
        Me.tp3ComboBox2 = New System.Windows.Forms.ComboBox
        Me.pictureBox1 = New System.Windows.Forms.PictureBox
        Me.tabPage4 = New System.Windows.Forms.TabPage
        Me.tp5GroupBox1 = New System.Windows.Forms.GroupBox
        Me.tp2GroupBox1 = New System.Windows.Forms.GroupBox
        Me.tp3ComboBox1 = New System.Windows.Forms.ComboBox
        Me.tp3Button1 = New System.Windows.Forms.Button
        Me.tabControl1 = New System.Windows.Forms.TabControl
        Me.tabPage3 = New System.Windows.Forms.TabPage
        Me.tp3GroupBox1 = New System.Windows.Forms.GroupBox
        Me.tp3Label1 = New System.Windows.Forms.Label
        Me.tabPage2 = New System.Windows.Forms.TabPage
        Me.tabPage5 = New System.Windows.Forms.TabPage
        Me.tp1GroupBox1.SuspendLayout()
        CType(Me.trackBar, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.tp4GroupBox1.SuspendLayout()
        CType(Me.tp4UpDown1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.groupBox1.SuspendLayout()
        Me.tabPage1.SuspendLayout()
        Me.tabPage4.SuspendLayout()
        Me.tp5GroupBox1.SuspendLayout()
        Me.tp2GroupBox1.SuspendLayout()
        Me.tabControl1.SuspendLayout()
        Me.tabPage3.SuspendLayout()
        Me.tp3GroupBox1.SuspendLayout()
        Me.tabPage2.SuspendLayout()
        Me.tabPage5.SuspendLayout()
        Me.SuspendLayout()
        '
        'label2
        '
        Me.label2.AccessibleDescription = resources.GetString("label2.AccessibleDescription")
        Me.label2.AccessibleName = resources.GetString("label2.AccessibleName")
        Me.label2.Anchor = CType(resources.GetObject("label2.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.label2.AutoSize = CType(resources.GetObject("label2.AutoSize"), Boolean)
        Me.label2.Dock = CType(resources.GetObject("label2.Dock"), System.Windows.Forms.DockStyle)
        Me.label2.Enabled = CType(resources.GetObject("label2.Enabled"), Boolean)
        Me.label2.Font = CType(resources.GetObject("label2.Font"), System.Drawing.Font)
        Me.label2.Image = CType(resources.GetObject("label2.Image"), System.Drawing.Image)
        Me.label2.ImageAlign = CType(resources.GetObject("label2.ImageAlign"), System.Drawing.ContentAlignment)
        Me.label2.ImageIndex = CType(resources.GetObject("label2.ImageIndex"), Integer)
        Me.label2.ImeMode = CType(resources.GetObject("label2.ImeMode"), System.Windows.Forms.ImeMode)
        Me.label2.Location = CType(resources.GetObject("label2.Location"), System.Drawing.Point)
        Me.label2.Name = "label2"
        Me.label2.RightToLeft = CType(resources.GetObject("label2.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.label2.Size = CType(resources.GetObject("label2.Size"), System.Drawing.Size)
        Me.label2.TabIndex = CType(resources.GetObject("label2.TabIndex"), Integer)
        Me.label2.Text = resources.GetString("label2.Text")
        Me.label2.TextAlign = CType(resources.GetObject("label2.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.label2, resources.GetString("label2.ToolTip"))
        Me.label2.Visible = CType(resources.GetObject("label2.Visible"), Boolean)
        '
        'label1
        '
        Me.label1.AccessibleDescription = resources.GetString("label1.AccessibleDescription")
        Me.label1.AccessibleName = resources.GetString("label1.AccessibleName")
        Me.label1.Anchor = CType(resources.GetObject("label1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.label1.AutoSize = CType(resources.GetObject("label1.AutoSize"), Boolean)
        Me.label1.Dock = CType(resources.GetObject("label1.Dock"), System.Windows.Forms.DockStyle)
        Me.label1.Enabled = CType(resources.GetObject("label1.Enabled"), Boolean)
        Me.label1.Font = CType(resources.GetObject("label1.Font"), System.Drawing.Font)
        Me.label1.Image = CType(resources.GetObject("label1.Image"), System.Drawing.Image)
        Me.label1.ImageAlign = CType(resources.GetObject("label1.ImageAlign"), System.Drawing.ContentAlignment)
        Me.label1.ImageIndex = CType(resources.GetObject("label1.ImageIndex"), Integer)
        Me.label1.ImeMode = CType(resources.GetObject("label1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.label1.Location = CType(resources.GetObject("label1.Location"), System.Drawing.Point)
        Me.label1.Name = "label1"
        Me.label1.RightToLeft = CType(resources.GetObject("label1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.label1.Size = CType(resources.GetObject("label1.Size"), System.Drawing.Size)
        Me.label1.TabIndex = CType(resources.GetObject("label1.TabIndex"), Integer)
        Me.label1.Text = resources.GetString("label1.Text")
        Me.label1.TextAlign = CType(resources.GetObject("label1.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.label1, resources.GetString("label1.ToolTip"))
        Me.label1.Visible = CType(resources.GetObject("label1.Visible"), Boolean)
        '
        'tp3RadioButton1
        '
        Me.tp3RadioButton1.AccessibleDescription = resources.GetString("tp3RadioButton1.AccessibleDescription")
        Me.tp3RadioButton1.AccessibleName = resources.GetString("tp3RadioButton1.AccessibleName")
        Me.tp3RadioButton1.Anchor = CType(resources.GetObject("tp3RadioButton1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp3RadioButton1.Appearance = CType(resources.GetObject("tp3RadioButton1.Appearance"), System.Windows.Forms.Appearance)
        Me.tp3RadioButton1.BackgroundImage = CType(resources.GetObject("tp3RadioButton1.BackgroundImage"), System.Drawing.Image)
        Me.tp3RadioButton1.CheckAlign = CType(resources.GetObject("tp3RadioButton1.CheckAlign"), System.Drawing.ContentAlignment)
        Me.tp3RadioButton1.Dock = CType(resources.GetObject("tp3RadioButton1.Dock"), System.Windows.Forms.DockStyle)
        Me.tp3RadioButton1.Enabled = CType(resources.GetObject("tp3RadioButton1.Enabled"), Boolean)
        Me.tp3RadioButton1.FlatStyle = CType(resources.GetObject("tp3RadioButton1.FlatStyle"), System.Windows.Forms.FlatStyle)
        Me.tp3RadioButton1.Font = CType(resources.GetObject("tp3RadioButton1.Font"), System.Drawing.Font)
        Me.tp3RadioButton1.Image = CType(resources.GetObject("tp3RadioButton1.Image"), System.Drawing.Image)
        Me.tp3RadioButton1.ImageAlign = CType(resources.GetObject("tp3RadioButton1.ImageAlign"), System.Drawing.ContentAlignment)
        Me.tp3RadioButton1.ImageIndex = CType(resources.GetObject("tp3RadioButton1.ImageIndex"), Integer)
        Me.tp3RadioButton1.ImeMode = CType(resources.GetObject("tp3RadioButton1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp3RadioButton1.Location = CType(resources.GetObject("tp3RadioButton1.Location"), System.Drawing.Point)
        Me.tp3RadioButton1.Name = "tp3RadioButton1"
        Me.tp3RadioButton1.RightToLeft = CType(resources.GetObject("tp3RadioButton1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp3RadioButton1.Size = CType(resources.GetObject("tp3RadioButton1.Size"), System.Drawing.Size)
        Me.tp3RadioButton1.TabIndex = CType(resources.GetObject("tp3RadioButton1.TabIndex"), Integer)
        Me.tp3RadioButton1.Text = resources.GetString("tp3RadioButton1.Text")
        Me.tp3RadioButton1.TextAlign = CType(resources.GetObject("tp3RadioButton1.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.tp3RadioButton1, resources.GetString("tp3RadioButton1.ToolTip"))
        Me.tp3RadioButton1.Visible = CType(resources.GetObject("tp3RadioButton1.Visible"), Boolean)
        '
        'tp5DomainUpDown1
        '
        Me.tp5DomainUpDown1.AccessibleDescription = resources.GetString("tp5DomainUpDown1.AccessibleDescription")
        Me.tp5DomainUpDown1.AccessibleName = resources.GetString("tp5DomainUpDown1.AccessibleName")
        Me.tp5DomainUpDown1.AccessibleRole = System.Windows.Forms.AccessibleRole.ComboBox
        Me.tp5DomainUpDown1.Anchor = CType(resources.GetObject("tp5DomainUpDown1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp5DomainUpDown1.Dock = CType(resources.GetObject("tp5DomainUpDown1.Dock"), System.Windows.Forms.DockStyle)
        Me.tp5DomainUpDown1.Enabled = CType(resources.GetObject("tp5DomainUpDown1.Enabled"), Boolean)
        Me.tp5DomainUpDown1.Font = CType(resources.GetObject("tp5DomainUpDown1.Font"), System.Drawing.Font)
        Me.tp5DomainUpDown1.ImeMode = CType(resources.GetObject("tp5DomainUpDown1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp5DomainUpDown1.Location = CType(resources.GetObject("tp5DomainUpDown1.Location"), System.Drawing.Point)
        Me.tp5DomainUpDown1.Name = "tp5DomainUpDown1"
        Me.tp5DomainUpDown1.RightToLeft = CType(resources.GetObject("tp5DomainUpDown1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp5DomainUpDown1.Size = CType(resources.GetObject("tp5DomainUpDown1.Size"), System.Drawing.Size)
        Me.tp5DomainUpDown1.TabIndex = CType(resources.GetObject("tp5DomainUpDown1.TabIndex"), Integer)
        Me.tp5DomainUpDown1.Text = resources.GetString("tp5DomainUpDown1.Text")
        Me.tp5DomainUpDown1.TextAlign = CType(resources.GetObject("tp5DomainUpDown1.TextAlign"), System.Windows.Forms.HorizontalAlignment)
        Me.toolTip1.SetToolTip(Me.tp5DomainUpDown1, resources.GetString("tp5DomainUpDown1.ToolTip"))
        Me.tp5DomainUpDown1.UpDownAlign = CType(resources.GetObject("tp5DomainUpDown1.UpDownAlign"), System.Windows.Forms.LeftRightAlignment)
        Me.tp5DomainUpDown1.Visible = CType(resources.GetObject("tp5DomainUpDown1.Visible"), Boolean)
        Me.tp5DomainUpDown1.Wrap = CType(resources.GetObject("tp5DomainUpDown1.Wrap"), Boolean)
        '
        'alignmentComboBox
        '
        Me.alignmentComboBox.AccessibleDescription = resources.GetString("alignmentComboBox.AccessibleDescription")
        Me.alignmentComboBox.AccessibleName = resources.GetString("alignmentComboBox.AccessibleName")
        Me.alignmentComboBox.Anchor = CType(resources.GetObject("alignmentComboBox.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.alignmentComboBox.BackgroundImage = CType(resources.GetObject("alignmentComboBox.BackgroundImage"), System.Drawing.Image)
        Me.alignmentComboBox.Dock = CType(resources.GetObject("alignmentComboBox.Dock"), System.Windows.Forms.DockStyle)
        Me.alignmentComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.alignmentComboBox.Enabled = CType(resources.GetObject("alignmentComboBox.Enabled"), Boolean)
        Me.alignmentComboBox.Font = CType(resources.GetObject("alignmentComboBox.Font"), System.Drawing.Font)
        Me.alignmentComboBox.ImeMode = CType(resources.GetObject("alignmentComboBox.ImeMode"), System.Windows.Forms.ImeMode)
        Me.alignmentComboBox.IntegralHeight = CType(resources.GetObject("alignmentComboBox.IntegralHeight"), Boolean)
        Me.alignmentComboBox.ItemHeight = CType(resources.GetObject("alignmentComboBox.ItemHeight"), Integer)
        Me.alignmentComboBox.Items.AddRange(New Object() {resources.GetString("alignmentComboBox.Items"), resources.GetString("alignmentComboBox.Items1"), resources.GetString("alignmentComboBox.Items2"), resources.GetString("alignmentComboBox.Items3")})
        Me.alignmentComboBox.Location = CType(resources.GetObject("alignmentComboBox.Location"), System.Drawing.Point)
        Me.alignmentComboBox.MaxDropDownItems = CType(resources.GetObject("alignmentComboBox.MaxDropDownItems"), Integer)
        Me.alignmentComboBox.MaxLength = CType(resources.GetObject("alignmentComboBox.MaxLength"), Integer)
        Me.alignmentComboBox.Name = "alignmentComboBox"
        Me.alignmentComboBox.RightToLeft = CType(resources.GetObject("alignmentComboBox.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.alignmentComboBox.Size = CType(resources.GetObject("alignmentComboBox.Size"), System.Drawing.Size)
        Me.alignmentComboBox.TabIndex = CType(resources.GetObject("alignmentComboBox.TabIndex"), Integer)
        Me.alignmentComboBox.Text = resources.GetString("alignmentComboBox.Text")
        Me.toolTip1.SetToolTip(Me.alignmentComboBox, resources.GetString("alignmentComboBox.ToolTip"))
        Me.alignmentComboBox.Visible = CType(resources.GetObject("alignmentComboBox.Visible"), Boolean)
        '
        'tp1Label2
        '
        Me.tp1Label2.AccessibleDescription = resources.GetString("tp1Label2.AccessibleDescription")
        Me.tp1Label2.AccessibleName = resources.GetString("tp1Label2.AccessibleName")
        Me.tp1Label2.Anchor = CType(resources.GetObject("tp1Label2.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp1Label2.AutoSize = CType(resources.GetObject("tp1Label2.AutoSize"), Boolean)
        Me.tp1Label2.Dock = CType(resources.GetObject("tp1Label2.Dock"), System.Windows.Forms.DockStyle)
        Me.tp1Label2.Enabled = CType(resources.GetObject("tp1Label2.Enabled"), Boolean)
        Me.tp1Label2.Font = CType(resources.GetObject("tp1Label2.Font"), System.Drawing.Font)
        Me.tp1Label2.Image = CType(resources.GetObject("tp1Label2.Image"), System.Drawing.Image)
        Me.tp1Label2.ImageAlign = CType(resources.GetObject("tp1Label2.ImageAlign"), System.Drawing.ContentAlignment)
        Me.tp1Label2.ImageIndex = CType(resources.GetObject("tp1Label2.ImageIndex"), Integer)
        Me.tp1Label2.ImeMode = CType(resources.GetObject("tp1Label2.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp1Label2.Location = CType(resources.GetObject("tp1Label2.Location"), System.Drawing.Point)
        Me.tp1Label2.Name = "tp1Label2"
        Me.tp1Label2.RightToLeft = CType(resources.GetObject("tp1Label2.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp1Label2.Size = CType(resources.GetObject("tp1Label2.Size"), System.Drawing.Size)
        Me.tp1Label2.TabIndex = CType(resources.GetObject("tp1Label2.TabIndex"), Integer)
        Me.tp1Label2.Text = resources.GetString("tp1Label2.Text")
        Me.tp1Label2.TextAlign = CType(resources.GetObject("tp1Label2.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.tp1Label2, resources.GetString("tp1Label2.ToolTip"))
        Me.tp1Label2.Visible = CType(resources.GetObject("tp1Label2.Visible"), Boolean)
        '
        'tp1Label1
        '
        Me.tp1Label1.AccessibleDescription = resources.GetString("tp1Label1.AccessibleDescription")
        Me.tp1Label1.AccessibleName = resources.GetString("tp1Label1.AccessibleName")
        Me.tp1Label1.Anchor = CType(resources.GetObject("tp1Label1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp1Label1.AutoSize = CType(resources.GetObject("tp1Label1.AutoSize"), Boolean)
        Me.tp1Label1.Dock = CType(resources.GetObject("tp1Label1.Dock"), System.Windows.Forms.DockStyle)
        Me.tp1Label1.Enabled = CType(resources.GetObject("tp1Label1.Enabled"), Boolean)
        Me.tp1Label1.Font = CType(resources.GetObject("tp1Label1.Font"), System.Drawing.Font)
        Me.tp1Label1.Image = CType(resources.GetObject("tp1Label1.Image"), System.Drawing.Image)
        Me.tp1Label1.ImageAlign = CType(resources.GetObject("tp1Label1.ImageAlign"), System.Drawing.ContentAlignment)
        Me.tp1Label1.ImageIndex = CType(resources.GetObject("tp1Label1.ImageIndex"), Integer)
        Me.tp1Label1.ImeMode = CType(resources.GetObject("tp1Label1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp1Label1.Location = CType(resources.GetObject("tp1Label1.Location"), System.Drawing.Point)
        Me.tp1Label1.Name = "tp1Label1"
        Me.tp1Label1.RightToLeft = CType(resources.GetObject("tp1Label1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp1Label1.Size = CType(resources.GetObject("tp1Label1.Size"), System.Drawing.Size)
        Me.tp1Label1.TabIndex = CType(resources.GetObject("tp1Label1.TabIndex"), Integer)
        Me.tp1Label1.Text = resources.GetString("tp1Label1.Text")
        Me.tp1Label1.TextAlign = CType(resources.GetObject("tp1Label1.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.tp1Label1, resources.GetString("tp1Label1.ToolTip"))
        Me.tp1Label1.Visible = CType(resources.GetObject("tp1Label1.Visible"), Boolean)
        '
        'tp1GroupBox1
        '
        Me.tp1GroupBox1.AccessibleDescription = resources.GetString("tp1GroupBox1.AccessibleDescription")
        Me.tp1GroupBox1.AccessibleName = resources.GetString("tp1GroupBox1.AccessibleName")
        Me.tp1GroupBox1.Anchor = CType(resources.GetObject("tp1GroupBox1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp1GroupBox1.BackgroundImage = CType(resources.GetObject("tp1GroupBox1.BackgroundImage"), System.Drawing.Image)
        Me.tp1GroupBox1.Controls.AddRange(New System.Windows.Forms.Control() {Me.tp1Label1, Me.tp1Label2, Me.tp1Button1, Me.tp1ComboBox1})
        Me.tp1GroupBox1.Dock = CType(resources.GetObject("tp1GroupBox1.Dock"), System.Windows.Forms.DockStyle)
        Me.tp1GroupBox1.Enabled = CType(resources.GetObject("tp1GroupBox1.Enabled"), Boolean)
        Me.tp1GroupBox1.Font = CType(resources.GetObject("tp1GroupBox1.Font"), System.Drawing.Font)
        Me.tp1GroupBox1.ImeMode = CType(resources.GetObject("tp1GroupBox1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp1GroupBox1.Location = CType(resources.GetObject("tp1GroupBox1.Location"), System.Drawing.Point)
        Me.tp1GroupBox1.Name = "tp1GroupBox1"
        Me.tp1GroupBox1.RightToLeft = CType(resources.GetObject("tp1GroupBox1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp1GroupBox1.Size = CType(resources.GetObject("tp1GroupBox1.Size"), System.Drawing.Size)
        Me.tp1GroupBox1.TabIndex = CType(resources.GetObject("tp1GroupBox1.TabIndex"), Integer)
        Me.tp1GroupBox1.TabStop = False
        Me.tp1GroupBox1.Text = resources.GetString("tp1GroupBox1.Text")
        Me.toolTip1.SetToolTip(Me.tp1GroupBox1, resources.GetString("tp1GroupBox1.ToolTip"))
        Me.tp1GroupBox1.Visible = CType(resources.GetObject("tp1GroupBox1.Visible"), Boolean)
        '
        'tp1Button1
        '
        Me.tp1Button1.AccessibleDescription = resources.GetString("tp1Button1.AccessibleDescription")
        Me.tp1Button1.AccessibleName = resources.GetString("tp1Button1.AccessibleName")
        Me.tp1Button1.Anchor = CType(resources.GetObject("tp1Button1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp1Button1.BackgroundImage = CType(resources.GetObject("tp1Button1.BackgroundImage"), System.Drawing.Image)
        Me.tp1Button1.Dock = CType(resources.GetObject("tp1Button1.Dock"), System.Windows.Forms.DockStyle)
        Me.tp1Button1.Enabled = CType(resources.GetObject("tp1Button1.Enabled"), Boolean)
        Me.tp1Button1.FlatStyle = CType(resources.GetObject("tp1Button1.FlatStyle"), System.Windows.Forms.FlatStyle)
        Me.tp1Button1.Font = CType(resources.GetObject("tp1Button1.Font"), System.Drawing.Font)
        Me.tp1Button1.Image = CType(resources.GetObject("tp1Button1.Image"), System.Drawing.Image)
        Me.tp1Button1.ImageAlign = CType(resources.GetObject("tp1Button1.ImageAlign"), System.Drawing.ContentAlignment)
        Me.tp1Button1.ImageIndex = CType(resources.GetObject("tp1Button1.ImageIndex"), Integer)
        Me.tp1Button1.ImeMode = CType(resources.GetObject("tp1Button1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp1Button1.Location = CType(resources.GetObject("tp1Button1.Location"), System.Drawing.Point)
        Me.tp1Button1.Name = "tp1Button1"
        Me.tp1Button1.RightToLeft = CType(resources.GetObject("tp1Button1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp1Button1.Size = CType(resources.GetObject("tp1Button1.Size"), System.Drawing.Size)
        Me.tp1Button1.TabIndex = CType(resources.GetObject("tp1Button1.TabIndex"), Integer)
        Me.tp1Button1.Text = resources.GetString("tp1Button1.Text")
        Me.tp1Button1.TextAlign = CType(resources.GetObject("tp1Button1.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.tp1Button1, resources.GetString("tp1Button1.ToolTip"))
        Me.tp1Button1.Visible = CType(resources.GetObject("tp1Button1.Visible"), Boolean)
        '
        'tp1ComboBox1
        '
        Me.tp1ComboBox1.AccessibleDescription = resources.GetString("tp1ComboBox1.AccessibleDescription")
        Me.tp1ComboBox1.AccessibleName = resources.GetString("tp1ComboBox1.AccessibleName")
        Me.tp1ComboBox1.Anchor = CType(resources.GetObject("tp1ComboBox1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp1ComboBox1.BackgroundImage = CType(resources.GetObject("tp1ComboBox1.BackgroundImage"), System.Drawing.Image)
        Me.tp1ComboBox1.Dock = CType(resources.GetObject("tp1ComboBox1.Dock"), System.Windows.Forms.DockStyle)
        Me.tp1ComboBox1.Enabled = CType(resources.GetObject("tp1ComboBox1.Enabled"), Boolean)
        Me.tp1ComboBox1.Font = CType(resources.GetObject("tp1ComboBox1.Font"), System.Drawing.Font)
        Me.tp1ComboBox1.ImeMode = CType(resources.GetObject("tp1ComboBox1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp1ComboBox1.IntegralHeight = CType(resources.GetObject("tp1ComboBox1.IntegralHeight"), Boolean)
        Me.tp1ComboBox1.ItemHeight = CType(resources.GetObject("tp1ComboBox1.ItemHeight"), Integer)
        Me.tp1ComboBox1.Location = CType(resources.GetObject("tp1ComboBox1.Location"), System.Drawing.Point)
        Me.tp1ComboBox1.MaxDropDownItems = CType(resources.GetObject("tp1ComboBox1.MaxDropDownItems"), Integer)
        Me.tp1ComboBox1.MaxLength = CType(resources.GetObject("tp1ComboBox1.MaxLength"), Integer)
        Me.tp1ComboBox1.Name = "tp1ComboBox1"
        Me.tp1ComboBox1.RightToLeft = CType(resources.GetObject("tp1ComboBox1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp1ComboBox1.Size = CType(resources.GetObject("tp1ComboBox1.Size"), System.Drawing.Size)
        Me.tp1ComboBox1.TabIndex = CType(resources.GetObject("tp1ComboBox1.TabIndex"), Integer)
        Me.tp1ComboBox1.Text = resources.GetString("tp1ComboBox1.Text")
        Me.toolTip1.SetToolTip(Me.tp1ComboBox1, resources.GetString("tp1ComboBox1.ToolTip"))
        Me.tp1ComboBox1.Visible = CType(resources.GetObject("tp1ComboBox1.Visible"), Boolean)
        '
        'tp3RadioButton2
        '
        Me.tp3RadioButton2.AccessibleDescription = resources.GetString("tp3RadioButton2.AccessibleDescription")
        Me.tp3RadioButton2.AccessibleName = resources.GetString("tp3RadioButton2.AccessibleName")
        Me.tp3RadioButton2.Anchor = CType(resources.GetObject("tp3RadioButton2.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp3RadioButton2.Appearance = CType(resources.GetObject("tp3RadioButton2.Appearance"), System.Windows.Forms.Appearance)
        Me.tp3RadioButton2.BackgroundImage = CType(resources.GetObject("tp3RadioButton2.BackgroundImage"), System.Drawing.Image)
        Me.tp3RadioButton2.CheckAlign = CType(resources.GetObject("tp3RadioButton2.CheckAlign"), System.Drawing.ContentAlignment)
        Me.tp3RadioButton2.Dock = CType(resources.GetObject("tp3RadioButton2.Dock"), System.Windows.Forms.DockStyle)
        Me.tp3RadioButton2.Enabled = CType(resources.GetObject("tp3RadioButton2.Enabled"), Boolean)
        Me.tp3RadioButton2.FlatStyle = CType(resources.GetObject("tp3RadioButton2.FlatStyle"), System.Windows.Forms.FlatStyle)
        Me.tp3RadioButton2.Font = CType(resources.GetObject("tp3RadioButton2.Font"), System.Drawing.Font)
        Me.tp3RadioButton2.Image = CType(resources.GetObject("tp3RadioButton2.Image"), System.Drawing.Image)
        Me.tp3RadioButton2.ImageAlign = CType(resources.GetObject("tp3RadioButton2.ImageAlign"), System.Drawing.ContentAlignment)
        Me.tp3RadioButton2.ImageIndex = CType(resources.GetObject("tp3RadioButton2.ImageIndex"), Integer)
        Me.tp3RadioButton2.ImeMode = CType(resources.GetObject("tp3RadioButton2.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp3RadioButton2.Location = CType(resources.GetObject("tp3RadioButton2.Location"), System.Drawing.Point)
        Me.tp3RadioButton2.Name = "tp3RadioButton2"
        Me.tp3RadioButton2.RightToLeft = CType(resources.GetObject("tp3RadioButton2.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp3RadioButton2.Size = CType(resources.GetObject("tp3RadioButton2.Size"), System.Drawing.Size)
        Me.tp3RadioButton2.TabIndex = CType(resources.GetObject("tp3RadioButton2.TabIndex"), Integer)
        Me.tp3RadioButton2.Text = resources.GetString("tp3RadioButton2.Text")
        Me.tp3RadioButton2.TextAlign = CType(resources.GetObject("tp3RadioButton2.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.tp3RadioButton2, resources.GetString("tp3RadioButton2.ToolTip"))
        Me.tp3RadioButton2.Visible = CType(resources.GetObject("tp3RadioButton2.Visible"), Boolean)
        '
        'trackBar
        '
        Me.trackBar.AccessibleDescription = resources.GetString("trackBar.AccessibleDescription")
        Me.trackBar.AccessibleName = resources.GetString("trackBar.AccessibleName")
        Me.trackBar.Anchor = CType(resources.GetObject("trackBar.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.trackBar.BackColor = System.Drawing.SystemColors.Control
        Me.trackBar.BackgroundImage = CType(resources.GetObject("trackBar.BackgroundImage"), System.Drawing.Image)
        Me.trackBar.Dock = CType(resources.GetObject("trackBar.Dock"), System.Windows.Forms.DockStyle)
        Me.trackBar.Enabled = CType(resources.GetObject("trackBar.Enabled"), Boolean)
        Me.trackBar.Font = CType(resources.GetObject("trackBar.Font"), System.Drawing.Font)
        Me.trackBar.ImeMode = CType(resources.GetObject("trackBar.ImeMode"), System.Windows.Forms.ImeMode)
        Me.trackBar.Location = CType(resources.GetObject("trackBar.Location"), System.Drawing.Point)
        Me.trackBar.Maximum = 220
        Me.trackBar.Name = "trackBar"
        Me.trackBar.Orientation = CType(resources.GetObject("trackBar.Orientation"), System.Windows.Forms.Orientation)
        Me.trackBar.RightToLeft = CType(resources.GetObject("trackBar.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.trackBar.Size = CType(resources.GetObject("trackBar.Size"), System.Drawing.Size)
        Me.trackBar.TabIndex = CType(resources.GetObject("trackBar.TabIndex"), Integer)
        Me.trackBar.TabStop = False
        Me.trackBar.Text = resources.GetString("trackBar.Text")
        Me.trackBar.TickFrequency = 10
        Me.toolTip1.SetToolTip(Me.trackBar, resources.GetString("trackBar.ToolTip"))
        Me.trackBar.Value = 220
        Me.trackBar.Visible = CType(resources.GetObject("trackBar.Visible"), Boolean)
        '
        'tp2ComboBox1
        '
        Me.tp2ComboBox1.AccessibleDescription = resources.GetString("tp2ComboBox1.AccessibleDescription")
        Me.tp2ComboBox1.AccessibleName = resources.GetString("tp2ComboBox1.AccessibleName")
        Me.tp2ComboBox1.Anchor = CType(resources.GetObject("tp2ComboBox1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp2ComboBox1.BackgroundImage = CType(resources.GetObject("tp2ComboBox1.BackgroundImage"), System.Drawing.Image)
        Me.tp2ComboBox1.Dock = CType(resources.GetObject("tp2ComboBox1.Dock"), System.Windows.Forms.DockStyle)
        Me.tp2ComboBox1.Enabled = CType(resources.GetObject("tp2ComboBox1.Enabled"), Boolean)
        Me.tp2ComboBox1.Font = CType(resources.GetObject("tp2ComboBox1.Font"), System.Drawing.Font)
        Me.tp2ComboBox1.ImeMode = CType(resources.GetObject("tp2ComboBox1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp2ComboBox1.IntegralHeight = CType(resources.GetObject("tp2ComboBox1.IntegralHeight"), Boolean)
        Me.tp2ComboBox1.ItemHeight = CType(resources.GetObject("tp2ComboBox1.ItemHeight"), Integer)
        Me.tp2ComboBox1.Location = CType(resources.GetObject("tp2ComboBox1.Location"), System.Drawing.Point)
        Me.tp2ComboBox1.MaxDropDownItems = CType(resources.GetObject("tp2ComboBox1.MaxDropDownItems"), Integer)
        Me.tp2ComboBox1.MaxLength = CType(resources.GetObject("tp2ComboBox1.MaxLength"), Integer)
        Me.tp2ComboBox1.Name = "tp2ComboBox1"
        Me.tp2ComboBox1.RightToLeft = CType(resources.GetObject("tp2ComboBox1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp2ComboBox1.Size = CType(resources.GetObject("tp2ComboBox1.Size"), System.Drawing.Size)
        Me.tp2ComboBox1.TabIndex = CType(resources.GetObject("tp2ComboBox1.TabIndex"), Integer)
        Me.tp2ComboBox1.Text = resources.GetString("tp2ComboBox1.Text")
        Me.toolTip1.SetToolTip(Me.tp2ComboBox1, resources.GetString("tp2ComboBox1.ToolTip"))
        Me.tp2ComboBox1.Visible = CType(resources.GetObject("tp2ComboBox1.Visible"), Boolean)
        '
        'tp2RadioButton2
        '
        Me.tp2RadioButton2.AccessibleDescription = resources.GetString("tp2RadioButton2.AccessibleDescription")
        Me.tp2RadioButton2.AccessibleName = resources.GetString("tp2RadioButton2.AccessibleName")
        Me.tp2RadioButton2.Anchor = CType(resources.GetObject("tp2RadioButton2.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp2RadioButton2.Appearance = CType(resources.GetObject("tp2RadioButton2.Appearance"), System.Windows.Forms.Appearance)
        Me.tp2RadioButton2.BackgroundImage = CType(resources.GetObject("tp2RadioButton2.BackgroundImage"), System.Drawing.Image)
        Me.tp2RadioButton2.CheckAlign = CType(resources.GetObject("tp2RadioButton2.CheckAlign"), System.Drawing.ContentAlignment)
        Me.tp2RadioButton2.Dock = CType(resources.GetObject("tp2RadioButton2.Dock"), System.Windows.Forms.DockStyle)
        Me.tp2RadioButton2.Enabled = CType(resources.GetObject("tp2RadioButton2.Enabled"), Boolean)
        Me.tp2RadioButton2.FlatStyle = CType(resources.GetObject("tp2RadioButton2.FlatStyle"), System.Windows.Forms.FlatStyle)
        Me.tp2RadioButton2.Font = CType(resources.GetObject("tp2RadioButton2.Font"), System.Drawing.Font)
        Me.tp2RadioButton2.Image = CType(resources.GetObject("tp2RadioButton2.Image"), System.Drawing.Image)
        Me.tp2RadioButton2.ImageAlign = CType(resources.GetObject("tp2RadioButton2.ImageAlign"), System.Drawing.ContentAlignment)
        Me.tp2RadioButton2.ImageIndex = CType(resources.GetObject("tp2RadioButton2.ImageIndex"), Integer)
        Me.tp2RadioButton2.ImeMode = CType(resources.GetObject("tp2RadioButton2.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp2RadioButton2.Location = CType(resources.GetObject("tp2RadioButton2.Location"), System.Drawing.Point)
        Me.tp2RadioButton2.Name = "tp2RadioButton2"
        Me.tp2RadioButton2.RightToLeft = CType(resources.GetObject("tp2RadioButton2.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp2RadioButton2.Size = CType(resources.GetObject("tp2RadioButton2.Size"), System.Drawing.Size)
        Me.tp2RadioButton2.TabIndex = CType(resources.GetObject("tp2RadioButton2.TabIndex"), Integer)
        Me.tp2RadioButton2.Text = resources.GetString("tp2RadioButton2.Text")
        Me.tp2RadioButton2.TextAlign = CType(resources.GetObject("tp2RadioButton2.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.tp2RadioButton2, resources.GetString("tp2RadioButton2.ToolTip"))
        Me.tp2RadioButton2.Visible = CType(resources.GetObject("tp2RadioButton2.Visible"), Boolean)
        '
        'label4
        '
        Me.label4.AccessibleDescription = resources.GetString("label4.AccessibleDescription")
        Me.label4.AccessibleName = resources.GetString("label4.AccessibleName")
        Me.label4.Anchor = CType(resources.GetObject("label4.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.label4.AutoSize = CType(resources.GetObject("label4.AutoSize"), Boolean)
        Me.label4.Dock = CType(resources.GetObject("label4.Dock"), System.Windows.Forms.DockStyle)
        Me.label4.Enabled = CType(resources.GetObject("label4.Enabled"), Boolean)
        Me.label4.Font = CType(resources.GetObject("label4.Font"), System.Drawing.Font)
        Me.label4.Image = CType(resources.GetObject("label4.Image"), System.Drawing.Image)
        Me.label4.ImageAlign = CType(resources.GetObject("label4.ImageAlign"), System.Drawing.ContentAlignment)
        Me.label4.ImageIndex = CType(resources.GetObject("label4.ImageIndex"), Integer)
        Me.label4.ImeMode = CType(resources.GetObject("label4.ImeMode"), System.Windows.Forms.ImeMode)
        Me.label4.Location = CType(resources.GetObject("label4.Location"), System.Drawing.Point)
        Me.label4.Name = "label4"
        Me.label4.RightToLeft = CType(resources.GetObject("label4.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.label4.Size = CType(resources.GetObject("label4.Size"), System.Drawing.Size)
        Me.label4.TabIndex = CType(resources.GetObject("label4.TabIndex"), Integer)
        Me.label4.Text = resources.GetString("label4.Text")
        Me.label4.TextAlign = CType(resources.GetObject("label4.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.label4, resources.GetString("label4.ToolTip"))
        Me.label4.Visible = CType(resources.GetObject("label4.Visible"), Boolean)
        '
        'imageList1
        '
        Me.imageList1.ColorDepth = System.Windows.Forms.ColorDepth.Depth8Bit
        Me.imageList1.ImageSize = CType(resources.GetObject("imageList1.ImageSize"), System.Drawing.Size)
        Me.imageList1.ImageStream = CType(resources.GetObject("imageList1.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.imageList1.TransparentColor = System.Drawing.Color.Transparent
        '
        'tp4GroupBox1
        '
        Me.tp4GroupBox1.AccessibleDescription = resources.GetString("tp4GroupBox1.AccessibleDescription")
        Me.tp4GroupBox1.AccessibleName = resources.GetString("tp4GroupBox1.AccessibleName")
        Me.tp4GroupBox1.Anchor = CType(resources.GetObject("tp4GroupBox1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp4GroupBox1.BackgroundImage = CType(resources.GetObject("tp4GroupBox1.BackgroundImage"), System.Drawing.Image)
        Me.tp4GroupBox1.Controls.AddRange(New System.Windows.Forms.Control() {Me.tp4ComboBox1, Me.tp4UpDown1})
        Me.tp4GroupBox1.Dock = CType(resources.GetObject("tp4GroupBox1.Dock"), System.Windows.Forms.DockStyle)
        Me.tp4GroupBox1.Enabled = CType(resources.GetObject("tp4GroupBox1.Enabled"), Boolean)
        Me.tp4GroupBox1.Font = CType(resources.GetObject("tp4GroupBox1.Font"), System.Drawing.Font)
        Me.tp4GroupBox1.ImeMode = CType(resources.GetObject("tp4GroupBox1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp4GroupBox1.Location = CType(resources.GetObject("tp4GroupBox1.Location"), System.Drawing.Point)
        Me.tp4GroupBox1.Name = "tp4GroupBox1"
        Me.tp4GroupBox1.RightToLeft = CType(resources.GetObject("tp4GroupBox1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp4GroupBox1.Size = CType(resources.GetObject("tp4GroupBox1.Size"), System.Drawing.Size)
        Me.tp4GroupBox1.TabIndex = CType(resources.GetObject("tp4GroupBox1.TabIndex"), Integer)
        Me.tp4GroupBox1.TabStop = False
        Me.tp4GroupBox1.Text = resources.GetString("tp4GroupBox1.Text")
        Me.toolTip1.SetToolTip(Me.tp4GroupBox1, resources.GetString("tp4GroupBox1.ToolTip"))
        Me.tp4GroupBox1.Visible = CType(resources.GetObject("tp4GroupBox1.Visible"), Boolean)
        '
        'tp4ComboBox1
        '
        Me.tp4ComboBox1.AccessibleDescription = resources.GetString("tp4ComboBox1.AccessibleDescription")
        Me.tp4ComboBox1.AccessibleName = resources.GetString("tp4ComboBox1.AccessibleName")
        Me.tp4ComboBox1.Anchor = CType(resources.GetObject("tp4ComboBox1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp4ComboBox1.BackgroundImage = CType(resources.GetObject("tp4ComboBox1.BackgroundImage"), System.Drawing.Image)
        Me.tp4ComboBox1.Dock = CType(resources.GetObject("tp4ComboBox1.Dock"), System.Windows.Forms.DockStyle)
        Me.tp4ComboBox1.Enabled = CType(resources.GetObject("tp4ComboBox1.Enabled"), Boolean)
        Me.tp4ComboBox1.Font = CType(resources.GetObject("tp4ComboBox1.Font"), System.Drawing.Font)
        Me.tp4ComboBox1.ImeMode = CType(resources.GetObject("tp4ComboBox1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp4ComboBox1.IntegralHeight = CType(resources.GetObject("tp4ComboBox1.IntegralHeight"), Boolean)
        Me.tp4ComboBox1.ItemHeight = CType(resources.GetObject("tp4ComboBox1.ItemHeight"), Integer)
        Me.tp4ComboBox1.Location = CType(resources.GetObject("tp4ComboBox1.Location"), System.Drawing.Point)
        Me.tp4ComboBox1.MaxDropDownItems = CType(resources.GetObject("tp4ComboBox1.MaxDropDownItems"), Integer)
        Me.tp4ComboBox1.MaxLength = CType(resources.GetObject("tp4ComboBox1.MaxLength"), Integer)
        Me.tp4ComboBox1.Name = "tp4ComboBox1"
        Me.tp4ComboBox1.RightToLeft = CType(resources.GetObject("tp4ComboBox1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp4ComboBox1.Size = CType(resources.GetObject("tp4ComboBox1.Size"), System.Drawing.Size)
        Me.tp4ComboBox1.TabIndex = CType(resources.GetObject("tp4ComboBox1.TabIndex"), Integer)
        Me.tp4ComboBox1.Text = resources.GetString("tp4ComboBox1.Text")
        Me.toolTip1.SetToolTip(Me.tp4ComboBox1, resources.GetString("tp4ComboBox1.ToolTip"))
        Me.tp4ComboBox1.Visible = CType(resources.GetObject("tp4ComboBox1.Visible"), Boolean)
        '
        'tp4UpDown1
        '
        Me.tp4UpDown1.AccessibleDescription = resources.GetString("tp4UpDown1.AccessibleDescription")
        Me.tp4UpDown1.AccessibleName = resources.GetString("tp4UpDown1.AccessibleName")
        Me.tp4UpDown1.Anchor = CType(resources.GetObject("tp4UpDown1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp4UpDown1.DecimalPlaces = 2
        Me.tp4UpDown1.Dock = CType(resources.GetObject("tp4UpDown1.Dock"), System.Windows.Forms.DockStyle)
        Me.tp4UpDown1.Enabled = CType(resources.GetObject("tp4UpDown1.Enabled"), Boolean)
        Me.tp4UpDown1.Font = CType(resources.GetObject("tp4UpDown1.Font"), System.Drawing.Font)
        Me.tp4UpDown1.ImeMode = CType(resources.GetObject("tp4UpDown1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp4UpDown1.Location = CType(resources.GetObject("tp4UpDown1.Location"), System.Drawing.Point)
        Me.tp4UpDown1.Maximum = New Decimal(New Integer() {0, 0, 0, 0})
        Me.tp4UpDown1.Name = "tp4UpDown1"
        Me.tp4UpDown1.RightToLeft = CType(resources.GetObject("tp4UpDown1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp4UpDown1.Size = CType(resources.GetObject("tp4UpDown1.Size"), System.Drawing.Size)
        Me.tp4UpDown1.TabIndex = CType(resources.GetObject("tp4UpDown1.TabIndex"), Integer)
        Me.tp4UpDown1.TextAlign = CType(resources.GetObject("tp4UpDown1.TextAlign"), System.Windows.Forms.HorizontalAlignment)
        Me.tp4UpDown1.ThousandsSeparator = CType(resources.GetObject("tp4UpDown1.ThousandsSeparator"), Boolean)
        Me.toolTip1.SetToolTip(Me.tp4UpDown1, resources.GetString("tp4UpDown1.ToolTip"))
        Me.tp4UpDown1.UpDownAlign = CType(resources.GetObject("tp4UpDown1.UpDownAlign"), System.Windows.Forms.LeftRightAlignment)
        Me.tp4UpDown1.Visible = CType(resources.GetObject("tp4UpDown1.Visible"), Boolean)
        '
        'sizeModeComboBox
        '
        Me.sizeModeComboBox.AccessibleDescription = resources.GetString("sizeModeComboBox.AccessibleDescription")
        Me.sizeModeComboBox.AccessibleName = resources.GetString("sizeModeComboBox.AccessibleName")
        Me.sizeModeComboBox.Anchor = CType(resources.GetObject("sizeModeComboBox.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.sizeModeComboBox.BackgroundImage = CType(resources.GetObject("sizeModeComboBox.BackgroundImage"), System.Drawing.Image)
        Me.sizeModeComboBox.Dock = CType(resources.GetObject("sizeModeComboBox.Dock"), System.Windows.Forms.DockStyle)
        Me.sizeModeComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.sizeModeComboBox.Enabled = CType(resources.GetObject("sizeModeComboBox.Enabled"), Boolean)
        Me.sizeModeComboBox.Font = CType(resources.GetObject("sizeModeComboBox.Font"), System.Drawing.Font)
        Me.sizeModeComboBox.ImeMode = CType(resources.GetObject("sizeModeComboBox.ImeMode"), System.Windows.Forms.ImeMode)
        Me.sizeModeComboBox.IntegralHeight = CType(resources.GetObject("sizeModeComboBox.IntegralHeight"), Boolean)
        Me.sizeModeComboBox.ItemHeight = CType(resources.GetObject("sizeModeComboBox.ItemHeight"), Integer)
        Me.sizeModeComboBox.Items.AddRange(New Object() {resources.GetString("sizeModeComboBox.Items"), resources.GetString("sizeModeComboBox.Items1"), resources.GetString("sizeModeComboBox.Items2")})
        Me.sizeModeComboBox.Location = CType(resources.GetObject("sizeModeComboBox.Location"), System.Drawing.Point)
        Me.sizeModeComboBox.MaxDropDownItems = CType(resources.GetObject("sizeModeComboBox.MaxDropDownItems"), Integer)
        Me.sizeModeComboBox.MaxLength = CType(resources.GetObject("sizeModeComboBox.MaxLength"), Integer)
        Me.sizeModeComboBox.Name = "sizeModeComboBox"
        Me.sizeModeComboBox.RightToLeft = CType(resources.GetObject("sizeModeComboBox.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.sizeModeComboBox.Size = CType(resources.GetObject("sizeModeComboBox.Size"), System.Drawing.Size)
        Me.sizeModeComboBox.TabIndex = CType(resources.GetObject("sizeModeComboBox.TabIndex"), Integer)
        Me.sizeModeComboBox.Text = resources.GetString("sizeModeComboBox.Text")
        Me.toolTip1.SetToolTip(Me.sizeModeComboBox, resources.GetString("sizeModeComboBox.ToolTip"))
        Me.sizeModeComboBox.Visible = CType(resources.GetObject("sizeModeComboBox.Visible"), Boolean)
        '
        'checkBox2
        '
        Me.checkBox2.AccessibleDescription = resources.GetString("checkBox2.AccessibleDescription")
        Me.checkBox2.AccessibleName = resources.GetString("checkBox2.AccessibleName")
        Me.checkBox2.Anchor = CType(resources.GetObject("checkBox2.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.checkBox2.Appearance = CType(resources.GetObject("checkBox2.Appearance"), System.Windows.Forms.Appearance)
        Me.checkBox2.BackgroundImage = CType(resources.GetObject("checkBox2.BackgroundImage"), System.Drawing.Image)
        Me.checkBox2.CheckAlign = CType(resources.GetObject("checkBox2.CheckAlign"), System.Drawing.ContentAlignment)
        Me.checkBox2.Dock = CType(resources.GetObject("checkBox2.Dock"), System.Windows.Forms.DockStyle)
        Me.checkBox2.Enabled = CType(resources.GetObject("checkBox2.Enabled"), Boolean)
        Me.checkBox2.FlatStyle = CType(resources.GetObject("checkBox2.FlatStyle"), System.Windows.Forms.FlatStyle)
        Me.checkBox2.Font = CType(resources.GetObject("checkBox2.Font"), System.Drawing.Font)
        Me.checkBox2.Image = CType(resources.GetObject("checkBox2.Image"), System.Drawing.Image)
        Me.checkBox2.ImageAlign = CType(resources.GetObject("checkBox2.ImageAlign"), System.Drawing.ContentAlignment)
        Me.checkBox2.ImageIndex = CType(resources.GetObject("checkBox2.ImageIndex"), Integer)
        Me.checkBox2.ImeMode = CType(resources.GetObject("checkBox2.ImeMode"), System.Windows.Forms.ImeMode)
        Me.checkBox2.Location = CType(resources.GetObject("checkBox2.Location"), System.Drawing.Point)
        Me.checkBox2.Name = "checkBox2"
        Me.checkBox2.RightToLeft = CType(resources.GetObject("checkBox2.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.checkBox2.Size = CType(resources.GetObject("checkBox2.Size"), System.Drawing.Size)
        Me.checkBox2.TabIndex = CType(resources.GetObject("checkBox2.TabIndex"), Integer)
        Me.checkBox2.Text = resources.GetString("checkBox2.Text")
        Me.checkBox2.TextAlign = CType(resources.GetObject("checkBox2.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.checkBox2, resources.GetString("checkBox2.ToolTip"))
        Me.checkBox2.Visible = CType(resources.GetObject("checkBox2.Visible"), Boolean)
        '
        'appearanceComboBox
        '
        Me.appearanceComboBox.AccessibleDescription = resources.GetString("appearanceComboBox.AccessibleDescription")
        Me.appearanceComboBox.AccessibleName = resources.GetString("appearanceComboBox.AccessibleName")
        Me.appearanceComboBox.Anchor = CType(resources.GetObject("appearanceComboBox.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.appearanceComboBox.BackgroundImage = CType(resources.GetObject("appearanceComboBox.BackgroundImage"), System.Drawing.Image)
        Me.appearanceComboBox.Dock = CType(resources.GetObject("appearanceComboBox.Dock"), System.Windows.Forms.DockStyle)
        Me.appearanceComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.appearanceComboBox.Enabled = CType(resources.GetObject("appearanceComboBox.Enabled"), Boolean)
        Me.appearanceComboBox.Font = CType(resources.GetObject("appearanceComboBox.Font"), System.Drawing.Font)
        Me.appearanceComboBox.ImeMode = CType(resources.GetObject("appearanceComboBox.ImeMode"), System.Windows.Forms.ImeMode)
        Me.appearanceComboBox.IntegralHeight = CType(resources.GetObject("appearanceComboBox.IntegralHeight"), Boolean)
        Me.appearanceComboBox.ItemHeight = CType(resources.GetObject("appearanceComboBox.ItemHeight"), Integer)
        Me.appearanceComboBox.Items.AddRange(New Object() {resources.GetString("appearanceComboBox.Items"), resources.GetString("appearanceComboBox.Items1"), resources.GetString("appearanceComboBox.Items2")})
        Me.appearanceComboBox.Location = CType(resources.GetObject("appearanceComboBox.Location"), System.Drawing.Point)
        Me.appearanceComboBox.MaxDropDownItems = CType(resources.GetObject("appearanceComboBox.MaxDropDownItems"), Integer)
        Me.appearanceComboBox.MaxLength = CType(resources.GetObject("appearanceComboBox.MaxLength"), Integer)
        Me.appearanceComboBox.Name = "appearanceComboBox"
        Me.appearanceComboBox.RightToLeft = CType(resources.GetObject("appearanceComboBox.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.appearanceComboBox.Size = CType(resources.GetObject("appearanceComboBox.Size"), System.Drawing.Size)
        Me.appearanceComboBox.TabIndex = CType(resources.GetObject("appearanceComboBox.TabIndex"), Integer)
        Me.appearanceComboBox.Text = resources.GetString("appearanceComboBox.Text")
        Me.toolTip1.SetToolTip(Me.appearanceComboBox, resources.GetString("appearanceComboBox.ToolTip"))
        Me.appearanceComboBox.Visible = CType(resources.GetObject("appearanceComboBox.Visible"), Boolean)
        '
        'checkBox1
        '
        Me.checkBox1.AccessibleDescription = resources.GetString("checkBox1.AccessibleDescription")
        Me.checkBox1.AccessibleName = resources.GetString("checkBox1.AccessibleName")
        Me.checkBox1.Anchor = CType(resources.GetObject("checkBox1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.checkBox1.Appearance = CType(resources.GetObject("checkBox1.Appearance"), System.Windows.Forms.Appearance)
        Me.checkBox1.BackgroundImage = CType(resources.GetObject("checkBox1.BackgroundImage"), System.Drawing.Image)
        Me.checkBox1.CheckAlign = CType(resources.GetObject("checkBox1.CheckAlign"), System.Drawing.ContentAlignment)
        Me.checkBox1.Dock = CType(resources.GetObject("checkBox1.Dock"), System.Windows.Forms.DockStyle)
        Me.checkBox1.Enabled = CType(resources.GetObject("checkBox1.Enabled"), Boolean)
        Me.checkBox1.FlatStyle = CType(resources.GetObject("checkBox1.FlatStyle"), System.Windows.Forms.FlatStyle)
        Me.checkBox1.Font = CType(resources.GetObject("checkBox1.Font"), System.Drawing.Font)
        Me.checkBox1.Image = CType(resources.GetObject("checkBox1.Image"), System.Drawing.Image)
        Me.checkBox1.ImageAlign = CType(resources.GetObject("checkBox1.ImageAlign"), System.Drawing.ContentAlignment)
        Me.checkBox1.ImageIndex = CType(resources.GetObject("checkBox1.ImageIndex"), Integer)
        Me.checkBox1.ImeMode = CType(resources.GetObject("checkBox1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.checkBox1.Location = CType(resources.GetObject("checkBox1.Location"), System.Drawing.Point)
        Me.checkBox1.Name = "checkBox1"
        Me.checkBox1.RightToLeft = CType(resources.GetObject("checkBox1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.checkBox1.Size = CType(resources.GetObject("checkBox1.Size"), System.Drawing.Size)
        Me.checkBox1.TabIndex = CType(resources.GetObject("checkBox1.TabIndex"), Integer)
        Me.checkBox1.Text = resources.GetString("checkBox1.Text")
        Me.checkBox1.TextAlign = CType(resources.GetObject("checkBox1.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.checkBox1, resources.GetString("checkBox1.ToolTip"))
        Me.checkBox1.Visible = CType(resources.GetObject("checkBox1.Visible"), Boolean)
        '
        'groupBox1
        '
        Me.groupBox1.AccessibleDescription = resources.GetString("groupBox1.AccessibleDescription")
        Me.groupBox1.AccessibleName = resources.GetString("groupBox1.AccessibleName")
        Me.groupBox1.Anchor = CType(resources.GetObject("groupBox1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.groupBox1.BackgroundImage = CType(resources.GetObject("groupBox1.BackgroundImage"), System.Drawing.Image)
        Me.groupBox1.Controls.AddRange(New System.Windows.Forms.Control() {Me.checkBox3, Me.label4, Me.trackBar, Me.label3, Me.label2, Me.label1, Me.sizeModeComboBox, Me.checkBox2, Me.alignmentComboBox, Me.appearanceComboBox, Me.checkBox1})
        Me.groupBox1.Dock = CType(resources.GetObject("groupBox1.Dock"), System.Windows.Forms.DockStyle)
        Me.groupBox1.Enabled = CType(resources.GetObject("groupBox1.Enabled"), Boolean)
        Me.groupBox1.Font = CType(resources.GetObject("groupBox1.Font"), System.Drawing.Font)
        Me.groupBox1.ImeMode = CType(resources.GetObject("groupBox1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.groupBox1.Location = CType(resources.GetObject("groupBox1.Location"), System.Drawing.Point)
        Me.groupBox1.Name = "groupBox1"
        Me.groupBox1.RightToLeft = CType(resources.GetObject("groupBox1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.groupBox1.Size = CType(resources.GetObject("groupBox1.Size"), System.Drawing.Size)
        Me.groupBox1.TabIndex = CType(resources.GetObject("groupBox1.TabIndex"), Integer)
        Me.groupBox1.TabStop = False
        Me.groupBox1.Text = resources.GetString("groupBox1.Text")
        Me.toolTip1.SetToolTip(Me.groupBox1, resources.GetString("groupBox1.ToolTip"))
        Me.groupBox1.Visible = CType(resources.GetObject("groupBox1.Visible"), Boolean)
        '
        'checkBox3
        '
        Me.checkBox3.AccessibleDescription = resources.GetString("checkBox3.AccessibleDescription")
        Me.checkBox3.AccessibleName = resources.GetString("checkBox3.AccessibleName")
        Me.checkBox3.Anchor = CType(resources.GetObject("checkBox3.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.checkBox3.Appearance = CType(resources.GetObject("checkBox3.Appearance"), System.Windows.Forms.Appearance)
        Me.checkBox3.BackgroundImage = CType(resources.GetObject("checkBox3.BackgroundImage"), System.Drawing.Image)
        Me.checkBox3.CheckAlign = CType(resources.GetObject("checkBox3.CheckAlign"), System.Drawing.ContentAlignment)
        Me.checkBox3.Dock = CType(resources.GetObject("checkBox3.Dock"), System.Windows.Forms.DockStyle)
        Me.checkBox3.Enabled = CType(resources.GetObject("checkBox3.Enabled"), Boolean)
        Me.checkBox3.FlatStyle = CType(resources.GetObject("checkBox3.FlatStyle"), System.Windows.Forms.FlatStyle)
        Me.checkBox3.Font = CType(resources.GetObject("checkBox3.Font"), System.Drawing.Font)
        Me.checkBox3.Image = CType(resources.GetObject("checkBox3.Image"), System.Drawing.Image)
        Me.checkBox3.ImageAlign = CType(resources.GetObject("checkBox3.ImageAlign"), System.Drawing.ContentAlignment)
        Me.checkBox3.ImageIndex = CType(resources.GetObject("checkBox3.ImageIndex"), Integer)
        Me.checkBox3.ImeMode = CType(resources.GetObject("checkBox3.ImeMode"), System.Windows.Forms.ImeMode)
        Me.checkBox3.Location = CType(resources.GetObject("checkBox3.Location"), System.Drawing.Point)
        Me.checkBox3.Name = "checkBox3"
        Me.checkBox3.RightToLeft = CType(resources.GetObject("checkBox3.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.checkBox3.Size = CType(resources.GetObject("checkBox3.Size"), System.Drawing.Size)
        Me.checkBox3.TabIndex = CType(resources.GetObject("checkBox3.TabIndex"), Integer)
        Me.checkBox3.Text = resources.GetString("checkBox3.Text")
        Me.checkBox3.TextAlign = CType(resources.GetObject("checkBox3.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.checkBox3, resources.GetString("checkBox3.ToolTip"))
        Me.checkBox3.Visible = CType(resources.GetObject("checkBox3.Visible"), Boolean)
        '
        'label3
        '
        Me.label3.AccessibleDescription = resources.GetString("label3.AccessibleDescription")
        Me.label3.AccessibleName = resources.GetString("label3.AccessibleName")
        Me.label3.Anchor = CType(resources.GetObject("label3.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.label3.AutoSize = CType(resources.GetObject("label3.AutoSize"), Boolean)
        Me.label3.Dock = CType(resources.GetObject("label3.Dock"), System.Windows.Forms.DockStyle)
        Me.label3.Enabled = CType(resources.GetObject("label3.Enabled"), Boolean)
        Me.label3.Font = CType(resources.GetObject("label3.Font"), System.Drawing.Font)
        Me.label3.Image = CType(resources.GetObject("label3.Image"), System.Drawing.Image)
        Me.label3.ImageAlign = CType(resources.GetObject("label3.ImageAlign"), System.Drawing.ContentAlignment)
        Me.label3.ImageIndex = CType(resources.GetObject("label3.ImageIndex"), Integer)
        Me.label3.ImeMode = CType(resources.GetObject("label3.ImeMode"), System.Windows.Forms.ImeMode)
        Me.label3.Location = CType(resources.GetObject("label3.Location"), System.Drawing.Point)
        Me.label3.Name = "label3"
        Me.label3.RightToLeft = CType(resources.GetObject("label3.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.label3.Size = CType(resources.GetObject("label3.Size"), System.Drawing.Size)
        Me.label3.TabIndex = CType(resources.GetObject("label3.TabIndex"), Integer)
        Me.label3.Text = resources.GetString("label3.Text")
        Me.label3.TextAlign = CType(resources.GetObject("label3.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.label3, resources.GetString("label3.ToolTip"))
        Me.label3.Visible = CType(resources.GetObject("label3.Visible"), Boolean)
        '
        'tabPage1
        '
        Me.tabPage1.AccessibleDescription = resources.GetString("tabPage1.AccessibleDescription")
        Me.tabPage1.AccessibleName = resources.GetString("tabPage1.AccessibleName")
        Me.tabPage1.Anchor = CType(resources.GetObject("tabPage1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tabPage1.AutoScroll = CType(resources.GetObject("tabPage1.AutoScroll"), Boolean)
        Me.tabPage1.AutoScrollMargin = CType(resources.GetObject("tabPage1.AutoScrollMargin"), System.Drawing.Size)
        Me.tabPage1.AutoScrollMinSize = CType(resources.GetObject("tabPage1.AutoScrollMinSize"), System.Drawing.Size)
        Me.tabPage1.BackgroundImage = CType(resources.GetObject("tabPage1.BackgroundImage"), System.Drawing.Image)
        Me.tabPage1.Controls.AddRange(New System.Windows.Forms.Control() {Me.tp1GroupBox1})
        Me.tabPage1.Dock = CType(resources.GetObject("tabPage1.Dock"), System.Windows.Forms.DockStyle)
        Me.tabPage1.Enabled = CType(resources.GetObject("tabPage1.Enabled"), Boolean)
        Me.tabPage1.Font = CType(resources.GetObject("tabPage1.Font"), System.Drawing.Font)
        Me.tabPage1.ImageIndex = CType(resources.GetObject("tabPage1.ImageIndex"), Integer)
        Me.tabPage1.ImeMode = CType(resources.GetObject("tabPage1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tabPage1.Location = CType(resources.GetObject("tabPage1.Location"), System.Drawing.Point)
        Me.tabPage1.Name = "tabPage1"
        Me.tabPage1.RightToLeft = CType(resources.GetObject("tabPage1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tabPage1.Size = CType(resources.GetObject("tabPage1.Size"), System.Drawing.Size)
        Me.tabPage1.TabIndex = CType(resources.GetObject("tabPage1.TabIndex"), Integer)
        Me.tabPage1.Text = resources.GetString("tabPage1.Text")
        Me.toolTip1.SetToolTip(Me.tabPage1, resources.GetString("tabPage1.ToolTip"))
        Me.tabPage1.ToolTipText = resources.GetString("tabPage1.ToolTipText")
        Me.tabPage1.Visible = CType(resources.GetObject("tabPage1.Visible"), Boolean)
        '
        'tp2RadioButton1
        '
        Me.tp2RadioButton1.AccessibleDescription = resources.GetString("tp2RadioButton1.AccessibleDescription")
        Me.tp2RadioButton1.AccessibleName = resources.GetString("tp2RadioButton1.AccessibleName")
        Me.tp2RadioButton1.Anchor = CType(resources.GetObject("tp2RadioButton1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp2RadioButton1.Appearance = CType(resources.GetObject("tp2RadioButton1.Appearance"), System.Windows.Forms.Appearance)
        Me.tp2RadioButton1.BackgroundImage = CType(resources.GetObject("tp2RadioButton1.BackgroundImage"), System.Drawing.Image)
        Me.tp2RadioButton1.CheckAlign = CType(resources.GetObject("tp2RadioButton1.CheckAlign"), System.Drawing.ContentAlignment)
        Me.tp2RadioButton1.Dock = CType(resources.GetObject("tp2RadioButton1.Dock"), System.Windows.Forms.DockStyle)
        Me.tp2RadioButton1.Enabled = CType(resources.GetObject("tp2RadioButton1.Enabled"), Boolean)
        Me.tp2RadioButton1.FlatStyle = CType(resources.GetObject("tp2RadioButton1.FlatStyle"), System.Windows.Forms.FlatStyle)
        Me.tp2RadioButton1.Font = CType(resources.GetObject("tp2RadioButton1.Font"), System.Drawing.Font)
        Me.tp2RadioButton1.Image = CType(resources.GetObject("tp2RadioButton1.Image"), System.Drawing.Image)
        Me.tp2RadioButton1.ImageAlign = CType(resources.GetObject("tp2RadioButton1.ImageAlign"), System.Drawing.ContentAlignment)
        Me.tp2RadioButton1.ImageIndex = CType(resources.GetObject("tp2RadioButton1.ImageIndex"), Integer)
        Me.tp2RadioButton1.ImeMode = CType(resources.GetObject("tp2RadioButton1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp2RadioButton1.Location = CType(resources.GetObject("tp2RadioButton1.Location"), System.Drawing.Point)
        Me.tp2RadioButton1.Name = "tp2RadioButton1"
        Me.tp2RadioButton1.RightToLeft = CType(resources.GetObject("tp2RadioButton1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp2RadioButton1.Size = CType(resources.GetObject("tp2RadioButton1.Size"), System.Drawing.Size)
        Me.tp2RadioButton1.TabIndex = CType(resources.GetObject("tp2RadioButton1.TabIndex"), Integer)
        Me.tp2RadioButton1.Text = resources.GetString("tp2RadioButton1.Text")
        Me.tp2RadioButton1.TextAlign = CType(resources.GetObject("tp2RadioButton1.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.tp2RadioButton1, resources.GetString("tp2RadioButton1.ToolTip"))
        Me.tp2RadioButton1.Visible = CType(resources.GetObject("tp2RadioButton1.Visible"), Boolean)
        '
        'tp3ComboBox2
        '
        Me.tp3ComboBox2.AccessibleDescription = resources.GetString("tp3ComboBox2.AccessibleDescription")
        Me.tp3ComboBox2.AccessibleName = resources.GetString("tp3ComboBox2.AccessibleName")
        Me.tp3ComboBox2.Anchor = CType(resources.GetObject("tp3ComboBox2.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp3ComboBox2.BackgroundImage = CType(resources.GetObject("tp3ComboBox2.BackgroundImage"), System.Drawing.Image)
        Me.tp3ComboBox2.Dock = CType(resources.GetObject("tp3ComboBox2.Dock"), System.Windows.Forms.DockStyle)
        Me.tp3ComboBox2.Enabled = CType(resources.GetObject("tp3ComboBox2.Enabled"), Boolean)
        Me.tp3ComboBox2.Font = CType(resources.GetObject("tp3ComboBox2.Font"), System.Drawing.Font)
        Me.tp3ComboBox2.ImeMode = CType(resources.GetObject("tp3ComboBox2.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp3ComboBox2.IntegralHeight = CType(resources.GetObject("tp3ComboBox2.IntegralHeight"), Boolean)
        Me.tp3ComboBox2.ItemHeight = CType(resources.GetObject("tp3ComboBox2.ItemHeight"), Integer)
        Me.tp3ComboBox2.Location = CType(resources.GetObject("tp3ComboBox2.Location"), System.Drawing.Point)
        Me.tp3ComboBox2.MaxDropDownItems = CType(resources.GetObject("tp3ComboBox2.MaxDropDownItems"), Integer)
        Me.tp3ComboBox2.MaxLength = CType(resources.GetObject("tp3ComboBox2.MaxLength"), Integer)
        Me.tp3ComboBox2.Name = "tp3ComboBox2"
        Me.tp3ComboBox2.RightToLeft = CType(resources.GetObject("tp3ComboBox2.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp3ComboBox2.Size = CType(resources.GetObject("tp3ComboBox2.Size"), System.Drawing.Size)
        Me.tp3ComboBox2.TabIndex = CType(resources.GetObject("tp3ComboBox2.TabIndex"), Integer)
        Me.tp3ComboBox2.Text = resources.GetString("tp3ComboBox2.Text")
        Me.toolTip1.SetToolTip(Me.tp3ComboBox2, resources.GetString("tp3ComboBox2.ToolTip"))
        Me.tp3ComboBox2.Visible = CType(resources.GetObject("tp3ComboBox2.Visible"), Boolean)
        '
        'pictureBox1
        '
        Me.pictureBox1.AccessibleDescription = resources.GetString("pictureBox1.AccessibleDescription")
        Me.pictureBox1.AccessibleName = resources.GetString("pictureBox1.AccessibleName")
        Me.pictureBox1.Anchor = CType(resources.GetObject("pictureBox1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.pictureBox1.BackColor = System.Drawing.SystemColors.ControlLightLight
        Me.pictureBox1.BackgroundImage = CType(resources.GetObject("pictureBox1.BackgroundImage"), System.Drawing.Image)
        Me.pictureBox1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.pictureBox1.Dock = CType(resources.GetObject("pictureBox1.Dock"), System.Windows.Forms.DockStyle)
        Me.pictureBox1.Enabled = CType(resources.GetObject("pictureBox1.Enabled"), Boolean)
        Me.pictureBox1.Font = CType(resources.GetObject("pictureBox1.Font"), System.Drawing.Font)
        Me.pictureBox1.Image = CType(resources.GetObject("pictureBox1.Image"), System.Drawing.Image)
        Me.pictureBox1.ImeMode = CType(resources.GetObject("pictureBox1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.pictureBox1.Location = CType(resources.GetObject("pictureBox1.Location"), System.Drawing.Point)
        Me.pictureBox1.Name = "pictureBox1"
        Me.pictureBox1.RightToLeft = CType(resources.GetObject("pictureBox1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.pictureBox1.Size = CType(resources.GetObject("pictureBox1.Size"), System.Drawing.Size)
        Me.pictureBox1.SizeMode = CType(resources.GetObject("pictureBox1.SizeMode"), System.Windows.Forms.PictureBoxSizeMode)
        Me.pictureBox1.TabIndex = CType(resources.GetObject("pictureBox1.TabIndex"), Integer)
        Me.pictureBox1.TabStop = False
        Me.pictureBox1.Text = resources.GetString("pictureBox1.Text")
        Me.toolTip1.SetToolTip(Me.pictureBox1, resources.GetString("pictureBox1.ToolTip"))
        Me.pictureBox1.Visible = CType(resources.GetObject("pictureBox1.Visible"), Boolean)
        '
        'tabPage4
        '
        Me.tabPage4.AccessibleDescription = resources.GetString("tabPage4.AccessibleDescription")
        Me.tabPage4.AccessibleName = resources.GetString("tabPage4.AccessibleName")
        Me.tabPage4.Anchor = CType(resources.GetObject("tabPage4.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tabPage4.AutoScroll = CType(resources.GetObject("tabPage4.AutoScroll"), Boolean)
        Me.tabPage4.AutoScrollMargin = CType(resources.GetObject("tabPage4.AutoScrollMargin"), System.Drawing.Size)
        Me.tabPage4.AutoScrollMinSize = CType(resources.GetObject("tabPage4.AutoScrollMinSize"), System.Drawing.Size)
        Me.tabPage4.BackgroundImage = CType(resources.GetObject("tabPage4.BackgroundImage"), System.Drawing.Image)
        Me.tabPage4.Controls.AddRange(New System.Windows.Forms.Control() {Me.tp4GroupBox1})
        Me.tabPage4.Dock = CType(resources.GetObject("tabPage4.Dock"), System.Windows.Forms.DockStyle)
        Me.tabPage4.Enabled = CType(resources.GetObject("tabPage4.Enabled"), Boolean)
        Me.tabPage4.Font = CType(resources.GetObject("tabPage4.Font"), System.Drawing.Font)
        Me.tabPage4.ImageIndex = CType(resources.GetObject("tabPage4.ImageIndex"), Integer)
        Me.tabPage4.ImeMode = CType(resources.GetObject("tabPage4.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tabPage4.Location = CType(resources.GetObject("tabPage4.Location"), System.Drawing.Point)
        Me.tabPage4.Name = "tabPage4"
        Me.tabPage4.RightToLeft = CType(resources.GetObject("tabPage4.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tabPage4.Size = CType(resources.GetObject("tabPage4.Size"), System.Drawing.Size)
        Me.tabPage4.TabIndex = CType(resources.GetObject("tabPage4.TabIndex"), Integer)
        Me.tabPage4.Text = resources.GetString("tabPage4.Text")
        Me.toolTip1.SetToolTip(Me.tabPage4, resources.GetString("tabPage4.ToolTip"))
        Me.tabPage4.ToolTipText = resources.GetString("tabPage4.ToolTipText")
        Me.tabPage4.Visible = CType(resources.GetObject("tabPage4.Visible"), Boolean)
        '
        'tp5GroupBox1
        '
        Me.tp5GroupBox1.AccessibleDescription = resources.GetString("tp5GroupBox1.AccessibleDescription")
        Me.tp5GroupBox1.AccessibleName = resources.GetString("tp5GroupBox1.AccessibleName")
        Me.tp5GroupBox1.Anchor = CType(resources.GetObject("tp5GroupBox1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp5GroupBox1.BackgroundImage = CType(resources.GetObject("tp5GroupBox1.BackgroundImage"), System.Drawing.Image)
        Me.tp5GroupBox1.Controls.AddRange(New System.Windows.Forms.Control() {Me.tp5DomainUpDown1})
        Me.tp5GroupBox1.Dock = CType(resources.GetObject("tp5GroupBox1.Dock"), System.Windows.Forms.DockStyle)
        Me.tp5GroupBox1.Enabled = CType(resources.GetObject("tp5GroupBox1.Enabled"), Boolean)
        Me.tp5GroupBox1.Font = CType(resources.GetObject("tp5GroupBox1.Font"), System.Drawing.Font)
        Me.tp5GroupBox1.ImeMode = CType(resources.GetObject("tp5GroupBox1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp5GroupBox1.Location = CType(resources.GetObject("tp5GroupBox1.Location"), System.Drawing.Point)
        Me.tp5GroupBox1.Name = "tp5GroupBox1"
        Me.tp5GroupBox1.RightToLeft = CType(resources.GetObject("tp5GroupBox1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp5GroupBox1.Size = CType(resources.GetObject("tp5GroupBox1.Size"), System.Drawing.Size)
        Me.tp5GroupBox1.TabIndex = CType(resources.GetObject("tp5GroupBox1.TabIndex"), Integer)
        Me.tp5GroupBox1.TabStop = False
        Me.tp5GroupBox1.Text = resources.GetString("tp5GroupBox1.Text")
        Me.toolTip1.SetToolTip(Me.tp5GroupBox1, resources.GetString("tp5GroupBox1.ToolTip"))
        Me.tp5GroupBox1.Visible = CType(resources.GetObject("tp5GroupBox1.Visible"), Boolean)
        '
        'tp2GroupBox1
        '
        Me.tp2GroupBox1.AccessibleDescription = resources.GetString("tp2GroupBox1.AccessibleDescription")
        Me.tp2GroupBox1.AccessibleName = resources.GetString("tp2GroupBox1.AccessibleName")
        Me.tp2GroupBox1.Anchor = CType(resources.GetObject("tp2GroupBox1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp2GroupBox1.BackgroundImage = CType(resources.GetObject("tp2GroupBox1.BackgroundImage"), System.Drawing.Image)
        Me.tp2GroupBox1.Controls.AddRange(New System.Windows.Forms.Control() {Me.tp2ComboBox1, Me.tp2RadioButton1, Me.tp2RadioButton2})
        Me.tp2GroupBox1.Dock = CType(resources.GetObject("tp2GroupBox1.Dock"), System.Windows.Forms.DockStyle)
        Me.tp2GroupBox1.Enabled = CType(resources.GetObject("tp2GroupBox1.Enabled"), Boolean)
        Me.tp2GroupBox1.Font = CType(resources.GetObject("tp2GroupBox1.Font"), System.Drawing.Font)
        Me.tp2GroupBox1.ImeMode = CType(resources.GetObject("tp2GroupBox1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp2GroupBox1.Location = CType(resources.GetObject("tp2GroupBox1.Location"), System.Drawing.Point)
        Me.tp2GroupBox1.Name = "tp2GroupBox1"
        Me.tp2GroupBox1.RightToLeft = CType(resources.GetObject("tp2GroupBox1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp2GroupBox1.Size = CType(resources.GetObject("tp2GroupBox1.Size"), System.Drawing.Size)
        Me.tp2GroupBox1.TabIndex = CType(resources.GetObject("tp2GroupBox1.TabIndex"), Integer)
        Me.tp2GroupBox1.TabStop = False
        Me.tp2GroupBox1.Text = resources.GetString("tp2GroupBox1.Text")
        Me.toolTip1.SetToolTip(Me.tp2GroupBox1, resources.GetString("tp2GroupBox1.ToolTip"))
        Me.tp2GroupBox1.Visible = CType(resources.GetObject("tp2GroupBox1.Visible"), Boolean)
        '
        'tp3ComboBox1
        '
        Me.tp3ComboBox1.AccessibleDescription = resources.GetString("tp3ComboBox1.AccessibleDescription")
        Me.tp3ComboBox1.AccessibleName = resources.GetString("tp3ComboBox1.AccessibleName")
        Me.tp3ComboBox1.Anchor = CType(resources.GetObject("tp3ComboBox1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp3ComboBox1.BackgroundImage = CType(resources.GetObject("tp3ComboBox1.BackgroundImage"), System.Drawing.Image)
        Me.tp3ComboBox1.Dock = CType(resources.GetObject("tp3ComboBox1.Dock"), System.Windows.Forms.DockStyle)
        Me.tp3ComboBox1.Enabled = CType(resources.GetObject("tp3ComboBox1.Enabled"), Boolean)
        Me.tp3ComboBox1.Font = CType(resources.GetObject("tp3ComboBox1.Font"), System.Drawing.Font)
        Me.tp3ComboBox1.ImeMode = CType(resources.GetObject("tp3ComboBox1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp3ComboBox1.IntegralHeight = CType(resources.GetObject("tp3ComboBox1.IntegralHeight"), Boolean)
        Me.tp3ComboBox1.ItemHeight = CType(resources.GetObject("tp3ComboBox1.ItemHeight"), Integer)
        Me.tp3ComboBox1.Location = CType(resources.GetObject("tp3ComboBox1.Location"), System.Drawing.Point)
        Me.tp3ComboBox1.MaxDropDownItems = CType(resources.GetObject("tp3ComboBox1.MaxDropDownItems"), Integer)
        Me.tp3ComboBox1.MaxLength = CType(resources.GetObject("tp3ComboBox1.MaxLength"), Integer)
        Me.tp3ComboBox1.Name = "tp3ComboBox1"
        Me.tp3ComboBox1.RightToLeft = CType(resources.GetObject("tp3ComboBox1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp3ComboBox1.Size = CType(resources.GetObject("tp3ComboBox1.Size"), System.Drawing.Size)
        Me.tp3ComboBox1.TabIndex = CType(resources.GetObject("tp3ComboBox1.TabIndex"), Integer)
        Me.tp3ComboBox1.Text = resources.GetString("tp3ComboBox1.Text")
        Me.toolTip1.SetToolTip(Me.tp3ComboBox1, resources.GetString("tp3ComboBox1.ToolTip"))
        Me.tp3ComboBox1.Visible = CType(resources.GetObject("tp3ComboBox1.Visible"), Boolean)
        '
        'tp3Button1
        '
        Me.tp3Button1.AccessibleDescription = resources.GetString("tp3Button1.AccessibleDescription")
        Me.tp3Button1.AccessibleName = resources.GetString("tp3Button1.AccessibleName")
        Me.tp3Button1.Anchor = CType(resources.GetObject("tp3Button1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp3Button1.BackgroundImage = CType(resources.GetObject("tp3Button1.BackgroundImage"), System.Drawing.Image)
        Me.tp3Button1.Dock = CType(resources.GetObject("tp3Button1.Dock"), System.Windows.Forms.DockStyle)
        Me.tp3Button1.Enabled = CType(resources.GetObject("tp3Button1.Enabled"), Boolean)
        Me.tp3Button1.FlatStyle = CType(resources.GetObject("tp3Button1.FlatStyle"), System.Windows.Forms.FlatStyle)
        Me.tp3Button1.Font = CType(resources.GetObject("tp3Button1.Font"), System.Drawing.Font)
        Me.tp3Button1.Image = CType(resources.GetObject("tp3Button1.Image"), System.Drawing.Image)
        Me.tp3Button1.ImageAlign = CType(resources.GetObject("tp3Button1.ImageAlign"), System.Drawing.ContentAlignment)
        Me.tp3Button1.ImageIndex = CType(resources.GetObject("tp3Button1.ImageIndex"), Integer)
        Me.tp3Button1.ImeMode = CType(resources.GetObject("tp3Button1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp3Button1.Location = CType(resources.GetObject("tp3Button1.Location"), System.Drawing.Point)
        Me.tp3Button1.Name = "tp3Button1"
        Me.tp3Button1.RightToLeft = CType(resources.GetObject("tp3Button1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp3Button1.Size = CType(resources.GetObject("tp3Button1.Size"), System.Drawing.Size)
        Me.tp3Button1.TabIndex = CType(resources.GetObject("tp3Button1.TabIndex"), Integer)
        Me.tp3Button1.Text = resources.GetString("tp3Button1.Text")
        Me.tp3Button1.TextAlign = CType(resources.GetObject("tp3Button1.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.tp3Button1, resources.GetString("tp3Button1.ToolTip"))
        Me.tp3Button1.Visible = CType(resources.GetObject("tp3Button1.Visible"), Boolean)
        '
        'tabControl1
        '
        Me.tabControl1.AccessibleDescription = resources.GetString("tabControl1.AccessibleDescription")
        Me.tabControl1.AccessibleName = resources.GetString("tabControl1.AccessibleName")
        Me.tabControl1.Alignment = CType(resources.GetObject("tabControl1.Alignment"), System.Windows.Forms.TabAlignment)
        Me.tabControl1.Anchor = CType(resources.GetObject("tabControl1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tabControl1.Appearance = CType(resources.GetObject("tabControl1.Appearance"), System.Windows.Forms.TabAppearance)
        Me.tabControl1.BackgroundImage = CType(resources.GetObject("tabControl1.BackgroundImage"), System.Drawing.Image)
        Me.tabControl1.Controls.AddRange(New System.Windows.Forms.Control() {Me.tabPage1, Me.tabPage3, Me.tabPage2, Me.tabPage5, Me.tabPage4})
        Me.tabControl1.Dock = CType(resources.GetObject("tabControl1.Dock"), System.Windows.Forms.DockStyle)
        Me.tabControl1.Enabled = CType(resources.GetObject("tabControl1.Enabled"), Boolean)
        Me.tabControl1.Font = CType(resources.GetObject("tabControl1.Font"), System.Drawing.Font)
        Me.tabControl1.ImageList = Me.imageList1
        Me.tabControl1.ImeMode = CType(resources.GetObject("tabControl1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tabControl1.ItemSize = CType(resources.GetObject("tabControl1.ItemSize"), System.Drawing.Size)
        Me.tabControl1.Location = CType(resources.GetObject("tabControl1.Location"), System.Drawing.Point)
        Me.tabControl1.Name = "tabControl1"
        Me.tabControl1.Padding = CType(resources.GetObject("tabControl1.Padding"), System.Drawing.Point)
        Me.tabControl1.RightToLeft = CType(resources.GetObject("tabControl1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tabControl1.SelectedIndex = 0
        Me.tabControl1.ShowToolTips = CType(resources.GetObject("tabControl1.ShowToolTips"), Boolean)
        Me.tabControl1.Size = CType(resources.GetObject("tabControl1.Size"), System.Drawing.Size)
        Me.tabControl1.TabIndex = CType(resources.GetObject("tabControl1.TabIndex"), Integer)
        Me.tabControl1.Text = resources.GetString("tabControl1.Text")
        Me.toolTip1.SetToolTip(Me.tabControl1, resources.GetString("tabControl1.ToolTip"))
        Me.tabControl1.Visible = CType(resources.GetObject("tabControl1.Visible"), Boolean)
        '
        'tabPage3
        '
        Me.tabPage3.AccessibleDescription = resources.GetString("tabPage3.AccessibleDescription")
        Me.tabPage3.AccessibleName = resources.GetString("tabPage3.AccessibleName")
        Me.tabPage3.Anchor = CType(resources.GetObject("tabPage3.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tabPage3.AutoScroll = CType(resources.GetObject("tabPage3.AutoScroll"), Boolean)
        Me.tabPage3.AutoScrollMargin = CType(resources.GetObject("tabPage3.AutoScrollMargin"), System.Drawing.Size)
        Me.tabPage3.AutoScrollMinSize = CType(resources.GetObject("tabPage3.AutoScrollMinSize"), System.Drawing.Size)
        Me.tabPage3.BackgroundImage = CType(resources.GetObject("tabPage3.BackgroundImage"), System.Drawing.Image)
        Me.tabPage3.Controls.AddRange(New System.Windows.Forms.Control() {Me.tp3GroupBox1})
        Me.tabPage3.Dock = CType(resources.GetObject("tabPage3.Dock"), System.Windows.Forms.DockStyle)
        Me.tabPage3.Enabled = CType(resources.GetObject("tabPage3.Enabled"), Boolean)
        Me.tabPage3.Font = CType(resources.GetObject("tabPage3.Font"), System.Drawing.Font)
        Me.tabPage3.ImageIndex = CType(resources.GetObject("tabPage3.ImageIndex"), Integer)
        Me.tabPage3.ImeMode = CType(resources.GetObject("tabPage3.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tabPage3.Location = CType(resources.GetObject("tabPage3.Location"), System.Drawing.Point)
        Me.tabPage3.Name = "tabPage3"
        Me.tabPage3.RightToLeft = CType(resources.GetObject("tabPage3.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tabPage3.Size = CType(resources.GetObject("tabPage3.Size"), System.Drawing.Size)
        Me.tabPage3.TabIndex = CType(resources.GetObject("tabPage3.TabIndex"), Integer)
        Me.tabPage3.Text = resources.GetString("tabPage3.Text")
        Me.toolTip1.SetToolTip(Me.tabPage3, resources.GetString("tabPage3.ToolTip"))
        Me.tabPage3.ToolTipText = resources.GetString("tabPage3.ToolTipText")
        Me.tabPage3.Visible = CType(resources.GetObject("tabPage3.Visible"), Boolean)
        '
        'tp3GroupBox1
        '
        Me.tp3GroupBox1.AccessibleDescription = resources.GetString("tp3GroupBox1.AccessibleDescription")
        Me.tp3GroupBox1.AccessibleName = resources.GetString("tp3GroupBox1.AccessibleName")
        Me.tp3GroupBox1.Anchor = CType(resources.GetObject("tp3GroupBox1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp3GroupBox1.BackgroundImage = CType(resources.GetObject("tp3GroupBox1.BackgroundImage"), System.Drawing.Image)
        Me.tp3GroupBox1.Controls.AddRange(New System.Windows.Forms.Control() {Me.tp3ComboBox2, Me.tp3Label1, Me.tp3RadioButton2, Me.tp3Button1, Me.tp3ComboBox1, Me.tp3RadioButton1})
        Me.tp3GroupBox1.Dock = CType(resources.GetObject("tp3GroupBox1.Dock"), System.Windows.Forms.DockStyle)
        Me.tp3GroupBox1.Enabled = CType(resources.GetObject("tp3GroupBox1.Enabled"), Boolean)
        Me.tp3GroupBox1.Font = CType(resources.GetObject("tp3GroupBox1.Font"), System.Drawing.Font)
        Me.tp3GroupBox1.ImeMode = CType(resources.GetObject("tp3GroupBox1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp3GroupBox1.Location = CType(resources.GetObject("tp3GroupBox1.Location"), System.Drawing.Point)
        Me.tp3GroupBox1.Name = "tp3GroupBox1"
        Me.tp3GroupBox1.RightToLeft = CType(resources.GetObject("tp3GroupBox1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp3GroupBox1.Size = CType(resources.GetObject("tp3GroupBox1.Size"), System.Drawing.Size)
        Me.tp3GroupBox1.TabIndex = CType(resources.GetObject("tp3GroupBox1.TabIndex"), Integer)
        Me.tp3GroupBox1.TabStop = False
        Me.tp3GroupBox1.Text = resources.GetString("tp3GroupBox1.Text")
        Me.toolTip1.SetToolTip(Me.tp3GroupBox1, resources.GetString("tp3GroupBox1.ToolTip"))
        Me.tp3GroupBox1.Visible = CType(resources.GetObject("tp3GroupBox1.Visible"), Boolean)
        '
        'tp3Label1
        '
        Me.tp3Label1.AccessibleDescription = resources.GetString("tp3Label1.AccessibleDescription")
        Me.tp3Label1.AccessibleName = resources.GetString("tp3Label1.AccessibleName")
        Me.tp3Label1.Anchor = CType(resources.GetObject("tp3Label1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tp3Label1.AutoSize = CType(resources.GetObject("tp3Label1.AutoSize"), Boolean)
        Me.tp3Label1.Dock = CType(resources.GetObject("tp3Label1.Dock"), System.Windows.Forms.DockStyle)
        Me.tp3Label1.Enabled = CType(resources.GetObject("tp3Label1.Enabled"), Boolean)
        Me.tp3Label1.Font = CType(resources.GetObject("tp3Label1.Font"), System.Drawing.Font)
        Me.tp3Label1.Image = CType(resources.GetObject("tp3Label1.Image"), System.Drawing.Image)
        Me.tp3Label1.ImageAlign = CType(resources.GetObject("tp3Label1.ImageAlign"), System.Drawing.ContentAlignment)
        Me.tp3Label1.ImageIndex = CType(resources.GetObject("tp3Label1.ImageIndex"), Integer)
        Me.tp3Label1.ImeMode = CType(resources.GetObject("tp3Label1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tp3Label1.Location = CType(resources.GetObject("tp3Label1.Location"), System.Drawing.Point)
        Me.tp3Label1.Name = "tp3Label1"
        Me.tp3Label1.RightToLeft = CType(resources.GetObject("tp3Label1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tp3Label1.Size = CType(resources.GetObject("tp3Label1.Size"), System.Drawing.Size)
        Me.tp3Label1.TabIndex = CType(resources.GetObject("tp3Label1.TabIndex"), Integer)
        Me.tp3Label1.Text = resources.GetString("tp3Label1.Text")
        Me.tp3Label1.TextAlign = CType(resources.GetObject("tp3Label1.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.tp3Label1, resources.GetString("tp3Label1.ToolTip"))
        Me.tp3Label1.Visible = CType(resources.GetObject("tp3Label1.Visible"), Boolean)
        '
        'tabPage2
        '
        Me.tabPage2.AccessibleDescription = resources.GetString("tabPage2.AccessibleDescription")
        Me.tabPage2.AccessibleName = resources.GetString("tabPage2.AccessibleName")
        Me.tabPage2.Anchor = CType(resources.GetObject("tabPage2.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tabPage2.AutoScroll = CType(resources.GetObject("tabPage2.AutoScroll"), Boolean)
        Me.tabPage2.AutoScrollMargin = CType(resources.GetObject("tabPage2.AutoScrollMargin"), System.Drawing.Size)
        Me.tabPage2.AutoScrollMinSize = CType(resources.GetObject("tabPage2.AutoScrollMinSize"), System.Drawing.Size)
        Me.tabPage2.BackgroundImage = CType(resources.GetObject("tabPage2.BackgroundImage"), System.Drawing.Image)
        Me.tabPage2.Controls.AddRange(New System.Windows.Forms.Control() {Me.tp2GroupBox1})
        Me.tabPage2.Dock = CType(resources.GetObject("tabPage2.Dock"), System.Windows.Forms.DockStyle)
        Me.tabPage2.Enabled = CType(resources.GetObject("tabPage2.Enabled"), Boolean)
        Me.tabPage2.Font = CType(resources.GetObject("tabPage2.Font"), System.Drawing.Font)
        Me.tabPage2.ImageIndex = CType(resources.GetObject("tabPage2.ImageIndex"), Integer)
        Me.tabPage2.ImeMode = CType(resources.GetObject("tabPage2.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tabPage2.Location = CType(resources.GetObject("tabPage2.Location"), System.Drawing.Point)
        Me.tabPage2.Name = "tabPage2"
        Me.tabPage2.RightToLeft = CType(resources.GetObject("tabPage2.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tabPage2.Size = CType(resources.GetObject("tabPage2.Size"), System.Drawing.Size)
        Me.tabPage2.TabIndex = CType(resources.GetObject("tabPage2.TabIndex"), Integer)
        Me.tabPage2.Text = resources.GetString("tabPage2.Text")
        Me.toolTip1.SetToolTip(Me.tabPage2, resources.GetString("tabPage2.ToolTip"))
        Me.tabPage2.ToolTipText = resources.GetString("tabPage2.ToolTipText")
        Me.tabPage2.Visible = CType(resources.GetObject("tabPage2.Visible"), Boolean)
        '
        'tabPage5
        '
        Me.tabPage5.AccessibleDescription = resources.GetString("tabPage5.AccessibleDescription")
        Me.tabPage5.AccessibleName = resources.GetString("tabPage5.AccessibleName")
        Me.tabPage5.Anchor = CType(resources.GetObject("tabPage5.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.tabPage5.AutoScroll = CType(resources.GetObject("tabPage5.AutoScroll"), Boolean)
        Me.tabPage5.AutoScrollMargin = CType(resources.GetObject("tabPage5.AutoScrollMargin"), System.Drawing.Size)
        Me.tabPage5.AutoScrollMinSize = CType(resources.GetObject("tabPage5.AutoScrollMinSize"), System.Drawing.Size)
        Me.tabPage5.BackgroundImage = CType(resources.GetObject("tabPage5.BackgroundImage"), System.Drawing.Image)
        Me.tabPage5.Controls.AddRange(New System.Windows.Forms.Control() {Me.tp5GroupBox1})
        Me.tabPage5.Dock = CType(resources.GetObject("tabPage5.Dock"), System.Windows.Forms.DockStyle)
        Me.tabPage5.Enabled = CType(resources.GetObject("tabPage5.Enabled"), Boolean)
        Me.tabPage5.Font = CType(resources.GetObject("tabPage5.Font"), System.Drawing.Font)
        Me.tabPage5.ImageIndex = CType(resources.GetObject("tabPage5.ImageIndex"), Integer)
        Me.tabPage5.ImeMode = CType(resources.GetObject("tabPage5.ImeMode"), System.Windows.Forms.ImeMode)
        Me.tabPage5.Location = CType(resources.GetObject("tabPage5.Location"), System.Drawing.Point)
        Me.tabPage5.Name = "tabPage5"
        Me.tabPage5.RightToLeft = CType(resources.GetObject("tabPage5.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.tabPage5.Size = CType(resources.GetObject("tabPage5.Size"), System.Drawing.Size)
        Me.tabPage5.TabIndex = CType(resources.GetObject("tabPage5.TabIndex"), Integer)
        Me.tabPage5.Text = resources.GetString("tabPage5.Text")
        Me.toolTip1.SetToolTip(Me.tabPage5, resources.GetString("tabPage5.ToolTip"))
        Me.tabPage5.ToolTipText = resources.GetString("tabPage5.ToolTipText")
        Me.tabPage5.Visible = CType(resources.GetObject("tabPage5.Visible"), Boolean)
        '
        'TabControlCtl
        '
        Me.AccessibleDescription = resources.GetString("$this.AccessibleDescription")
        Me.AccessibleName = resources.GetString("$this.AccessibleName")
        Me.AutoScaleBaseSize = CType(resources.GetObject("$this.AutoScaleBaseSize"), System.Drawing.Size)
        Me.AutoScroll = CType(resources.GetObject("$this.AutoScroll"), Boolean)
        Me.AutoScrollMargin = CType(resources.GetObject("$this.AutoScrollMargin"), System.Drawing.Size)
        Me.AutoScrollMinSize = CType(resources.GetObject("$this.AutoScrollMinSize"), System.Drawing.Size)
        Me.BackgroundImage = CType(resources.GetObject("$this.BackgroundImage"), System.Drawing.Image)
        Me.ClientSize = CType(resources.GetObject("$this.ClientSize"), System.Drawing.Size)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.tabControl1, Me.pictureBox1, Me.groupBox1})
        Me.Enabled = CType(resources.GetObject("$this.Enabled"), Boolean)
        Me.Font = CType(resources.GetObject("$this.Font"), System.Drawing.Font)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.ImeMode = CType(resources.GetObject("$this.ImeMode"), System.Windows.Forms.ImeMode)
        Me.Location = CType(resources.GetObject("$this.Location"), System.Drawing.Point)
        Me.MaximumSize = CType(resources.GetObject("$this.MaximumSize"), System.Drawing.Size)
        Me.MinimumSize = CType(resources.GetObject("$this.MinimumSize"), System.Drawing.Size)
        Me.Name = "TabControlCtl"
        Me.RightToLeft = CType(resources.GetObject("$this.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.StartPosition = CType(resources.GetObject("$this.StartPosition"), System.Windows.Forms.FormStartPosition)
        Me.Text = resources.GetString("$this.Text")
        Me.toolTip1.SetToolTip(Me, resources.GetString("$this.ToolTip"))
        Me.tp1GroupBox1.ResumeLayout(False)
        CType(Me.trackBar, System.ComponentModel.ISupportInitialize).EndInit()
        Me.tp4GroupBox1.ResumeLayout(False)
        CType(Me.tp4UpDown1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.groupBox1.ResumeLayout(False)
        Me.tabPage1.ResumeLayout(False)
        Me.tabPage4.ResumeLayout(False)
        Me.tp5GroupBox1.ResumeLayout(False)
        Me.tp2GroupBox1.ResumeLayout(False)
        Me.tabControl1.ResumeLayout(False)
        Me.tabPage3.ResumeLayout(False)
        Me.tp3GroupBox1.ResumeLayout(False)
        Me.tabPage2.ResumeLayout(False)
        Me.tabPage5.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region


    ' The main entry point for the application.
    <STAThread()> Public Shared Sub Main()
        Application.Run(New TabControlCtl())
    End Sub


End Class


