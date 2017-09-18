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


namespace Microsoft.Samples.Windows.Forms.Cs.ComboBoxCtl {
    using System;
    using System.Drawing;
    using System.Collections;
    using System.ComponentModel;
    using System.ComponentModel.Design;
    using System.Windows.Forms;
    using System.Drawing.Drawing2D;

    /// <summary>
    ///    This sample demonstrates the features of the ComboBox control.
    /// </summary>

    public class ComboBoxCtl : System.Windows.Forms.Form {

        /// <summary>
        ///    Required designer variables.
        /// </summary>
        private System.ComponentModel.Container components;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.ComboBox comboBegin;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.ComboBox comboEnd;
        private System.Windows.Forms.CheckBox chkEnabled;
        private System.Windows.Forms.CheckBox chkSorted;
        private System.Windows.Forms.CheckBox chkIntegralHeight;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cmbStyle;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox cmbDrawMode;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cmbItemHeight;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cmbMaxDropDownItems;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.ToolTip toolTip1;

        private Size      cmbsize ;
        private Hashtable brushMap = new Hashtable();

        private Color     gradientBegin = Color.Red;
        private Color     gradientEnd = Color.Blue;

        /// <summary>
        ///     We speed up ownerdraw operations on the Color ComboBoxes
        ///     by caching the Brush objects which represent the Color
        ///     to choose.
        /// </summary>

