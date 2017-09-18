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
Imports System.Drawing.Drawing2D

Namespace Microsoft.Samples.Windows.Forms.VB.ComboBoxCtl


    '/ <summary>
    '/    This sample demonstrates the features of the ComboBox control.
    '/ </summary>
    Public Class ComboBoxCtl
        Inherits System.Windows.Forms.Form

        Private cmbsize As Size
        Private brushMap As New Hashtable()
        Private gradientBegin As Color = Color.Red
        Private gradientEnd As Color = Color.Blue


        Public Sub New()

            MyBase.New()

            ComboBoxCtl = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            InitControlState()
            FillItems(comboBegin)
            FillItems(comboEnd)

            comboBegin.SelectedIndex = 0
            comboEnd.SelectedIndex = comboEnd.Items.Count - 1
            cmbsize = comboBegin.Size
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
        Private WithEvents label6 As System.Windows.Forms.Label
        Private WithEvents comboBegin As System.Windows.Forms.ComboBox
        Private WithEvents label7 As System.Windows.Forms.Label
        Private WithEvents comboEnd As System.Windows.Forms.ComboBox
        Private WithEvents chkEnabled As System.Windows.Forms.CheckBox
        Private WithEvents chkSorted As System.Windows.Forms.CheckBox
        Private WithEvents chkIntegralHeight As System.Windows.Forms.CheckBox
        Private WithEvents groupBox1 As System.Windows.Forms.GroupBox
        Private WithEvents label1 As System.Windows.Forms.Label
        Private WithEvents cmbStyle As System.Windows.Forms.ComboBox
        Private WithEvents label2 As System.Windows.Forms.Label
        Private WithEvents cmbDrawMode As System.Windows.Forms.ComboBox
        Private WithEvents label3 As System.Windows.Forms.Label
        Private WithEvents cmbItemHeight As System.Windows.Forms.ComboBox
        Private WithEvents label4 As System.Windows.Forms.Label
        Private WithEvents cmbMaxDropDownItems As System.Windows.Forms.ComboBox
        Private WithEvents label5 As System.Windows.Forms.Label
        Private WithEvents label9 As System.Windows.Forms.Label
        Private WithEvents panel1 As System.Windows.Forms.Panel
        Private WithEvents toolTip1 As System.Windows.Forms.ToolTip

        Private WithEvents ComboBoxCtl As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.cmbDrawMode = New System.Windows.Forms.ComboBox()
            Me.chkEnabled = New System.Windows.Forms.CheckBox()
            Me.groupBox1 = New System.Windows.Forms.GroupBox()
            Me.cmbMaxDropDownItems = New System.Windows.Forms.ComboBox()
            Me.toolTip1 = New System.Windows.Forms.ToolTip(components)
            Me.chkSorted = New System.Windows.Forms.CheckBox()
            Me.chkIntegralHeight = New System.Windows.Forms.CheckBox()
            Me.comboEnd = New System.Windows.Forms.ComboBox()
            Me.cmbItemHeight = New System.Windows.Forms.ComboBox()
            Me.cmbStyle = New System.Windows.Forms.ComboBox()
            Me.label6 = New System.Windows.Forms.Label()
            Me.comboBegin = New System.Windows.Forms.ComboBox()
            Me.label5 = New System.Windows.Forms.Label()
            Me.label9 = New System.Windows.Forms.Label()
            Me.label4 = New System.Windows.Forms.Label()
            Me.label3 = New System.Windows.Forms.Label()
            Me.label7 = New System.Windows.Forms.Label()
            Me.label2 = New System.Windows.Forms.Label()
            Me.panel1 = New System.Windows.Forms.Panel()
            Me.label1 = New System.Windows.Forms.Label()

            Me.Text = "ComboBox"
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.ClientSize = New System.Drawing.Size(504, 293)

            cmbDrawMode.Location = New System.Drawing.Point(128, 120)
            cmbDrawMode.Size = New System.Drawing.Size(104, 21)
            cmbDrawMode.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            toolTip1.SetToolTip(cmbDrawMode, "Controls ComboBox painting")
            cmbDrawMode.TabIndex = 5
            AddHandler cmbDrawMode.SelectedIndexChanged, New System.EventHandler(AddressOf cmbDrawMode_SelectedIndexChanged)

            chkEnabled.Location = New System.Drawing.Point(16, 24)
            chkEnabled.Text = "Enabled"
            chkEnabled.Size = New System.Drawing.Size(88, 16)
            toolTip1.SetToolTip(chkEnabled, "Sets a Boolean value determining whether the ComboBox is clickable")
            chkEnabled.TabIndex = 0
            AddHandler chkEnabled.CheckedChanged, New System.EventHandler(AddressOf chkEnabled_CheckedChanged)

            groupBox1.Location = New System.Drawing.Point(248, 16)
            groupBox1.TabIndex = 2
            groupBox1.TabStop = False
            groupBox1.Text = "ComboBox"
            groupBox1.Size = New System.Drawing.Size(248, 264)

            cmbMaxDropDownItems.Location = New System.Drawing.Point(128, 168)
            cmbMaxDropDownItems.Size = New System.Drawing.Size(104, 21)
            cmbMaxDropDownItems.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            toolTip1.SetToolTip(cmbMaxDropDownItems, "The number of items to display on dropdown")
            cmbMaxDropDownItems.TabIndex = 7
            AddHandler cmbMaxDropDownItems.SelectedIndexChanged, New System.EventHandler(AddressOf cmbMaxDropDownItems_SelectedIndexChanged)
            cmbMaxDropDownItems.Items.AddRange(New Object() {"2", "4", "6", "8", "10"})

            toolTip1.Active = True

            chkSorted.Location = New System.Drawing.Point(16, 48)
            chkSorted.Text = "Sorted"
            chkSorted.Size = New System.Drawing.Size(88, 16)
            toolTip1.SetToolTip(chkSorted, "Sets whether the items in the ComboBoxesshould be sorted alphabetically")
            chkSorted.TabIndex = 1
            AddHandler chkSorted.CheckedChanged, New System.EventHandler(AddressOf chkSorted_CheckedChanged)

            chkIntegralHeight.Location = New System.Drawing.Point(16, 72)
            chkIntegralHeight.Text = "IntegralHeight"
            chkIntegralHeight.Size = New System.Drawing.Size(104, 16)
            toolTip1.SetToolTip(chkIntegralHeight, "Sets a boolean value indicating whether the combo box should resize to avoid showing partial items")
            chkIntegralHeight.TabIndex = 2
            AddHandler chkIntegralHeight.CheckedChanged, New System.EventHandler(AddressOf chkIntegralHeight_CheckedChanged)

            comboEnd.Text = "comboBegin1"
            comboEnd.Location = New System.Drawing.Point(24, 120)
            comboEnd.Size = New System.Drawing.Size(208, 21)
            toolTip1.SetToolTip(comboEnd, "Choose the color for the right end of gradient")
            comboEnd.TabIndex = 1
            comboEnd.Sorted = True
            AddHandler comboEnd.MeasureItem, New System.Windows.Forms.MeasureItemEventHandler(AddressOf combo_MeasureItem)
            AddHandler comboEnd.DrawItem, New System.Windows.Forms.DrawItemEventHandler(AddressOf combo_DrawItem)
            AddHandler comboEnd.SelectedIndexChanged, New System.EventHandler(AddressOf comboEnd_SelectedIndexChanged)

            cmbItemHeight.Location = New System.Drawing.Point(128, 144)
            cmbItemHeight.Size = New System.Drawing.Size(104, 21)
            cmbItemHeight.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            toolTip1.SetToolTip(cmbItemHeight, "The height, in pixels, of an item in the combo box")
            cmbItemHeight.TabIndex = 6
            AddHandler cmbItemHeight.SelectedIndexChanged, New System.EventHandler(AddressOf cmbItemHeight_SelectedIndexChanged)
            cmbItemHeight.Items.AddRange(New Object() {"12", "14", "16", "18", "24", "26"})

            cmbStyle.Location = New System.Drawing.Point(128, 96)
            cmbStyle.Size = New System.Drawing.Size(104, 21)
            cmbStyle.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            toolTip1.SetToolTip(cmbStyle, "Controls the appearance and functionality of the ComboBox")
            cmbStyle.TabIndex = 4
            AddHandler cmbStyle.SelectedIndexChanged, New System.EventHandler(AddressOf cmbStyle_SelectedIndexChanged)

            label6.Location = New System.Drawing.Point(24, 16)
            label6.Text = "Left:"
            label6.Size = New System.Drawing.Size(96, 16)
            label6.TabIndex = 5

            comboBegin.Text = "comboBegin1"
            comboBegin.Location = New System.Drawing.Point(24, 32)
            comboBegin.Size = New System.Drawing.Size(208, 21)
            toolTip1.SetToolTip(comboBegin, "Choose color for left end of gradient")
            comboBegin.TabIndex = 0
            comboBegin.Sorted = True
            AddHandler comboBegin.MeasureItem, New System.Windows.Forms.MeasureItemEventHandler(AddressOf combo_MeasureItem)
            AddHandler comboBegin.DrawItem, New System.Windows.Forms.DrawItemEventHandler(AddressOf combo_DrawItem)
            AddHandler comboBegin.SelectedIndexChanged, New System.EventHandler(AddressOf comboBegin_SelectedIndexChanged)

            label5.Location = New System.Drawing.Point(16, 208)
            label5.Text = "Left"
            label5.Size = New System.Drawing.Size(64, 16)
            label5.TabIndex = 12

            label9.Location = New System.Drawing.Point(200, 208)
            label9.Text = "Right"
            label9.Size = New System.Drawing.Size(32, 16)
            label9.TabIndex = 14

            label4.Location = New System.Drawing.Point(16, 176)
            label4.Text = "MaxDropdownItems"
            label4.Size = New System.Drawing.Size(104, 16)
            label4.TabIndex = 11

            label3.Location = New System.Drawing.Point(16, 152)
            label3.Text = "ItemHeight"
            label3.Size = New System.Drawing.Size(80, 16)
            label3.TabIndex = 10

            label7.Location = New System.Drawing.Point(24, 104)
            label7.Text = "Right:"
            label7.Size = New System.Drawing.Size(96, 16)
            label7.TabIndex = 3

            label2.Location = New System.Drawing.Point(16, 128)
            label2.Text = "DrawMode"
            label2.Size = New System.Drawing.Size(88, 16)
            label2.TabIndex = 9

            panel1.Location = New System.Drawing.Point(16, 224)
            panel1.Text = "panel1"
            panel1.Size = New System.Drawing.Size(216, 24)
            panel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
            panel1.TabIndex = 3
            AddHandler panel1.Paint, New System.Windows.Forms.PaintEventHandler(AddressOf panel1_Paint)

            label1.Location = New System.Drawing.Point(16, 104)
            label1.Text = "Style"
            label1.Size = New System.Drawing.Size(88, 16)
            label1.TabIndex = 8
            Me.Controls.Add(label7)
            Me.Controls.Add(label6)
            Me.Controls.Add(comboEnd)
            Me.Controls.Add(comboBegin)
            Me.Controls.Add(groupBox1)
            groupBox1.Controls.Add(panel1)
            groupBox1.Controls.Add(label9)
            groupBox1.Controls.Add(label5)
            groupBox1.Controls.Add(cmbStyle)
            groupBox1.Controls.Add(cmbDrawMode)
            groupBox1.Controls.Add(cmbItemHeight)
            groupBox1.Controls.Add(cmbMaxDropDownItems)
            groupBox1.Controls.Add(label4)
            groupBox1.Controls.Add(label3)
            groupBox1.Controls.Add(label2)
            groupBox1.Controls.Add(label1)
            groupBox1.Controls.Add(chkIntegralHeight)
            groupBox1.Controls.Add(chkSorted)
            groupBox1.Controls.Add(chkEnabled)
        End Sub

