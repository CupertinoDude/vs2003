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

    ' <doc>
    ' <desc>
    '     This sample demonstrates the way that Windows does scrolling. The
    '     "value" of the scrollbar must be between minimum and
    '     (maximum - largeChange + 1).
    '     Windows does this because the size of the scrollbar's thumb is equal to
    '     the "largeChange" or "page" value. The value property of the
    '     scrollbar is the  position of the top of the thumb. Therefore, when the
    '     value points to the top of  the last page, the thumb is at the end of the
    '     scrollbar and we can scroll no further, even though the value is less than
    '     the maximum.
    ' </desc>
    ' </doc>
    Public Class ScrollBarCtl
        Inherits System.Windows.Forms.Form

        ' Variables for adjusting the position of the pictureBox when scrolling
        Private dragging As Boolean = False
        Private oldX, oldY As Integer
        Private vScrollMultiplier As Single
        Private vAbsPos As Single
        Private hScrollMultiplier As Single
        Private hAbsPos As Single

        Public Sub New()

            MyBase.New()

            ScrollBarCtl = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            comboBox1.SelectedIndex = 0
            comboBox2.SelectedIndex = 0

            VScrollBar1.LargeChange = Convert.ToInt16(comboBox1.SelectedItem.ToString())
            HScrollBar1.LargeChange = Convert.ToInt16(comboBox1.SelectedItem.ToString())
            VScrollBar1.SmallChange = Convert.ToInt16(comboBox2.SelectedItem.ToString())
            HScrollBar1.SmallChange = Convert.ToInt16(comboBox2.SelectedItem.ToString())

            SetVerticalScrollMultiplier()
            SetHorizontalScrollMultiplier()

            label11.Text = HScrollBar1.Value.ToString()
            label12.Text = VScrollBar1.Value.ToString()

            ' Change the cursor give the user feedback for dragging the
            ' picture around the picturebox
            pictureBox1.Cursor = Cursors.SizeAll

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



        ' The vScrollMultiplier takes into account the height of the pictureBox
        ' when scrolling.
        ' It is essentially "pixels per tick", where a tick is the smallest
        ' increment of the scrollbar.
        Private Sub SetVerticalScrollMultiplier()
            Dim hsb As Single = CSng(VScrollBar1.Height - pictureBox1.Height)
            Dim ticks As Single = CSng(VScrollBar1.Maximum - VScrollBar1.Minimum)

            vScrollMultiplier = hsb / ticks
        End Sub


        ' The hScrollMultiplier takes into account the width of the
        ' pictureBox when scrolling.
        ' It is essentially "pixels per tick", where a tick is the smallest
        ' increment of the scrollbar.
        Private Sub SetHorizontalScrollMultiplier()
            Dim hsb As Single = CSng(HScrollBar1.Width - pictureBox1.Width)
            Dim ticks As Single = CSng(HScrollBar1.Maximum - HScrollBar1.Minimum)

            hScrollMultiplier = hsb / ticks
        End Sub


        ' Vertical scrollbar handler - scrollbar action handled by Windows Forms Scrollbar.
        ' Here we update the label displaying our value and the
        ' set the  pictureBox y coordinate.
        Private Sub VScrollBar1_Scroll(ByVal sender As Object, ByVal e As ScrollEventArgs)
            label12.Text = VScrollBar1.Value.ToString()
            vAbsPos = CSng(VScrollBar1.Value - VScrollBar1.Minimum)
            pictureBox1.Top = VScrollBar1.Bottom - CInt(vScrollMultiplier * vAbsPos) - pictureBox1.Height
        End Sub


        ' Horizontal scrollbar handler - scrollbar action handled by Windows Forms
        ' Scrollbar. Here we update the label displaying our value and the set
        ' the pictureBox y coordinate.
        Private Sub HScrollBar1_Scroll(ByVal sender As Object, ByVal e As ScrollEventArgs)
            label11.Text = HScrollBar1.Value.ToString()
            hAbsPos = CSng(HScrollBar1.Value - HScrollBar1.Minimum)
            pictureBox1.Left = HScrollBar1.Right - CInt(hScrollMultiplier * hAbsPos) - pictureBox1.Width
        End Sub


        ' Changing the "LargeChange" (the number of ticks per page) property of
        ' the ScrollBarCtl.
        Private Sub comboBox1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
            VScrollBar1.LargeChange = Convert.ToInt16(comboBox1.SelectedItem.ToString())
            HScrollBar1.LargeChange = Convert.ToInt16(comboBox1.SelectedItem.ToString())
            label11.Text = HScrollBar1.Value.ToString()
            label12.Text = VScrollBar1.Value.ToString()
        End Sub


        ' Changing the "SmallChange" (the number of ticks per line) property of
        ' the ScrollBarCtl.
        Private Sub comboBox2_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
            VScrollBar1.SmallChange = Convert.ToInt16(comboBox2.SelectedItem.ToString())
            HScrollBar1.SmallChange = Convert.ToInt16(comboBox2.SelectedItem.ToString())
            label11.Text = HScrollBar1.Value.ToString()
            label12.Text = VScrollBar1.Value.ToString()
        End Sub


        ' Mouse event handler to initiate dragging the pictureBox around
        Private Sub pictureBox1_MouseDown(ByVal sender As Object, ByVal e As MouseEventArgs)
            dragging = True

            ' (e.x, e.y) represent the coordinates of the cursor relative to the
            ' pictureBox's location. We need to save these on mouseDown in order
            ' to calculate the distance dragged.
            oldX = e.X
            oldY = e.Y
        End Sub


        ' Mouse event handler to effect dragging the pictureBox around.
        Private Sub pictureBox1_MouseMove(ByVal sender As Object, ByVal e As MouseEventArgs)
            If dragging Then
                Dim minY As Integer = VScrollBar1.Minimum
                Dim maxY As Integer = VScrollBar1.Maximum
                Dim minX As Integer = HScrollBar1.Minimum
                Dim maxX As Integer = HScrollBar1.Maximum
                Dim value As Integer = CInt(VScrollBar1.Value - (e.Y - oldY) / vScrollMultiplier)
                If value < minY Then

                    ' The new y position of the scrollbar is
                    ' (old_y_Position - y_distance_that_the_cursor_has_moved).
                    ' We want to simulate "real" scrolling so we move the
                    ' ScrollBarCtl in the opposite direction of the pictureBox.
                    ' We need the multiplier to convert pixels to scrollbar ticks.
                    VScrollBar1.Value = minY
                Else
                    If value > maxY - VScrollBar1.LargeChange + 1 Then
                        VScrollBar1.Value = maxY - VScrollBar1.LargeChange + 1
                    Else
                        VScrollBar1.Value = value
                    End If

                End If
                ' Similarly for the x position...
                value = CInt(HScrollBar1.Value - (e.X - oldX) / hScrollMultiplier)
                If value < minX Then
                    HScrollBar1.Value = minX
                Else
                    If value > maxX - HScrollBar1.LargeChange + 1 Then
                        HScrollBar1.Value = maxX - HScrollBar1.LargeChange + 1
                    Else
                        HScrollBar1.Value = value
                    End If

                End If
                label11.Text = HScrollBar1.Value.ToString()
                label12.Text = VScrollBar1.Value.ToString()

                ' The pictureBox moves with the mouse. Thus the new y coordinate is
                ' (old_y_Position + y_distance_that_the_cursor_has_moved), and similarly
                ' for the x coordinate.
                value = pictureBox1.Top + (e.Y - oldY)
                If value < VScrollBar1.Top Then
                    value = VScrollBar1.Top
                Else
                    If value > VScrollBar1.Bottom - pictureBox1.Height Then
                        value = VScrollBar1.Bottom - pictureBox1.Height
                    End If
                End If
                pictureBox1.Top = value

                value = pictureBox1.Left + (e.X - oldX)
                If value < HScrollBar1.Left Then
                    value = HScrollBar1.Left
                Else
                    If value > HScrollBar1.Right - pictureBox1.Width Then
                        value = HScrollBar1.Right - pictureBox1.Width
                    End If
                End If
                pictureBox1.Left = value
            End If
        End Sub


        ' Mouse event handler to signal the end of the pictureBox dragging
        ' sequence.
        Private Sub pictureBox1_MouseUp(ByVal sender As Object, ByVal e As MouseEventArgs)
            dragging = False
        End Sub



