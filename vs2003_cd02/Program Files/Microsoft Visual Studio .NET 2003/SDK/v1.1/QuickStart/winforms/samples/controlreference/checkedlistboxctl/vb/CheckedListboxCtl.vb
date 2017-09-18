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
Imports System.Windows.Forms
Imports System.Resources
Imports System.Drawing

Namespace Microsoft.Samples.Windows.Forms.VB.CheckedListBoxCtl


    '/ <summary>
    '/    This sample demonstrates the features of the CheckedListBox control.
    '/ </summary>
    Public Class CheckedListBoxCtl
        Inherits System.Windows.Forms.Form

        '/ <summary>
        '/    The fruit that we can add to the checkedListBox1.
        '/ </summary>
        Private fruits() As String = {"Spruce", "Ash", "Koa", "Elm", "Oak", "Cherry", "Ironwood", "Cedar", "Sequoia", "Walnut", "Maple", "Balsa", "Pine"}

        Public Sub New()

            MyBase.New()

            CheckedListBoxCtl = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            ' Add all but the last four fruits to the checkedListBox1
            Dim i As Integer
            For i = 0 To fruits.Length - 5
                checkedListBox1.Items.Add(fruits(i), False)
            Next i

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
        Private WithEvents toolTip1 As System.Windows.Forms.ToolTip
        Private WithEvents groupBox1 As System.Windows.Forms.GroupBox
        Private WithEvents chkOnClick As System.Windows.Forms.CheckBox
        Private WithEvents chkIntegralHeight As System.Windows.Forms.CheckBox
        Private WithEvents chkMultiColumn As System.Windows.Forms.CheckBox
        Private WithEvents cmdAdd As System.Windows.Forms.Button
        Private WithEvents chkSorted As System.Windows.Forms.CheckBox
        Private WithEvents cmdRemove As System.Windows.Forms.Button
        Private WithEvents cmdReset As System.Windows.Forms.Button
        Private WithEvents chkThreeDCheckBoxes As System.Windows.Forms.CheckBox
        Private WithEvents checkedListBox1 As System.Windows.Forms.CheckedListBox

        Private WithEvents CheckedListBoxCtl As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.chkMultiColumn = New System.Windows.Forms.CheckBox()
            Me.cmdRemove = New System.Windows.Forms.Button()
            Me.chkSorted = New System.Windows.Forms.CheckBox()
            Me.cmdReset = New System.Windows.Forms.Button()
            Me.chkThreeDCheckBoxes = New System.Windows.Forms.CheckBox()
            Me.groupBox1 = New System.Windows.Forms.GroupBox()
            Me.chkOnClick = New System.Windows.Forms.CheckBox()
            Me.chkIntegralHeight = New System.Windows.Forms.CheckBox()
            Me.cmdAdd = New System.Windows.Forms.Button()
            Me.checkedListBox1 = New System.Windows.Forms.CheckedListBox()
            Me.toolTip1 = New System.Windows.Forms.ToolTip(components)

            chkMultiColumn.Location = New System.Drawing.Point(16, 72)
            chkMultiColumn.TabIndex = 2
            chkMultiColumn.CheckState = System.Windows.Forms.CheckState.Checked
            chkMultiColumn.Text = "&MultiColumn"
            chkMultiColumn.Size = New System.Drawing.Size(104, 25)
            chkMultiColumn.Checked = True
            AddHandler chkMultiColumn.CheckedChanged, New System.EventHandler(AddressOf chkMultiColumn_CheckedChanged)

            cmdRemove.Location = New System.Drawing.Point(96, 168)
            cmdRemove.TabIndex = 3
            cmdRemove.Text = "&Remove"
            cmdRemove.Size = New System.Drawing.Size(75, 23)
            AddHandler cmdRemove.Click, New System.EventHandler(AddressOf cmdRemove_Click)

            chkSorted.Location = New System.Drawing.Point(16, 96)
            chkSorted.TabIndex = 3
            chkSorted.Text = "&Sorted"
            chkSorted.Size = New System.Drawing.Size(136, 25)
            toolTip1.SetToolTip(chkSorted, "Controls whether the list is sorted.")
            AddHandler chkSorted.CheckedChanged, New System.EventHandler(AddressOf chkSorted_CheckedChanged)

            cmdReset.Location = New System.Drawing.Point(16, 200)
            cmdReset.TabIndex = 4
            cmdReset.Enabled = False
            cmdReset.Text = "R&eset"
            cmdReset.Size = New System.Drawing.Size(75, 23)
            AddHandler cmdReset.Click, New System.EventHandler(AddressOf cmdReset_Click)

            chkThreeDCheckBoxes.Location = New System.Drawing.Point(16, 24)
            chkThreeDCheckBoxes.TabIndex = 0
            chkThreeDCheckBoxes.CheckState = System.Windows.Forms.CheckState.Checked
            chkThreeDCheckBoxes.Text = "T&hreeDCheckBoxes"
            chkThreeDCheckBoxes.Size = New System.Drawing.Size(136, 25)
            chkThreeDCheckBoxes.Checked = True
            toolTip1.SetToolTip(chkThreeDCheckBoxes, "Indicates if the check values should be shown as flat or 3D checkmarks.")
            AddHandler chkThreeDCheckBoxes.CheckedChanged, New System.EventHandler(AddressOf chkThreeDCheckBoxes_CheckedChanged)

            groupBox1.Location = New System.Drawing.Point(248, 16)
            groupBox1.TabIndex = 0
            groupBox1.TabStop = False
            groupBox1.Text = "CheckedListBox"
            groupBox1.Size = New System.Drawing.Size(248, 264)

            chkOnClick.Location = New System.Drawing.Point(16, 120)
            chkOnClick.TabIndex = 4
            chkOnClick.CheckState = System.Windows.Forms.CheckState.Checked
            chkOnClick.Text = "&CheckOnClick"
            chkOnClick.Size = New System.Drawing.Size(136, 25)
            chkOnClick.Checked = True
            toolTip1.SetToolTip(chkOnClick, "Indicates whether the check box should be toggled on the first click on an item.")
            AddHandler chkOnClick.CheckedChanged, New System.EventHandler(AddressOf chkOnClick_CheckedChanged)

            chkIntegralHeight.Location = New System.Drawing.Point(16, 48)
            chkIntegralHeight.TabIndex = 1
            chkIntegralHeight.CheckState = System.Windows.Forms.CheckState.Checked
            chkIntegralHeight.Text = "&IntegralHeight"
            chkIntegralHeight.Size = New System.Drawing.Size(120, 25)
            chkIntegralHeight.Checked = True
            AddHandler chkIntegralHeight.CheckedChanged, New System.EventHandler(AddressOf chkIntegralHeight_CheckedChanged)

            cmdAdd.Location = New System.Drawing.Point(16, 168)
            cmdAdd.TabIndex = 2
            cmdAdd.Text = "&Add"
            cmdAdd.Size = New System.Drawing.Size(75, 23)
            AddHandler cmdAdd.Click, New System.EventHandler(AddressOf cmdAdd_Click)

            checkedListBox1.ThreeDCheckBoxes = True
            checkedListBox1.IntegralHeight = False
            checkedListBox1.TabIndex = 1
            checkedListBox1.CheckOnClick = True
            checkedListBox1.ColumnWidth = 100
            checkedListBox1.MultiColumn = True
            checkedListBox1.Size = New System.Drawing.Size(232, 84)
            checkedListBox1.Location = New System.Drawing.Point(8, 24)
            checkedListBox1.Text = "checkedListBox1"

            toolTip1.Active = True

            Me.Text = "Checked ListBox"
            Me.TabIndex = 0
            Me.Size = New System.Drawing.Size(512, 320)

            Me.Controls.Add(groupBox1)
            Me.Controls.Add(cmdAdd)
            Me.Controls.Add(cmdRemove)
            Me.Controls.Add(cmdReset)
            Me.Controls.Add(checkedListBox1)
            groupBox1.Controls.Add(chkOnClick)
            groupBox1.Controls.Add(chkIntegralHeight)
            groupBox1.Controls.Add(chkMultiColumn)
            groupBox1.Controls.Add(chkThreeDCheckBoxes)
            groupBox1.Controls.Add(chkSorted)

        End Sub 'InitializeComponent