        public ComboBoxCtl () {

            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            InitControlState();
            FillItems(comboBegin);
            FillItems(comboEnd);

            comboBegin.SelectedIndex = 0;
            comboEnd.SelectedIndex = comboEnd.Items.Count-1;
            cmbsize = comboBegin.Size;
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
            this.cmbDrawMode = new System.Windows.Forms.ComboBox();
            this.chkEnabled = new System.Windows.Forms.CheckBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.cmbMaxDropDownItems = new System.Windows.Forms.ComboBox();
            this.toolTip1 = new System.Windows.Forms.ToolTip(components);
            this.chkSorted = new System.Windows.Forms.CheckBox();
            this.chkIntegralHeight = new System.Windows.Forms.CheckBox();
            this.comboEnd = new System.Windows.Forms.ComboBox();
            this.cmbItemHeight = new System.Windows.Forms.ComboBox();
            this.cmbStyle = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.comboBegin = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();

            this.Text = "ComboBox";
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(504, 293);

            cmbDrawMode.Location = new System.Drawing.Point(128, 120);
            cmbDrawMode.Size = new System.Drawing.Size(104, 21);
            cmbDrawMode.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            toolTip1.SetToolTip(cmbDrawMode, "Controls ComboBox painting");
            cmbDrawMode.TabIndex = 5;
            cmbDrawMode.SelectedIndexChanged += new System.EventHandler(cmbDrawMode_SelectedIndexChanged);

            chkEnabled.Location = new System.Drawing.Point(16, 24);
            chkEnabled.Text = "Enabled";
            chkEnabled.Size = new System.Drawing.Size(88, 16);
            toolTip1.SetToolTip(chkEnabled, "Sets a Boolean value determining whether the ComboBox is clickable");
            chkEnabled.TabIndex = 0;
            chkEnabled.CheckedChanged += new System.EventHandler(chkEnabled_CheckedChanged);

            groupBox1.Location = new System.Drawing.Point(248, 16);
            groupBox1.TabIndex = 2;
            groupBox1.TabStop = false;
            groupBox1.Text = "ComboBox";
            groupBox1.Size = new System.Drawing.Size(248, 264);

            cmbMaxDropDownItems.Location = new System.Drawing.Point(128, 168);
            cmbMaxDropDownItems.Size = new System.Drawing.Size(104, 21);
            cmbMaxDropDownItems.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            toolTip1.SetToolTip(cmbMaxDropDownItems, "The number of items to display on dropdown");
            cmbMaxDropDownItems.TabIndex = 7;
            cmbMaxDropDownItems.SelectedIndexChanged += new System.EventHandler(cmbMaxDropDownItems_SelectedIndexChanged);
            cmbMaxDropDownItems.Items.AddRange(new object[] {"2",
                "4",
                "6",
                "8",
                "10"});

            toolTip1.Active = true;

            chkSorted.Location = new System.Drawing.Point(16, 48);
            chkSorted.Text = "Sorted";
            chkSorted.Size = new System.Drawing.Size(88, 16);
            toolTip1.SetToolTip(chkSorted, "Sets whether the items in the ComboBoxes\nshould be sorted alphabetically");
            chkSorted.TabIndex = 1;
            chkSorted.CheckedChanged += new System.EventHandler(chkSorted_CheckedChanged);

            chkIntegralHeight.Location = new System.Drawing.Point(16, 72);
            chkIntegralHeight.Text = "IntegralHeight";
            chkIntegralHeight.Size = new System.Drawing.Size(104, 16);
            toolTip1.SetToolTip(chkIntegralHeight, "Sets a boolean value indicating\nwhether the combo box should resize\nto avoid showing partial items");
            chkIntegralHeight.TabIndex = 2;
            chkIntegralHeight.CheckedChanged += new System.EventHandler(chkIntegralHeight_CheckedChanged);

            comboEnd.Text = "comboBegin1";
            comboEnd.Location = new System.Drawing.Point(24, 120);
            comboEnd.Size = new System.Drawing.Size(208, 21);
            toolTip1.SetToolTip(comboEnd, "Choose the color for the right end of gradient");
            comboEnd.TabIndex = 1;
            comboEnd.Sorted = true;
            comboEnd.MeasureItem += new System.Windows.Forms.MeasureItemEventHandler(combo_MeasureItem);
            comboEnd.DrawItem += new System.Windows.Forms.DrawItemEventHandler(combo_DrawItem);
            comboEnd.SelectedIndexChanged += new System.EventHandler(comboEnd_SelectedIndexChanged);

            cmbItemHeight.Location = new System.Drawing.Point(128, 144);
            cmbItemHeight.Size = new System.Drawing.Size(104, 21);
            cmbItemHeight.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            toolTip1.SetToolTip(cmbItemHeight, "The height, in pixels, of an item in the combo box");
            cmbItemHeight.TabIndex = 6;
            cmbItemHeight.SelectedIndexChanged += new System.EventHandler(cmbItemHeight_SelectedIndexChanged);
            cmbItemHeight.Items.AddRange(new object[] {"12",
                "14",
                "16",
                "18",
                "24",
                "26"});

            cmbStyle.Location = new System.Drawing.Point(128, 96);
            cmbStyle.Size = new System.Drawing.Size(104, 21);
            cmbStyle.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            toolTip1.SetToolTip(cmbStyle, "Controls the appearance and functionality of the ComboBox");
            cmbStyle.TabIndex = 4;
            cmbStyle.SelectedIndexChanged += new System.EventHandler(cmbStyle_SelectedIndexChanged);

            label6.Location = new System.Drawing.Point(24, 16);
            label6.Text = "Left:";
            label6.Size = new System.Drawing.Size(96, 16);
            label6.TabIndex = 5;

            comboBegin.Text = "comboBegin1";
            comboBegin.Location = new System.Drawing.Point(24, 32);
            comboBegin.Size = new System.Drawing.Size(208, 21);
            toolTip1.SetToolTip(comboBegin, "Choose color for left end of gradient");
            comboBegin.TabIndex = 0;
            comboBegin.Sorted = true;
            comboBegin.MeasureItem += new System.Windows.Forms.MeasureItemEventHandler(combo_MeasureItem);
            comboBegin.DrawItem += new System.Windows.Forms.DrawItemEventHandler(combo_DrawItem);
            comboBegin.SelectedIndexChanged += new System.EventHandler(comboBegin_SelectedIndexChanged);

            label5.Location = new System.Drawing.Point(16, 208);
            label5.Text = "Left";
            label5.Size = new System.Drawing.Size(64, 16);
            label5.TabIndex = 12;

            label9.Location = new System.Drawing.Point(200, 208);
            label9.Text = "Right";
            label9.Size = new System.Drawing.Size(32, 16);
            label9.TabIndex = 14;

            label4.Location = new System.Drawing.Point(16, 176);
            label4.Text = "MaxDropdownItems";
            label4.Size = new System.Drawing.Size(104, 16);
            label4.TabIndex = 11;

            label3.Location = new System.Drawing.Point(16, 152);
            label3.Text = "ItemHeight";
            label3.Size = new System.Drawing.Size(80, 16);
            label3.TabIndex = 10;

            label7.Location = new System.Drawing.Point(24, 104);
            label7.Text = "Right:";
            label7.Size = new System.Drawing.Size(96, 16);
            label7.TabIndex = 3;

            label2.Location = new System.Drawing.Point(16, 128);
            label2.Text = "DrawMode";
            label2.Size = new System.Drawing.Size(88, 16);
            label2.TabIndex = 9;

            panel1.Location = new System.Drawing.Point(16, 224);
            panel1.Text = "panel1";
            panel1.Size = new System.Drawing.Size(216, 24);
            panel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            panel1.TabIndex = 3;
            panel1.Paint += new System.Windows.Forms.PaintEventHandler(panel1_Paint);

            label1.Location = new System.Drawing.Point(16, 104);
            label1.Text = "Style";
            label1.Size = new System.Drawing.Size(88, 16);
            label1.TabIndex = 8;
			this.Controls.AddRange(new Control[] {label7,
													 label6,
													 comboEnd,
													 comboBegin,
													 groupBox1});
			groupBox1.Controls.AddRange(new Control[] {panel1,
														  label9,
														  label5,
														  cmbStyle,
														  cmbDrawMode,
														  cmbItemHeight,
														  cmbMaxDropDownItems,
														  label4,
														  label3,
														  label2,
														  label1,
														  chkIntegralHeight,
														  chkSorted,
														  chkEnabled});
        }


