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
Imports System.Resources
Imports System.Windows.Forms

    ' <doc>
    ' <desc>
    '     This sample control demonstrates various properties and
    '     methods for the ListBox control.
    ' </desc>
    ' </doc>
    Public Class ListBoxCtl
        Inherits System.Windows.Forms.Form

        Private listBoxColors() As Color = New System.Drawing.Color() {Color.Green, Color.Red, Color.Magenta, Color.Yellow}
        Private imgPanel As SampleImagePanel

        Public Sub New()

            MyBase.New()

            ListBoxCtl = Me

            ' This call is required for support of the Windows Forms Form Designer.
            InitializeComponent()

            Dim resources As ResourceManager = New ResourceManager(GetType(ListBoxCtl))

        'Add the simple custom control that displays the images selected in the
        'List Box
            imgPanel = New SampleImagePanel()
            imgPanel.Location = New System.Drawing.Point(64, 90)
            imgPanel.Size = New System.Drawing.Size(64, 168)
            imgPanel.TabIndex = 12
            Me.Controls.Add(imgPanel)

            ' item Height selection only matters for OWNERDRAW modes.
            integralHeightCheckBox.Enabled = False

            ' Initialize the combo boxes
            borderStyleComboBox.SelectedIndex = 0
            selectionModeComboBox.SelectedIndex = 2
            drawModeComboBox.SelectedIndex = 0

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


        Private Sub sortedCheckBox_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles sortedCheckBox.Click
            If sortedCheckBox.CheckState = CheckState.Checked Then
                '
                ' If the List Box is already populated, setting the
                ' Sorted property will cause the list to be sorted.
                ' Items subsequently added to the List Box will be
                ' inserted in sorting position.
                ' If the sorted property is not set (false), then
                ' items added to the list will appear at the end of
                ' the list.  The 'else' branch below demonstrates this,
                ' and was purposely used instead of the more efficient
                ' "setItems" method, as in the "InitializeComponent" method.
                '
                listBox1.Sorted = True
            Else
                listBox1.Items.Clear()
                listBox1.Items.Add("First Image")
                listBox1.Sorted = False
                listBox1.Items.Add("Second Image")
                listBox1.Items.Add("Third Image")
                listBox1.Items.Add("Fourth Image")
            End If
            ClearSelections()
            imgPanel.ClearImages()
        End Sub


        Private Sub borderStyleComboBox_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles borderStyleComboBox.SelectedIndexChanged
            Dim index As Integer = borderStyleComboBox.SelectedIndex
            If index = 0 Then
                listBox1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
            Else
                If index = 1 Then
                    listBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
                Else
                    listBox1.BorderStyle = System.Windows.Forms.BorderStyle.None
                End If
            End If

        End Sub


        Private Sub integralHeightCheckBox_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles integralHeightCheckBox.Click
            If integralHeightCheckBox.CheckState = CheckState.Checked Then
                listBox1.ItemHeight = 25
            Else
                listBox1.ItemHeight = 15
            End If
        End Sub


        Private Sub FGColorButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FGColorButton.Click
            If LBColorDialog.ShowDialog() = DialogResult.OK Then
                listBox1.ForeColor = LBColorDialog.Color
            End If
        End Sub


        Private Sub BGColorButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BGColorButton.Click
            If LBColorDialog.ShowDialog() = DialogResult.OK Then
                listBox1.BackColor = LBColorDialog.Color
            End If
        End Sub


        Private Sub multiColumnCheckBox_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles multiColumnCheckBox.Click
            Dim selection As Integer = drawModeComboBox.SelectedIndex
            drawModeComboBox.Items.Clear()

            If multiColumnCheckBox.CheckState = CheckState.Checked Then
                drawModeComboBox.Items.AddRange(New Object() {"Normal", "OwnerDrawFixed"})
                drawModeComboBox.SelectedIndex = selection

                '
                ' To show multiple columns, we size the ListBox so that 3 rows
                ' appear, and the last item in the list appears in the 2nd column
                '
                listBox1.MultiColumn = True
                listBox1.ColumnWidth = 70
            Else
                ' enable OWNERDRAWVARIABLE
                drawModeComboBox.Items.AddRange(New Object() {"Normal", "OwnerDrawFixed", "OwnerDrawVariable"})
                listBox1.MultiColumn = False
                listBox1.ColumnWidth = 144
            End If
            drawModeComboBox.SelectedIndex = selection
        End Sub


        Private Sub selectionModeComboBox_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles selectionModeComboBox.SelectedIndexChanged
            Dim index As Integer = selectionModeComboBox.SelectedIndex
            If index = 0 Then
                listBox1.SelectionMode = SelectionMode.None
            Else
                If index = 1 Then
                    listBox1.SelectionMode = SelectionMode.One
                Else
                    If index = 2 Then
                        listBox1.SelectionMode = SelectionMode.MultiSimple
                    Else
                        listBox1.SelectionMode = SelectionMode.MultiExtended
                    End If
                    '
                    ' After changing the selection mode, it's a good idea to
                    ' remove all selections.  Also invalidate the selection.
                    '
                End If
            End If
            ClearSelections()
            imgPanel.ClearImages()
        End Sub


        Private Sub ClearSelections()
            Dim index As Integer = selectionModeComboBox.SelectedIndex
            If index <> 0 Then
                Dim selectIndex As Integer
                '
                ' Calling setSelected with selectionMode "None" throws
                ' an exception.
                '
                For selectIndex = 0 To listBox1.Items.Count - 1
                    listBox1.SetSelected(selectIndex, False)
                Next selectIndex
            End If
            imgPanel.Invalidate()
        End Sub


        Private Sub listBox1_DrawItem(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DrawItemEventArgs) Handles listBox1.DrawItem
            '
            ' The method e.drawFocusRect();
            ' should be called to fill in a handy focus rectangle if this item
            ' is currently selected.  This call should be made AFTER all other
            ' drawing, else it will get overwritten!
            ' The following method should generally be called before drawing.
            ' It is actually superfluous here, since the subsequent drawing
            ' will completely cover the area of interest.
            '
            e.DrawBackground()
            Dim mode As DrawMode = listBox1.DrawMode
            If mode = DrawMode.Normal Then
                ' NORMAL Draw: The control handles the drawing.
                Return
            Else
                If mode = DrawMode.OwnerDrawFixed Or mode = DrawMode.OwnerDrawVariable Then
                    Dim b As Brush = New SolidBrush(listBoxColors(e.Index))
                    '
                    ' In either owner-draw mode, the system provides the context
                    ' into which the owner custom-draws the required graphics.
                    ' The context into which to draw is e.graphics.
                    ' The index of the item to be painted is e.index.
                    ' The painting should be done into the area described by e.rect.
                    '
                    e.Graphics.FillRectangle(b, e.Bounds)
                    e.Graphics.DrawRectangle(SystemPens.WindowText, e.Bounds)

                    Dim selected As Boolean
                    Dim selText As String
                    If ((e.State And DrawItemState.Selected) = DrawItemState.Selected) Then
                        selected = True
                        selText = "SEL."
                    Else
                        selected = False
                        selText = ""
                    End If

                    e.Graphics.DrawString("Bmp #" + e.Index.ToString() + " " + selText, Font, New SolidBrush(Color.Black), e.Bounds.X + 1, e.Bounds.Y + 1)
                    '
                    ' After all other drawing is complete, the next method will
                    ' add a rectangle that indicates whether this item has the
                    ' focus.
                    e.DrawFocusRectangle()
                End If
            End If

        End Sub


        Private Sub drawModeComboBox_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles drawModeComboBox.SelectedIndexChanged
            Dim index As Integer = drawModeComboBox.SelectedIndex
            If index = 0 Then
                listBox1.DrawMode = DrawMode.Normal
                integralHeightCheckBox.Enabled = False
                multiColumnCheckBox.Enabled = True
            ElseIf index = 1 Then
                listBox1.DrawMode = DrawMode.OwnerDrawFixed
                integralHeightCheckBox.Enabled = True
                multiColumnCheckBox.Enabled = True
            Else
                ' if OWNERDRAWVARIABLE is selected, Multi-column is not allowed.
                multiColumnCheckBox.Enabled = False
                multiColumnCheckBox.CheckState = CheckState.Unchecked
                listBox1.MultiColumn = False
                listBox1.DrawMode = DrawMode.OwnerDrawVariable
                integralHeightCheckBox.Enabled = True
            End If
            listBox1.ItemHeight = CInt(itemHeightUpDown.Value)
        End Sub


        Private Sub listBox1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles listBox1.SelectedIndexChanged

            imgPanel.ClearImages()

            Dim selected(listBox1.SelectedIndices.Count - 1) As Integer
            listBox1.SelectedIndices.CopyTo(selected, 0)
            Dim i As Integer

            For i = 0 To selected.Length - 1
                Dim index As Integer = selected(i)
                Dim item As Object = listBox1.Items(index)
                Dim str As String = item.ToString()
                Dim img As Image = GetImage(str)
                imgPanel.AddImage(img)
            Next i
            '
            ' To update (paint) the image area, call the invalidate method.
            ' This causes the onPaint method for that control to be called.
            '
            imgPanel.Invalidate()
        End Sub


        Private Function GetImage(ByVal bmpName As String) As Image
            If bmpName.Equals("First Image") Then
                Return imageList1.Images(0)
            ElseIf bmpName.Equals("Second Image") Then
                Return imageList1.Images(1)
            ElseIf bmpName.Equals("Third Image") Then
                Return imageList1.Images(2)
            ElseIf bmpName.Equals("Fourth Image") Then
                Return imageList1.Images(3)
            Else
                Return Nothing
            End If
        End Function


        Private Sub itemHeightUpDown_ValueChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles itemHeightUpDown.ValueChanged
            listBox1.ItemHeight = CInt(itemHeightUpDown.Value)
        End Sub


        Private Sub listBox1_MeasureItem(ByVal sender As System.Object, ByVal mie As System.Windows.Forms.MeasureItemEventArgs) Handles listBox1.MeasureItem
            Dim nominalHeight As Integer = listBox1.ItemHeight
            mie.ItemHeight = 2 * (mie.Index Mod 5) + nominalHeight
        End Sub
        Private components As System.ComponentModel.IContainer