#End Region


        '/ <summary>
        '/    Sets the default states for the controls driving the properties
        '/    of the two ComboBoxes.
        '/ </summary>
        Private Sub InitControlState()
            ' Sync the checkboxes
            chkSorted.Checked = comboBegin.Sorted
            chkEnabled.Checked = comboBegin.Enabled
            chkIntegralHeight.Checked = comboBegin.IntegralHeight
            Dim aStyle(2) As StringIntObject

            ' Sync ComboBox styles to ComboBoxStyle.DROPDOWN
            aStyle(0) = New StringIntObject("Simple", CInt(ComboBoxStyle.Simple))
            aStyle(1) = New StringIntObject("Dropdown", CInt(ComboBoxStyle.DropDown))
            aStyle(2) = New StringIntObject("Dropdownlist", CInt(ComboBoxStyle.DropDownList))
            cmbStyle.Items.AddRange(aStyle)
            comboBegin.DropDownStyle = CType(aStyle(1).i, ComboBoxStyle)
            comboEnd.DropDownStyle = CType(aStyle(1).i, ComboBoxStyle)
            cmbStyle.SelectedIndex = 1
            Dim aDMO(2) As StringIntObject

            ' Sync ComboBox draw modes to DrawMode.NORMAL
            aDMO(0) = New StringIntObject("Normal", CInt(DrawMode.Normal))
            aDMO(1) = New StringIntObject("Ownerdrawfixed", CInt(DrawMode.OwnerDrawFixed))
            aDMO(2) = New StringIntObject("Ownerdrawvariable", CInt(DrawMode.OwnerDrawVariable))
            cmbDrawMode.Items.AddRange(aDMO)
            comboBegin.DrawMode = CType(aDMO(0).i, DrawMode)
            comboEnd.DrawMode = CType(aDMO(0).i, DrawMode)
            cmbDrawMode.SelectedIndex = 0

        End Sub

        Private Sub FillItems(ByVal cmb As ComboBox)
            cmb.DisplayMember = "Color"
            cmb.Items.Add(Brushes.Aqua)
            cmb.Items.Add(Brushes.Black)
            cmb.Items.Add(Brushes.Blue)
            cmb.Items.Add(Brushes.Brown)
            cmb.Items.Add(Brushes.Cyan)
            cmb.Items.Add(Brushes.DarkGray)
            cmb.Items.Add(Brushes.Gray)
            cmb.Items.Add(Brushes.Green)
            cmb.Items.Add(Brushes.LightGray)
            cmb.Items.Add(Brushes.Magenta)
            cmb.Items.Add(Brushes.Orange)
            cmb.Items.Add(Brushes.Purple)
            cmb.Items.Add(Brushes.Red)
            cmb.Items.Add(Brushes.White)
            cmb.Items.Add(Brushes.Yellow)
        End Sub

        '/ <summary>
        '     Returns the int which is currently selected in a ComboBox.
        '/ </summary>
        Private Function SelectedValue(ByVal cmb As ComboBox) As Integer
            Dim ret As Integer
            Dim obj As Object = cmb.SelectedItem
            If obj Is Nothing Then
                Return -1
            End If
            Try
                ret = Integer.Parse(obj.ToString())
            Catch
            End Try
            Return ret
        End Function

        Private Sub chkEnabled_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            comboBegin.Enabled = chkEnabled.Checked
            comboEnd.Enabled = chkEnabled.Checked
        End Sub

        Private Sub chkIntegralHeight_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            comboBegin.IntegralHeight = chkIntegralHeight.Checked
            comboEnd.IntegralHeight = chkIntegralHeight.Checked
        End Sub

        Private Sub chkSorted_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            Dim sorted As Boolean = chkSorted.Checked
            comboBegin.Sorted = sorted
            comboEnd.Sorted = sorted
            If Not sorted Then
                RandomShuffle(comboBegin)
                RandomShuffle(comboEnd)
            End If
        End Sub

        '/ <summary>
        '/    Performs a random shuffle on the given ComboBox.
        '/ </summary>
        Private Sub RandomShuffle(ByVal cmb As ComboBox)
            Dim items(cmb.Items.Count-1) As Object
            cmb.Items.CopyTo(items, 0)
            Dim swapItem As Integer
            Dim rand As New Random()
            Dim i As Integer

            For i = 0 To (items.Length - 1)
                swapItem = Math.Abs(rand.Next()) Mod items.Length
                If swapItem <> i Then
                    Dim tempObject As Object = items(swapItem)
                    items(swapItem) = items(i)
                    items(i) = tempObject
                End If
            Next
            cmb.Items.Clear()
            cmb.Items.AddRange(items)
        End Sub

        Private Sub cmbItemHeight_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
            Dim i As Integer = SelectedValue(cmbItemHeight)
            If i = -1 Then
                Return
            End If
            comboBegin.ItemHeight = i
            comboEnd.ItemHeight = i
        End Sub

        Private Sub cmbStyle_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
            Dim i As ComboBoxStyle = CType(CType(cmbStyle.SelectedItem, StringIntObject).i, ComboBoxStyle)
            comboBegin.DropDownStyle = i
            comboEnd.DropDownStyle = i
            If i = ComboBoxStyle.Simple Then
                Dim cmbsize2 As New Size(cmbsize.Width, cmbsize.Height * 3)

                comboBegin.Size = cmbsize2
                comboEnd.Size = cmbsize2
                cmbMaxDropDownItems.Enabled = False
            Else
                cmbMaxDropDownItems.Enabled = True
            End If
        End Sub

        Private Sub cmbDrawMode_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
            Dim i As DrawMode = CType(CType(cmbDrawMode.SelectedItem, StringIntObject).i, DrawMode)
            comboBegin.DrawMode = i
            comboEnd.DrawMode = i
            If i = DrawMode.OwnerDrawVariable Then
                cmbItemHeight.Enabled = True
            Else
                cmbItemHeight.Enabled = False
            End If
        End Sub

        '/ <summary>
        '/    This DrawItem event handler is invoked to draw an item in a ComboBox if that
        '/    ComboBox is in an OwnerDraw DrawMode.
        '/ </summary>
        Private Sub combo_DrawItem(ByVal sender As Object, ByVal die As DrawItemEventArgs)
            Dim cmb As ComboBox = CType(sender, ComboBox)
            If die.Index = -1 Then
                Return
            End If
            If sender Is Nothing Then
                Return

            End If
            Dim selectedBrush As SolidBrush = CType(cmb.Items(die.Index), SolidBrush)
            Dim g As Graphics = die.Graphics
            'string brushName = (string)cmb.Items[die.Index];
            'SolidBrush selectedBrush = (SolidBrush)brushMap[brushName];

            ' If the item is selected, this draws the correct background color
            die.DrawBackground()
            die.DrawFocusRectangle()
            Dim rectPreviewBox As Rectangle = die.Bounds

            ' Draw the color's preview box
            rectPreviewBox.Offset(2, 2)
            rectPreviewBox.Width = 20
            rectPreviewBox.Height -= 4
            g.DrawRectangle(New Pen(die.ForeColor), rectPreviewBox)

            ' Get the appropriate Brush object for the selected color
            ' and fill the preview box.
            rectPreviewBox.Offset(1, 1)
            rectPreviewBox.Width -= 2
            rectPreviewBox.Height -= 2
            g.FillRectangle(selectedBrush, rectPreviewBox)

            ' Draw the name of the color selected
            g.DrawString(selectedBrush.Color.ToString(), Font, New SolidBrush(die.ForeColor), die.Bounds.X + 30, die.Bounds.Y + 1)
        End Sub

        Private Sub comboBegin_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
            If comboBegin.SelectedIndex >= 0 Then
                Dim b As SolidBrush = CType(comboBegin.SelectedItem, SolidBrush)
                gradientBegin = b.Color
                panel1.Invalidate()
            End If
        End Sub

        Private Sub comboEnd_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
            If comboEnd.SelectedIndex >= 0 Then
                Dim b As SolidBrush = CType(comboEnd.SelectedItem, SolidBrush)
                gradientEnd = b.Color
                panel1.Invalidate()
            End If
        End Sub

        Private Sub cmbMaxDropDownItems_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
            Dim i As Integer = SelectedValue(cmbMaxDropDownItems)
            If i = -1 Then
                Return
            End If
            comboBegin.MaxDropDownItems = i
            comboEnd.MaxDropDownItems = i
        End Sub

        Private Sub combo_MeasureItem(ByVal sender As Object, ByVal mie As MeasureItemEventArgs)
            Dim cb As ComboBox = CType(sender, ComboBox)
            mie.ItemHeight = cb.ItemHeight - 2
        End Sub

        Private Sub panel1_Paint(ByVal sender As Object, ByVal e As PaintEventArgs)
            Dim b As Brush = New LinearGradientBrush(panel1.ClientRectangle, gradientBegin, gradientEnd, LinearGradientMode.ForwardDiagonal)
            e.Graphics.FillRectangle(b, panel1.ClientRectangle)
        End Sub

        ' The main entry point for the application.
        <STAThread()> Public Shared Sub Main()
            Application.Run(New ComboBoxCtl())
        End Sub


    End Class

End Namespace