        /// <summary>
        ///    Sets the default states for the controls driving the properties
        ///    of the two ComboBoxes.
        /// </summary>
        private void InitControlState() {
            // Sync the checkboxes
            chkSorted.Checked = comboBegin.Sorted;
            chkEnabled.Checked = comboBegin.Enabled;
            chkIntegralHeight.Checked = comboBegin.IntegralHeight;

            // Sync ComboBox styles to ComboBoxStyle.DROPDOWN
            StringIntObject[] aStyle = new StringIntObject[3];
            aStyle[0] = new StringIntObject("Simple",(int)ComboBoxStyle.Simple);
            aStyle[1] = new StringIntObject("Dropdown",(int)ComboBoxStyle.DropDown);
            aStyle[2] = new StringIntObject("Dropdownlist",(int)ComboBoxStyle.DropDownList);
            cmbStyle.Items.AddRange(aStyle);
            comboBegin.DropDownStyle = (ComboBoxStyle)aStyle[1].i;
            comboEnd.DropDownStyle = (ComboBoxStyle)aStyle[1].i;
            cmbStyle.SelectedIndex = 1;

            // Sync ComboBox draw modes to DrawMode.NORMAL
            StringIntObject[] aDMO = new StringIntObject[3];
            aDMO[0] = new StringIntObject("Normal",(int)DrawMode.Normal);
            aDMO[1] = new StringIntObject("Ownerdrawfixed",(int)DrawMode.OwnerDrawFixed);
            aDMO[2] = new StringIntObject("Ownerdrawvariable",(int)DrawMode.OwnerDrawVariable);
            cmbDrawMode.Items.AddRange(aDMO);
            comboBegin.DrawMode = (DrawMode)aDMO[0].i;
            comboEnd.DrawMode = (DrawMode)aDMO[0].i;
            cmbDrawMode.SelectedIndex = 0;
        }

        private void FillItems(ComboBox cmb) {
            cmb.DisplayMember = "Color";
            cmb.Items.Add(Brushes.Aqua);
            cmb.Items.Add(Brushes.Black);
            cmb.Items.Add(Brushes.Blue);
            cmb.Items.Add(Brushes.Brown);
            cmb.Items.Add(Brushes.Cyan);
            cmb.Items.Add(Brushes.DarkGray);
            cmb.Items.Add(Brushes.Gray);
            cmb.Items.Add(Brushes.Green);
            cmb.Items.Add(Brushes.LightGray);
            cmb.Items.Add(Brushes.Magenta);
            cmb.Items.Add(Brushes.Orange);
            cmb.Items.Add(Brushes.Purple);
            cmb.Items.Add(Brushes.Red);
            cmb.Items.Add(Brushes.White);
            cmb.Items.Add(Brushes.Yellow);
        }


        /// <summary>
        //     Returns the int which is currently selected in a ComboBox.
        /// </summary>
        private int SelectedValue(ComboBox cmb) {
            int ret;
            object obj = cmb.SelectedItem;
            if (obj == null) {
                return -1;
            }
            try {
                ret = Int32.Parse(obj.ToString());
            }
            catch (FormatException) {
                return -1;
            }
            return ret;
        }

        private void chkEnabled_CheckedChanged(object sender, EventArgs e) {
            comboBegin.Enabled = chkEnabled.Checked;
            comboEnd.Enabled = chkEnabled.Checked;
        }

        private void chkIntegralHeight_CheckedChanged(object sender, EventArgs e) {
            comboBegin.IntegralHeight = chkIntegralHeight.Checked;
            comboEnd.IntegralHeight = chkIntegralHeight.Checked;
        }

        private void chkSorted_CheckedChanged(object sender, EventArgs e) {
            bool sorted = chkSorted.Checked;
            comboBegin.Sorted = sorted;
            comboEnd.Sorted = sorted;
            if (!sorted) {
                RandomShuffle(comboBegin);
                RandomShuffle(comboEnd);
            }
        }

        /// <summary>
        ///    Performs a random shuffle on the given ComboBox.
        /// </summary>
        private void RandomShuffle(ComboBox cmb) {
            object[] items = new object[cmb.Items.Count];
            cmb.Items.CopyTo(items, 0);
            int swapItem;
            Random rand = new Random();
            for (int i = 0; i < items.Length; ++i) {
                swapItem = Math.Abs(rand.Next()) % items.Length;
                if (swapItem != i) {
                    object tempObject = items[swapItem];
                    items[swapItem] = items[i];
                    items[i] = tempObject;
                }
            }
            cmb.Items.Clear();
            cmb.Items.AddRange(items);
        }

