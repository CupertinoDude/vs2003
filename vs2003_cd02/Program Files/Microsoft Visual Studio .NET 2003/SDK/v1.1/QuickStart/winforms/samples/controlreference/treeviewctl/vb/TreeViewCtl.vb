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
Imports System.IO
Imports System.Resources
Imports System.ComponentModel
Imports System.Drawing
Imports System.Windows.Forms

' <doc>
' <desc>
'     This sample demonstrates how to use the Treeview control
' </desc>
' </doc>
'
Public Class TreeViewCtl
    Inherits System.Windows.Forms.Form

    Public Sub New()

        MyBase.New()

        TreeViewCtl = Me

        'This call is required by the Windows Forms Designer.
        InitializeComponent()

        FillDirectoryTree()
        imageListComboBox.SelectedIndex = 1
        indentUpDown.Value = directoryTree.Indent
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


    ' <doc>
    ' <desc>
    '     For a given root directory (or drive), add the directories to the
    '     directoryTree.
    ' </desc>
    ' </doc>
    '
    Private Sub AddDirectories(ByVal node As TreeNode)
        Try
            Dim dir As New DirectoryInfo(GetPathFromNode(node))
            Dim e As DirectoryInfo() = dir.GetDirectories()
            Dim i As Integer

            For i = 0 To e.Length - 1
                Dim name As String = e(i).Name
                If Not name.Equals(".") And Not name.Equals("..") Then
                    node.Nodes.Add(New DirectoryNode(name))
                End If
            Next i
        Catch e As Exception
            MessageBox.Show(e.Message)
        End Try
    End Sub


    ' <doc>
    ' <desc>
    '     For a given node, add the sub-directories for node's children in the
    '     directoryTree.
    ' </desc>
    ' </doc>
    '
    Private Sub AddSubDirectories(ByVal node As DirectoryNode)
        Dim i As Integer
        For i = 0 To node.Nodes.Count - 1
            AddDirectories(node.Nodes(i))
        Next i
        node.SubDirectoriesAdded = True
    End Sub


    ' <doc>
    ' <desc>
    '     Event handler for the afterSelect event on the directoryTree. Change the
    '     title bar to show the path of the selected directoryNode.
    ' </desc>
    ' </doc>
    '
    Private Sub directoryTree_AfterSelect(ByVal [source] As System.Object, ByVal e As System.Windows.Forms.TreeViewEventArgs) Handles directoryTree.AfterSelect
        [Text] = "Windows.Forms File Explorer - " + e.Node.Text
    End Sub


    ' <doc>
    ' <desc>
    '     Event handler for the beforeExpand event on the directoryTree. If the
    '     node is not already expanded, expand it.
    ' </desc>
    ' </doc>
    '
    Private Sub directoryTree_BeforeExpand(ByVal [source] As System.Object, ByVal e As System.Windows.Forms.TreeViewCancelEventArgs) Handles directoryTree.BeforeExpand
        Dim nodeExpanding As DirectoryNode = CType(e.Node, DirectoryNode)
        If Not nodeExpanding.SubDirectoriesAdded Then
            AddSubDirectories(nodeExpanding)
        End If
    End Sub

    ' <doc>
    ' <desc>
    '      For initializing the directoryTree upon creation of the TreeViewCtl form.
    ' </desc>
    ' </doc>
    '
    Private Sub FillDirectoryTree()
        Dim i As Integer
        Dim drives As String() = Environment.GetLogicalDrives()
        For i = 0 To drives.Length - 1
            If PlatformInvokeKernel32.GetDriveType(drives(i)) = PlatformInvokeKernel32.DRIVE_FIXED Then
                Dim cRoot As New DirectoryNode(drives(i))
                directoryTree.Nodes.Add(cRoot)
                AddDirectories(cRoot)
            End If
        Next i
    End Sub


    ' <doc>
    ' <desc>
    '        Returns the directory path of the node.
    ' </desc>
    ' <retvalue>
    '        Directory path of node.
    ' </retvalue>
    ' </doc>
    '
    Private Function GetPathFromNode(ByVal node As TreeNode) As String
        If node.Parent Is Nothing Then
            Return node.Text
        End If
        Return Path.Combine(GetPathFromNode(node.Parent), node.Text)
    End Function


    ' <doc>
    ' <desc>
    '        Refresh helper functions to get all expanded nodes under the given
    '        node.
    ' </desc>
    ' <param term='expandedNodes'>
    '        Reference to an array of paths containing all nodes which were in the
    '        expanded state when Refresh was requested.
    ' </param>
    ' <param term='startIndex'>
    '        Array index of ExpandedNodes to start adding entries to.
    ' </param>
    ' <retvalue>
    '        New StartIndex, i.e. given value of StartIndex + number of entries
    '        added to ExpandedNodes.
    ' </retvalue>
    ' </doc>
    '
    Private Function Refresh_GetExpanded(ByVal Node As TreeNode, ByVal ExpandedNodes() As String, ByVal StartIndex As Integer) As Integer
        If StartIndex < ExpandedNodes.Length Then
            If Node.IsExpanded Then

                ExpandedNodes(StartIndex) = Node.Text
                StartIndex += 1
                Dim i As Integer
                For i = 0 To Node.Nodes.Count - 1
                    StartIndex = Refresh_GetExpanded(Node.Nodes(i), ExpandedNodes, StartIndex)
                Next i
            End If
            Return StartIndex
        End If
        Return -1
    End Function

    ' <doc>
    ' <desc>
    '        Refresh helper function to expand all nodes whose paths are in parameter
    '        ExpandedNodes.
    ' </desc>
    ' <param term='node'>
    '        Node from which to start expanding.
    ' </param>
    ' <param term='expandedNodes'>
    '        Array of strings with the path names of all nodes to expand.
    ' </param>
    ' </doc>
    '
    Private Sub Refresh_Expand(ByVal Node As TreeNode, ByVal ExpandedNodes() As String)
        Dim i As Integer

        For i = ExpandedNodes.Length - 1 To 0 Step -1
            If ExpandedNodes(i) = Node.Text Then
                ' For the expand button to show properly, one level of
                ' invisible children have to be added to the tree.
                AddSubDirectories(CType(Node, DirectoryNode))
                Node.Expand()
                Dim j As Integer

                ' If the node is expanded, expand any children that were
                ' expanded before the refresh.
                For j = 0 To Node.Nodes.Count - 1
                    Refresh_Expand(Node.Nodes(j), ExpandedNodes)
                Next j

                Return
            End If
        Next i
    End Sub


    ' <doc>
    ' <desc>
    '     Refreshes the view by deleting all the nodes and restoring them by
    '     reading the disk(s). Any expanded nodes in the directoryView will be
    '     expanded after the refresh.
    ' </desc>
    ' <param term='node'>
    '     - Node from which the refresh begins. Generally, this is
    '     the root.
    ' </param>
    ' </doc>
    '
    Private Overloads Sub Refresh(ByVal node As TreeNode)
        If node.Nodes.Count > 0 Then
            If node.IsExpanded Then
                Dim tooBigExpandedNodes(node.GetNodeCount(True)) As String
                Dim iExpandedNodes As Integer = Refresh_GetExpanded(node, tooBigExpandedNodes, 0)
                Dim expandedNodes(iExpandedNodes) As String
                ' Update the directoryTree
                ' Save all expanded nodes rooted at node, even those that are
                ' indirectly rooted.
                Array.Copy(tooBigExpandedNodes, 0, expandedNodes, 0, iExpandedNodes)

                node.Nodes.Clear()
                AddDirectories(node)

                ' so children with subdirectories show up with expand/collapse
                ' button.
                AddSubDirectories(CType(node, DirectoryNode))
                node.Expand()
                Dim j As Integer

                ' check all children. Some might have had sub-directories added
                ' from an external application so previous childless nodes
                ' might now have children.
                For j = 0 To node.Nodes.Count - 1
                    If node.Nodes(j).Nodes.Count > 0 Then
                        ' If the child has subdirectories. If it was expanded
                        ' before the refresh, then expand after the refresh.
                        Refresh_Expand(node.Nodes(j), expandedNodes)
                    End If
                Next j
            Else
                ' If the node is not expanded, then there is no need to check
                ' if any of the children were expanded. However, we should
                ' update the tree by reading the drive in case an external
                ' application add/removed any directories.
                node.Nodes.Clear()
                AddDirectories(node)
            End If
        Else
            ' Again, if there are no children, then there is no need to
            ' worry about expanded nodes but if an external application
            ' add/removed any directories we should reflect that.
            node.Nodes.Clear()
            AddDirectories(node)
        End If
    End Sub

    Private Sub checkBox1_Click(ByVal [source] As System.Object, ByVal e As System.EventArgs) Handles checkBox1.Click
        Me.directoryTree.Sorted = checkBox1.Checked
        Dim i As Integer
        For i = 0 To directoryTree.Nodes.Count - 1
            Refresh(directoryTree.Nodes(i))
        Next i

    End Sub

    Private Sub imageListComboBox_SelectedIndexChanged(ByVal [source] As System.Object, ByVal e As System.EventArgs) Handles imageListComboBox.SelectedIndexChanged
        Dim index As Integer = imageListComboBox.SelectedIndex
        If index = 0 Then
            directoryTree.ImageList = Nothing
        Else
            If index = 1 Then
                directoryTree.ImageList = imageList1
            Else
                directoryTree.ImageList = imageList2
            End If

        End If
    End Sub

    Private Sub indentUpDown_ValueChanged(ByVal [source] As System.Object, ByVal e As System.EventArgs) Handles indentUpDown.ValueChanged
        directoryTree.Indent = CInt(indentUpDown.Value)
    End Sub

    Private Sub CheckBox2_click(ByVal [source] As System.Object, ByVal e As System.EventArgs) Handles checkBox2.Click
        Me.directoryTree.HotTracking = checkBox2.Checked
    End Sub

    Private Sub CheckBox3_click(ByVal [source] As System.Object, ByVal e As System.EventArgs) Handles checkBox3.Click
        Me.directoryTree.ShowLines = checkBox3.Checked
    End Sub

    Private Sub CheckBox4_click(ByVal [source] As System.Object, ByVal e As System.EventArgs) Handles checkBox4.Click
        Me.directoryTree.ShowRootLines = checkBox4.Checked
    End Sub

    Private Sub CheckBox5_click(ByVal [source] As System.Object, ByVal e As System.EventArgs) Handles checkBox5.Click
        Me.directoryTree.ShowPlusMinus = checkBox5.Checked
    End Sub

    Private Sub CheckBox6_click(ByVal [source] As System.Object, ByVal e As System.EventArgs) Handles checkBox6.Click
        Me.directoryTree.CheckBoxes = checkBox6.Checked
    End Sub

    Private Sub CheckBox7_click(ByVal [source] As System.Object, ByVal e As System.EventArgs) Handles checkBox7.Click
        Me.directoryTree.HideSelection = checkBox7.Checked
    End Sub
    Private components As System.ComponentModel.IContainer


