//-----------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
// 
//THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//-----------------------------------------------------------------------




    using System;
    using System.IO;
    using System.Resources;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;

    // <doc>
    // <desc>
    //     This sample demonstrates how to use the Treeview control
    // </desc>
    // </doc>
    //
    public class TreeViewCtl : System.Windows.Forms.Form {

        public TreeViewCtl() {
            //
            // Required for Windows Forms Designer support
            //
            InitializeComponent();

            FillDirectoryTree();
            imageListComboBox.SelectedIndex = 1;
            indentUpDown.Value = directoryTree.Indent;
        }

        /// <summary>
        ///    Clean up any resources being used
        /// </summary>
        protected override void Dispose(bool disposing) {
            if (disposing) {
                if (components != null) {
                    components.Dispose();
                }
            }
            base.Dispose(disposing);
        }

        // <doc>
        // <desc>
        //     For a given root directory (or drive), add the directories to the
        //     directoryTree.
        // </desc>
        // </doc>
        //
        private void AddDirectories(TreeNode node) {
            try {
                DirectoryInfo dir = new DirectoryInfo(GetPathFromNode(node));
                DirectoryInfo[] e = dir.GetDirectories();

                for (int i = 0; i < e.Length; i++) {
                    string name = e[i].Name;
                    if (!name.Equals(".") && !name.Equals("..")) {
                        node.Nodes.Add(new DirectoryNode(name));
                    }
                }
            }
            catch (Exception e) {
                MessageBox.Show(e.Message);
            }
        }

        // <doc>
        // <desc>
        //     For a given node, add the sub-directories for node's children in the
        //     directoryTree.
        // </desc>
        // </doc>
        //
        private void AddSubDirectories(DirectoryNode node) {
            for (int i = 0; i < node.Nodes.Count; i++) {
                AddDirectories(node.Nodes[i]);
            }
            node.SubDirectoriesAdded = true;
        }

        // <doc>
        // <desc>
        //     Event handler for the afterSelect event on the directoryTree. Change the
        //     title bar to show the path of the selected directoryNode.
        // </desc>
        // </doc>
        //
        private void directoryTree_AfterSelect(object source, TreeViewEventArgs e) {
            Text = "Windows.Forms File Explorer - " + e.Node.Text;
        }

        // <doc>
        // <desc>
        //     Event handler for the beforeExpand event on the directoryTree. If the
        //     node is not already expanded, expand it.
        // </desc>
        // </doc>
        //
        private void directoryTree_BeforeExpand(object source, TreeViewCancelEventArgs e) {
            DirectoryNode nodeExpanding = (DirectoryNode)e.Node;
            if (!nodeExpanding.SubDirectoriesAdded)
                AddSubDirectories(nodeExpanding);
        }

        // <doc>
        // <desc>
        //      For initializing the directoryTree upon creation of the TreeViewCtl form.
        // </desc>
        // </doc>
        //
        private void FillDirectoryTree() {
            string[] drives = Environment.GetLogicalDrives();
            for (int i = 0; i < drives.Length; i++) {
                if (PlatformInvokeKernel32.GetDriveType(drives[i]) == PlatformInvokeKernel32.DRIVE_FIXED) {
                    DirectoryNode cRoot = new DirectoryNode(drives[i]);
                    directoryTree.Nodes.Add(cRoot);
                    AddDirectories(cRoot);
                }
            }
        }

        // <doc>
        // <desc>
        //        Returns the directory path of the node.
        // </desc>
        // <retvalue>
        //        Directory path of node.
        // </retvalue>
        // </doc>
        //
        private string GetPathFromNode(TreeNode node) {
            if (node.Parent == null) {
                return node.Text;
            }
            return Path.Combine(GetPathFromNode(node.Parent), node.Text);
        }

        // <doc>
        // <desc>
        //        Refresh helper functions to get all expanded nodes under the given
        //        node.
        // </desc>
        // <param term='expandedNodes'>
        //        Reference to an array of paths containing all nodes which were in the
        //        expanded state when Refresh was requested.
        // </param>
        // <param term='startIndex'>
        //        Array index of ExpandedNodes to start adding entries to.
        // </param>
        // <retvalue>
        //        New StartIndex, i.e. given value of StartIndex + number of entries
        //        added to ExpandedNodes.
        // </retvalue>
        // </doc>
        //
        private int Refresh_GetExpanded(TreeNode Node, string[] ExpandedNodes, int StartIndex) {

            if (StartIndex < ExpandedNodes.Length) {
                if (Node.IsExpanded) {
                    ExpandedNodes[StartIndex] = Node.Text;
                    StartIndex++;
                    for (int i = 0; i < Node.Nodes.Count; i++) {
                        StartIndex = Refresh_GetExpanded(Node.Nodes[i],
                                                         ExpandedNodes,
                                                         StartIndex);
                    }
                }
                return StartIndex;
            }
            return -1;
        }

        // <doc>
        // <desc>
        //        Refresh helper function to expand all nodes whose paths are in parameter
        //        ExpandedNodes.
        // </desc>
        // <param term='node'>
        //        Node from which to start expanding.
        // </param>
        // <param term='expandedNodes'>
        //        Array of strings with the path names of all nodes to expand.
        // </param>
        // </doc>
        //
        private void Refresh_Expand(TreeNode Node, string[] ExpandedNodes) {

            for (int i = ExpandedNodes.Length - 1; i >= 0; i--) {
                if (ExpandedNodes[i] == Node.Text) {
                    /*
                    * For the expand button to show properly, one level of
                    * invisible children have to be added to the tree.
                    */
                    AddSubDirectories((DirectoryNode) Node);
                    Node.Expand();

                    /* If the node is expanded, expand any children that were
                    * expanded before the refresh.
                    */
                    for (int j = 0; j < Node.Nodes.Count; j++) {
                        Refresh_Expand(Node.Nodes[j], ExpandedNodes);
                    }

                    return;
                }
            }
        }

        // <doc>
        // <desc>
        //     Refreshes the view by deleting all the nodes and restoring them by
        //     reading the disk(s). Any expanded nodes in the directoryView will be
        //     expanded after the refresh.
        // </desc>
        // <param term='node'>
        //     - Node from which the refresh begins. Generally, this is
        //     the root.
        // </param>
        // </doc>
        //
        private void Refresh(TreeNode node) {
            // Update the directoryTree
            if (node.Nodes.Count > 0) {
                if (node.IsExpanded) {
                    // Save all expanded nodes rooted at node, even those that are
                    // indirectly rooted.
                    string[] tooBigExpandedNodes = new string[node.GetNodeCount(true)];
                    int iExpandedNodes = Refresh_GetExpanded(node,
                        tooBigExpandedNodes,
                        0);
                    string[] expandedNodes = new string[iExpandedNodes];
                    Array.Copy(tooBigExpandedNodes, 0, expandedNodes, 0,
                        iExpandedNodes);

                    node.Nodes.Clear();
                    AddDirectories(node);

                    // so children with subdirectories show up with expand/collapse
                    //button.
                    AddSubDirectories((DirectoryNode)node);
                    node.Expand();

                    /*
                     * check all children. Some might have had sub-directories added
                     * from an external application so previous childless nodes
                     * might now have children.
                     */
                    for (int j = 0; j < node.Nodes.Count ; j++) {
                        if (node.Nodes[j].Nodes.Count > 0) {
                            // If the child has subdirectories. If it was expanded
                            // before the refresh, then expand after the refresh.
                            Refresh_Expand(node.Nodes[j], expandedNodes);
                        }
                    }
                } else {
                    /*
                     * If the node is not expanded, then there is no need to check
                     * if any of the children were expanded. However, we should
                     * update the tree by reading the drive in case an external
                     * application add/removed any directories.
                     */
                    node.Nodes.Clear();
                    AddDirectories(node);
                }
            } else {
                /*
                 * Again, if there are no children, then there is no need to
                 * worry about expanded nodes but if an external application
                 * add/removed any directories we should reflect that.
                 */
                node.Nodes.Clear();
                AddDirectories(node);
            }
        }

        private void checkBox1_Click(object source, EventArgs e) {
            this.directoryTree.Sorted = checkBox1.Checked;
            for (int i = 0; i < directoryTree.Nodes.Count; i++) {
                Refresh(directoryTree.Nodes[i]);
            }
        }

        private void imageListComboBox_SelectedIndexChanged(object source, EventArgs e) {
            int index = imageListComboBox.SelectedIndex;
            if (index == 0) {
                directoryTree.ImageList = null;
            } else if (index == 1) {
                directoryTree.ImageList = imageList1;
            } else {
                directoryTree.ImageList = imageList2;
            }
        }

        private void indentUpDown_ValueChanged(Object source, EventArgs e) {
            directoryTree.Indent = (int)indentUpDown.Value;
        }

        private void CheckBox2_click(object source, EventArgs e) {
            this.directoryTree.HotTracking = checkBox2.Checked;
        }

        private void CheckBox3_click(object source, EventArgs e) {
            this.directoryTree.ShowLines = checkBox3.Checked;
        }

        private void CheckBox4_click(object source, EventArgs e) {
            this.directoryTree.ShowRootLines = checkBox4.Checked;
        }

        private void CheckBox5_click(object source, EventArgs e) {
            this.directoryTree.ShowPlusMinus = checkBox5.Checked;
        }

        private void CheckBox6_click(object source, EventArgs e) {
            this.directoryTree.CheckBoxes = checkBox6.Checked;
        }

        private void CheckBox7_click(object source, EventArgs e) {
            this.directoryTree.HideSelection = checkBox7.Checked;
        }

		private System.ComponentModel.IContainer components;
        protected internal System.Windows.Forms.TreeView directoryTree;
        protected internal System.Windows.Forms.ImageList imageList1;
        protected internal System.Windows.Forms.ImageList imageList2;
        protected internal System.Windows.Forms.GroupBox grpTreeView;
        protected internal System.Windows.Forms.CheckBox checkBox1;
        protected internal System.Windows.Forms.ComboBox imageListComboBox;
        protected internal System.Windows.Forms.Label label1;
        protected internal System.Windows.Forms.NumericUpDown indentUpDown;
        protected internal System.Windows.Forms.Label label4;
        protected internal System.Windows.Forms.CheckBox checkBox2;
        protected internal System.Windows.Forms.CheckBox checkBox3;
        protected internal System.Windows.Forms.CheckBox checkBox4;
        protected internal System.Windows.Forms.CheckBox checkBox5;
        protected internal System.Windows.Forms.CheckBox checkBox6;
        protected internal System.Windows.Forms.CheckBox checkBox7;
        protected internal System.Windows.Forms.ToolTip toolTip1;

        /// <summary>
        ///    Required method for Designer support - do not modify
        ///    the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
			this.components = new System.ComponentModel.Container();
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(TreeViewCtl));
			this.checkBox7 = new System.Windows.Forms.CheckBox();
			this.directoryTree = new System.Windows.Forms.TreeView();
			this.imageList1 = new System.Windows.Forms.ImageList(this.components);
			this.checkBox5 = new System.Windows.Forms.CheckBox();
			this.label4 = new System.Windows.Forms.Label();
			this.indentUpDown = new System.Windows.Forms.NumericUpDown();
			this.imageList2 = new System.Windows.Forms.ImageList(this.components);
			this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
			this.checkBox6 = new System.Windows.Forms.CheckBox();
			this.checkBox1 = new System.Windows.Forms.CheckBox();
			this.checkBox3 = new System.Windows.Forms.CheckBox();
			this.checkBox4 = new System.Windows.Forms.CheckBox();
			this.checkBox2 = new System.Windows.Forms.CheckBox();
			this.imageListComboBox = new System.Windows.Forms.ComboBox();
			this.grpTreeView = new System.Windows.Forms.GroupBox();
			this.label1 = new System.Windows.Forms.Label();
			((System.ComponentModel.ISupportInitialize)(this.indentUpDown)).BeginInit();
			this.grpTreeView.SuspendLayout();
			this.SuspendLayout();
			// 
			// checkBox7
			// 
			this.checkBox7.AccessibleDescription = resources.GetString("checkBox7.AccessibleDescription");
			this.checkBox7.AccessibleName = resources.GetString("checkBox7.AccessibleName");
			this.checkBox7.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("checkBox7.Anchor")));
			this.checkBox7.Appearance = ((System.Windows.Forms.Appearance)(resources.GetObject("checkBox7.Appearance")));
			this.checkBox7.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("checkBox7.BackgroundImage")));
			this.checkBox7.CheckAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox7.CheckAlign")));
			this.checkBox7.Checked = true;
			this.checkBox7.CheckState = System.Windows.Forms.CheckState.Checked;
			this.checkBox7.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("checkBox7.Dock")));
			this.checkBox7.Enabled = ((bool)(resources.GetObject("checkBox7.Enabled")));
			this.checkBox7.FlatStyle = ((System.Windows.Forms.FlatStyle)(resources.GetObject("checkBox7.FlatStyle")));
			this.checkBox7.Font = ((System.Drawing.Font)(resources.GetObject("checkBox7.Font")));
			this.checkBox7.Image = ((System.Drawing.Image)(resources.GetObject("checkBox7.Image")));
			this.checkBox7.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox7.ImageAlign")));
			this.checkBox7.ImageIndex = ((int)(resources.GetObject("checkBox7.ImageIndex")));
			this.checkBox7.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("checkBox7.ImeMode")));
			this.checkBox7.Location = ((System.Drawing.Point)(resources.GetObject("checkBox7.Location")));
			this.checkBox7.Name = "checkBox7";
			this.checkBox7.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("checkBox7.RightToLeft")));
			this.checkBox7.Size = ((System.Drawing.Size)(resources.GetObject("checkBox7.Size")));
			this.checkBox7.TabIndex = ((int)(resources.GetObject("checkBox7.TabIndex")));
			this.checkBox7.Text = resources.GetString("checkBox7.Text");
			this.checkBox7.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox7.TextAlign")));
			this.toolTip1.SetToolTip(this.checkBox7, resources.GetString("checkBox7.ToolTip"));
			this.checkBox7.Visible = ((bool)(resources.GetObject("checkBox7.Visible")));
			this.checkBox7.Click += new System.EventHandler(this.CheckBox7_click);
			// 
			// directoryTree
			// 
			this.directoryTree.AccessibleDescription = resources.GetString("directoryTree.AccessibleDescription");
			this.directoryTree.AccessibleName = resources.GetString("directoryTree.AccessibleName");
			this.directoryTree.AllowDrop = true;
			this.directoryTree.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("directoryTree.Anchor")));
			this.directoryTree.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("directoryTree.BackgroundImage")));
			this.directoryTree.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("directoryTree.Dock")));
			this.directoryTree.Enabled = ((bool)(resources.GetObject("directoryTree.Enabled")));
			this.directoryTree.Font = ((System.Drawing.Font)(resources.GetObject("directoryTree.Font")));
			this.directoryTree.ForeColor = System.Drawing.SystemColors.WindowText;
			this.directoryTree.ImageIndex = ((int)(resources.GetObject("directoryTree.ImageIndex")));
			this.directoryTree.ImageList = this.imageList1;
			this.directoryTree.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("directoryTree.ImeMode")));
			this.directoryTree.Indent = ((int)(resources.GetObject("directoryTree.Indent")));
			this.directoryTree.ItemHeight = ((int)(resources.GetObject("directoryTree.ItemHeight")));
			this.directoryTree.Location = ((System.Drawing.Point)(resources.GetObject("directoryTree.Location")));
			this.directoryTree.Name = "directoryTree";
			this.directoryTree.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("directoryTree.RightToLeft")));
			this.directoryTree.SelectedImageIndex = ((int)(resources.GetObject("directoryTree.SelectedImageIndex")));
			this.directoryTree.Size = ((System.Drawing.Size)(resources.GetObject("directoryTree.Size")));
			this.directoryTree.TabIndex = ((int)(resources.GetObject("directoryTree.TabIndex")));
			this.directoryTree.Text = resources.GetString("directoryTree.Text");
			this.toolTip1.SetToolTip(this.directoryTree, resources.GetString("directoryTree.ToolTip"));
			this.directoryTree.Visible = ((bool)(resources.GetObject("directoryTree.Visible")));
			this.directoryTree.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.directoryTree_AfterSelect);
			this.directoryTree.BeforeExpand += new System.Windows.Forms.TreeViewCancelEventHandler(this.directoryTree_BeforeExpand);
			// 
			// imageList1
			// 
			this.imageList1.ImageSize = ((System.Drawing.Size)(resources.GetObject("imageList1.ImageSize")));
			this.imageList1.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imageList1.ImageStream")));
			this.imageList1.TransparentColor = System.Drawing.Color.Transparent;
			// 
			// checkBox5
			// 
			this.checkBox5.AccessibleDescription = resources.GetString("checkBox5.AccessibleDescription");
			this.checkBox5.AccessibleName = resources.GetString("checkBox5.AccessibleName");
			this.checkBox5.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("checkBox5.Anchor")));
			this.checkBox5.Appearance = ((System.Windows.Forms.Appearance)(resources.GetObject("checkBox5.Appearance")));
			this.checkBox5.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("checkBox5.BackgroundImage")));
			this.checkBox5.CheckAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox5.CheckAlign")));
			this.checkBox5.Checked = true;
			this.checkBox5.CheckState = System.Windows.Forms.CheckState.Checked;
			this.checkBox5.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("checkBox5.Dock")));
			this.checkBox5.Enabled = ((bool)(resources.GetObject("checkBox5.Enabled")));
			this.checkBox5.FlatStyle = ((System.Windows.Forms.FlatStyle)(resources.GetObject("checkBox5.FlatStyle")));
			this.checkBox5.Font = ((System.Drawing.Font)(resources.GetObject("checkBox5.Font")));
			this.checkBox5.Image = ((System.Drawing.Image)(resources.GetObject("checkBox5.Image")));
			this.checkBox5.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox5.ImageAlign")));
			this.checkBox5.ImageIndex = ((int)(resources.GetObject("checkBox5.ImageIndex")));
			this.checkBox5.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("checkBox5.ImeMode")));
			this.checkBox5.Location = ((System.Drawing.Point)(resources.GetObject("checkBox5.Location")));
			this.checkBox5.Name = "checkBox5";
			this.checkBox5.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("checkBox5.RightToLeft")));
			this.checkBox5.Size = ((System.Drawing.Size)(resources.GetObject("checkBox5.Size")));
			this.checkBox5.TabIndex = ((int)(resources.GetObject("checkBox5.TabIndex")));
			this.checkBox5.Text = resources.GetString("checkBox5.Text");
			this.checkBox5.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox5.TextAlign")));
			this.toolTip1.SetToolTip(this.checkBox5, resources.GetString("checkBox5.ToolTip"));
			this.checkBox5.Visible = ((bool)(resources.GetObject("checkBox5.Visible")));
			this.checkBox5.Click += new System.EventHandler(this.CheckBox5_click);
			// 
			// label4
			// 
			this.label4.AccessibleDescription = resources.GetString("label4.AccessibleDescription");
			this.label4.AccessibleName = resources.GetString("label4.AccessibleName");
			this.label4.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("label4.Anchor")));
			this.label4.AutoSize = ((bool)(resources.GetObject("label4.AutoSize")));
			this.label4.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("label4.Dock")));
			this.label4.Enabled = ((bool)(resources.GetObject("label4.Enabled")));
			this.label4.Font = ((System.Drawing.Font)(resources.GetObject("label4.Font")));
			this.label4.Image = ((System.Drawing.Image)(resources.GetObject("label4.Image")));
			this.label4.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("label4.ImageAlign")));
			this.label4.ImageIndex = ((int)(resources.GetObject("label4.ImageIndex")));
			this.label4.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("label4.ImeMode")));
			this.label4.Location = ((System.Drawing.Point)(resources.GetObject("label4.Location")));
			this.label4.Name = "label4";
			this.label4.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("label4.RightToLeft")));
			this.label4.Size = ((System.Drawing.Size)(resources.GetObject("label4.Size")));
			this.label4.TabIndex = ((int)(resources.GetObject("label4.TabIndex")));
			this.label4.Text = resources.GetString("label4.Text");
			this.label4.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("label4.TextAlign")));
			this.toolTip1.SetToolTip(this.label4, resources.GetString("label4.ToolTip"));
			this.label4.Visible = ((bool)(resources.GetObject("label4.Visible")));
			// 
			// indentUpDown
			// 
			this.indentUpDown.AccessibleDescription = resources.GetString("indentUpDown.AccessibleDescription");
			this.indentUpDown.AccessibleName = resources.GetString("indentUpDown.AccessibleName");
			this.indentUpDown.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("indentUpDown.Anchor")));
			this.indentUpDown.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("indentUpDown.Dock")));
			this.indentUpDown.Enabled = ((bool)(resources.GetObject("indentUpDown.Enabled")));
			this.indentUpDown.Font = ((System.Drawing.Font)(resources.GetObject("indentUpDown.Font")));
			this.indentUpDown.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("indentUpDown.ImeMode")));
			this.indentUpDown.Location = ((System.Drawing.Point)(resources.GetObject("indentUpDown.Location")));
			this.indentUpDown.Maximum = new System.Decimal(new int[] {
																		 150,
																		 0,
																		 0,
																		 0});
			this.indentUpDown.Minimum = new System.Decimal(new int[] {
																		 18,
																		 0,
																		 0,
																		 0});
			this.indentUpDown.Name = "indentUpDown";
			this.indentUpDown.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("indentUpDown.RightToLeft")));
			this.indentUpDown.Size = ((System.Drawing.Size)(resources.GetObject("indentUpDown.Size")));
			this.indentUpDown.TabIndex = ((int)(resources.GetObject("indentUpDown.TabIndex")));
			this.indentUpDown.TextAlign = ((System.Windows.Forms.HorizontalAlignment)(resources.GetObject("indentUpDown.TextAlign")));
			this.indentUpDown.ThousandsSeparator = ((bool)(resources.GetObject("indentUpDown.ThousandsSeparator")));
			this.toolTip1.SetToolTip(this.indentUpDown, resources.GetString("indentUpDown.ToolTip"));
			this.indentUpDown.UpDownAlign = ((System.Windows.Forms.LeftRightAlignment)(resources.GetObject("indentUpDown.UpDownAlign")));
			this.indentUpDown.Value = new System.Decimal(new int[] {
																	   18,
																	   0,
																	   0,
																	   0});
			this.indentUpDown.Visible = ((bool)(resources.GetObject("indentUpDown.Visible")));
			this.indentUpDown.ValueChanged += new System.EventHandler(this.indentUpDown_ValueChanged);
			// 
			// imageList2
			// 
			this.imageList2.ImageSize = ((System.Drawing.Size)(resources.GetObject("imageList2.ImageSize")));
			this.imageList2.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imageList2.ImageStream")));
			this.imageList2.TransparentColor = System.Drawing.Color.Transparent;
			// 
			// checkBox6
			// 
			this.checkBox6.AccessibleDescription = resources.GetString("checkBox6.AccessibleDescription");
			this.checkBox6.AccessibleName = resources.GetString("checkBox6.AccessibleName");
			this.checkBox6.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("checkBox6.Anchor")));
			this.checkBox6.Appearance = ((System.Windows.Forms.Appearance)(resources.GetObject("checkBox6.Appearance")));
			this.checkBox6.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("checkBox6.BackgroundImage")));
			this.checkBox6.CheckAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox6.CheckAlign")));
			this.checkBox6.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("checkBox6.Dock")));
			this.checkBox6.Enabled = ((bool)(resources.GetObject("checkBox6.Enabled")));
			this.checkBox6.FlatStyle = ((System.Windows.Forms.FlatStyle)(resources.GetObject("checkBox6.FlatStyle")));
			this.checkBox6.Font = ((System.Drawing.Font)(resources.GetObject("checkBox6.Font")));
			this.checkBox6.Image = ((System.Drawing.Image)(resources.GetObject("checkBox6.Image")));
			this.checkBox6.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox6.ImageAlign")));
			this.checkBox6.ImageIndex = ((int)(resources.GetObject("checkBox6.ImageIndex")));
			this.checkBox6.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("checkBox6.ImeMode")));
			this.checkBox6.Location = ((System.Drawing.Point)(resources.GetObject("checkBox6.Location")));
			this.checkBox6.Name = "checkBox6";
			this.checkBox6.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("checkBox6.RightToLeft")));
			this.checkBox6.Size = ((System.Drawing.Size)(resources.GetObject("checkBox6.Size")));
			this.checkBox6.TabIndex = ((int)(resources.GetObject("checkBox6.TabIndex")));
			this.checkBox6.Text = resources.GetString("checkBox6.Text");
			this.checkBox6.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox6.TextAlign")));
			this.toolTip1.SetToolTip(this.checkBox6, resources.GetString("checkBox6.ToolTip"));
			this.checkBox6.Visible = ((bool)(resources.GetObject("checkBox6.Visible")));
			this.checkBox6.Click += new System.EventHandler(this.CheckBox6_click);
			// 
			// checkBox1
			// 
			this.checkBox1.AccessibleDescription = resources.GetString("checkBox1.AccessibleDescription");
			this.checkBox1.AccessibleName = resources.GetString("checkBox1.AccessibleName");
			this.checkBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("checkBox1.Anchor")));
			this.checkBox1.Appearance = ((System.Windows.Forms.Appearance)(resources.GetObject("checkBox1.Appearance")));
			this.checkBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("checkBox1.BackgroundImage")));
			this.checkBox1.CheckAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox1.CheckAlign")));
			this.checkBox1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("checkBox1.Dock")));
			this.checkBox1.Enabled = ((bool)(resources.GetObject("checkBox1.Enabled")));
			this.checkBox1.FlatStyle = ((System.Windows.Forms.FlatStyle)(resources.GetObject("checkBox1.FlatStyle")));
			this.checkBox1.Font = ((System.Drawing.Font)(resources.GetObject("checkBox1.Font")));
			this.checkBox1.Image = ((System.Drawing.Image)(resources.GetObject("checkBox1.Image")));
			this.checkBox1.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox1.ImageAlign")));
			this.checkBox1.ImageIndex = ((int)(resources.GetObject("checkBox1.ImageIndex")));
			this.checkBox1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("checkBox1.ImeMode")));
			this.checkBox1.Location = ((System.Drawing.Point)(resources.GetObject("checkBox1.Location")));
			this.checkBox1.Name = "checkBox1";
			this.checkBox1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("checkBox1.RightToLeft")));
			this.checkBox1.Size = ((System.Drawing.Size)(resources.GetObject("checkBox1.Size")));
			this.checkBox1.TabIndex = ((int)(resources.GetObject("checkBox1.TabIndex")));
			this.checkBox1.Text = resources.GetString("checkBox1.Text");
			this.checkBox1.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox1.TextAlign")));
			this.toolTip1.SetToolTip(this.checkBox1, resources.GetString("checkBox1.ToolTip"));
			this.checkBox1.Visible = ((bool)(resources.GetObject("checkBox1.Visible")));
			this.checkBox1.Click += new System.EventHandler(this.checkBox1_Click);
			// 
			// checkBox3
			// 
			this.checkBox3.AccessibleDescription = resources.GetString("checkBox3.AccessibleDescription");
			this.checkBox3.AccessibleName = resources.GetString("checkBox3.AccessibleName");
			this.checkBox3.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("checkBox3.Anchor")));
			this.checkBox3.Appearance = ((System.Windows.Forms.Appearance)(resources.GetObject("checkBox3.Appearance")));
			this.checkBox3.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("checkBox3.BackgroundImage")));
			this.checkBox3.CheckAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox3.CheckAlign")));
			this.checkBox3.Checked = true;
			this.checkBox3.CheckState = System.Windows.Forms.CheckState.Checked;
			this.checkBox3.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("checkBox3.Dock")));
			this.checkBox3.Enabled = ((bool)(resources.GetObject("checkBox3.Enabled")));
			this.checkBox3.FlatStyle = ((System.Windows.Forms.FlatStyle)(resources.GetObject("checkBox3.FlatStyle")));
			this.checkBox3.Font = ((System.Drawing.Font)(resources.GetObject("checkBox3.Font")));
			this.checkBox3.Image = ((System.Drawing.Image)(resources.GetObject("checkBox3.Image")));
			this.checkBox3.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox3.ImageAlign")));
			this.checkBox3.ImageIndex = ((int)(resources.GetObject("checkBox3.ImageIndex")));
			this.checkBox3.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("checkBox3.ImeMode")));
			this.checkBox3.Location = ((System.Drawing.Point)(resources.GetObject("checkBox3.Location")));
			this.checkBox3.Name = "checkBox3";
			this.checkBox3.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("checkBox3.RightToLeft")));
			this.checkBox3.Size = ((System.Drawing.Size)(resources.GetObject("checkBox3.Size")));
			this.checkBox3.TabIndex = ((int)(resources.GetObject("checkBox3.TabIndex")));
			this.checkBox3.Text = resources.GetString("checkBox3.Text");
			this.checkBox3.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox3.TextAlign")));
			this.toolTip1.SetToolTip(this.checkBox3, resources.GetString("checkBox3.ToolTip"));
			this.checkBox3.Visible = ((bool)(resources.GetObject("checkBox3.Visible")));
			this.checkBox3.Click += new System.EventHandler(this.CheckBox3_click);
			// 
			// checkBox4
			// 
			this.checkBox4.AccessibleDescription = resources.GetString("checkBox4.AccessibleDescription");
			this.checkBox4.AccessibleName = resources.GetString("checkBox4.AccessibleName");
			this.checkBox4.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("checkBox4.Anchor")));
			this.checkBox4.Appearance = ((System.Windows.Forms.Appearance)(resources.GetObject("checkBox4.Appearance")));
			this.checkBox4.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("checkBox4.BackgroundImage")));
			this.checkBox4.CheckAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox4.CheckAlign")));
			this.checkBox4.Checked = true;
			this.checkBox4.CheckState = System.Windows.Forms.CheckState.Checked;
			this.checkBox4.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("checkBox4.Dock")));
			this.checkBox4.Enabled = ((bool)(resources.GetObject("checkBox4.Enabled")));
			this.checkBox4.FlatStyle = ((System.Windows.Forms.FlatStyle)(resources.GetObject("checkBox4.FlatStyle")));
			this.checkBox4.Font = ((System.Drawing.Font)(resources.GetObject("checkBox4.Font")));
			this.checkBox4.Image = ((System.Drawing.Image)(resources.GetObject("checkBox4.Image")));
			this.checkBox4.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox4.ImageAlign")));
			this.checkBox4.ImageIndex = ((int)(resources.GetObject("checkBox4.ImageIndex")));
			this.checkBox4.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("checkBox4.ImeMode")));
			this.checkBox4.Location = ((System.Drawing.Point)(resources.GetObject("checkBox4.Location")));
			this.checkBox4.Name = "checkBox4";
			this.checkBox4.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("checkBox4.RightToLeft")));
			this.checkBox4.Size = ((System.Drawing.Size)(resources.GetObject("checkBox4.Size")));
			this.checkBox4.TabIndex = ((int)(resources.GetObject("checkBox4.TabIndex")));
			this.checkBox4.Text = resources.GetString("checkBox4.Text");
			this.checkBox4.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox4.TextAlign")));
			this.toolTip1.SetToolTip(this.checkBox4, resources.GetString("checkBox4.ToolTip"));
			this.checkBox4.Visible = ((bool)(resources.GetObject("checkBox4.Visible")));
			this.checkBox4.Click += new System.EventHandler(this.CheckBox4_click);
			// 
			// checkBox2
			// 
			this.checkBox2.AccessibleDescription = resources.GetString("checkBox2.AccessibleDescription");
			this.checkBox2.AccessibleName = resources.GetString("checkBox2.AccessibleName");
			this.checkBox2.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("checkBox2.Anchor")));
			this.checkBox2.Appearance = ((System.Windows.Forms.Appearance)(resources.GetObject("checkBox2.Appearance")));
			this.checkBox2.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("checkBox2.BackgroundImage")));
			this.checkBox2.CheckAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox2.CheckAlign")));
			this.checkBox2.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("checkBox2.Dock")));
			this.checkBox2.Enabled = ((bool)(resources.GetObject("checkBox2.Enabled")));
			this.checkBox2.FlatStyle = ((System.Windows.Forms.FlatStyle)(resources.GetObject("checkBox2.FlatStyle")));
			this.checkBox2.Font = ((System.Drawing.Font)(resources.GetObject("checkBox2.Font")));
			this.checkBox2.Image = ((System.Drawing.Image)(resources.GetObject("checkBox2.Image")));
			this.checkBox2.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox2.ImageAlign")));
			this.checkBox2.ImageIndex = ((int)(resources.GetObject("checkBox2.ImageIndex")));
			this.checkBox2.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("checkBox2.ImeMode")));
			this.checkBox2.Location = ((System.Drawing.Point)(resources.GetObject("checkBox2.Location")));
			this.checkBox2.Name = "checkBox2";
			this.checkBox2.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("checkBox2.RightToLeft")));
			this.checkBox2.Size = ((System.Drawing.Size)(resources.GetObject("checkBox2.Size")));
			this.checkBox2.TabIndex = ((int)(resources.GetObject("checkBox2.TabIndex")));
			this.checkBox2.Text = resources.GetString("checkBox2.Text");
			this.checkBox2.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox2.TextAlign")));
			this.toolTip1.SetToolTip(this.checkBox2, resources.GetString("checkBox2.ToolTip"));
			this.checkBox2.Visible = ((bool)(resources.GetObject("checkBox2.Visible")));
			this.checkBox2.Click += new System.EventHandler(this.CheckBox2_click);
			// 
			// imageListComboBox
			// 
			this.imageListComboBox.AccessibleDescription = resources.GetString("imageListComboBox.AccessibleDescription");
			this.imageListComboBox.AccessibleName = resources.GetString("imageListComboBox.AccessibleName");
			this.imageListComboBox.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("imageListComboBox.Anchor")));
			this.imageListComboBox.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("imageListComboBox.BackgroundImage")));
			this.imageListComboBox.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("imageListComboBox.Dock")));
			this.imageListComboBox.Enabled = ((bool)(resources.GetObject("imageListComboBox.Enabled")));
			this.imageListComboBox.Font = ((System.Drawing.Font)(resources.GetObject("imageListComboBox.Font")));
			this.imageListComboBox.ForeColor = System.Drawing.SystemColors.WindowText;
			this.imageListComboBox.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("imageListComboBox.ImeMode")));
			this.imageListComboBox.IntegralHeight = ((bool)(resources.GetObject("imageListComboBox.IntegralHeight")));
			this.imageListComboBox.ItemHeight = ((int)(resources.GetObject("imageListComboBox.ItemHeight")));
			this.imageListComboBox.Items.AddRange(new object[] {
																   resources.GetString("imageListComboBox.Items"),
																   resources.GetString("imageListComboBox.Items1"),
																   resources.GetString("imageListComboBox.Items2")});
			this.imageListComboBox.Location = ((System.Drawing.Point)(resources.GetObject("imageListComboBox.Location")));
			this.imageListComboBox.MaxDropDownItems = ((int)(resources.GetObject("imageListComboBox.MaxDropDownItems")));
			this.imageListComboBox.MaxLength = ((int)(resources.GetObject("imageListComboBox.MaxLength")));
			this.imageListComboBox.Name = "imageListComboBox";
			this.imageListComboBox.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("imageListComboBox.RightToLeft")));
			this.imageListComboBox.Size = ((System.Drawing.Size)(resources.GetObject("imageListComboBox.Size")));
			this.imageListComboBox.TabIndex = ((int)(resources.GetObject("imageListComboBox.TabIndex")));
			this.imageListComboBox.Text = resources.GetString("imageListComboBox.Text");
			this.toolTip1.SetToolTip(this.imageListComboBox, resources.GetString("imageListComboBox.ToolTip"));
			this.imageListComboBox.Visible = ((bool)(resources.GetObject("imageListComboBox.Visible")));
			this.imageListComboBox.SelectedIndexChanged += new System.EventHandler(this.imageListComboBox_SelectedIndexChanged);
			// 
			// grpTreeView
			// 
			this.grpTreeView.AccessibleDescription = resources.GetString("grpTreeView.AccessibleDescription");
			this.grpTreeView.AccessibleName = resources.GetString("grpTreeView.AccessibleName");
			this.grpTreeView.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("grpTreeView.Anchor")));
			this.grpTreeView.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("grpTreeView.BackgroundImage")));
			this.grpTreeView.Controls.AddRange(new System.Windows.Forms.Control[] {
																					  this.checkBox7,
																					  this.checkBox6,
																					  this.checkBox5,
																					  this.checkBox4,
																					  this.checkBox3,
																					  this.checkBox2,
																					  this.label4,
																					  this.indentUpDown,
																					  this.label1,
																					  this.imageListComboBox,
																					  this.checkBox1});
			this.grpTreeView.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("grpTreeView.Dock")));
			this.grpTreeView.Enabled = ((bool)(resources.GetObject("grpTreeView.Enabled")));
			this.grpTreeView.Font = ((System.Drawing.Font)(resources.GetObject("grpTreeView.Font")));
			this.grpTreeView.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("grpTreeView.ImeMode")));
			this.grpTreeView.Location = ((System.Drawing.Point)(resources.GetObject("grpTreeView.Location")));
			this.grpTreeView.Name = "grpTreeView";
			this.grpTreeView.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("grpTreeView.RightToLeft")));
			this.grpTreeView.Size = ((System.Drawing.Size)(resources.GetObject("grpTreeView.Size")));
			this.grpTreeView.TabIndex = ((int)(resources.GetObject("grpTreeView.TabIndex")));
			this.grpTreeView.TabStop = false;
			this.grpTreeView.Text = resources.GetString("grpTreeView.Text");
			this.toolTip1.SetToolTip(this.grpTreeView, resources.GetString("grpTreeView.ToolTip"));
			this.grpTreeView.Visible = ((bool)(resources.GetObject("grpTreeView.Visible")));
			// 
			// label1
			// 
			this.label1.AccessibleDescription = resources.GetString("label1.AccessibleDescription");
			this.label1.AccessibleName = resources.GetString("label1.AccessibleName");
			this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("label1.Anchor")));
			this.label1.AutoSize = ((bool)(resources.GetObject("label1.AutoSize")));
			this.label1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("label1.Dock")));
			this.label1.Enabled = ((bool)(resources.GetObject("label1.Enabled")));
			this.label1.Font = ((System.Drawing.Font)(resources.GetObject("label1.Font")));
			this.label1.Image = ((System.Drawing.Image)(resources.GetObject("label1.Image")));
			this.label1.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("label1.ImageAlign")));
			this.label1.ImageIndex = ((int)(resources.GetObject("label1.ImageIndex")));
			this.label1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("label1.ImeMode")));
			this.label1.Location = ((System.Drawing.Point)(resources.GetObject("label1.Location")));
			this.label1.Name = "label1";
			this.label1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("label1.RightToLeft")));
			this.label1.Size = ((System.Drawing.Size)(resources.GetObject("label1.Size")));
			this.label1.TabIndex = ((int)(resources.GetObject("label1.TabIndex")));
			this.label1.Text = resources.GetString("label1.Text");
			this.label1.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("label1.TextAlign")));
			this.toolTip1.SetToolTip(this.label1, resources.GetString("label1.ToolTip"));
			this.label1.Visible = ((bool)(resources.GetObject("label1.Visible")));
			// 
			// TreeViewCtl
			// 
			this.AccessibleDescription = resources.GetString("$this.AccessibleDescription");
			this.AccessibleName = resources.GetString("$this.AccessibleName");
			this.AutoScaleBaseSize = ((System.Drawing.Size)(resources.GetObject("$this.AutoScaleBaseSize")));
			this.AutoScroll = ((bool)(resources.GetObject("$this.AutoScroll")));
			this.AutoScrollMargin = ((System.Drawing.Size)(resources.GetObject("$this.AutoScrollMargin")));
			this.AutoScrollMinSize = ((System.Drawing.Size)(resources.GetObject("$this.AutoScrollMinSize")));
			this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
			this.ClientSize = ((System.Drawing.Size)(resources.GetObject("$this.ClientSize")));
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.grpTreeView,
																		  this.directoryTree});
			this.Enabled = ((bool)(resources.GetObject("$this.Enabled")));
			this.Font = ((System.Drawing.Font)(resources.GetObject("$this.Font")));
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("$this.ImeMode")));
			this.Location = ((System.Drawing.Point)(resources.GetObject("$this.Location")));
			this.MaximumSize = ((System.Drawing.Size)(resources.GetObject("$this.MaximumSize")));
			this.MinimumSize = ((System.Drawing.Size)(resources.GetObject("$this.MinimumSize")));
			this.Name = "TreeViewCtl";
			this.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("$this.RightToLeft")));
			this.StartPosition = ((System.Windows.Forms.FormStartPosition)(resources.GetObject("$this.StartPosition")));
			this.Text = resources.GetString("$this.Text");
			this.toolTip1.SetToolTip(this, resources.GetString("$this.ToolTip"));
			((System.ComponentModel.ISupportInitialize)(this.indentUpDown)).EndInit();
			this.grpTreeView.ResumeLayout(false);
			this.ResumeLayout(false);

		}

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new TreeViewCtl());
        }

    }



