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

Namespace Microsoft.Samples.Windows.Forms.VB.TrackBarCtl

    Public Class TrackBarCtl
        Inherits System.Windows.Forms.Form

        Public Sub New()
            MyBase.New()

            TrackBarCtl = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            InitState()
        End Sub 'New


        ' <doc>
        ' <desc>
        '     Sets up the form so that the fields which drive the TrackBar
        '     show up with the correct initial fields.
        ' </desc>
        ' </doc>
        '
        Private Sub InitState()
            trackbar.TickFrequency = 5
            cmbTickFreq.SelectedIndex = 2

            trackbar.SmallChange = 5
            cmbSmallChange.SelectedIndex = 2

            trackbar.LargeChange = 25
            cmbLargeChange.SelectedIndex = 1

            trackbar.Minimum = 0
            cmbMinimum.SelectedIndex = 0

            trackbar.Maximum = 100
            cmbMaximum.SelectedIndex = 0

            trackbar.Orientation = Orientation.Horizontal
            cmbOrientation.SelectedIndex = 0

            trackbar.TickStyle = TickStyle.None
            cmbTickStyle.SelectedIndex = 0

            lblValue.Text = trackbar.Value.ToString()
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


        Private Sub CmbTickFreq_selectedIndexChanged(ByVal [source] As Object, ByVal e As EventArgs)
            Try
                Dim newVal1 As [String] = cmbTickFreq.SelectedItem.ToString()
                Dim newVal As Integer = Convert.ToInt16(newVal1)
                trackbar.TickFrequency = newVal
            Catch
            End Try
        End Sub

        Private Sub CmbLargeChange_selectedIndexChanged(ByVal [source] As Object, ByVal e As EventArgs)
            Try
                Dim newVal1 As [String] = cmbLargeChange.SelectedItem.ToString()
                Dim newVal As Integer = Convert.ToInt16(newVal1)
                trackbar.LargeChange = newVal
            Catch
            End Try
        End Sub

        Private Sub CmbSmallChange_selectedIndexChanged(ByVal [source] As Object, ByVal e As EventArgs)
            Try
                Dim newVal1 As [String] = cmbSmallChange.SelectedItem.ToString()
                Dim newVal As Integer = Convert.ToInt16(newVal1)
                trackbar.SmallChange = newVal
            Catch
            End Try
        End Sub

        Private Sub CmbMinimum_selectedIndexChanged(ByVal [source] As Object, ByVal e As EventArgs)
            Try
                Dim newVal1 As [String] = cmbMinimum.SelectedItem.ToString()
                Dim newVal As Integer = Convert.ToInt16(newVal1)
                If newVal > trackbar.Value And newVal < trackbar.Maximum Then

                    lblValue.Text = newVal.ToString()

                End If
                If newVal < trackbar.Maximum Then
                    trackbar.Minimum = newVal
                End If
            Catch
            End Try
        End Sub

        Private Sub CmbMaximum_selectedIndexChanged(ByVal [source] As Object, ByVal e As EventArgs)
            Try
                Dim newVal1 As [String] = cmbMaximum.SelectedItem.ToString()
                Dim newVal As Integer = Convert.ToInt16(newVal1)
                If newVal < trackbar.Value And newVal > trackbar.Minimum Then

                    lblValue.Text = newVal.ToString()

                End If
                If newVal > trackbar.Minimum Then
                    trackbar.Maximum = newVal
                End If
            Catch
            End Try
        End Sub

        Private Sub Trackbar_valueChanged(ByVal [source] As Object, ByVal e As EventArgs)
            lblValue.Text = trackbar.Value.ToString()
        End Sub

        Private Sub CmbTickStyle_selectedIndexChanged(ByVal [source] As Object, ByVal e As EventArgs)
            Dim cmb As ComboBox = CType([source], ComboBox)
            Dim newSel As String = CStr(cmb.SelectedItem)
            If newSel.Equals("Both") Then
                trackbar.TickStyle = TickStyle.Both
            Else
                If newSel.Equals("Bottomright") Then
                    trackbar.TickStyle = TickStyle.BottomRight
                Else
                    If newSel.Equals("Topleft") Then
                        trackbar.TickStyle = TickStyle.TopLeft
                    Else
                        trackbar.TickStyle = TickStyle.None
                    End If

                End If
            End If
            If trackbar.TickStyle = TickStyle.None Then
                cmbTickFreq.Enabled = False
            Else
                cmbTickFreq.Enabled = True
            End If

        End Sub

        Private Sub CmbOrientation_selectedIndexChanged(ByVal [source] As Object, ByVal e As EventArgs)
            Dim cmb As ComboBox = CType([source], ComboBox)
            Dim newSel As String = CStr(cmb.SelectedItem)
            If newSel.Equals("Horizontal") Then
                trackbar.Orientation = Orientation.Horizontal
            Else
                trackbar.Orientation = Orientation.Vertical
            End If
        End Sub

        ' <doc>
        ' <desc>
        '     All KeyPresses that are not digits are ignored.
        '     Other non-letter keys (such as ENTER) are accepted.
        '     The edit boxes which require numerical input wire up to
        '     this handler.
        ' </desc>
        ' </doc>
        Private Sub NumberKeyPressFilter(ByVal [source] As Object, ByVal e As KeyPressEventArgs)
            If [Char].IsLetterOrDigit(e.KeyChar) And Not [Char].IsDigit(e.KeyChar) Then
                e.Handled = True
            End If
        End Sub