#Region " Windows Form Designer generated code "

    'Required by the Windows Form Designer
    Protected WithEvents directoryTree As System.Windows.Forms.TreeView
    Protected WithEvents imageList1 As System.Windows.Forms.ImageList
    Protected WithEvents imageList2 As System.Windows.Forms.ImageList
    Protected WithEvents grpTreeView As System.Windows.Forms.GroupBox
    Protected WithEvents checkBox1 As System.Windows.Forms.CheckBox
    Protected WithEvents imageListComboBox As System.Windows.Forms.ComboBox
    Protected WithEvents label1 As System.Windows.Forms.Label
    Protected WithEvents indentUpDown As System.Windows.Forms.NumericUpDown
    Protected WithEvents label4 As System.Windows.Forms.Label
    Protected WithEvents checkBox2 As System.Windows.Forms.CheckBox
    Protected WithEvents checkBox3 As System.Windows.Forms.CheckBox
    Protected WithEvents checkBox4 As System.Windows.Forms.CheckBox
    Protected WithEvents checkBox5 As System.Windows.Forms.CheckBox
    Protected WithEvents checkBox6 As System.Windows.Forms.CheckBox
    Protected WithEvents checkBox7 As System.Windows.Forms.CheckBox
    Protected toolTip1 As System.Windows.Forms.ToolTip

    Private WithEvents TreeViewCtl As System.Windows.Forms.Form

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.
    'Do not modify it using the code editor.
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(TreeViewCtl))
        Me.checkBox7 = New System.Windows.Forms.CheckBox
        Me.directoryTree = New System.Windows.Forms.TreeView
        Me.imageList1 = New System.Windows.Forms.ImageList(Me.components)
        Me.checkBox5 = New System.Windows.Forms.CheckBox
        Me.label4 = New System.Windows.Forms.Label
        Me.indentUpDown = New System.Windows.Forms.NumericUpDown
        Me.imageList2 = New System.Windows.Forms.ImageList(Me.components)
        Me.toolTip1 = New System.Windows.Forms.ToolTip(Me.components)
        Me.checkBox6 = New System.Windows.Forms.CheckBox
        Me.checkBox1 = New System.Windows.Forms.CheckBox
        Me.checkBox3 = New System.Windows.Forms.CheckBox
        Me.checkBox4 = New System.Windows.Forms.CheckBox
        Me.checkBox2 = New System.Windows.Forms.CheckBox
        Me.imageListComboBox = New System.Windows.Forms.ComboBox
        Me.grpTreeView = New System.Windows.Forms.GroupBox
        Me.label1 = New System.Windows.Forms.Label
        CType(Me.indentUpDown, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.grpTreeView.SuspendLayout()
        Me.SuspendLayout()
        '
        'checkBox7
        '
        Me.checkBox7.AccessibleDescription = resources.GetString("checkBox7.AccessibleDescription")
        Me.checkBox7.AccessibleName = resources.GetString("checkBox7.AccessibleName")
        Me.checkBox7.Anchor = CType(resources.GetObject("checkBox7.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.checkBox7.Appearance = CType(resources.GetObject("checkBox7.Appearance"), System.Windows.Forms.Appearance)
        Me.checkBox7.BackgroundImage = CType(resources.GetObject("checkBox7.BackgroundImage"), System.Drawing.Image)
        Me.checkBox7.CheckAlign = CType(resources.GetObject("checkBox7.CheckAlign"), System.Drawing.ContentAlignment)
        Me.checkBox7.Checked = True
        Me.checkBox7.CheckState = System.Windows.Forms.CheckState.Checked
        Me.checkBox7.Dock = CType(resources.GetObject("checkBox7.Dock"), System.Windows.Forms.DockStyle)
        Me.checkBox7.Enabled = CType(resources.GetObject("checkBox7.Enabled"), Boolean)
        Me.checkBox7.FlatStyle = CType(resources.GetObject("checkBox7.FlatStyle"), System.Windows.Forms.FlatStyle)
        Me.checkBox7.Font = CType(resources.GetObject("checkBox7.Font"), System.Drawing.Font)
        Me.checkBox7.Image = CType(resources.GetObject("checkBox7.Image"), System.Drawing.Image)
        Me.checkBox7.ImageAlign = CType(resources.GetObject("checkBox7.ImageAlign"), System.Drawing.ContentAlignment)
        Me.checkBox7.ImageIndex = CType(resources.GetObject("checkBox7.ImageIndex"), Integer)
        Me.checkBox7.ImeMode = CType(resources.GetObject("checkBox7.ImeMode"), System.Windows.Forms.ImeMode)
        Me.checkBox7.Location = CType(resources.GetObject("checkBox7.Location"), System.Drawing.Point)
        Me.checkBox7.Name = "checkBox7"
        Me.checkBox7.RightToLeft = CType(resources.GetObject("checkBox7.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.checkBox7.Size = CType(resources.GetObject("checkBox7.Size"), System.Drawing.Size)
        Me.checkBox7.TabIndex = CType(resources.GetObject("checkBox7.TabIndex"), Integer)
        Me.checkBox7.Text = resources.GetString("checkBox7.Text")
        Me.checkBox7.TextAlign = CType(resources.GetObject("checkBox7.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.checkBox7, resources.GetString("checkBox7.ToolTip"))
        Me.checkBox7.Visible = CType(resources.GetObject("checkBox7.Visible"), Boolean)
        '
        'directoryTree
        '
        Me.directoryTree.AccessibleDescription = resources.GetString("directoryTree.AccessibleDescription")
        Me.directoryTree.AccessibleName = resources.GetString("directoryTree.AccessibleName")
        Me.directoryTree.AllowDrop = True
        Me.directoryTree.Anchor = CType(resources.GetObject("directoryTree.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.directoryTree.BackgroundImage = CType(resources.GetObject("directoryTree.BackgroundImage"), System.Drawing.Image)
        Me.directoryTree.Dock = CType(resources.GetObject("directoryTree.Dock"), System.Windows.Forms.DockStyle)
        Me.directoryTree.Enabled = CType(resources.GetObject("directoryTree.Enabled"), Boolean)
        Me.directoryTree.Font = CType(resources.GetObject("directoryTree.Font"), System.Drawing.Font)
        Me.directoryTree.ForeColor = System.Drawing.SystemColors.WindowText
        Me.directoryTree.ImageIndex = CType(resources.GetObject("directoryTree.ImageIndex"), Integer)
        Me.directoryTree.ImageList = Me.imageList1
        Me.directoryTree.ImeMode = CType(resources.GetObject("directoryTree.ImeMode"), System.Windows.Forms.ImeMode)
        Me.directoryTree.Indent = CType(resources.GetObject("directoryTree.Indent"), Integer)
        Me.directoryTree.ItemHeight = CType(resources.GetObject("directoryTree.ItemHeight"), Integer)
        Me.directoryTree.Location = CType(resources.GetObject("directoryTree.Location"), System.Drawing.Point)
        Me.directoryTree.Name = "directoryTree"
        Me.directoryTree.RightToLeft = CType(resources.GetObject("directoryTree.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.directoryTree.SelectedImageIndex = CType(resources.GetObject("directoryTree.SelectedImageIndex"), Integer)
        Me.directoryTree.Size = CType(resources.GetObject("directoryTree.Size"), System.Drawing.Size)
        Me.directoryTree.TabIndex = CType(resources.GetObject("directoryTree.TabIndex"), Integer)
        Me.directoryTree.Text = resources.GetString("directoryTree.Text")
        Me.toolTip1.SetToolTip(Me.directoryTree, resources.GetString("directoryTree.ToolTip"))
        Me.directoryTree.Visible = CType(resources.GetObject("directoryTree.Visible"), Boolean)
        '
        'imageList1
        '
        Me.imageList1.ColorDepth = System.Windows.Forms.ColorDepth.Depth8Bit
        Me.imageList1.ImageSize = CType(resources.GetObject("imageList1.ImageSize"), System.Drawing.Size)
        Me.imageList1.ImageStream = CType(resources.GetObject("imageList1.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.imageList1.TransparentColor = System.Drawing.Color.Transparent
        '
        'checkBox5
        '
        Me.checkBox5.AccessibleDescription = resources.GetString("checkBox5.AccessibleDescription")
        Me.checkBox5.AccessibleName = resources.GetString("checkBox5.AccessibleName")
        Me.checkBox5.Anchor = CType(resources.GetObject("checkBox5.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.checkBox5.Appearance = CType(resources.GetObject("checkBox5.Appearance"), System.Windows.Forms.Appearance)
        Me.checkBox5.BackgroundImage = CType(resources.GetObject("checkBox5.BackgroundImage"), System.Drawing.Image)
        Me.checkBox5.CheckAlign = CType(resources.GetObject("checkBox5.CheckAlign"), System.Drawing.ContentAlignment)
        Me.checkBox5.Checked = True
        Me.checkBox5.CheckState = System.Windows.Forms.CheckState.Checked
        Me.checkBox5.Dock = CType(resources.GetObject("checkBox5.Dock"), System.Windows.Forms.DockStyle)
        Me.checkBox5.Enabled = CType(resources.GetObject("checkBox5.Enabled"), Boolean)
        Me.checkBox5.FlatStyle = CType(resources.GetObject("checkBox5.FlatStyle"), System.Windows.Forms.FlatStyle)
        Me.checkBox5.Font = CType(resources.GetObject("checkBox5.Font"), System.Drawing.Font)
        Me.checkBox5.Image = CType(resources.GetObject("checkBox5.Image"), System.Drawing.Image)
        Me.checkBox5.ImageAlign = CType(resources.GetObject("checkBox5.ImageAlign"), System.Drawing.ContentAlignment)
        Me.checkBox5.ImageIndex = CType(resources.GetObject("checkBox5.ImageIndex"), Integer)
        Me.checkBox5.ImeMode = CType(resources.GetObject("checkBox5.ImeMode"), System.Windows.Forms.ImeMode)
        Me.checkBox5.Location = CType(resources.GetObject("checkBox5.Location"), System.Drawing.Point)
        Me.checkBox5.Name = "checkBox5"
        Me.checkBox5.RightToLeft = CType(resources.GetObject("checkBox5.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.checkBox5.Size = CType(resources.GetObject("checkBox5.Size"), System.Drawing.Size)
        Me.checkBox5.TabIndex = CType(resources.GetObject("checkBox5.TabIndex"), Integer)
        Me.checkBox5.Text = resources.GetString("checkBox5.Text")
        Me.checkBox5.TextAlign = CType(resources.GetObject("checkBox5.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.checkBox5, resources.GetString("checkBox5.ToolTip"))
        Me.checkBox5.Visible = CType(resources.GetObject("checkBox5.Visible"), Boolean)
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
        'indentUpDown
        '
        Me.indentUpDown.AccessibleDescription = resources.GetString("indentUpDown.AccessibleDescription")
        Me.indentUpDown.AccessibleName = resources.GetString("indentUpDown.AccessibleName")
        Me.indentUpDown.Anchor = CType(resources.GetObject("indentUpDown.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.indentUpDown.Dock = CType(resources.GetObject("indentUpDown.Dock"), System.Windows.Forms.DockStyle)
        Me.indentUpDown.Enabled = CType(resources.GetObject("indentUpDown.Enabled"), Boolean)
        Me.indentUpDown.Font = CType(resources.GetObject("indentUpDown.Font"), System.Drawing.Font)
        Me.indentUpDown.ImeMode = CType(resources.GetObject("indentUpDown.ImeMode"), System.Windows.Forms.ImeMode)
        Me.indentUpDown.Location = CType(resources.GetObject("indentUpDown.Location"), System.Drawing.Point)
        Me.indentUpDown.Maximum = New Decimal(New Integer() {150, 0, 0, 0})
        Me.indentUpDown.Minimum = New Decimal(New Integer() {18, 0, 0, 0})
        Me.indentUpDown.Name = "indentUpDown"
        Me.indentUpDown.RightToLeft = CType(resources.GetObject("indentUpDown.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.indentUpDown.Size = CType(resources.GetObject("indentUpDown.Size"), System.Drawing.Size)
        Me.indentUpDown.TabIndex = CType(resources.GetObject("indentUpDown.TabIndex"), Integer)
        Me.indentUpDown.TextAlign = CType(resources.GetObject("indentUpDown.TextAlign"), System.Windows.Forms.HorizontalAlignment)
        Me.indentUpDown.ThousandsSeparator = CType(resources.GetObject("indentUpDown.ThousandsSeparator"), Boolean)
        Me.toolTip1.SetToolTip(Me.indentUpDown, resources.GetString("indentUpDown.ToolTip"))
        Me.indentUpDown.UpDownAlign = CType(resources.GetObject("indentUpDown.UpDownAlign"), System.Windows.Forms.LeftRightAlignment)
        Me.indentUpDown.Value = New Decimal(New Integer() {18, 0, 0, 0})
        Me.indentUpDown.Visible = CType(resources.GetObject("indentUpDown.Visible"), Boolean)
        '
        'imageList2
        '
        Me.imageList2.ColorDepth = System.Windows.Forms.ColorDepth.Depth8Bit
        Me.imageList2.ImageSize = CType(resources.GetObject("imageList2.ImageSize"), System.Drawing.Size)
        Me.imageList2.ImageStream = CType(resources.GetObject("imageList2.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.imageList2.TransparentColor = System.Drawing.Color.Transparent
        '
        'checkBox6
        '
        Me.checkBox6.AccessibleDescription = resources.GetString("checkBox6.AccessibleDescription")
        Me.checkBox6.AccessibleName = resources.GetString("checkBox6.AccessibleName")
        Me.checkBox6.Anchor = CType(resources.GetObject("checkBox6.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.checkBox6.Appearance = CType(resources.GetObject("checkBox6.Appearance"), System.Windows.Forms.Appearance)
        Me.checkBox6.BackgroundImage = CType(resources.GetObject("checkBox6.BackgroundImage"), System.Drawing.Image)
        Me.checkBox6.CheckAlign = CType(resources.GetObject("checkBox6.CheckAlign"), System.Drawing.ContentAlignment)
        Me.checkBox6.Dock = CType(resources.GetObject("checkBox6.Dock"), System.Windows.Forms.DockStyle)
        Me.checkBox6.Enabled = CType(resources.GetObject("checkBox6.Enabled"), Boolean)
        Me.checkBox6.FlatStyle = CType(resources.GetObject("checkBox6.FlatStyle"), System.Windows.Forms.FlatStyle)
        Me.checkBox6.Font = CType(resources.GetObject("checkBox6.Font"), System.Drawing.Font)
        Me.checkBox6.Image = CType(resources.GetObject("checkBox6.Image"), System.Drawing.Image)
        Me.checkBox6.ImageAlign = CType(resources.GetObject("checkBox6.ImageAlign"), System.Drawing.ContentAlignment)
        Me.checkBox6.ImageIndex = CType(resources.GetObject("checkBox6.ImageIndex"), Integer)
        Me.checkBox6.ImeMode = CType(resources.GetObject("checkBox6.ImeMode"), System.Windows.Forms.ImeMode)
        Me.checkBox6.Location = CType(resources.GetObject("checkBox6.Location"), System.Drawing.Point)
        Me.checkBox6.Name = "checkBox6"
        Me.checkBox6.RightToLeft = CType(resources.GetObject("checkBox6.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.checkBox6.Size = CType(resources.GetObject("checkBox6.Size"), System.Drawing.Size)
        Me.checkBox6.TabIndex = CType(resources.GetObject("checkBox6.TabIndex"), Integer)
        Me.checkBox6.Text = resources.GetString("checkBox6.Text")
        Me.checkBox6.TextAlign = CType(resources.GetObject("checkBox6.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.checkBox6, resources.GetString("checkBox6.ToolTip"))
        Me.checkBox6.Visible = CType(resources.GetObject("checkBox6.Visible"), Boolean)
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
        'checkBox3
        '
        Me.checkBox3.AccessibleDescription = resources.GetString("checkBox3.AccessibleDescription")
        Me.checkBox3.AccessibleName = resources.GetString("checkBox3.AccessibleName")
        Me.checkBox3.Anchor = CType(resources.GetObject("checkBox3.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.checkBox3.Appearance = CType(resources.GetObject("checkBox3.Appearance"), System.Windows.Forms.Appearance)
        Me.checkBox3.BackgroundImage = CType(resources.GetObject("checkBox3.BackgroundImage"), System.Drawing.Image)
        Me.checkBox3.CheckAlign = CType(resources.GetObject("checkBox3.CheckAlign"), System.Drawing.ContentAlignment)
        Me.checkBox3.Checked = True
        Me.checkBox3.CheckState = System.Windows.Forms.CheckState.Checked
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
        'checkBox4
        '
        Me.checkBox4.AccessibleDescription = resources.GetString("checkBox4.AccessibleDescription")
        Me.checkBox4.AccessibleName = resources.GetString("checkBox4.AccessibleName")
        Me.checkBox4.Anchor = CType(resources.GetObject("checkBox4.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.checkBox4.Appearance = CType(resources.GetObject("checkBox4.Appearance"), System.Windows.Forms.Appearance)
        Me.checkBox4.BackgroundImage = CType(resources.GetObject("checkBox4.BackgroundImage"), System.Drawing.Image)
        Me.checkBox4.CheckAlign = CType(resources.GetObject("checkBox4.CheckAlign"), System.Drawing.ContentAlignment)
        Me.checkBox4.Checked = True
        Me.checkBox4.CheckState = System.Windows.Forms.CheckState.Checked
        Me.checkBox4.Dock = CType(resources.GetObject("checkBox4.Dock"), System.Windows.Forms.DockStyle)
        Me.checkBox4.Enabled = CType(resources.GetObject("checkBox4.Enabled"), Boolean)
        Me.checkBox4.FlatStyle = CType(resources.GetObject("checkBox4.FlatStyle"), System.Windows.Forms.FlatStyle)
        Me.checkBox4.Font = CType(resources.GetObject("checkBox4.Font"), System.Drawing.Font)
        Me.checkBox4.Image = CType(resources.GetObject("checkBox4.Image"), System.Drawing.Image)
        Me.checkBox4.ImageAlign = CType(resources.GetObject("checkBox4.ImageAlign"), System.Drawing.ContentAlignment)
        Me.checkBox4.ImageIndex = CType(resources.GetObject("checkBox4.ImageIndex"), Integer)
        Me.checkBox4.ImeMode = CType(resources.GetObject("checkBox4.ImeMode"), System.Windows.Forms.ImeMode)
        Me.checkBox4.Location = CType(resources.GetObject("checkBox4.Location"), System.Drawing.Point)
        Me.checkBox4.Name = "checkBox4"
        Me.checkBox4.RightToLeft = CType(resources.GetObject("checkBox4.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.checkBox4.Size = CType(resources.GetObject("checkBox4.Size"), System.Drawing.Size)
        Me.checkBox4.TabIndex = CType(resources.GetObject("checkBox4.TabIndex"), Integer)
        Me.checkBox4.Text = resources.GetString("checkBox4.Text")
        Me.checkBox4.TextAlign = CType(resources.GetObject("checkBox4.TextAlign"), System.Drawing.ContentAlignment)
        Me.toolTip1.SetToolTip(Me.checkBox4, resources.GetString("checkBox4.ToolTip"))
        Me.checkBox4.Visible = CType(resources.GetObject("checkBox4.Visible"), Boolean)
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
        'imageListComboBox
        '
        Me.imageListComboBox.AccessibleDescription = resources.GetString("imageListComboBox.AccessibleDescription")
        Me.imageListComboBox.AccessibleName = resources.GetString("imageListComboBox.AccessibleName")
        Me.imageListComboBox.Anchor = CType(resources.GetObject("imageListComboBox.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.imageListComboBox.BackgroundImage = CType(resources.GetObject("imageListComboBox.BackgroundImage"), System.Drawing.Image)
        Me.imageListComboBox.Dock = CType(resources.GetObject("imageListComboBox.Dock"), System.Windows.Forms.DockStyle)
        Me.imageListComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.imageListComboBox.Enabled = CType(resources.GetObject("imageListComboBox.Enabled"), Boolean)
        Me.imageListComboBox.Font = CType(resources.GetObject("imageListComboBox.Font"), System.Drawing.Font)
        Me.imageListComboBox.ForeColor = System.Drawing.SystemColors.WindowText
        Me.imageListComboBox.ImeMode = CType(resources.GetObject("imageListComboBox.ImeMode"), System.Windows.Forms.ImeMode)
        Me.imageListComboBox.IntegralHeight = CType(resources.GetObject("imageListComboBox.IntegralHeight"), Boolean)
        Me.imageListComboBox.ItemHeight = CType(resources.GetObject("imageListComboBox.ItemHeight"), Integer)
        Me.imageListComboBox.Items.AddRange(New Object() {resources.GetString("imageListComboBox.Items"), resources.GetString("imageListComboBox.Items1"), resources.GetString("imageListComboBox.Items2")})
        Me.imageListComboBox.Location = CType(resources.GetObject("imageListComboBox.Location"), System.Drawing.Point)
        Me.imageListComboBox.MaxDropDownItems = CType(resources.GetObject("imageListComboBox.MaxDropDownItems"), Integer)
        Me.imageListComboBox.MaxLength = CType(resources.GetObject("imageListComboBox.MaxLength"), Integer)
        Me.imageListComboBox.Name = "imageListComboBox"
        Me.imageListComboBox.RightToLeft = CType(resources.GetObject("imageListComboBox.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.imageListComboBox.Size = CType(resources.GetObject("imageListComboBox.Size"), System.Drawing.Size)
        Me.imageListComboBox.TabIndex = CType(resources.GetObject("imageListComboBox.TabIndex"), Integer)
        Me.imageListComboBox.Text = resources.GetString("imageListComboBox.Text")
        Me.toolTip1.SetToolTip(Me.imageListComboBox, resources.GetString("imageListComboBox.ToolTip"))
        Me.imageListComboBox.Visible = CType(resources.GetObject("imageListComboBox.Visible"), Boolean)
        '
        'grpTreeView
        '
        Me.grpTreeView.AccessibleDescription = resources.GetString("grpTreeView.AccessibleDescription")
        Me.grpTreeView.AccessibleName = resources.GetString("grpTreeView.AccessibleName")
        Me.grpTreeView.Anchor = CType(resources.GetObject("grpTreeView.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.grpTreeView.BackgroundImage = CType(resources.GetObject("grpTreeView.BackgroundImage"), System.Drawing.Image)
        Me.grpTreeView.Controls.AddRange(New System.Windows.Forms.Control() {Me.checkBox7, Me.checkBox6, Me.checkBox5, Me.checkBox4, Me.checkBox3, Me.checkBox2, Me.label4, Me.indentUpDown, Me.label1, Me.imageListComboBox, Me.checkBox1})
        Me.grpTreeView.Dock = CType(resources.GetObject("grpTreeView.Dock"), System.Windows.Forms.DockStyle)
        Me.grpTreeView.Enabled = CType(resources.GetObject("grpTreeView.Enabled"), Boolean)
        Me.grpTreeView.Font = CType(resources.GetObject("grpTreeView.Font"), System.Drawing.Font)
        Me.grpTreeView.ImeMode = CType(resources.GetObject("grpTreeView.ImeMode"), System.Windows.Forms.ImeMode)
        Me.grpTreeView.Location = CType(resources.GetObject("grpTreeView.Location"), System.Drawing.Point)
        Me.grpTreeView.Name = "grpTreeView"
        Me.grpTreeView.RightToLeft = CType(resources.GetObject("grpTreeView.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.grpTreeView.Size = CType(resources.GetObject("grpTreeView.Size"), System.Drawing.Size)
        Me.grpTreeView.TabIndex = CType(resources.GetObject("grpTreeView.TabIndex"), Integer)
        Me.grpTreeView.TabStop = False
        Me.grpTreeView.Text = resources.GetString("grpTreeView.Text")
        Me.toolTip1.SetToolTip(Me.grpTreeView, resources.GetString("grpTreeView.ToolTip"))
        Me.grpTreeView.Visible = CType(resources.GetObject("grpTreeView.Visible"), Boolean)
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
        'TreeViewCtl
        '
        Me.AccessibleDescription = resources.GetString("$this.AccessibleDescription")
        Me.AccessibleName = resources.GetString("$this.AccessibleName")
        Me.AutoScaleBaseSize = CType(resources.GetObject("$this.AutoScaleBaseSize"), System.Drawing.Size)
        Me.AutoScroll = CType(resources.GetObject("$this.AutoScroll"), Boolean)
        Me.AutoScrollMargin = CType(resources.GetObject("$this.AutoScrollMargin"), System.Drawing.Size)
        Me.AutoScrollMinSize = CType(resources.GetObject("$this.AutoScrollMinSize"), System.Drawing.Size)
        Me.BackgroundImage = CType(resources.GetObject("$this.BackgroundImage"), System.Drawing.Image)
        Me.ClientSize = CType(resources.GetObject("$this.ClientSize"), System.Drawing.Size)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.grpTreeView, Me.directoryTree})
        Me.Enabled = CType(resources.GetObject("$this.Enabled"), Boolean)
        Me.Font = CType(resources.GetObject("$this.Font"), System.Drawing.Font)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.ImeMode = CType(resources.GetObject("$this.ImeMode"), System.Windows.Forms.ImeMode)
        Me.Location = CType(resources.GetObject("$this.Location"), System.Drawing.Point)
        Me.MaximumSize = CType(resources.GetObject("$this.MaximumSize"), System.Drawing.Size)
        Me.MinimumSize = CType(resources.GetObject("$this.MinimumSize"), System.Drawing.Size)
        Me.Name = "TreeViewCtl"
        Me.RightToLeft = CType(resources.GetObject("$this.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.StartPosition = CType(resources.GetObject("$this.StartPosition"), System.Windows.Forms.FormStartPosition)
        Me.Text = resources.GetString("$this.Text")
        Me.toolTip1.SetToolTip(Me, resources.GetString("$this.ToolTip"))
        CType(Me.indentUpDown, System.ComponentModel.ISupportInitialize).EndInit()
        Me.grpTreeView.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region


    'The main entry point for the application.
    <STAThread()> Public Shared Sub Main()
        Application.Run(New TreeViewCtl())
    End Sub


End Class