#Region " Windows Form Designer generated code "

        'Required by the Windows Form Designer
        Protected WithEvents groupBox1 As System.Windows.Forms.GroupBox
        Protected WithEvents selectionModeComboBox As System.Windows.Forms.ComboBox
        Protected WithEvents sortedCheckBox As System.Windows.Forms.CheckBox
        Protected WithEvents listBox1 As System.Windows.Forms.ListBox
        Protected WithEvents integralHeightCheckBox As System.Windows.Forms.CheckBox
        Protected WithEvents borderStyleComboBox As System.Windows.Forms.ComboBox
        Protected WithEvents label1 As System.Windows.Forms.Label
        Protected WithEvents drawModeComboBox As System.Windows.Forms.ComboBox
        Protected WithEvents label2 As System.Windows.Forms.Label
        Protected WithEvents label3 As System.Windows.Forms.Label
        Protected WithEvents multiColumnCheckBox As System.Windows.Forms.CheckBox
        Protected WithEvents FGColorButton As System.Windows.Forms.Button
        Protected WithEvents BGColorButton As System.Windows.Forms.Button
        Protected WithEvents LBColorDialog As System.Windows.Forms.ColorDialog
        Protected WithEvents itemHeightUpDown As System.Windows.Forms.NumericUpDown
        Protected WithEvents label4 As System.Windows.Forms.Label
        Protected WithEvents toolTip1 As System.Windows.Forms.ToolTip
        Protected WithEvents imageList1 As System.Windows.Forms.ImageList


        Private WithEvents ListBoxCtl As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(ListBoxCtl))
        Me.toolTip1 = New System.Windows.Forms.ToolTip(Me.components)
        Me.integralHeightCheckBox = New System.Windows.Forms.CheckBox()
        Me.borderStyleComboBox = New System.Windows.Forms.ComboBox()
        Me.sortedCheckBox = New System.Windows.Forms.CheckBox()
        Me.multiColumnCheckBox = New System.Windows.Forms.CheckBox()
        Me.FGColorButton = New System.Windows.Forms.Button()
        Me.listBox1 = New System.Windows.Forms.ListBox()
        Me.drawModeComboBox = New System.Windows.Forms.ComboBox()
        Me.selectionModeComboBox = New System.Windows.Forms.ComboBox()
        Me.itemHeightUpDown = New System.Windows.Forms.NumericUpDown()
        Me.BGColorButton = New System.Windows.Forms.Button()
        Me.label1 = New System.Windows.Forms.Label()
        Me.label4 = New System.Windows.Forms.Label()
        Me.label3 = New System.Windows.Forms.Label()
        Me.label2 = New System.Windows.Forms.Label()
        Me.imageList1 = New System.Windows.Forms.ImageList(Me.components)
        Me.groupBox1 = New System.Windows.Forms.GroupBox()
        Me.LBColorDialog = New System.Windows.Forms.ColorDialog()
        CType(Me.itemHeightUpDown, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.groupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'integralHeightCheckBox
        '
        Me.integralHeightCheckBox.Location = New System.Drawing.Point(16, 48)
        Me.integralHeightCheckBox.Name = "integralHeightCheckBox"
        Me.integralHeightCheckBox.Size = New System.Drawing.Size(112, 16)
        Me.integralHeightCheckBox.TabIndex = 9
        Me.integralHeightCheckBox.Text = "IntegralHeight"
        Me.toolTip1.SetToolTip(Me.integralHeightCheckBox, "If clicked, owner-drawn items take up more room.")
        '
        'borderStyleComboBox
        '
        Me.borderStyleComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.borderStyleComboBox.DropDownWidth = 104
        Me.borderStyleComboBox.ForeColor = System.Drawing.SystemColors.WindowText
        Me.borderStyleComboBox.ItemHeight = 13
        Me.borderStyleComboBox.Items.AddRange(New Object() {"Fixed 3d", "Fixed Single", "None"})
        Me.borderStyleComboBox.Location = New System.Drawing.Point(128, 96)
        Me.borderStyleComboBox.MaxDropDownItems = 3
        Me.borderStyleComboBox.Name = "borderStyleComboBox"
        Me.borderStyleComboBox.Size = New System.Drawing.Size(104, 21)
        Me.borderStyleComboBox.TabIndex = 1
        Me.toolTip1.SetToolTip(Me.borderStyleComboBox, "Selects the ListBox border style.")
        '
        'sortedCheckBox
        '
        Me.sortedCheckBox.Location = New System.Drawing.Point(16, 72)
        Me.sortedCheckBox.Name = "sortedCheckBox"
        Me.sortedCheckBox.Size = New System.Drawing.Size(120, 16)
        Me.sortedCheckBox.TabIndex = 11
        Me.sortedCheckBox.Text = "Sorted"
        Me.toolTip1.SetToolTip(Me.sortedCheckBox, "If clicked, the List Box items appear in sorted order.")
        '
        'multiColumnCheckBox
        '
        Me.multiColumnCheckBox.Location = New System.Drawing.Point(16, 24)
        Me.multiColumnCheckBox.Name = "multiColumnCheckBox"
        Me.multiColumnCheckBox.Size = New System.Drawing.Size(104, 16)
        Me.multiColumnCheckBox.TabIndex = 7
        Me.multiColumnCheckBox.Text = "MultiColumn"
        Me.toolTip1.SetToolTip(Me.multiColumnCheckBox, "Sets the multicolumn property to true.  Only matters if ListBox height is small.")
        '
        'FGColorButton
        '
        Me.FGColorButton.Location = New System.Drawing.Point(16, 200)
        Me.FGColorButton.Name = "FGColorButton"
        Me.FGColorButton.TabIndex = 10
        Me.FGColorButton.Text = "&ForeColor"
        Me.toolTip1.SetToolTip(Me.FGColorButton, "Button to change the text foreground color.")
        '
        'listBox1
        '
        Me.listBox1.ColumnWidth = 144
        Me.listBox1.ForeColor = System.Drawing.SystemColors.WindowText
        Me.listBox1.IntegralHeight = False
        Me.listBox1.Items.AddRange(New Object() {"First Image", "Second Image", "Third Image", "Fourth Image"})
        Me.listBox1.Location = New System.Drawing.Point(8, 24)
        Me.listBox1.Name = "listBox1"
        Me.listBox1.Size = New System.Drawing.Size(232, 60)
        Me.listBox1.TabIndex = 0
        Me.toolTip1.SetToolTip(Me.listBox1, "The control being demonstrated.  In response to selections, Images will be displa" & _
        "yed elsewhere on the form.")
        '
        'drawModeComboBox
        '
        Me.drawModeComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.drawModeComboBox.DropDownWidth = 104
        Me.drawModeComboBox.ForeColor = System.Drawing.SystemColors.WindowText
        Me.drawModeComboBox.Items.AddRange(New Object() {"Normal", "OwnerDrawFixed", "OwnerDrawVariable"})
        Me.drawModeComboBox.Location = New System.Drawing.Point(128, 144)
        Me.drawModeComboBox.Name = "drawModeComboBox"
        Me.drawModeComboBox.Size = New System.Drawing.Size(104, 21)
        Me.drawModeComboBox.TabIndex = 5
        Me.toolTip1.SetToolTip(Me.drawModeComboBox, "Selects the mode in which ListBox items are drawn.")
        '
        'selectionModeComboBox
        '
        Me.selectionModeComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.selectionModeComboBox.DropDownWidth = 104
        Me.selectionModeComboBox.ForeColor = System.Drawing.SystemColors.WindowText
        Me.selectionModeComboBox.Items.AddRange(New Object() {"None", "One", "Multi Simple", "Multi Extended"})
        Me.selectionModeComboBox.Location = New System.Drawing.Point(128, 120)
        Me.selectionModeComboBox.Name = "selectionModeComboBox"
        Me.selectionModeComboBox.Size = New System.Drawing.Size(104, 21)
        Me.selectionModeComboBox.TabIndex = 3
        Me.toolTip1.SetToolTip(Me.selectionModeComboBox, "Selects the mode by which ListBox items are selected.")
        '
        'itemHeightUpDown
        '
        Me.itemHeightUpDown.Location = New System.Drawing.Point(128, 168)
        Me.itemHeightUpDown.Maximum = New Decimal(New Integer() {45, 0, 0, 0})
        Me.itemHeightUpDown.Minimum = New Decimal(New Integer() {15, 0, 0, 0})
        Me.itemHeightUpDown.Name = "itemHeightUpDown"
        Me.itemHeightUpDown.Size = New System.Drawing.Size(104, 20)
        Me.itemHeightUpDown.TabIndex = 6
        Me.toolTip1.SetToolTip(Me.itemHeightUpDown, "Changes the target size of the ListBox.  The ListBox may change the size it is ac" & _
        "tually drawn.")
        Me.itemHeightUpDown.Value = New Decimal(New Integer() {30, 0, 0, 0})
        '
        'BGColorButton
        '
        Me.BGColorButton.Location = New System.Drawing.Point(96, 200)
        Me.BGColorButton.Name = "BGColorButton"
        Me.BGColorButton.TabIndex = 12
        Me.BGColorButton.Text = "&BackColor"
        Me.toolTip1.SetToolTip(Me.BGColorButton, "Button to set the text background color.")
        '
        'label1
        '
        Me.label1.Location = New System.Drawing.Point(16, 96)
        Me.label1.Name = "label1"
        Me.label1.Size = New System.Drawing.Size(80, 16)
        Me.label1.TabIndex = 0
        Me.label1.Text = "BorderStyle:"
        '
        'label4
        '
        Me.label4.Location = New System.Drawing.Point(16, 168)
        Me.label4.Name = "label4"
        Me.label4.Size = New System.Drawing.Size(72, 16)
        Me.label4.TabIndex = 8
        Me.label4.Text = "ItemHeight:"
        '
        'label3
        '
        Me.label3.Location = New System.Drawing.Point(16, 144)
        Me.label3.Name = "label3"
        Me.label3.Size = New System.Drawing.Size(80, 16)
        Me.label3.TabIndex = 4
        Me.label3.Text = "DrawMode:"
        '
        'label2
        '
        Me.label2.Location = New System.Drawing.Point(16, 120)
        Me.label2.Name = "label2"
        Me.label2.Size = New System.Drawing.Size(80, 16)
        Me.label2.TabIndex = 2
        Me.label2.Text = "SelectionMode:"
        '
        'imageList1
        '
        Me.imageList1.ColorDepth = System.Windows.Forms.ColorDepth.Depth8Bit
        Me.imageList1.ImageSize = New System.Drawing.Size(24, 22)
        Me.imageList1.ImageStream = CType(resources.GetObject("imageList1.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.imageList1.TransparentColor = System.Drawing.Color.Transparent
        '
        'groupBox1
        '
        Me.groupBox1.Controls.AddRange(New System.Windows.Forms.Control() {Me.label4, Me.itemHeightUpDown, Me.multiColumnCheckBox, Me.BGColorButton, Me.FGColorButton, Me.label3, Me.label2, Me.drawModeComboBox, Me.selectionModeComboBox, Me.label1, Me.borderStyleComboBox, Me.integralHeightCheckBox, Me.sortedCheckBox})
        Me.groupBox1.Location = New System.Drawing.Point(248, 16)
        Me.groupBox1.Name = "groupBox1"
        Me.groupBox1.Size = New System.Drawing.Size(248, 272)
        Me.groupBox1.TabIndex = 1
        Me.groupBox1.TabStop = False
        Me.groupBox1.Text = "ListBox"
        '
        'ListBoxCtl
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(504, 293)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.listBox1, Me.groupBox1})
        Me.Name = "ListBoxCtl"
        Me.Text = "ListBox"
        CType(Me.itemHeightUpDown, System.ComponentModel.ISupportInitialize).EndInit()
        Me.groupBox1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

        ' The main entry point for the application.
        <STAThread()> Public Shared Sub Main()
            Application.Run(New ListBoxCtl())
        End Sub

    End Class