#Region " Windows Form Designer generated code "

        'Required by the Windows Form Designer
        Private components As System.ComponentModel.Container
        Protected WithEvents trackbar As System.Windows.Forms.TrackBar
        Protected WithEvents grpAppearance As System.Windows.Forms.GroupBox
        Protected WithEvents label3 As System.Windows.Forms.Label
        Protected WithEvents label1 As System.Windows.Forms.Label
        Protected WithEvents label8 As System.Windows.Forms.Label
        Protected WithEvents label7 As System.Windows.Forms.Label
        Protected WithEvents label4 As System.Windows.Forms.Label
        Protected WithEvents label5 As System.Windows.Forms.Label
        Protected WithEvents cmbOrientation As System.Windows.Forms.ComboBox
        Protected WithEvents cmbTickStyle As System.Windows.Forms.ComboBox
        Protected WithEvents cmbTickFreq As System.Windows.Forms.ComboBox
        Protected WithEvents label6 As System.Windows.Forms.Label
        Protected WithEvents cmbMaximum As System.Windows.Forms.ComboBox
        Protected WithEvents lblValue As System.Windows.Forms.Label
        Protected WithEvents cmbMinimum As System.Windows.Forms.ComboBox
        Protected WithEvents cmbSmallChange As System.Windows.Forms.ComboBox
        Protected WithEvents label2 As System.Windows.Forms.Label
        Protected WithEvents cmbLargeChange As System.Windows.Forms.ComboBox
        Protected WithEvents toolTip1 As System.Windows.Forms.ToolTip

        Private WithEvents TrackBarCtl As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.trackbar = New System.Windows.Forms.TrackBar()
            Me.grpAppearance = New System.Windows.Forms.GroupBox()
            Me.label3 = New System.Windows.Forms.Label()
            Me.label1 = New System.Windows.Forms.Label()
            Me.label8 = New System.Windows.Forms.Label()
            Me.label7 = New System.Windows.Forms.Label()
            Me.label4 = New System.Windows.Forms.Label()
            Me.label5 = New System.Windows.Forms.Label()
            Me.cmbOrientation = New System.Windows.Forms.ComboBox()
            Me.cmbTickStyle = New System.Windows.Forms.ComboBox()
            Me.cmbTickFreq = New System.Windows.Forms.ComboBox()
            Me.label6 = New System.Windows.Forms.Label()
            Me.cmbMaximum = New System.Windows.Forms.ComboBox()
            Me.lblValue = New System.Windows.Forms.Label()
            Me.cmbMinimum = New System.Windows.Forms.ComboBox()
            Me.cmbSmallChange = New System.Windows.Forms.ComboBox()
            Me.label2 = New System.Windows.Forms.Label()
            Me.cmbLargeChange = New System.Windows.Forms.ComboBox()
            Me.toolTip1 = New System.Windows.Forms.ToolTip(components)

            Me.BackColor = System.Drawing.SystemColors.Control
            Me.Size = New System.Drawing.Size(512, 320)
            Me.Text = "TrackBar"

            trackbar.Location = New System.Drawing.Point(8, 24)
            trackbar.Size = New System.Drawing.Size(200, 42)
            trackbar.TabIndex = 0
            trackbar.Text = "trackBar1"
            trackbar.BackColor = System.Drawing.SystemColors.Control
            AddHandler trackbar.ValueChanged, New System.EventHandler(AddressOf Trackbar_valueChanged)

            grpAppearance.Location = New System.Drawing.Point(248, 16)
            grpAppearance.Size = New System.Drawing.Size(248, 264)
            grpAppearance.TabIndex = 0
            grpAppearance.TabStop = False
            grpAppearance.Text = "TrackBar"

            label3.Location = New System.Drawing.Point(16, 96)
            label3.Size = New System.Drawing.Size(88, 16)
            label3.TabIndex = 0
            label3.TabStop = False
            label3.Text = "largeChange:"

            label1.Location = New System.Drawing.Point(16, 24)
            label1.Size = New System.Drawing.Size(88, 17)
            label1.TabIndex = 10
            label1.TabStop = False
            label1.Text = "orientation:"

            label8.Location = New System.Drawing.Point(16, 192)
            label8.Size = New System.Drawing.Size(88, 16)
            label8.TabIndex = 8
            label8.TabStop = False
            label8.Text = "value:"

            label7.Location = New System.Drawing.Point(16, 168)
            label7.Size = New System.Drawing.Size(88, 16)
            label7.TabIndex = 6
            label7.TabStop = False
            label7.Text = "maximum:"

            label4.Location = New System.Drawing.Point(16, 48)
            label4.Size = New System.Drawing.Size(88, 17)
            label4.TabIndex = 12
            label4.TabStop = False
            label4.Text = "tickFrequency:"

            label5.Location = New System.Drawing.Point(16, 72)
            label5.Size = New System.Drawing.Size(88, 17)
            label5.TabIndex = 14
            label5.TabStop = False
            label5.Text = "tickStyle:"

            cmbOrientation.Location = New System.Drawing.Point(112, 16)
            cmbOrientation.Size = New System.Drawing.Size(120, 21)
            cmbOrientation.TabIndex = 1
            cmbOrientation.Text = ""
            cmbOrientation.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            AddHandler cmbOrientation.SelectedIndexChanged, New System.EventHandler(AddressOf CmbOrientation_selectedIndexChanged)
            cmbOrientation.Items.AddRange(New Object() {"Horizontal", "Vertical"})

            cmbTickStyle.Location = New System.Drawing.Point(112, 64)
            cmbTickStyle.Size = New System.Drawing.Size(120, 21)
            cmbTickStyle.TabIndex = 3
            cmbTickStyle.Text = ""
            cmbTickStyle.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            AddHandler cmbTickStyle.SelectedIndexChanged, New System.EventHandler(AddressOf CmbTickStyle_selectedIndexChanged)
            cmbTickStyle.Items.AddRange(New Object() {"None", "Bottomright", "Topleft", "Both"})

            cmbTickFreq.Location = New System.Drawing.Point(112, 40)
            cmbTickFreq.Size = New System.Drawing.Size(120, 21)
            cmbTickFreq.TabIndex = 2
            cmbTickFreq.Text = ""
            cmbTickFreq.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            AddHandler cmbTickFreq.SelectedIndexChanged, New System.EventHandler(AddressOf CmbTickFreq_selectedIndexChanged)
            cmbTickFreq.Items.AddRange(New Object() {"1", "2", "5", "10", "20", "25", "50"})

            label6.Location = New System.Drawing.Point(16, 144)
            label6.Size = New System.Drawing.Size(88, 16)
            label6.TabIndex = 4
            label6.TabStop = False
            label6.Text = "minimum:"

            cmbMaximum.Location = New System.Drawing.Point(112, 160)
            cmbMaximum.Size = New System.Drawing.Size(121, 21)
            cmbMaximum.TabIndex = 7
            cmbMaximum.Text = ""
            cmbMaximum.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            AddHandler cmbMaximum.SelectedIndexChanged, New System.EventHandler(AddressOf CmbMaximum_selectedIndexChanged)
            cmbMaximum.Items.AddRange(New Object() {"100", "150", "200"})

            lblValue.Location = New System.Drawing.Point(112, 192)
            lblValue.Size = New System.Drawing.Size(120, 16)
            lblValue.TabIndex = 9
            lblValue.TabStop = False
            lblValue.Text = ""
            lblValue.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D

            cmbMinimum.Location = New System.Drawing.Point(112, 136)
            cmbMinimum.Size = New System.Drawing.Size(121, 21)
            cmbMinimum.TabIndex = 6
            cmbMinimum.Text = ""
            cmbMinimum.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            AddHandler cmbMinimum.SelectedIndexChanged, New System.EventHandler(AddressOf CmbMinimum_selectedIndexChanged)
            cmbMinimum.Items.AddRange(New Object() {"0", "25", "50"})

            cmbSmallChange.Location = New System.Drawing.Point(112, 112)
            cmbSmallChange.Size = New System.Drawing.Size(121, 21)
            cmbSmallChange.TabIndex = 5
            cmbSmallChange.Text = ""
            cmbSmallChange.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            AddHandler cmbSmallChange.SelectedIndexChanged, New System.EventHandler(AddressOf CmbSmallChange_selectedIndexChanged)
            cmbSmallChange.Items.AddRange(New Object() {"1", "2", "5", "10"})

            label2.Location = New System.Drawing.Point(16, 120)
            label2.Size = New System.Drawing.Size(88, 16)
            label2.TabIndex = 2
            label2.TabStop = False
            label2.Text = "smallChange:"

            cmbLargeChange.Location = New System.Drawing.Point(112, 88)
            cmbLargeChange.Size = New System.Drawing.Size(121, 21)
            cmbLargeChange.TabIndex = 4
            cmbLargeChange.Text = ""
            cmbLargeChange.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            AddHandler cmbLargeChange.SelectedIndexChanged, New System.EventHandler(AddressOf CmbLargeChange_selectedIndexChanged)
            cmbLargeChange.Items.AddRange(New Object() {"10", "20", "50"})

            toolTip1.Active = True
            toolTip1.SetToolTip(cmbTickStyle, "The location of the tick marks.")
            toolTip1.SetToolTip(cmbTickFreq, "The number of units betwen tick marks")
            ' @designTimeOnly toolTip1.setLocation(new System.Drawing.Point(48, 152))

            Me.Controls.Add(grpAppearance)
            Me.Controls.Add(trackbar)
            grpAppearance.Controls.Add(lblValue)
            grpAppearance.Controls.Add(label8)
            grpAppearance.Controls.Add(cmbMaximum)
            grpAppearance.Controls.Add(label7)
            grpAppearance.Controls.Add(cmbMinimum)
            grpAppearance.Controls.Add(label6)
            grpAppearance.Controls.Add(cmbSmallChange)
            grpAppearance.Controls.Add(label2)
            grpAppearance.Controls.Add(cmbLargeChange)
            grpAppearance.Controls.Add(label3)
            grpAppearance.Controls.Add(cmbTickFreq)
            grpAppearance.Controls.Add(cmbTickStyle)
            grpAppearance.Controls.Add(cmbOrientation)
            grpAppearance.Controls.Add(label5)
            grpAppearance.Controls.Add(label1)
            grpAppearance.Controls.Add(label4)
        End Sub

#End Region


        ' The main entry point for the application.
        <STAThread()> Public Shared Sub Main()
            Application.Run(New TrackBarCtl())
        End Sub


    End Class

End Namespace