#End Region

        '/ <summary>
        '/    Event that gets fired when the user clicks on the threeDCheckBoxes
        '/    checkbox.
        '/ </summary>
        Private Sub chkThreeDCheckBoxes_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            checkedListBox1.ThreeDCheckBoxes = chkThreeDCheckBoxes.Checked
        End Sub


        '/ <summary>
        '/    Event that gets fired when the user clicks on the integralHeight
        '/    checkbox.
        '/ </summary>
        Private Sub chkIntegralHeight_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            checkedListBox1.IntegralHeight = chkIntegralHeight.Checked
            checkedListBox1.Height = 94
        End Sub


        '/ <summary>
        '/    Event that gets fired when the user clicks on the multiColumn
        '/    checkbox.
        '/ </summary>
        Private Sub chkMultiColumn_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            checkedListBox1.MultiColumn = chkMultiColumn.Checked
        End Sub


        '/ <summary>
        '/    Event that gets fired when the user clicks on the sorted
        '/    checkbox.
        '/ </summary>
        Private Sub chkSorted_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            checkedListBox1.Sorted = chkSorted.Checked
            cmdReset.Enabled = Not chkSorted.Checked
        End Sub


        '/ <summary>
        '/    This event gets fired when the user clicks on the onClick
        '/    CheckBox.
        '/ </summary>
        Private Sub chkOnClick_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            checkedListBox1.CheckOnClick = chkOnClick.Checked
        End Sub


        '/ <summary>
        '/    Event that gets fired when the user clicks on the Add
        '/    button.  This handler adds a fruit to the listbox if
        '/    any additional fruit remain.
        '/ </summary>
        Private Sub cmdAdd_Click(ByVal sender As Object, ByVal e As EventArgs)
            If checkedListBox1.Items.Count < fruits.Length Then
                Dim stopLoop As Boolean = False
                Dim found As Boolean = False
                Dim i As Integer = 0
                ' If we still have some fruit that have not been
                ' added to the checkedListBox1, run through the list
                ' and add the first fruit that has not been added.
                While stopLoop = False
                    found = False
                    Dim j As Integer
                    For j = 0 To checkedListBox1.Items.Count - 1
                        If fruits(i).Equals(CStr(checkedListBox1.Items(j))) Then
                            found = True
                        End If
                    Next j
                    If found = False Then
                        stopLoop = True
                    Else
                        i += 1
                    End If
                End While
                checkedListBox1.Items.Add(fruits(i), False)
            End If
            If checkedListBox1.Items.Count = fruits.Length Then

                ' Make sure that the user can't attemp to add fruits
                ' that don't exist.
                cmdAdd.Enabled = False

            End If
            If checkedListBox1.Items.Count > 0 Then
                cmdRemove.Enabled = True
            End If

        End Sub

        '/ <summary>
        '/    Event that gets fired when the user clicks on the Remove button.
        '/    This handler removes the selected fruit from the list.
        '/ </summary>
        Private Sub cmdRemove_Click(ByVal sender As Object, ByVal e As EventArgs)
            If checkedListBox1.SelectedIndex >= 0 Then
                Dim index As Integer = checkedListBox1.SelectedIndex
                checkedListBox1.Items.RemoveAt(index)

                If index > 0 Then
                    checkedListBox1.SelectedIndex = index - 1
                Else
                    If checkedListBox1.Items.Count <> 0 Then
                        checkedListBox1.SelectedIndex = 0
                    End If
                End If
            End If

            If checkedListBox1.Items.Count = 0 Then
                cmdRemove.Enabled = False
            End If

            If checkedListBox1.Items.Count < fruits.Length Then
                cmdAdd.Enabled = True
            End If

        End Sub

        '/ <summary>
        '/    Event that gets fired when the user clicks on the Reset button.
        '/ </summary>
        Private Sub cmdReset_Click(ByVal sender As Object, ByVal e As EventArgs)
            Dim nListItems As Integer = checkedListBox1.Items.Count
            Dim new_checked(fruits.Length) As Boolean
            Dim item As String = ""
            Dim k As Integer

            For k = 0 To fruits.Length - 1
                new_checked(k) = False
            Next k

            Dim l As Integer = 0
            Dim m As Integer = 0
            For l = 0 To nListItems - 1
                If checkedListBox1.GetItemChecked(l) Then
                    item = CStr(checkedListBox1.Items(l))
                    For m = 0 To fruits.Length - 1
                        If fruits(m).Equals(item) Then
                            new_checked(m) = True
                        End If
                    Next m
                End If
            Next l

            checkedListBox1.Items.Clear()

            Dim j As Integer
            For j = 0 To nListItems - 1
                checkedListBox1.Items.Add(fruits(j), False)
                If new_checked(j) = True Then
                    checkedListBox1.SetItemChecked(j, True)
                End If
            Next j

            cmdReset.Enabled = False
        End Sub

        '/ <summary>
        '/ The main entry point for the application.
        '/ </summary>
        <STAThread()> Public Shared Sub Main()
            Application.Run(New CheckedListBoxCtl())
        End Sub

    End Class

End Namespace