#Region " Windows Form Designer generated code "

        'Required by the Windows Form Designer
        Private components As System.ComponentModel.Container
        Protected WithEvents VScrollBar1 As System.Windows.Forms.VScrollBar
        Protected WithEvents HScrollBar1 As System.Windows.Forms.HScrollBar
        Protected WithEvents groupBox1 As System.Windows.Forms.GroupBox
        Protected WithEvents label1 As System.Windows.Forms.Label
        Protected WithEvents label2 As System.Windows.Forms.Label
        Protected WithEvents comboBox2 As System.Windows.Forms.ComboBox
        Protected WithEvents pictureBox1 As System.Windows.Forms.PictureBox
        Protected WithEvents label3 As System.Windows.Forms.Label
        Protected WithEvents label4 As System.Windows.Forms.Label
        Protected WithEvents label5 As System.Windows.Forms.Label
        Protected WithEvents label7 As System.Windows.Forms.Label
        Protected WithEvents label6 As System.Windows.Forms.Label
        Protected WithEvents label12 As System.Windows.Forms.Label
        Protected WithEvents label11 As System.Windows.Forms.Label
        Protected WithEvents label8 As System.Windows.Forms.Label
        Protected WithEvents label9 As System.Windows.Forms.Label
        Protected WithEvents label10 As System.Windows.Forms.Label
        Protected WithEvents comboBox1 As System.Windows.Forms.ComboBox

        Private WithEvents ScrollBarCtl As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(ScrollBarCtl))

            Me.components = New System.ComponentModel.Container()
            Me.label11 = New System.Windows.Forms.Label()
            Me.label10 = New System.Windows.Forms.Label()
            Me.VScrollBar1 = New System.Windows.Forms.VScrollBar()
            Me.label12 = New System.Windows.Forms.Label()
            Me.comboBox1 = New System.Windows.Forms.ComboBox()
            Me.HScrollBar1 = New System.Windows.Forms.HScrollBar()
            Me.groupBox1 = New System.Windows.Forms.GroupBox()
            Me.comboBox2 = New System.Windows.Forms.ComboBox()
            Me.pictureBox1 = New System.Windows.Forms.PictureBox()
            Me.label4 = New System.Windows.Forms.Label()
            Me.label5 = New System.Windows.Forms.Label()
            Me.label8 = New System.Windows.Forms.Label()
            Me.label9 = New System.Windows.Forms.Label()
            Me.label6 = New System.Windows.Forms.Label()
            Me.label2 = New System.Windows.Forms.Label()
            Me.label3 = New System.Windows.Forms.Label()
            Me.label7 = New System.Windows.Forms.Label()
            Me.label1 = New System.Windows.Forms.Label()

            label11.Location = New System.Drawing.Point(408, 160)
            label11.Text = "Label11"
            label11.Size = New System.Drawing.Size(72, 16)
            label11.TabIndex = 4

            label10.Location = New System.Drawing.Point(216, 168)
            label10.Text = "100"
            label10.Size = New System.Drawing.Size(24, 16)
            label10.TabIndex = 13

            VScrollBar1.Location = New System.Drawing.Point(200, 24)
            VScrollBar1.TabIndex = 2
            VScrollBar1.Size = New System.Drawing.Size(16, 152)
            AddHandler VScrollBar1.Scroll, New System.Windows.Forms.ScrollEventHandler(AddressOf VScrollBar1_Scroll)
            VScrollBar1.Minimum = -100
            VScrollBar1.Maximum = 100

            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.Text = "VScrollBar"

            Me.ClientSize = New System.Drawing.Size(520, 277)

            label12.Location = New System.Drawing.Point(408, 184)
            label12.Text = "label12"
            label12.Size = New System.Drawing.Size(72, 16)
            label12.TabIndex = 7

            comboBox1.Text = ""
            comboBox1.Location = New System.Drawing.Point(136, 24)
            comboBox1.Size = New System.Drawing.Size(96, 21)
            comboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            comboBox1.TabIndex = 0
            AddHandler comboBox1.SelectedIndexChanged, New System.EventHandler(AddressOf comboBox1_SelectedIndexChanged)
            comboBox1.Items.AddRange(new Object() {"20", "10", "5"})

            HScrollBar1.Location = New System.Drawing.Point(16, 176)
            HScrollBar1.TabIndex = 3
            HScrollBar1.Size = New System.Drawing.Size(184, 16)
            AddHandler HScrollBar1.Scroll, New System.Windows.Forms.ScrollEventHandler(AddressOf HScrollBar1_Scroll)
            HScrollBar1.Minimum = -100
            HScrollBar1.Maximum = 100

            groupBox1.Location = New System.Drawing.Point(264, 16)
            groupBox1.TabIndex = 5
            groupBox1.TabStop = False
            groupBox1.Text = "HScrollBar and VScrollBar"
            groupBox1.Size = New System.Drawing.Size(248, 264)

            comboBox2.Text = ""
            comboBox2.Location = New System.Drawing.Point(136, 48)
            comboBox2.Size = New System.Drawing.Size(96, 21)
            comboBox2.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            comboBox2.TabIndex = 1
            AddHandler comboBox2.SelectedIndexChanged, New System.EventHandler(AddressOf comboBox2_SelectedIndexChanged)
            comboBox2.Items.AddRange(new Object() {"5","2","1"})

            pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
            pictureBox1.Location = New System.Drawing.Point(64, 32)
            pictureBox1.Size = New System.Drawing.Size(96, 96)
            pictureBox1.TabIndex = 6
            pictureBox1.TabStop = False
            pictureBox1.Image = CType(resources.GetObject("pictureBox1.Image"), Image)
            pictureBox1.Text = "pictureBox1"
            AddHandler pictureBox1.MouseDown, New System.Windows.Forms.MouseEventHandler(AddressOf pictureBox1_MouseDown)
            AddHandler pictureBox1.MouseUp, New System.Windows.Forms.MouseEventHandler(AddressOf pictureBox1_MouseUp)
            AddHandler pictureBox1.MouseMove, New System.Windows.Forms.MouseEventHandler(AddressOf pictureBox1_MouseMove)

            label4.Location = New System.Drawing.Point(184, 192)
            label4.Text = "100"
            label4.Size = New System.Drawing.Size(24, 16)
            label4.TabIndex = 9

            label5.Location = New System.Drawing.Point(112, 200)
            label5.Text = "0"
            label5.Size = New System.Drawing.Size(32, 16)
            label5.TabIndex = 10

            label8.Location = New System.Drawing.Point(224, 24)
            label8.Text = "-100"
            label8.Size = New System.Drawing.Size(32, 16)
            label8.TabIndex = 11

            label9.Location = New System.Drawing.Point(224, 96)
            label9.Text = "0"
            label9.Size = New System.Drawing.Size(16, 16)
            label9.TabIndex = 12

            label6.Location = New System.Drawing.Point(16, 144)
            label6.Text = "HScrollBar.value"
            label6.Size = New System.Drawing.Size(92, 32)
            label6.TabIndex = 3

            label2.Location = New System.Drawing.Point(280, 64)
            label2.Text = "Small Change"
            label2.Size = New System.Drawing.Size(92, 16)
            label2.TabIndex = 1

            label3.Location = New System.Drawing.Point(8, 200)
            label3.Text = "-100"
            label3.Size = New System.Drawing.Size(32, 16)
            label3.TabIndex = 8

            label7.Location = New System.Drawing.Point(16, 168)
            label7.Text = "VScrollBar.value"
            label7.Size = New System.Drawing.Size(92, 16)
            label7.TabIndex = 2

            label1.Location = New System.Drawing.Point(280, 40)
            label1.Text = "Large Change"
            label1.Size = New System.Drawing.Size(92, 16)
            label1.TabIndex = 0

            Me.Controls.Add(label12)
            Me.Controls.Add(label11)
            Me.Controls.Add(label10)
            Me.Controls.Add(label9)
            Me.Controls.Add(label8)
            Me.Controls.Add(label5)
            Me.Controls.Add(label4)
            Me.Controls.Add(label3)
            Me.Controls.Add(label2)
            Me.Controls.Add(label1)
            Me.Controls.Add(groupBox1)
            Me.Controls.Add(HScrollBar1)
            Me.Controls.Add(VScrollBar1)
            Me.Controls.Add(pictureBox1)
            groupBox1.Controls.Add(label7)
            groupBox1.Controls.Add(label6)
            groupBox1.Controls.Add(comboBox2)
            groupBox1.Controls.Add(comboBox1)
        End Sub

#End Region

        ' The main entry point for the application.
        <STAThread()> Public Shared Sub Main()
            Application.Run(New ScrollBarCtl())
        End Sub


    End Class


