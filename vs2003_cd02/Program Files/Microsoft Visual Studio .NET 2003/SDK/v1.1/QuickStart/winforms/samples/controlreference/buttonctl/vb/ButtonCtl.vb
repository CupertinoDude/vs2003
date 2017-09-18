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
Imports System.Resources

'/ <summary>
'/    This class demonstrates the Button control.
'/ </summary>
Public Class ButtonCtl
    Inherits System.Windows.Forms.Form

    '/ <summary>
    '/    Required designer variables.
    '/ </summary>

    Public Sub New()

        MyBase.New()

        ButtonCtl = Me

        'This call is required by the Windows Forms Designer.
        InitializeComponent()

        ' Set up combo-boxes

        Dim cmbItems() As Object

        cmbItems = CType(New StringIntObject() {New StringIntObject("Flat", CInt(FlatStyle.Flat)), New StringIntObject("Popup", CInt(FlatStyle.Popup)), New StringIntObject("Standard", CInt(FlatStyle.Standard)), New StringIntObject("System", CInt(FlatStyle.System))}, Object())

        cmbFlatStyle.Items.AddRange(cmbItems)
        cmbFlatStyle.SelectedIndex = 0

        cmbItems = CType(New StringIntObject() {New StringIntObject("TopLeft", CInt(ContentAlignment.TopLeft)), New StringIntObject("TopCenter", CInt(ContentAlignment.TopCenter)), New StringIntObject("TopRight", CInt(ContentAlignment.TopRight)), New StringIntObject("MiddleLeft", CInt(ContentAlignment.MiddleLeft)), New StringIntObject("MiddleCenter", CInt(ContentAlignment.MiddleCenter)), New StringIntObject("MiddleRight", CInt(ContentAlignment.MiddleRight)), New StringIntObject("BottomLeft", CInt(ContentAlignment.BottomLeft)), New StringIntObject("BottomCenter", CInt(ContentAlignment.BottomCenter)), New StringIntObject("BottomRight", CInt(ContentAlignment.BottomRight))}, Object())

        cmbTextAlign.Items.AddRange(cmbItems)
        cmbTextAlign.SelectedIndex = 1

        cmbImageAlign.Items.AddRange(cmbItems)
        cmbImageAlign.SelectedIndex = 0

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


