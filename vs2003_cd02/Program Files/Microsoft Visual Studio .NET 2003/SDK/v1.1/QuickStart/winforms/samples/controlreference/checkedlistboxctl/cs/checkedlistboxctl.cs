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


namespace Microsoft.Samples.Windows.Forms.Cs.CheckedListBoxCtl {
    using System;
    using System.ComponentModel;
    using System.Windows.Forms;
    using System.Resources;
    using System.Drawing;

    /// <summary>
    ///    This sample demonstrates the features of the CheckedListBox control.
    /// </summary>
    public class CheckedListBoxCtl : System.Windows.Forms.Form {

        /// <summary>
        ///    Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components;
        private System.Windows.Forms.ToolTip toolTip1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.CheckBox chkOnClick;
        private System.Windows.Forms.CheckBox chkIntegralHeight;
        private System.Windows.Forms.CheckBox chkMultiColumn;
        private System.Windows.Forms.Button cmdAdd;
        private System.Windows.Forms.CheckBox chkSorted;
        private System.Windows.Forms.Button cmdRemove;
        private System.Windows.Forms.Button cmdReset;
        private System.Windows.Forms.CheckBox chkThreeDCheckBoxes;
        private System.Windows.Forms.CheckedListBox checkedListBox1;

        /// <summary>
        ///    The tree that we can add to the checkedListBox1.
        /// </summary>
        private string[] trees = new string[] { "Spruce",
                                "Ash",
                                "Koa",
                                "Elm",
                                "Oak",
                                "Cherry",
                                "Ironwood",
                                "Cedar",
                                "Sequoia",
                                "Walnut",
                                "Maple",
                                "Balsa",
                                "Pine" };


        public CheckedListBoxCtl() {

            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            // Add all but the last four trees to the checkedListBox1
            for (int i = 0; i <= trees.Length - 5; i++) {
                checkedListBox1.Items.Add(trees[i]);
            }
        }

        /// <summary>
        ///    Clean up any resources being used.
        /// </summary>
        protected override void Dispose(bool disposing)
        {
           if (disposing) {
                if (components != null) {
                    components.Dispose();
                }
           }
           base.Dispose(disposing);
        }


        /// <summary>
        ///    Required method for Designer support - do not modify
        ///    the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent() {
            this.components = new System.ComponentModel.Container();
            this.chkMultiColumn = new System.Windows.Forms.CheckBox();
            this.cmdRemove = new System.Windows.Forms.Button();
            this.chkSorted = new System.Windows.Forms.CheckBox();
            this.cmdReset = new System.Windows.Forms.Button();
            this.chkThreeDCheckBoxes = new System.Windows.Forms.CheckBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.chkOnClick = new System.Windows.Forms.CheckBox();
            this.chkIntegralHeight = new System.Windows.Forms.CheckBox();
            this.cmdAdd = new System.Windows.Forms.Button();
            this.checkedListBox1 = new System.Windows.Forms.CheckedListBox();
            this.toolTip1 = new System.Windows.Forms.ToolTip(components);

            chkMultiColumn.Location = new System.Drawing.Point(16, 72);
            chkMultiColumn.TabIndex = 2;
            chkMultiColumn.CheckState = System.Windows.Forms.CheckState.Checked;
            chkMultiColumn.Text = "&MultiColumn";
            chkMultiColumn.Size = new System.Drawing.Size(104, 25);
            chkMultiColumn.Checked = true;
            chkMultiColumn.CheckedChanged += new System.EventHandler(chkMultiColumn_CheckedChanged);

            cmdRemove.Location = new System.Drawing.Point(96, 168);
            cmdRemove.TabIndex = 3;
            cmdRemove.Text = "&Remove";
            cmdRemove.Size = new System.Drawing.Size(75, 23);
            cmdRemove.Click += new System.EventHandler(cmdRemove_Click);

            chkSorted.Location = new System.Drawing.Point(16, 96);
            chkSorted.TabIndex = 3;
            chkSorted.Text = "&Sorted";
            chkSorted.Size = new System.Drawing.Size(136, 25);
            toolTip1.SetToolTip(chkSorted, "Controls whether the list is sorted.");
            chkSorted.CheckedChanged += new System.EventHandler(chkSorted_CheckedChanged);