        private void cmbItemHeight_SelectedIndexChanged(object sender, EventArgs e) {
            int i = SelectedValue(cmbItemHeight);
            if (i == -1)
                return;
            comboBegin.ItemHeight = i;
            comboEnd.ItemHeight = i;
        }

        private void cmbStyle_SelectedIndexChanged(object sender, EventArgs e) {
            ComboBoxStyle i = (ComboBoxStyle)(((StringIntObject)cmbStyle.SelectedItem).i);
            comboBegin.DropDownStyle = i;
            comboEnd.DropDownStyle = i;

            if (i == ComboBoxStyle.Simple) {
                Size cmbsize2 = new Size(cmbsize.Width, cmbsize.Height * 3);
                comboBegin.Size = cmbsize2;
                comboEnd.Size = cmbsize2;
                cmbMaxDropDownItems.Enabled = false;
            }
            else {
                cmbMaxDropDownItems.Enabled = true;
            }
        }

        private void cmbDrawMode_SelectedIndexChanged(object sender, EventArgs e) {
            DrawMode i = (DrawMode)(((StringIntObject)cmbDrawMode.SelectedItem).i);
            comboBegin.DrawMode = i;
            comboEnd.DrawMode = i;

            if (i == DrawMode.OwnerDrawVariable) {
                cmbItemHeight.Enabled = true;
            }
            else {
                cmbItemHeight.Enabled = false;
            }
        }

        /// <summary>
        ///    This DrawItem event handler is invoked to draw an item in a ComboBox if that
        ///    ComboBox is in an OwnerDraw DrawMode.
        /// </summary>
        private void combo_DrawItem(object sender, DrawItemEventArgs die) {
            ComboBox cmb = (ComboBox) sender;
            if (die.Index == -1)
                return;
            if (sender == null)
                return;

            //string brushName = (string)cmb.Items[die.Index];
            //SolidBrush selectedBrush = (SolidBrush)brushMap[brushName];
            SolidBrush selectedBrush = (SolidBrush)cmb.Items[die.Index];
            Graphics g = die.Graphics;

            // If the item is selected, this draws the correct background color
            die.DrawBackground();
            die.DrawFocusRectangle();

            // Draw the color's preview box
            Rectangle rectPreviewBox = die.Bounds;
            rectPreviewBox.Offset(2,2);
            rectPreviewBox.Width = 20;
            rectPreviewBox.Height -= 4;
            g.DrawRectangle(new Pen(die.ForeColor), rectPreviewBox);

            // Get the appropriate Brush object for the selected color
            // and fill the preview box.
            rectPreviewBox.Offset(1,1);
            rectPreviewBox.Width -= 2;
            rectPreviewBox.Height -= 2;
            g.FillRectangle(selectedBrush, rectPreviewBox);

            // Draw the name of the color selected
            g.DrawString(selectedBrush.Color.ToString(), Font, new SolidBrush(die.ForeColor), die.Bounds.X+30,die.Bounds.Y+1);
        }

        private void comboBegin_SelectedIndexChanged(object sender, EventArgs e) {
            if (comboBegin.SelectedIndex >= 0)
            {
                SolidBrush b = (SolidBrush)(comboBegin.SelectedItem);
                gradientBegin = b.Color;
                panel1.Invalidate();
            }
        }

        private void comboEnd_SelectedIndexChanged(object sender, EventArgs e) {
            if (comboBegin.SelectedIndex >= 0)
            {
                SolidBrush b = (SolidBrush)(comboEnd.SelectedItem);
                gradientEnd = b.Color;
                panel1.Invalidate();
            }
        }

        private void cmbMaxDropDownItems_SelectedIndexChanged(object sender, EventArgs e) {
            int i = SelectedValue(cmbMaxDropDownItems);
            if (i == -1)
                return;
            comboBegin.MaxDropDownItems = i;
            comboEnd.MaxDropDownItems = i;
        }

        private void combo_MeasureItem(object sender, MeasureItemEventArgs mie) {
            ComboBox cb = (ComboBox) sender;
            mie.ItemHeight = cb.ItemHeight - 2;
        }

        private void panel1_Paint(object sender, PaintEventArgs e) {
            Brush brush = new LinearGradientBrush (panel1.ClientRectangle, gradientBegin, gradientEnd, LinearGradientMode.ForwardDiagonal) ;
            e.Graphics.FillRectangle(brush, panel1.ClientRectangle);
        }

        // The main entry point for the application.
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new ComboBoxCtl());
        }

    }

}