#Region " Windows Form Designer generated code "

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.Container
    Private WithEvents chkImage As System.Windows.Forms.CheckBox
    Private WithEvents cmbImageAlign As System.Windows.Forms.ComboBox
    Private WithEvents label3 As System.Windows.Forms.Label
    Private WithEvents cmbTextAlign As System.Windows.Forms.ComboBox
    Private WithEvents label2 As System.Windows.Forms.Label
    Private WithEvents cmbFlatStyle As System.Windows.Forms.ComboBox
    Private WithEvents label1 As System.Windows.Forms.Label
    Private WithEvents chkBGImage As System.Windows.Forms.CheckBox
    Private WithEvents button1 As System.Windows.Forms.Button
    Private WithEvents panel1 As System.Windows.Forms.Panel
    Private WithEvents grpBehavior As System.Windows.Forms.GroupBox


    Private WithEvents ButtonCtl As System.Windows.Forms.Form

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.
    'Do not modify it using the code editor.
    Private Sub InitializeComponent()
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(ButtonCtl))
        Me.grpBehavior = New System.Windows.Forms.GroupBox
        Me.chkImage = New System.Windows.Forms.CheckBox
        Me.cmbImageAlign = New System.Windows.Forms.ComboBox
        Me.cmbTextAlign = New System.Windows.Forms.ComboBox
        Me.label2 = New System.Windows.Forms.Label
        Me.cmbFlatStyle = New System.Windows.Forms.ComboBox
        Me.label1 = New System.Windows.Forms.Label
        Me.chkBGImage = New System.Windows.Forms.CheckBox
        Me.label3 = New System.Windows.Forms.Label
        Me.panel1 = New System.Windows.Forms.Panel
        Me.button1 = New System.Windows.Forms.Button
        Me.grpBehavior.SuspendLayout()
        Me.panel1.SuspendLayout()
        Me.SuspendLayout()
        '
        'grpBehavior
        '
        Me.grpBehavior.AccessibleDescription = resources.GetString("grpBehavior.AccessibleDescription")
        Me.grpBehavior.AccessibleName = resources.GetString("grpBehavior.AccessibleName")
        Me.grpBehavior.Anchor = CType(resources.GetObject("grpBehavior.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.grpBehavior.BackgroundImage = CType(resources.GetObject("grpBehavior.BackgroundImage"), System.Drawing.Image)
        Me.grpBehavior.Controls.AddRange(New System.Windows.Forms.Control() {Me.chkImage, Me.cmbImageAlign, Me.cmbTextAlign, Me.label2, Me.cmbFlatStyle, Me.label1, Me.chkBGImage, Me.label3})
        Me.grpBehavior.Dock = CType(resources.GetObject("grpBehavior.Dock"), System.Windows.Forms.DockStyle)
        Me.grpBehavior.Enabled = CType(resources.GetObject("grpBehavior.Enabled"), Boolean)
        Me.grpBehavior.Font = CType(resources.GetObject("grpBehavior.Font"), System.Drawing.Font)
        Me.grpBehavior.ImeMode = CType(resources.GetObject("grpBehavior.ImeMode"), System.Windows.Forms.ImeMode)
        Me.grpBehavior.Location = CType(resources.GetObject("grpBehavior.Location"), System.Drawing.Point)
        Me.grpBehavior.Name = "grpBehavior"
        Me.grpBehavior.RightToLeft = CType(resources.GetObject("grpBehavior.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.grpBehavior.Size = CType(resources.GetObject("grpBehavior.Size"), System.Drawing.Size)
        Me.grpBehavior.TabIndex = CType(resources.GetObject("grpBehavior.TabIndex"), Integer)
        Me.grpBehavior.TabStop = False
        Me.grpBehavior.Text = resources.GetString("grpBehavior.Text")
        Me.grpBehavior.Visible = CType(resources.GetObject("grpBehavior.Visible"), Boolean)
        '
        'chkImage
        '
        Me.chkImage.AccessibleDescription = resources.GetString("chkImage.AccessibleDescription")
        Me.chkImage.AccessibleName = resources.GetString("chkImage.AccessibleName")
        Me.chkImage.Anchor = CType(resources.GetObject("chkImage.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.chkImage.Appearance = CType(resources.GetObject("chkImage.Appearance"), System.Windows.Forms.Appearance)
        Me.chkImage.BackgroundImage = CType(resources.GetObject("chkImage.BackgroundImage"), System.Drawing.Image)
        Me.chkImage.CheckAlign = CType(resources.GetObject("chkImage.CheckAlign"), System.Drawing.ContentAlignment)
        Me.chkImage.Checked = True
        Me.chkImage.CheckState = System.Windows.Forms.CheckState.Checked
        Me.chkImage.Dock = CType(resources.GetObject("chkImage.Dock"), System.Windows.Forms.DockStyle)
        Me.chkImage.Enabled = CType(resources.GetObject("chkImage.Enabled"), Boolean)
        Me.chkImage.FlatStyle = CType(resources.GetObject("chkImage.FlatStyle"), System.Windows.Forms.FlatStyle)
        Me.chkImage.Font = CType(resources.GetObject("chkImage.Font"), System.Drawing.Font)
        Me.chkImage.Image = CType(resources.GetObject("chkImage.Image"), System.Drawing.Image)
        Me.chkImage.ImageAlign = CType(resources.GetObject("chkImage.ImageAlign"), System.Drawing.ContentAlignment)
        Me.chkImage.ImageIndex = CType(resources.GetObject("chkImage.ImageIndex"), Integer)
        Me.chkImage.ImeMode = CType(resources.GetObject("chkImage.ImeMode"), System.Windows.Forms.ImeMode)
        Me.chkImage.Location = CType(resources.GetObject("chkImage.Location"), System.Drawing.Point)
        Me.chkImage.Name = "chkImage"
        Me.chkImage.RightToLeft = CType(resources.GetObject("chkImage.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.chkImage.Size = CType(resources.GetObject("chkImage.Size"), System.Drawing.Size)
        Me.chkImage.TabIndex = CType(resources.GetObject("chkImage.TabIndex"), Integer)
        Me.chkImage.Text = resources.GetString("chkImage.Text")
        Me.chkImage.TextAlign = CType(resources.GetObject("chkImage.TextAlign"), System.Drawing.ContentAlignment)
        Me.chkImage.Visible = CType(resources.GetObject("chkImage.Visible"), Boolean)
        '
        'cmbImageAlign
        '
        Me.cmbImageAlign.AccessibleDescription = resources.GetString("cmbImageAlign.AccessibleDescription")
        Me.cmbImageAlign.AccessibleName = resources.GetString("cmbImageAlign.AccessibleName")
        Me.cmbImageAlign.Anchor = CType(resources.GetObject("cmbImageAlign.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.cmbImageAlign.BackgroundImage = CType(resources.GetObject("cmbImageAlign.BackgroundImage"), System.Drawing.Image)
        Me.cmbImageAlign.Dock = CType(resources.GetObject("cmbImageAlign.Dock"), System.Windows.Forms.DockStyle)
        Me.cmbImageAlign.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cmbImageAlign.Enabled = CType(resources.GetObject("cmbImageAlign.Enabled"), Boolean)
        Me.cmbImageAlign.Font = CType(resources.GetObject("cmbImageAlign.Font"), System.Drawing.Font)
        Me.cmbImageAlign.ImeMode = CType(resources.GetObject("cmbImageAlign.ImeMode"), System.Windows.Forms.ImeMode)
        Me.cmbImageAlign.IntegralHeight = CType(resources.GetObject("cmbImageAlign.IntegralHeight"), Boolean)
        Me.cmbImageAlign.ItemHeight = CType(resources.GetObject("cmbImageAlign.ItemHeight"), Integer)
        Me.cmbImageAlign.Location = CType(resources.GetObject("cmbImageAlign.Location"), System.Drawing.Point)
        Me.cmbImageAlign.MaxDropDownItems = CType(resources.GetObject("cmbImageAlign.MaxDropDownItems"), Integer)
        Me.cmbImageAlign.MaxLength = CType(resources.GetObject("cmbImageAlign.MaxLength"), Integer)
        Me.cmbImageAlign.Name = "cmbImageAlign"
        Me.cmbImageAlign.RightToLeft = CType(resources.GetObject("cmbImageAlign.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.cmbImageAlign.Size = CType(resources.GetObject("cmbImageAlign.Size"), System.Drawing.Size)
        Me.cmbImageAlign.TabIndex = CType(resources.GetObject("cmbImageAlign.TabIndex"), Integer)
        Me.cmbImageAlign.Text = resources.GetString("cmbImageAlign.Text")
        Me.cmbImageAlign.Visible = CType(resources.GetObject("cmbImageAlign.Visible"), Boolean)
        '
        'cmbTextAlign
        '
        Me.cmbTextAlign.AccessibleDescription = resources.GetString("cmbTextAlign.AccessibleDescription")
        Me.cmbTextAlign.AccessibleName = resources.GetString("cmbTextAlign.AccessibleName")
        Me.cmbTextAlign.Anchor = CType(resources.GetObject("cmbTextAlign.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.cmbTextAlign.BackgroundImage = CType(resources.GetObject("cmbTextAlign.BackgroundImage"), System.Drawing.Image)
        Me.cmbTextAlign.Dock = CType(resources.GetObject("cmbTextAlign.Dock"), System.Windows.Forms.DockStyle)
        Me.cmbTextAlign.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cmbTextAlign.Enabled = CType(resources.GetObject("cmbTextAlign.Enabled"), Boolean)
        Me.cmbTextAlign.Font = CType(resources.GetObject("cmbTextAlign.Font"), System.Drawing.Font)
        Me.cmbTextAlign.ImeMode = CType(resources.GetObject("cmbTextAlign.ImeMode"), System.Windows.Forms.ImeMode)
        Me.cmbTextAlign.IntegralHeight = CType(resources.GetObject("cmbTextAlign.IntegralHeight"), Boolean)
        Me.cmbTextAlign.ItemHeight = CType(resources.GetObject("cmbTextAlign.ItemHeight"), Integer)
        Me.cmbTextAlign.Location = CType(resources.GetObject("cmbTextAlign.Location"), System.Drawing.Point)
        Me.cmbTextAlign.MaxDropDownItems = CType(resources.GetObject("cmbTextAlign.MaxDropDownItems"), Integer)
        Me.cmbTextAlign.MaxLength = CType(resources.GetObject("cmbTextAlign.MaxLength"), Integer)
        Me.cmbTextAlign.Name = "cmbTextAlign"
        Me.cmbTextAlign.RightToLeft = CType(resources.GetObject("cmbTextAlign.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.cmbTextAlign.Size = CType(resources.GetObject("cmbTextAlign.Size"), System.Drawing.Size)
        Me.cmbTextAlign.TabIndex = CType(resources.GetObject("cmbTextAlign.TabIndex"), Integer)
        Me.cmbTextAlign.Text = resources.GetString("cmbTextAlign.Text")
        Me.cmbTextAlign.Visible = CType(resources.GetObject("cmbTextAlign.Visible"), Boolean)
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
        Me.label2.Visible = CType(resources.GetObject("label2.Visible"), Boolean)
        '
        'cmbFlatStyle
        '
        Me.cmbFlatStyle.AccessibleDescription = resources.GetString("cmbFlatStyle.AccessibleDescription")
        Me.cmbFlatStyle.AccessibleName = resources.GetString("cmbFlatStyle.AccessibleName")
        Me.cmbFlatStyle.Anchor = CType(resources.GetObject("cmbFlatStyle.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.cmbFlatStyle.BackgroundImage = CType(resources.GetObject("cmbFlatStyle.BackgroundImage"), System.Drawing.Image)
        Me.cmbFlatStyle.Dock = CType(resources.GetObject("cmbFlatStyle.Dock"), System.Windows.Forms.DockStyle)
        Me.cmbFlatStyle.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cmbFlatStyle.Enabled = CType(resources.GetObject("cmbFlatStyle.Enabled"), Boolean)
        Me.cmbFlatStyle.Font = CType(resources.GetObject("cmbFlatStyle.Font"), System.Drawing.Font)
        Me.cmbFlatStyle.ImeMode = CType(resources.GetObject("cmbFlatStyle.ImeMode"), System.Windows.Forms.ImeMode)
        Me.cmbFlatStyle.IntegralHeight = CType(resources.GetObject("cmbFlatStyle.IntegralHeight"), Boolean)
        Me.cmbFlatStyle.ItemHeight = CType(resources.GetObject("cmbFlatStyle.ItemHeight"), Integer)
        Me.cmbFlatStyle.Location = CType(resources.GetObject("cmbFlatStyle.Location"), System.Drawing.Point)
        Me.cmbFlatStyle.MaxDropDownItems = CType(resources.GetObject("cmbFlatStyle.MaxDropDownItems"), Integer)
        Me.cmbFlatStyle.MaxLength = CType(resources.GetObject("cmbFlatStyle.MaxLength"), Integer)
        Me.cmbFlatStyle.Name = "cmbFlatStyle"
        Me.cmbFlatStyle.RightToLeft = CType(resources.GetObject("cmbFlatStyle.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.cmbFlatStyle.Size = CType(resources.GetObject("cmbFlatStyle.Size"), System.Drawing.Size)
        Me.cmbFlatStyle.TabIndex = CType(resources.GetObject("cmbFlatStyle.TabIndex"), Integer)
        Me.cmbFlatStyle.Text = resources.GetString("cmbFlatStyle.Text")
        Me.cmbFlatStyle.Visible = CType(resources.GetObject("cmbFlatStyle.Visible"), Boolean)
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
        Me.label1.Visible = CType(resources.GetObject("label1.Visible"), Boolean)
        '
        'chkBGImage
        '
        Me.chkBGImage.AccessibleDescription = resources.GetString("chkBGImage.AccessibleDescription")
        Me.chkBGImage.AccessibleName = resources.GetString("chkBGImage.AccessibleName")
        Me.chkBGImage.Anchor = CType(resources.GetObject("chkBGImage.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.chkBGImage.Appearance = CType(resources.GetObject("chkBGImage.Appearance"), System.Windows.Forms.Appearance)
        Me.chkBGImage.BackgroundImage = CType(resources.GetObject("chkBGImage.BackgroundImage"), System.Drawing.Image)
        Me.chkBGImage.CheckAlign = CType(resources.GetObject("chkBGImage.CheckAlign"), System.Drawing.ContentAlignment)
        Me.chkBGImage.Checked = True
        Me.chkBGImage.CheckState = System.Windows.Forms.CheckState.Checked
        Me.chkBGImage.Dock = CType(resources.GetObject("chkBGImage.Dock"), System.Windows.Forms.DockStyle)
        Me.chkBGImage.Enabled = CType(resources.GetObject("chkBGImage.Enabled"), Boolean)
        Me.chkBGImage.FlatStyle = CType(resources.GetObject("chkBGImage.FlatStyle"), System.Windows.Forms.FlatStyle)
        Me.chkBGImage.Font = CType(resources.GetObject("chkBGImage.Font"), System.Drawing.Font)
        Me.chkBGImage.Image = CType(resources.GetObject("chkBGImage.Image"), System.Drawing.Image)
        Me.chkBGImage.ImageAlign = CType(resources.GetObject("chkBGImage.ImageAlign"), System.Drawing.ContentAlignment)
        Me.chkBGImage.ImageIndex = CType(resources.GetObject("chkBGImage.ImageIndex"), Integer)
        Me.chkBGImage.ImeMode = CType(resources.GetObject("chkBGImage.ImeMode"), System.Windows.Forms.ImeMode)
        Me.chkBGImage.Location = CType(resources.GetObject("chkBGImage.Location"), System.Drawing.Point)
        Me.chkBGImage.Name = "chkBGImage"
        Me.chkBGImage.RightToLeft = CType(resources.GetObject("chkBGImage.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.chkBGImage.Size = CType(resources.GetObject("chkBGImage.Size"), System.Drawing.Size)
        Me.chkBGImage.TabIndex = CType(resources.GetObject("chkBGImage.TabIndex"), Integer)
        Me.chkBGImage.Text = resources.GetString("chkBGImage.Text")
        Me.chkBGImage.TextAlign = CType(resources.GetObject("chkBGImage.TextAlign"), System.Drawing.ContentAlignment)
        Me.chkBGImage.Visible = CType(resources.GetObject("chkBGImage.Visible"), Boolean)
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
        Me.label3.Visible = CType(resources.GetObject("label3.Visible"), Boolean)
        '
        'panel1
        '
        Me.panel1.AccessibleDescription = resources.GetString("panel1.AccessibleDescription")
        Me.panel1.AccessibleName = resources.GetString("panel1.AccessibleName")
        Me.panel1.Anchor = CType(resources.GetObject("panel1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.panel1.AutoScroll = CType(resources.GetObject("panel1.AutoScroll"), Boolean)
        Me.panel1.AutoScrollMargin = CType(resources.GetObject("panel1.AutoScrollMargin"), System.Drawing.Size)
        Me.panel1.AutoScrollMinSize = CType(resources.GetObject("panel1.AutoScrollMinSize"), System.Drawing.Size)
        Me.panel1.BackColor = System.Drawing.Color.DarkGoldenrod
        Me.panel1.BackgroundImage = CType(resources.GetObject("panel1.BackgroundImage"), System.Drawing.Image)
        Me.panel1.Controls.AddRange(New System.Windows.Forms.Control() {Me.button1})
        Me.panel1.Dock = CType(resources.GetObject("panel1.Dock"), System.Windows.Forms.DockStyle)
        Me.panel1.Enabled = CType(resources.GetObject("panel1.Enabled"), Boolean)
        Me.panel1.Font = CType(resources.GetObject("panel1.Font"), System.Drawing.Font)
        Me.panel1.ImeMode = CType(resources.GetObject("panel1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.panel1.Location = CType(resources.GetObject("panel1.Location"), System.Drawing.Point)
        Me.panel1.Name = "panel1"
        Me.panel1.RightToLeft = CType(resources.GetObject("panel1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.panel1.Size = CType(resources.GetObject("panel1.Size"), System.Drawing.Size)
        Me.panel1.TabIndex = CType(resources.GetObject("panel1.TabIndex"), Integer)
        Me.panel1.Text = resources.GetString("panel1.Text")
        Me.panel1.Visible = CType(resources.GetObject("panel1.Visible"), Boolean)
        '
        'button1
        '
        Me.button1.AccessibleDescription = resources.GetString("button1.AccessibleDescription")
        Me.button1.AccessibleName = resources.GetString("button1.AccessibleName")
        Me.button1.Anchor = CType(resources.GetObject("button1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.button1.BackgroundImage = CType(resources.GetObject("button1.BackgroundImage"), System.Drawing.Image)
        Me.button1.Dock = CType(resources.GetObject("button1.Dock"), System.Windows.Forms.DockStyle)
        Me.button1.Enabled = CType(resources.GetObject("button1.Enabled"), Boolean)
        Me.button1.FlatStyle = CType(resources.GetObject("button1.FlatStyle"), System.Windows.Forms.FlatStyle)
        Me.button1.Font = CType(resources.GetObject("button1.Font"), System.Drawing.Font)
        Me.button1.Image = CType(resources.GetObject("button1.Image"), System.Drawing.Image)
        Me.button1.ImageAlign = CType(resources.GetObject("button1.ImageAlign"), System.Drawing.ContentAlignment)
        Me.button1.ImageIndex = CType(resources.GetObject("button1.ImageIndex"), Integer)
        Me.button1.ImeMode = CType(resources.GetObject("button1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.button1.Location = CType(resources.GetObject("button1.Location"), System.Drawing.Point)
        Me.button1.Name = "button1"
        Me.button1.RightToLeft = CType(resources.GetObject("button1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.button1.Size = CType(resources.GetObject("button1.Size"), System.Drawing.Size)
        Me.button1.TabIndex = CType(resources.GetObject("button1.TabIndex"), Integer)
        Me.button1.Text = resources.GetString("button1.Text")
        Me.button1.TextAlign = CType(resources.GetObject("button1.TextAlign"), System.Drawing.ContentAlignment)
        Me.button1.Visible = CType(resources.GetObject("button1.Visible"), Boolean)
        '
        'ButtonCtl
        '
        Me.AccessibleDescription = resources.GetString("$this.AccessibleDescription")
        Me.AccessibleName = resources.GetString("$this.AccessibleName")
        Me.AutoScaleBaseSize = CType(resources.GetObject("$this.AutoScaleBaseSize"), System.Drawing.Size)
        Me.AutoScroll = CType(resources.GetObject("$this.AutoScroll"), Boolean)
        Me.AutoScrollMargin = CType(resources.GetObject("$this.AutoScrollMargin"), System.Drawing.Size)
        Me.AutoScrollMinSize = CType(resources.GetObject("$this.AutoScrollMinSize"), System.Drawing.Size)
        Me.BackgroundImage = CType(resources.GetObject("$this.BackgroundImage"), System.Drawing.Image)
        Me.ClientSize = CType(resources.GetObject("$this.ClientSize"), System.Drawing.Size)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.panel1, Me.grpBehavior})
        Me.Enabled = CType(resources.GetObject("$this.Enabled"), Boolean)
        Me.Font = CType(resources.GetObject("$this.Font"), System.Drawing.Font)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.ImeMode = CType(resources.GetObject("$this.ImeMode"), System.Windows.Forms.ImeMode)
        Me.Location = CType(resources.GetObject("$this.Location"), System.Drawing.Point)
        Me.MaximumSize = CType(resources.GetObject("$this.MaximumSize"), System.Drawing.Size)
        Me.MinimumSize = CType(resources.GetObject("$this.MinimumSize"), System.Drawing.Size)
        Me.Name = "ButtonCtl"
        Me.RightToLeft = CType(resources.GetObject("$this.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.StartPosition = CType(resources.GetObject("$this.StartPosition"), System.Windows.Forms.FormStartPosition)
        Me.Text = resources.GetString("$this.Text")
        Me.grpBehavior.ResumeLayout(False)
        Me.panel1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region


    '/ <summary>
    '/    Handle button1.Click
    '/ </summary>
    Private Sub button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles button1.Click
        MessageBox.Show("You pressed the test button")
    End Sub

    '/ <summary>
    '/    Handle cmbImageAlign.SelectedIndexChanged
    '/ </summary>
    Private Sub cmbImageAlign_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbImageAlign.SelectedIndexChanged
        Dim i As Integer = CType(cmbImageAlign.SelectedItem, StringIntObject).i
        button1.ImageAlign = CType(i, ContentAlignment)
    End Sub

    '/ <summary>
    '/    Handle cmbTextAlign.SelectedIndexChanged
    '/ </summary>
    Private Sub cmbTextAlign_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbTextAlign.SelectedIndexChanged
        Dim i As Integer = CType(cmbTextAlign.SelectedItem, StringIntObject).i
        button1.TextAlign = CType(i, ContentAlignment)
    End Sub

    '/ <summary>
    '/    Handle cmbFlatStyle.SelectedIndexChanged
    '/ </summary>
    Private Sub cmbFlatStyle_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbFlatStyle.SelectedIndexChanged
        Dim i As FlatStyle = CType(CType(cmbFlatStyle.SelectedItem, StringIntObject).i, FlatStyle)
        button1.FlatStyle = i
    End Sub

    '/ <summary>
    '/    Handle chkImage.CheckedChanged
    '/ </summary>
    Private Sub chkImage_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles chkImage.CheckedChanged
        If chkImage.Checked Then
            Dim resources As New ResourceManager(GetType(ButtonCtl))
            button1.Image = CType(resources.GetObject("button1.Image"), System.Drawing.Image)
            cmbImageAlign.Enabled = True
        Else
            button1.Image = Nothing
            cmbImageAlign.Enabled = False
        End If
    End Sub

    '/ <summary>
    '/    Handle chkBGImage.CheckedChanged
    '/ </summary>
    Private Sub chkBGImage_CheckChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles chkBGImage.CheckedChanged
        If chkBGImage.Checked Then
            Dim resources As New ResourceManager(GetType(ButtonCtl))
            button1.BackgroundImage = CType(resources.GetObject("button1.BackgroundImage"), System.Drawing.Image)
        Else
            button1.BackgroundImage = Nothing
        End If
    End Sub

    '/ <summary>
    '/ The main entry point for the application.
    '/ </summary>
    <STAThread()> Public Shared Sub Main()
        Application.Run(New ButtonCtl())
    End Sub

End Class