            cmdReset.Location = new System.Drawing.Point(16, 200);
            cmdReset.TabIndex = 4;
            cmdReset.Enabled = false;
            cmdReset.Text = "R&eset";
            cmdReset.Size = new System.Drawing.Size(75, 23);
            cmdReset.Click += new System.EventHandler(cmdReset_Click);

            chkThreeDCheckBoxes.Location = new System.Drawing.Point(16, 24);
            chkThreeDCheckBoxes.TabIndex = 0;
            chkThreeDCheckBoxes.CheckState = System.Windows.Forms.CheckState.Checked;
            chkThreeDCheckBoxes.Text = "T&hreeDCheckBoxes";
            chkThreeDCheckBoxes.Size = new System.Drawing.Size(136, 25);
            chkThreeDCheckBoxes.Checked = true;
            toolTip1.SetToolTip(chkThreeDCheckBoxes, "Indicates if the check values should be shown as flat or 3D checkmarks.");
            chkThreeDCheckBoxes.CheckedChanged += new System.EventHandler(chkThreeDCheckBoxes_CheckedChanged);

            groupBox1.Location = new System.Drawing.Point(248, 16);
            groupBox1.TabIndex = 0;
            groupBox1.TabStop = false;
            groupBox1.Text = "CheckedListBox";
            groupBox1.Size = new System.Drawing.Size(248, 264);

            chkOnClick.Location = new System.Drawing.Point(16, 120);
            chkOnClick.TabIndex = 4;
            chkOnClick.CheckState = System.Windows.Forms.CheckState.Checked;
            chkOnClick.Text = "&CheckOnClick";
            chkOnClick.Size = new System.Drawing.Size(136, 25);
            chkOnClick.Checked = true;
            toolTip1.SetToolTip(chkOnClick, "Indicates whether the check box should be toggled on the first click on an item.");
            chkOnClick.CheckedChanged += new EventHandler(chkOnClick_CheckedChanged);

            chkIntegralHeight.Location = new System.Drawing.Point(16, 48);
            chkIntegralHeight.TabIndex = 1;
            chkIntegralHeight.CheckState = System.Windows.Forms.CheckState.Checked;
            chkIntegralHeight.Text = "&IntegralHeight";
            chkIntegralHeight.Size = new System.Drawing.Size(120, 25);
            chkIntegralHeight.Checked = true;
            chkIntegralHeight.CheckedChanged += new EventHandler(chkIntegralHeight_CheckedChanged);

            cmdAdd.Location = new System.Drawing.Point(16, 168);
            cmdAdd.TabIndex = 2;
            cmdAdd.Text = "&Add";
            cmdAdd.Size = new System.Drawing.Size(75, 23);
            cmdAdd.Click += new EventHandler(cmdAdd_Click);

            checkedListBox1.ThreeDCheckBoxes = true;
            checkedListBox1.IntegralHeight = false;
            checkedListBox1.TabIndex = 1;
            checkedListBox1.CheckOnClick = true;
            checkedListBox1.ColumnWidth = 100;
            checkedListBox1.MultiColumn = true;
            checkedListBox1.Size = new System.Drawing.Size(232, 84);
            checkedListBox1.Location = new System.Drawing.Point(8, 24);
            checkedListBox1.Text = "checkedListBox1";

            toolTip1.Active = true;


            this.Text = "Checked ListBox";
            this.TabIndex = 0;
            this.Size = new System.Drawing.Size(512, 320);

            this.Controls.Add(groupBox1);
            this.Controls.Add(cmdAdd);
            this.Controls.Add(cmdRemove);
            this.Controls.Add(cmdReset);
            this.Controls.Add(checkedListBox1);
            groupBox1.Controls.Add(chkOnClick);
            groupBox1.Controls.Add(chkIntegralHeight);
            groupBox1.Controls.Add(chkMultiColumn);
            groupBox1.Controls.Add(chkThreeDCheckBoxes);
            groupBox1.Controls.Add(chkSorted);

        }

        /// <summary>
        ///    Event that gets fired when the user clicks on the threeDCheckBoxes
        ///    checkbox.
        /// </summary>
        private void chkThreeDCheckBoxes_CheckedChanged(object sender, EventArgs e) {
            checkedListBox1.ThreeDCheckBoxes = chkThreeDCheckBoxes.Checked;
        }

        /// <summary>
        ///    Event that gets fired when the user clicks on the integralHeight
        ///    checkbox.
        /// </summary>
        private void chkIntegralHeight_CheckedChanged(object sender, EventArgs e) {
            checkedListBox1.IntegralHeight = chkIntegralHeight.Checked;
            checkedListBox1.Height = 94;
        }

        /// <summary>
        ///    Event that gets fired when the user clicks on the multiColumn
        ///    checkbox.
        /// </summary>
        private void chkMultiColumn_CheckedChanged(object sender, EventArgs e) {
            checkedListBox1.MultiColumn = chkMultiColumn.Checked;
        }

        /// <summary>
        ///    Event that gets fired when the user clicks on the sorted
        ///    checkbox.
        /// </summary>
        private void chkSorted_CheckedChanged(object sender, EventArgs e) {
            checkedListBox1.Sorted = chkSorted.Checked;
            cmdReset.Enabled = !chkSorted.Checked;
        }

        /// <summary>
        ///    This event gets fired when the user clicks on the onClick
        ///    CheckBox.
        /// </summary>
        private void chkOnClick_CheckedChanged(object sender, EventArgs e) {
            checkedListBox1.CheckOnClick = chkOnClick.Checked;
        }

        /// <summary>
        ///    Event that gets fired when the user clicks on the Add
        ///    button.  This handler adds a tree to the listbox if
        ///    any additional trees remain.
        /// </summary>
        private void cmdAdd_Click(object sender, EventArgs e) {
            // If we still have some trees that have not been
            // added to the checkedListBox1, run through the list
            // and add the first tree that has not been added.
            if (checkedListBox1.Items.Count < trees.Length) {
                bool stopLoop = false;
                bool found = false;
                int i = 0;
                while (stopLoop == false) {
                    found = false;
                    for (int j = 0; j < checkedListBox1.Items.Count; j++)
                        if (trees[i].Equals((string)checkedListBox1.Items[j])) {
                            found = true;
                        }
                    if (found == false)
                        stopLoop = true;
                    else
                        i++;
                }
                checkedListBox1.Items.Add(trees[i]);
            }

            // Make sure that the user can't attemp to add trees
            // that don't exist.
            if (checkedListBox1.Items.Count == trees.Length)
                cmdAdd.Enabled = false;

            if (checkedListBox1.Items.Count > 0)
                cmdRemove.Enabled = true;
        }

        /// <summary>
        ///    Event that gets fired when the user clicks on the Remove button.
        ///    This handler removes the selected tree from the list.
        /// </summary>
        private void cmdRemove_Click(object sender, EventArgs e) {
            if (checkedListBox1.SelectedIndex >= 0) {
                int index = checkedListBox1.SelectedIndex;
                checkedListBox1.Items.RemoveAt(index);

                if (index > 0)
                    checkedListBox1.SelectedIndex = index - 1;
                else if (checkedListBox1.Items.Count != 0)
                    checkedListBox1.SelectedIndex = 0;
            }

            if (checkedListBox1.Items.Count== 0)
                cmdRemove.Enabled = false;

            if (checkedListBox1.Items.Count < trees.Length)
                cmdAdd.Enabled = true;
        }

        /// <summary>
        ///    Event that gets fired when the user clicks on the Reset button.
        /// </summary>
        private void cmdReset_Click(object sender, EventArgs e ) {
            int nListItems = checkedListBox1.Items.Count;
            bool[] new_checked = new bool[trees.Length];
            string item = "";

            for (int k = 0; k < trees.Length; k++)
                new_checked[k] = false;

            int m = 0;
            for (int k = 0; k < nListItems; k++) {
                if (checkedListBox1.GetItemChecked(k)) {
                    item = (string) checkedListBox1.Items[k];
                    for (m = 0; m < trees.Length; m++)
                        if (trees[m].Equals(item))
                            new_checked[m] = true;
                }
            }

            checkedListBox1.Items.Clear();

            for (int j = 0; j < nListItems; j++) {
                checkedListBox1.Items.Add(trees[j]);
                if (new_checked[j] == true)
                    checkedListBox1.SetItemChecked(j,true);
            }

            cmdReset.Enabled = false;
        }


        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new CheckedListBoxCtl());
        }

    }

}




