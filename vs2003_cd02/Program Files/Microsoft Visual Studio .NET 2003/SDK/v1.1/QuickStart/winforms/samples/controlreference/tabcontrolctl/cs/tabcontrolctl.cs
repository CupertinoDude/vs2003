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
    using System.Collections;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
    using System.Resources;

    // <doc>
    // <desc>
    //     This class demonstrates the TabControl control.
    //
    //     Typically the contents of each page are encapsulated
    //     in a UserControl however for this simple example the
    //     contents of all pages are defined directly in this
    //     form.
    //
    //     TabPages can either be added at designtime or runtime
    //     The main MiscUI file shows an example of how to add pages
    //     dynamically at runtime
    //
    // </desc>
    // </doc>
    //
    public class TabControlCtl : System.Windows.Forms.Form {

        public TabControlCtl() {

            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            appearanceComboBox.SelectedIndex = 0 ;
            alignmentComboBox.SelectedIndex = 0 ;
            sizeModeComboBox.SelectedIndex = 0 ;
            tabControl1.ImageList = null;

            //imageList1.Images.Add((Bitmap)resources.GetObject("speaker"));
            //imageList1.Images.Add((Bitmap)resources.GetObject("camcorder"));
            //imageList1.Images.Add((Bitmap)resources.GetObject("note"));
            //imageList1.Images.Add((Bitmap)resources.GetObject("calendar"));
            //imageList1.Images.Add((Bitmap)resources.GetObject("time"));
        }

        // <doc>
        // <desc>
        //     TabControlCtl overrides dispose so it can clean up the
        //     component list.
        // </desc>
        // </doc>
        //
        protected override void Dispose(bool disposing)
        {
           if (disposing) {
                if (components != null) {
                    components.Dispose();
                }
           }
           base.Dispose(disposing);
        }

        protected void checkBox1_Click(object sender, EventArgs e) {
            this.tabControl1.Multiline = checkBox1.Checked;
            this.alignmentComboBox_SelectedIndexChanged(null, EventArgs.Empty);
        }

        protected void checkBox2_Click(object sender, EventArgs e) {
            this.tabControl1.HotTrack = checkBox2.Checked;
        }

        protected void checkBox3_Click(object sender, EventArgs e) {
            if (checkBox3.Checked)
                tabControl1.ImageList = imageList1;
            else
                tabControl1.ImageList = null;
        }

        protected void appearanceComboBox_SelectedIndexChanged(object sender, EventArgs e) {
            int index = appearanceComboBox.SelectedIndex;
            if (index == 0) {
                tabControl1.Appearance = TabAppearance.Normal;
            }
            else if (index == 1) {
                tabControl1.Appearance = TabAppearance.Buttons;
            }
            else {
                tabControl1.Appearance = TabAppearance.FlatButtons;
            }
            tabControl1.PerformLayout();
        }

        protected void alignmentComboBox_SelectedIndexChanged(object sender, EventArgs e) {
            int index = alignmentComboBox.SelectedIndex;
            if (index == 0) {
                tabControl1.Alignment = TabAlignment.Top;
            }
            else if (index == 1) {
                tabControl1.Alignment = TabAlignment.Bottom;
            }
            else if (index == 2) {
                tabControl1.Alignment = TabAlignment.Left;
            }
            else
                tabControl1.Alignment = TabAlignment.Right;
        }

        protected void sizeModeComboBox_SelectedIndexChanged(object sender, EventArgs e) {
            int index = sizeModeComboBox.SelectedIndex;
            if (index == 0) {
                tabControl1.SizeMode = TabSizeMode.Normal;
            }
            else if (index == 1) {
                tabControl1.SizeMode = TabSizeMode.FillToRight;
            }
            else
                tabControl1.SizeMode = TabSizeMode.Fixed;

        }

        protected void trackBar_Scroll(object sender, EventArgs e) {
            tabControl1.Width = trackBar.Value;
        }

		private System.ComponentModel.IContainer components;
        protected internal System.Windows.Forms.DomainUpDown tp5DomainUpDown1;
        protected internal System.Windows.Forms.GroupBox tp5GroupBox1;
        protected internal System.Windows.Forms.ComboBox tp4ComboBox1;
        protected internal System.Windows.Forms.NumericUpDown tp4UpDown1;
        protected internal System.Windows.Forms.GroupBox tp4GroupBox1;
        protected internal System.Windows.Forms.ComboBox tp3ComboBox1;
        protected internal System.Windows.Forms.RadioButton tp3RadioButton1;
        protected internal System.Windows.Forms.RadioButton tp3RadioButton2;
        protected internal System.Windows.Forms.ComboBox tp3ComboBox2;
        protected internal System.Windows.Forms.Label tp3Label1;
        protected internal System.Windows.Forms.Button tp3Button1;
        protected internal System.Windows.Forms.GroupBox tp3GroupBox1;
        protected internal System.Windows.Forms.TabPage tabPage5;
        protected internal System.Windows.Forms.TabPage tabPage4;
        protected internal System.Windows.Forms.TabPage tabPage3;
        protected internal System.Windows.Forms.ComboBox tp2ComboBox1;
        protected internal System.Windows.Forms.RadioButton tp2RadioButton1;
        protected internal System.Windows.Forms.RadioButton tp2RadioButton2;
        protected internal System.Windows.Forms.GroupBox tp2GroupBox1;
        protected internal System.Windows.Forms.TabPage tabPage2;
        protected internal System.Windows.Forms.TabPage tabPage1;
        protected internal System.Windows.Forms.GroupBox groupBox1;
        protected internal System.Windows.Forms.ComboBox appearanceComboBox;
        protected internal System.Windows.Forms.CheckBox checkBox1;
        protected internal System.Windows.Forms.TabControl tabControl1;
        protected internal System.Windows.Forms.ComboBox alignmentComboBox;
        protected internal System.Windows.Forms.CheckBox checkBox2;
        protected internal System.Windows.Forms.ComboBox sizeModeComboBox;
        protected internal System.Windows.Forms.Label label1;
        protected internal System.Windows.Forms.Label label2;
        protected internal System.Windows.Forms.Label label3;
        protected internal System.Windows.Forms.TrackBar trackBar;
        protected internal System.Windows.Forms.Label label4;
        protected internal System.Windows.Forms.PictureBox pictureBox1;
        protected internal System.Windows.Forms.ToolTip toolTip1;
        protected internal System.Windows.Forms.ImageList imageList1;
        protected internal System.Windows.Forms.CheckBox checkBox3;
        protected internal System.Windows.Forms.ComboBox tp1ComboBox1;
        protected internal System.Windows.Forms.Label tp1Label1;
        protected internal System.Windows.Forms.Label tp1Label2;
        protected internal System.Windows.Forms.Button tp1Button1;
        protected internal System.Windows.Forms.GroupBox tp1GroupBox1;
        protected internal System.Resources.ResourceManager resources;

        /// <summary>
        ///    Required method for Designer support - do not modify
        ///    the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
			this.components = new System.ComponentModel.Container();
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(TabControlCtl));
			this.label2 = new System.Windows.Forms.Label();
			this.label1 = new System.Windows.Forms.Label();
			this.tp3RadioButton1 = new System.Windows.Forms.RadioButton();
			this.tp5DomainUpDown1 = new System.Windows.Forms.DomainUpDown();
			this.alignmentComboBox = new System.Windows.Forms.ComboBox();
			this.tp1Label2 = new System.Windows.Forms.Label();
			this.tp1Label1 = new System.Windows.Forms.Label();
			this.tp1GroupBox1 = new System.Windows.Forms.GroupBox();
			this.tp1Button1 = new System.Windows.Forms.Button();
			this.tp1ComboBox1 = new System.Windows.Forms.ComboBox();
			this.tp3RadioButton2 = new System.Windows.Forms.RadioButton();
			this.trackBar = new System.Windows.Forms.TrackBar();
			this.tp2ComboBox1 = new System.Windows.Forms.ComboBox();
			this.tp2RadioButton2 = new System.Windows.Forms.RadioButton();
			this.label4 = new System.Windows.Forms.Label();
			this.imageList1 = new System.Windows.Forms.ImageList(this.components);
			this.tp4GroupBox1 = new System.Windows.Forms.GroupBox();
			this.tp4ComboBox1 = new System.Windows.Forms.ComboBox();
			this.tp4UpDown1 = new System.Windows.Forms.NumericUpDown();
			this.sizeModeComboBox = new System.Windows.Forms.ComboBox();
			this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
			this.checkBox2 = new System.Windows.Forms.CheckBox();
			this.appearanceComboBox = new System.Windows.Forms.ComboBox();
			this.checkBox1 = new System.Windows.Forms.CheckBox();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.checkBox3 = new System.Windows.Forms.CheckBox();
			this.label3 = new System.Windows.Forms.Label();
			this.tabPage1 = new System.Windows.Forms.TabPage();
			this.tp2RadioButton1 = new System.Windows.Forms.RadioButton();
			this.tp3ComboBox2 = new System.Windows.Forms.ComboBox();
			this.pictureBox1 = new System.Windows.Forms.PictureBox();
			this.tabPage4 = new System.Windows.Forms.TabPage();
			this.tp5GroupBox1 = new System.Windows.Forms.GroupBox();
			this.tp2GroupBox1 = new System.Windows.Forms.GroupBox();
			this.tp3ComboBox1 = new System.Windows.Forms.ComboBox();
			this.tp3Button1 = new System.Windows.Forms.Button();
			this.tabControl1 = new System.Windows.Forms.TabControl();
			this.tabPage2 = new System.Windows.Forms.TabPage();
			this.tabPage3 = new System.Windows.Forms.TabPage();
			this.tp3GroupBox1 = new System.Windows.Forms.GroupBox();
			this.tp3Label1 = new System.Windows.Forms.Label();
			this.tabPage5 = new System.Windows.Forms.TabPage();
			this.tp1GroupBox1.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.trackBar)).BeginInit();
			this.tp4GroupBox1.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.tp4UpDown1)).BeginInit();
			this.groupBox1.SuspendLayout();
			this.tabPage1.SuspendLayout();
			this.tabPage4.SuspendLayout();
			this.tp5GroupBox1.SuspendLayout();
			this.tp2GroupBox1.SuspendLayout();
			this.tabControl1.SuspendLayout();
			this.tabPage2.SuspendLayout();
			this.tabPage3.SuspendLayout();
			this.tp3GroupBox1.SuspendLayout();
			this.tabPage5.SuspendLayout();
			this.SuspendLayout();
			// 
			// label2
			// 
			this.label2.AccessibleDescription = resources.GetString("label2.AccessibleDescription");
			this.label2.AccessibleName = resources.GetString("label2.AccessibleName");
			this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("label2.Anchor")));
			this.label2.AutoSize = ((bool)(resources.GetObject("label2.AutoSize")));
			this.label2.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("label2.Dock")));
			this.label2.Enabled = ((bool)(resources.GetObject("label2.Enabled")));
			this.label2.Font = ((System.Drawing.Font)(resources.GetObject("label2.Font")));
			this.label2.Image = ((System.Drawing.Image)(resources.GetObject("label2.Image")));
			this.label2.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("label2.ImageAlign")));
			this.label2.ImageIndex = ((int)(resources.GetObject("label2.ImageIndex")));
			this.label2.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("label2.ImeMode")));
			this.label2.Location = ((System.Drawing.Point)(resources.GetObject("label2.Location")));
			this.label2.Name = "label2";
			this.label2.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("label2.RightToLeft")));
			this.label2.Size = ((System.Drawing.Size)(resources.GetObject("label2.Size")));
			this.label2.TabIndex = ((int)(resources.GetObject("label2.TabIndex")));
			this.label2.Text = resources.GetString("label2.Text");
			this.label2.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("label2.TextAlign")));
			this.toolTip1.SetToolTip(this.label2, resources.GetString("label2.ToolTip"));
			this.label2.Visible = ((bool)(resources.GetObject("label2.Visible")));
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
			// tp3RadioButton1
			// 
			this.tp3RadioButton1.AccessibleDescription = resources.GetString("tp3RadioButton1.AccessibleDescription");
			this.tp3RadioButton1.AccessibleName = resources.GetString("tp3RadioButton1.AccessibleName");
			this.tp3RadioButton1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp3RadioButton1.Anchor")));
			this.tp3RadioButton1.Appearance = ((System.Windows.Forms.Appearance)(resources.GetObject("tp3RadioButton1.Appearance")));
			this.tp3RadioButton1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tp3RadioButton1.BackgroundImage")));
			this.tp3RadioButton1.CheckAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp3RadioButton1.CheckAlign")));
			this.tp3RadioButton1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp3RadioButton1.Dock")));
			this.tp3RadioButton1.Enabled = ((bool)(resources.GetObject("tp3RadioButton1.Enabled")));
			this.tp3RadioButton1.FlatStyle = ((System.Windows.Forms.FlatStyle)(resources.GetObject("tp3RadioButton1.FlatStyle")));
			this.tp3RadioButton1.Font = ((System.Drawing.Font)(resources.GetObject("tp3RadioButton1.Font")));
			this.tp3RadioButton1.Image = ((System.Drawing.Image)(resources.GetObject("tp3RadioButton1.Image")));
			this.tp3RadioButton1.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp3RadioButton1.ImageAlign")));
			this.tp3RadioButton1.ImageIndex = ((int)(resources.GetObject("tp3RadioButton1.ImageIndex")));
			this.tp3RadioButton1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp3RadioButton1.ImeMode")));
			this.tp3RadioButton1.Location = ((System.Drawing.Point)(resources.GetObject("tp3RadioButton1.Location")));
			this.tp3RadioButton1.Name = "tp3RadioButton1";
			this.tp3RadioButton1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp3RadioButton1.RightToLeft")));
			this.tp3RadioButton1.Size = ((System.Drawing.Size)(resources.GetObject("tp3RadioButton1.Size")));
			this.tp3RadioButton1.TabIndex = ((int)(resources.GetObject("tp3RadioButton1.TabIndex")));
			this.tp3RadioButton1.Text = resources.GetString("tp3RadioButton1.Text");
			this.tp3RadioButton1.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp3RadioButton1.TextAlign")));
			this.toolTip1.SetToolTip(this.tp3RadioButton1, resources.GetString("tp3RadioButton1.ToolTip"));
			this.tp3RadioButton1.Visible = ((bool)(resources.GetObject("tp3RadioButton1.Visible")));
			// 
			// tp5DomainUpDown1
			// 
			this.tp5DomainUpDown1.AccessibleDescription = resources.GetString("tp5DomainUpDown1.AccessibleDescription");
			this.tp5DomainUpDown1.AccessibleName = resources.GetString("tp5DomainUpDown1.AccessibleName");
			this.tp5DomainUpDown1.AccessibleRole = System.Windows.Forms.AccessibleRole.ComboBox;
			this.tp5DomainUpDown1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp5DomainUpDown1.Anchor")));
			this.tp5DomainUpDown1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp5DomainUpDown1.Dock")));
			this.tp5DomainUpDown1.Enabled = ((bool)(resources.GetObject("tp5DomainUpDown1.Enabled")));
			this.tp5DomainUpDown1.Font = ((System.Drawing.Font)(resources.GetObject("tp5DomainUpDown1.Font")));
			this.tp5DomainUpDown1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp5DomainUpDown1.ImeMode")));
			this.tp5DomainUpDown1.Location = ((System.Drawing.Point)(resources.GetObject("tp5DomainUpDown1.Location")));
			this.tp5DomainUpDown1.Name = "tp5DomainUpDown1";
			this.tp5DomainUpDown1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp5DomainUpDown1.RightToLeft")));
			this.tp5DomainUpDown1.Size = ((System.Drawing.Size)(resources.GetObject("tp5DomainUpDown1.Size")));
			this.tp5DomainUpDown1.TabIndex = ((int)(resources.GetObject("tp5DomainUpDown1.TabIndex")));
			this.tp5DomainUpDown1.Text = resources.GetString("tp5DomainUpDown1.Text");
			this.tp5DomainUpDown1.TextAlign = ((System.Windows.Forms.HorizontalAlignment)(resources.GetObject("tp5DomainUpDown1.TextAlign")));
			this.toolTip1.SetToolTip(this.tp5DomainUpDown1, resources.GetString("tp5DomainUpDown1.ToolTip"));
			this.tp5DomainUpDown1.UpDownAlign = ((System.Windows.Forms.LeftRightAlignment)(resources.GetObject("tp5DomainUpDown1.UpDownAlign")));
			this.tp5DomainUpDown1.Visible = ((bool)(resources.GetObject("tp5DomainUpDown1.Visible")));
			this.tp5DomainUpDown1.Wrap = ((bool)(resources.GetObject("tp5DomainUpDown1.Wrap")));
			// 
			// alignmentComboBox
			// 
			this.alignmentComboBox.AccessibleDescription = resources.GetString("alignmentComboBox.AccessibleDescription");
			this.alignmentComboBox.AccessibleName = resources.GetString("alignmentComboBox.AccessibleName");
			this.alignmentComboBox.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("alignmentComboBox.Anchor")));
			this.alignmentComboBox.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("alignmentComboBox.BackgroundImage")));
			this.alignmentComboBox.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("alignmentComboBox.Dock")));
			this.alignmentComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.alignmentComboBox.Enabled = ((bool)(resources.GetObject("alignmentComboBox.Enabled")));
			this.alignmentComboBox.Font = ((System.Drawing.Font)(resources.GetObject("alignmentComboBox.Font")));
			this.alignmentComboBox.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("alignmentComboBox.ImeMode")));
			this.alignmentComboBox.IntegralHeight = ((bool)(resources.GetObject("alignmentComboBox.IntegralHeight")));
			this.alignmentComboBox.ItemHeight = ((int)(resources.GetObject("alignmentComboBox.ItemHeight")));
			this.alignmentComboBox.Items.AddRange(new object[] {
																   resources.GetString("alignmentComboBox.Items"),
																   resources.GetString("alignmentComboBox.Items1"),
																   resources.GetString("alignmentComboBox.Items2"),
																   resources.GetString("alignmentComboBox.Items3")});
			this.alignmentComboBox.Location = ((System.Drawing.Point)(resources.GetObject("alignmentComboBox.Location")));
			this.alignmentComboBox.MaxDropDownItems = ((int)(resources.GetObject("alignmentComboBox.MaxDropDownItems")));
			this.alignmentComboBox.MaxLength = ((int)(resources.GetObject("alignmentComboBox.MaxLength")));
			this.alignmentComboBox.Name = "alignmentComboBox";
			this.alignmentComboBox.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("alignmentComboBox.RightToLeft")));
			this.alignmentComboBox.Size = ((System.Drawing.Size)(resources.GetObject("alignmentComboBox.Size")));
			this.alignmentComboBox.TabIndex = ((int)(resources.GetObject("alignmentComboBox.TabIndex")));
			this.alignmentComboBox.Text = resources.GetString("alignmentComboBox.Text");
			this.toolTip1.SetToolTip(this.alignmentComboBox, resources.GetString("alignmentComboBox.ToolTip"));
			this.alignmentComboBox.Visible = ((bool)(resources.GetObject("alignmentComboBox.Visible")));
			this.alignmentComboBox.SelectedIndexChanged += new System.EventHandler(this.alignmentComboBox_SelectedIndexChanged);
			// 
			// tp1Label2
			// 
			this.tp1Label2.AccessibleDescription = resources.GetString("tp1Label2.AccessibleDescription");
			this.tp1Label2.AccessibleName = resources.GetString("tp1Label2.AccessibleName");
			this.tp1Label2.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp1Label2.Anchor")));
			this.tp1Label2.AutoSize = ((bool)(resources.GetObject("tp1Label2.AutoSize")));
			this.tp1Label2.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp1Label2.Dock")));
			this.tp1Label2.Enabled = ((bool)(resources.GetObject("tp1Label2.Enabled")));
			this.tp1Label2.Font = ((System.Drawing.Font)(resources.GetObject("tp1Label2.Font")));
			this.tp1Label2.Image = ((System.Drawing.Image)(resources.GetObject("tp1Label2.Image")));
			this.tp1Label2.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp1Label2.ImageAlign")));
			this.tp1Label2.ImageIndex = ((int)(resources.GetObject("tp1Label2.ImageIndex")));
			this.tp1Label2.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp1Label2.ImeMode")));
			this.tp1Label2.Location = ((System.Drawing.Point)(resources.GetObject("tp1Label2.Location")));
			this.tp1Label2.Name = "tp1Label2";
			this.tp1Label2.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp1Label2.RightToLeft")));
			this.tp1Label2.Size = ((System.Drawing.Size)(resources.GetObject("tp1Label2.Size")));
			this.tp1Label2.TabIndex = ((int)(resources.GetObject("tp1Label2.TabIndex")));
			this.tp1Label2.Text = resources.GetString("tp1Label2.Text");
			this.tp1Label2.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp1Label2.TextAlign")));
			this.toolTip1.SetToolTip(this.tp1Label2, resources.GetString("tp1Label2.ToolTip"));
			this.tp1Label2.Visible = ((bool)(resources.GetObject("tp1Label2.Visible")));
			// 
			// tp1Label1
			// 
			this.tp1Label1.AccessibleDescription = resources.GetString("tp1Label1.AccessibleDescription");
			this.tp1Label1.AccessibleName = resources.GetString("tp1Label1.AccessibleName");
			this.tp1Label1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp1Label1.Anchor")));
			this.tp1Label1.AutoSize = ((bool)(resources.GetObject("tp1Label1.AutoSize")));
			this.tp1Label1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp1Label1.Dock")));
			this.tp1Label1.Enabled = ((bool)(resources.GetObject("tp1Label1.Enabled")));
			this.tp1Label1.Font = ((System.Drawing.Font)(resources.GetObject("tp1Label1.Font")));
			this.tp1Label1.Image = ((System.Drawing.Image)(resources.GetObject("tp1Label1.Image")));
			this.tp1Label1.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp1Label1.ImageAlign")));
			this.tp1Label1.ImageIndex = ((int)(resources.GetObject("tp1Label1.ImageIndex")));
			this.tp1Label1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp1Label1.ImeMode")));
			this.tp1Label1.Location = ((System.Drawing.Point)(resources.GetObject("tp1Label1.Location")));
			this.tp1Label1.Name = "tp1Label1";
			this.tp1Label1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp1Label1.RightToLeft")));
			this.tp1Label1.Size = ((System.Drawing.Size)(resources.GetObject("tp1Label1.Size")));
			this.tp1Label1.TabIndex = ((int)(resources.GetObject("tp1Label1.TabIndex")));
			this.tp1Label1.Text = resources.GetString("tp1Label1.Text");
			this.tp1Label1.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp1Label1.TextAlign")));
			this.toolTip1.SetToolTip(this.tp1Label1, resources.GetString("tp1Label1.ToolTip"));
			this.tp1Label1.Visible = ((bool)(resources.GetObject("tp1Label1.Visible")));
			// 
			// tp1GroupBox1
			// 
			this.tp1GroupBox1.AccessibleDescription = resources.GetString("tp1GroupBox1.AccessibleDescription");
			this.tp1GroupBox1.AccessibleName = resources.GetString("tp1GroupBox1.AccessibleName");
			this.tp1GroupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp1GroupBox1.Anchor")));
			this.tp1GroupBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tp1GroupBox1.BackgroundImage")));
			this.tp1GroupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					   this.tp1Label1,
																					   this.tp1Label2,
																					   this.tp1Button1,
																					   this.tp1ComboBox1});
			this.tp1GroupBox1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp1GroupBox1.Dock")));
			this.tp1GroupBox1.Enabled = ((bool)(resources.GetObject("tp1GroupBox1.Enabled")));
			this.tp1GroupBox1.Font = ((System.Drawing.Font)(resources.GetObject("tp1GroupBox1.Font")));
			this.tp1GroupBox1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp1GroupBox1.ImeMode")));
			this.tp1GroupBox1.Location = ((System.Drawing.Point)(resources.GetObject("tp1GroupBox1.Location")));
			this.tp1GroupBox1.Name = "tp1GroupBox1";
			this.tp1GroupBox1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp1GroupBox1.RightToLeft")));
			this.tp1GroupBox1.Size = ((System.Drawing.Size)(resources.GetObject("tp1GroupBox1.Size")));
			this.tp1GroupBox1.TabIndex = ((int)(resources.GetObject("tp1GroupBox1.TabIndex")));
			this.tp1GroupBox1.TabStop = false;
			this.tp1GroupBox1.Text = resources.GetString("tp1GroupBox1.Text");
			this.toolTip1.SetToolTip(this.tp1GroupBox1, resources.GetString("tp1GroupBox1.ToolTip"));
			this.tp1GroupBox1.Visible = ((bool)(resources.GetObject("tp1GroupBox1.Visible")));
			// 
			// tp1Button1
			// 
			this.tp1Button1.AccessibleDescription = resources.GetString("tp1Button1.AccessibleDescription");
			this.tp1Button1.AccessibleName = resources.GetString("tp1Button1.AccessibleName");
			this.tp1Button1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp1Button1.Anchor")));
			this.tp1Button1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tp1Button1.BackgroundImage")));
			this.tp1Button1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp1Button1.Dock")));
			this.tp1Button1.Enabled = ((bool)(resources.GetObject("tp1Button1.Enabled")));
			this.tp1Button1.FlatStyle = ((System.Windows.Forms.FlatStyle)(resources.GetObject("tp1Button1.FlatStyle")));
			this.tp1Button1.Font = ((System.Drawing.Font)(resources.GetObject("tp1Button1.Font")));
			this.tp1Button1.Image = ((System.Drawing.Image)(resources.GetObject("tp1Button1.Image")));
			this.tp1Button1.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp1Button1.ImageAlign")));
			this.tp1Button1.ImageIndex = ((int)(resources.GetObject("tp1Button1.ImageIndex")));
			this.tp1Button1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp1Button1.ImeMode")));
			this.tp1Button1.Location = ((System.Drawing.Point)(resources.GetObject("tp1Button1.Location")));
			this.tp1Button1.Name = "tp1Button1";
			this.tp1Button1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp1Button1.RightToLeft")));
			this.tp1Button1.Size = ((System.Drawing.Size)(resources.GetObject("tp1Button1.Size")));
			this.tp1Button1.TabIndex = ((int)(resources.GetObject("tp1Button1.TabIndex")));
			this.tp1Button1.Text = resources.GetString("tp1Button1.Text");
			this.tp1Button1.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp1Button1.TextAlign")));
			this.toolTip1.SetToolTip(this.tp1Button1, resources.GetString("tp1Button1.ToolTip"));
			this.tp1Button1.Visible = ((bool)(resources.GetObject("tp1Button1.Visible")));
			// 
			// tp1ComboBox1
			// 
			this.tp1ComboBox1.AccessibleDescription = resources.GetString("tp1ComboBox1.AccessibleDescription");
			this.tp1ComboBox1.AccessibleName = resources.GetString("tp1ComboBox1.AccessibleName");
			this.tp1ComboBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp1ComboBox1.Anchor")));
			this.tp1ComboBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tp1ComboBox1.BackgroundImage")));
			this.tp1ComboBox1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp1ComboBox1.Dock")));
			this.tp1ComboBox1.Enabled = ((bool)(resources.GetObject("tp1ComboBox1.Enabled")));
			this.tp1ComboBox1.Font = ((System.Drawing.Font)(resources.GetObject("tp1ComboBox1.Font")));
			this.tp1ComboBox1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp1ComboBox1.ImeMode")));
			this.tp1ComboBox1.IntegralHeight = ((bool)(resources.GetObject("tp1ComboBox1.IntegralHeight")));
			this.tp1ComboBox1.ItemHeight = ((int)(resources.GetObject("tp1ComboBox1.ItemHeight")));
			this.tp1ComboBox1.Location = ((System.Drawing.Point)(resources.GetObject("tp1ComboBox1.Location")));
			this.tp1ComboBox1.MaxDropDownItems = ((int)(resources.GetObject("tp1ComboBox1.MaxDropDownItems")));
			this.tp1ComboBox1.MaxLength = ((int)(resources.GetObject("tp1ComboBox1.MaxLength")));
			this.tp1ComboBox1.Name = "tp1ComboBox1";
			this.tp1ComboBox1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp1ComboBox1.RightToLeft")));
			this.tp1ComboBox1.Size = ((System.Drawing.Size)(resources.GetObject("tp1ComboBox1.Size")));
			this.tp1ComboBox1.TabIndex = ((int)(resources.GetObject("tp1ComboBox1.TabIndex")));
			this.tp1ComboBox1.Text = resources.GetString("tp1ComboBox1.Text");
			this.toolTip1.SetToolTip(this.tp1ComboBox1, resources.GetString("tp1ComboBox1.ToolTip"));
			this.tp1ComboBox1.Visible = ((bool)(resources.GetObject("tp1ComboBox1.Visible")));
			// 
			// tp3RadioButton2
			// 
			this.tp3RadioButton2.AccessibleDescription = resources.GetString("tp3RadioButton2.AccessibleDescription");
			this.tp3RadioButton2.AccessibleName = resources.GetString("tp3RadioButton2.AccessibleName");
			this.tp3RadioButton2.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp3RadioButton2.Anchor")));
			this.tp3RadioButton2.Appearance = ((System.Windows.Forms.Appearance)(resources.GetObject("tp3RadioButton2.Appearance")));
			this.tp3RadioButton2.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tp3RadioButton2.BackgroundImage")));
			this.tp3RadioButton2.CheckAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp3RadioButton2.CheckAlign")));
			this.tp3RadioButton2.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp3RadioButton2.Dock")));
			this.tp3RadioButton2.Enabled = ((bool)(resources.GetObject("tp3RadioButton2.Enabled")));
			this.tp3RadioButton2.FlatStyle = ((System.Windows.Forms.FlatStyle)(resources.GetObject("tp3RadioButton2.FlatStyle")));
			this.tp3RadioButton2.Font = ((System.Drawing.Font)(resources.GetObject("tp3RadioButton2.Font")));
			this.tp3RadioButton2.Image = ((System.Drawing.Image)(resources.GetObject("tp3RadioButton2.Image")));
			this.tp3RadioButton2.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp3RadioButton2.ImageAlign")));
			this.tp3RadioButton2.ImageIndex = ((int)(resources.GetObject("tp3RadioButton2.ImageIndex")));
			this.tp3RadioButton2.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp3RadioButton2.ImeMode")));
			this.tp3RadioButton2.Location = ((System.Drawing.Point)(resources.GetObject("tp3RadioButton2.Location")));
			this.tp3RadioButton2.Name = "tp3RadioButton2";
			this.tp3RadioButton2.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp3RadioButton2.RightToLeft")));
			this.tp3RadioButton2.Size = ((System.Drawing.Size)(resources.GetObject("tp3RadioButton2.Size")));
			this.tp3RadioButton2.TabIndex = ((int)(resources.GetObject("tp3RadioButton2.TabIndex")));
			this.tp3RadioButton2.Text = resources.GetString("tp3RadioButton2.Text");
			this.tp3RadioButton2.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp3RadioButton2.TextAlign")));
			this.toolTip1.SetToolTip(this.tp3RadioButton2, resources.GetString("tp3RadioButton2.ToolTip"));
			this.tp3RadioButton2.Visible = ((bool)(resources.GetObject("tp3RadioButton2.Visible")));
			// 
			// trackBar
			// 
			this.trackBar.AccessibleDescription = resources.GetString("trackBar.AccessibleDescription");
			this.trackBar.AccessibleName = resources.GetString("trackBar.AccessibleName");
			this.trackBar.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("trackBar.Anchor")));
			this.trackBar.BackColor = System.Drawing.SystemColors.Control;
			this.trackBar.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("trackBar.BackgroundImage")));
			this.trackBar.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("trackBar.Dock")));
			this.trackBar.Enabled = ((bool)(resources.GetObject("trackBar.Enabled")));
			this.trackBar.Font = ((System.Drawing.Font)(resources.GetObject("trackBar.Font")));
			this.trackBar.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("trackBar.ImeMode")));
			this.trackBar.Location = ((System.Drawing.Point)(resources.GetObject("trackBar.Location")));
			this.trackBar.Maximum = 220;
			this.trackBar.Name = "trackBar";
			this.trackBar.Orientation = ((System.Windows.Forms.Orientation)(resources.GetObject("trackBar.Orientation")));
			this.trackBar.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("trackBar.RightToLeft")));
			this.trackBar.Size = ((System.Drawing.Size)(resources.GetObject("trackBar.Size")));
			this.trackBar.TabIndex = ((int)(resources.GetObject("trackBar.TabIndex")));
			this.trackBar.TabStop = false;
			this.trackBar.Text = resources.GetString("trackBar.Text");
			this.trackBar.TickFrequency = 10;
			this.toolTip1.SetToolTip(this.trackBar, resources.GetString("trackBar.ToolTip"));
			this.trackBar.Value = 220;
			this.trackBar.Visible = ((bool)(resources.GetObject("trackBar.Visible")));
			this.trackBar.Scroll += new System.EventHandler(this.trackBar_Scroll);
			// 
			// tp2ComboBox1
			// 
			this.tp2ComboBox1.AccessibleDescription = resources.GetString("tp2ComboBox1.AccessibleDescription");
			this.tp2ComboBox1.AccessibleName = resources.GetString("tp2ComboBox1.AccessibleName");
			this.tp2ComboBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp2ComboBox1.Anchor")));
			this.tp2ComboBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tp2ComboBox1.BackgroundImage")));
			this.tp2ComboBox1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp2ComboBox1.Dock")));
			this.tp2ComboBox1.Enabled = ((bool)(resources.GetObject("tp2ComboBox1.Enabled")));
			this.tp2ComboBox1.Font = ((System.Drawing.Font)(resources.GetObject("tp2ComboBox1.Font")));
			this.tp2ComboBox1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp2ComboBox1.ImeMode")));
			this.tp2ComboBox1.IntegralHeight = ((bool)(resources.GetObject("tp2ComboBox1.IntegralHeight")));
			this.tp2ComboBox1.ItemHeight = ((int)(resources.GetObject("tp2ComboBox1.ItemHeight")));
			this.tp2ComboBox1.Location = ((System.Drawing.Point)(resources.GetObject("tp2ComboBox1.Location")));
			this.tp2ComboBox1.MaxDropDownItems = ((int)(resources.GetObject("tp2ComboBox1.MaxDropDownItems")));
			this.tp2ComboBox1.MaxLength = ((int)(resources.GetObject("tp2ComboBox1.MaxLength")));
			this.tp2ComboBox1.Name = "tp2ComboBox1";
			this.tp2ComboBox1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp2ComboBox1.RightToLeft")));
			this.tp2ComboBox1.Size = ((System.Drawing.Size)(resources.GetObject("tp2ComboBox1.Size")));
			this.tp2ComboBox1.TabIndex = ((int)(resources.GetObject("tp2ComboBox1.TabIndex")));
			this.tp2ComboBox1.Text = resources.GetString("tp2ComboBox1.Text");
			this.toolTip1.SetToolTip(this.tp2ComboBox1, resources.GetString("tp2ComboBox1.ToolTip"));
			this.tp2ComboBox1.Visible = ((bool)(resources.GetObject("tp2ComboBox1.Visible")));
			// 
			// tp2RadioButton2
			// 
			this.tp2RadioButton2.AccessibleDescription = resources.GetString("tp2RadioButton2.AccessibleDescription");
			this.tp2RadioButton2.AccessibleName = resources.GetString("tp2RadioButton2.AccessibleName");
			this.tp2RadioButton2.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp2RadioButton2.Anchor")));
			this.tp2RadioButton2.Appearance = ((System.Windows.Forms.Appearance)(resources.GetObject("tp2RadioButton2.Appearance")));
			this.tp2RadioButton2.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tp2RadioButton2.BackgroundImage")));
			this.tp2RadioButton2.CheckAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp2RadioButton2.CheckAlign")));
			this.tp2RadioButton2.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp2RadioButton2.Dock")));
			this.tp2RadioButton2.Enabled = ((bool)(resources.GetObject("tp2RadioButton2.Enabled")));
			this.tp2RadioButton2.FlatStyle = ((System.Windows.Forms.FlatStyle)(resources.GetObject("tp2RadioButton2.FlatStyle")));
			this.tp2RadioButton2.Font = ((System.Drawing.Font)(resources.GetObject("tp2RadioButton2.Font")));
			this.tp2RadioButton2.Image = ((System.Drawing.Image)(resources.GetObject("tp2RadioButton2.Image")));
			this.tp2RadioButton2.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp2RadioButton2.ImageAlign")));
			this.tp2RadioButton2.ImageIndex = ((int)(resources.GetObject("tp2RadioButton2.ImageIndex")));
			this.tp2RadioButton2.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp2RadioButton2.ImeMode")));
			this.tp2RadioButton2.Location = ((System.Drawing.Point)(resources.GetObject("tp2RadioButton2.Location")));
			this.tp2RadioButton2.Name = "tp2RadioButton2";
			this.tp2RadioButton2.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp2RadioButton2.RightToLeft")));
			this.tp2RadioButton2.Size = ((System.Drawing.Size)(resources.GetObject("tp2RadioButton2.Size")));
			this.tp2RadioButton2.TabIndex = ((int)(resources.GetObject("tp2RadioButton2.TabIndex")));
			this.tp2RadioButton2.Text = resources.GetString("tp2RadioButton2.Text");
			this.tp2RadioButton2.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp2RadioButton2.TextAlign")));
			this.toolTip1.SetToolTip(this.tp2RadioButton2, resources.GetString("tp2RadioButton2.ToolTip"));
			this.tp2RadioButton2.Visible = ((bool)(resources.GetObject("tp2RadioButton2.Visible")));
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
			// imageList1
			// 
			this.imageList1.ColorDepth = System.Windows.Forms.ColorDepth.Depth8Bit;
			this.imageList1.ImageSize = ((System.Drawing.Size)(resources.GetObject("imageList1.ImageSize")));
			this.imageList1.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imageList1.ImageStream")));
			this.imageList1.TransparentColor = System.Drawing.Color.Transparent;
			// 
			// tp4GroupBox1
			// 
			this.tp4GroupBox1.AccessibleDescription = resources.GetString("tp4GroupBox1.AccessibleDescription");
			this.tp4GroupBox1.AccessibleName = resources.GetString("tp4GroupBox1.AccessibleName");
			this.tp4GroupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp4GroupBox1.Anchor")));
			this.tp4GroupBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tp4GroupBox1.BackgroundImage")));
			this.tp4GroupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					   this.tp4ComboBox1,
																					   this.tp4UpDown1});
			this.tp4GroupBox1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp4GroupBox1.Dock")));
			this.tp4GroupBox1.Enabled = ((bool)(resources.GetObject("tp4GroupBox1.Enabled")));
			this.tp4GroupBox1.Font = ((System.Drawing.Font)(resources.GetObject("tp4GroupBox1.Font")));
			this.tp4GroupBox1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp4GroupBox1.ImeMode")));
			this.tp4GroupBox1.Location = ((System.Drawing.Point)(resources.GetObject("tp4GroupBox1.Location")));
			this.tp4GroupBox1.Name = "tp4GroupBox1";
			this.tp4GroupBox1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp4GroupBox1.RightToLeft")));
			this.tp4GroupBox1.Size = ((System.Drawing.Size)(resources.GetObject("tp4GroupBox1.Size")));
			this.tp4GroupBox1.TabIndex = ((int)(resources.GetObject("tp4GroupBox1.TabIndex")));
			this.tp4GroupBox1.TabStop = false;
			this.tp4GroupBox1.Text = resources.GetString("tp4GroupBox1.Text");
			this.toolTip1.SetToolTip(this.tp4GroupBox1, resources.GetString("tp4GroupBox1.ToolTip"));
			this.tp4GroupBox1.Visible = ((bool)(resources.GetObject("tp4GroupBox1.Visible")));
			// 
			// tp4ComboBox1
			// 
			this.tp4ComboBox1.AccessibleDescription = resources.GetString("tp4ComboBox1.AccessibleDescription");
			this.tp4ComboBox1.AccessibleName = resources.GetString("tp4ComboBox1.AccessibleName");
			this.tp4ComboBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp4ComboBox1.Anchor")));
			this.tp4ComboBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tp4ComboBox1.BackgroundImage")));
			this.tp4ComboBox1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp4ComboBox1.Dock")));
			this.tp4ComboBox1.Enabled = ((bool)(resources.GetObject("tp4ComboBox1.Enabled")));
			this.tp4ComboBox1.Font = ((System.Drawing.Font)(resources.GetObject("tp4ComboBox1.Font")));
			this.tp4ComboBox1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp4ComboBox1.ImeMode")));
			this.tp4ComboBox1.IntegralHeight = ((bool)(resources.GetObject("tp4ComboBox1.IntegralHeight")));
			this.tp4ComboBox1.ItemHeight = ((int)(resources.GetObject("tp4ComboBox1.ItemHeight")));
			this.tp4ComboBox1.Location = ((System.Drawing.Point)(resources.GetObject("tp4ComboBox1.Location")));
			this.tp4ComboBox1.MaxDropDownItems = ((int)(resources.GetObject("tp4ComboBox1.MaxDropDownItems")));
			this.tp4ComboBox1.MaxLength = ((int)(resources.GetObject("tp4ComboBox1.MaxLength")));
			this.tp4ComboBox1.Name = "tp4ComboBox1";
			this.tp4ComboBox1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp4ComboBox1.RightToLeft")));
			this.tp4ComboBox1.Size = ((System.Drawing.Size)(resources.GetObject("tp4ComboBox1.Size")));
			this.tp4ComboBox1.TabIndex = ((int)(resources.GetObject("tp4ComboBox1.TabIndex")));
			this.tp4ComboBox1.Text = resources.GetString("tp4ComboBox1.Text");
			this.toolTip1.SetToolTip(this.tp4ComboBox1, resources.GetString("tp4ComboBox1.ToolTip"));
			this.tp4ComboBox1.Visible = ((bool)(resources.GetObject("tp4ComboBox1.Visible")));
			// 
			// tp4UpDown1
			// 
			this.tp4UpDown1.AccessibleDescription = resources.GetString("tp4UpDown1.AccessibleDescription");
			this.tp4UpDown1.AccessibleName = resources.GetString("tp4UpDown1.AccessibleName");
			this.tp4UpDown1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp4UpDown1.Anchor")));
			this.tp4UpDown1.DecimalPlaces = 2;
			this.tp4UpDown1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp4UpDown1.Dock")));
			this.tp4UpDown1.Enabled = ((bool)(resources.GetObject("tp4UpDown1.Enabled")));
			this.tp4UpDown1.Font = ((System.Drawing.Font)(resources.GetObject("tp4UpDown1.Font")));
			this.tp4UpDown1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp4UpDown1.ImeMode")));
			this.tp4UpDown1.Location = ((System.Drawing.Point)(resources.GetObject("tp4UpDown1.Location")));
			this.tp4UpDown1.Maximum = new System.Decimal(new int[] {
																	   0,
																	   0,
																	   0,
																	   0});
			this.tp4UpDown1.Name = "tp4UpDown1";
			this.tp4UpDown1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp4UpDown1.RightToLeft")));
			this.tp4UpDown1.Size = ((System.Drawing.Size)(resources.GetObject("tp4UpDown1.Size")));
			this.tp4UpDown1.TabIndex = ((int)(resources.GetObject("tp4UpDown1.TabIndex")));
			this.tp4UpDown1.TextAlign = ((System.Windows.Forms.HorizontalAlignment)(resources.GetObject("tp4UpDown1.TextAlign")));
			this.tp4UpDown1.ThousandsSeparator = ((bool)(resources.GetObject("tp4UpDown1.ThousandsSeparator")));
			this.toolTip1.SetToolTip(this.tp4UpDown1, resources.GetString("tp4UpDown1.ToolTip"));
			this.tp4UpDown1.UpDownAlign = ((System.Windows.Forms.LeftRightAlignment)(resources.GetObject("tp4UpDown1.UpDownAlign")));
			this.tp4UpDown1.Visible = ((bool)(resources.GetObject("tp4UpDown1.Visible")));
			// 
			// sizeModeComboBox
			// 
			this.sizeModeComboBox.AccessibleDescription = resources.GetString("sizeModeComboBox.AccessibleDescription");
			this.sizeModeComboBox.AccessibleName = resources.GetString("sizeModeComboBox.AccessibleName");
			this.sizeModeComboBox.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("sizeModeComboBox.Anchor")));
			this.sizeModeComboBox.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("sizeModeComboBox.BackgroundImage")));
			this.sizeModeComboBox.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("sizeModeComboBox.Dock")));
			this.sizeModeComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.sizeModeComboBox.Enabled = ((bool)(resources.GetObject("sizeModeComboBox.Enabled")));
			this.sizeModeComboBox.Font = ((System.Drawing.Font)(resources.GetObject("sizeModeComboBox.Font")));
			this.sizeModeComboBox.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("sizeModeComboBox.ImeMode")));
			this.sizeModeComboBox.IntegralHeight = ((bool)(resources.GetObject("sizeModeComboBox.IntegralHeight")));
			this.sizeModeComboBox.ItemHeight = ((int)(resources.GetObject("sizeModeComboBox.ItemHeight")));
			this.sizeModeComboBox.Items.AddRange(new object[] {
																  resources.GetString("sizeModeComboBox.Items"),
																  resources.GetString("sizeModeComboBox.Items1"),
																  resources.GetString("sizeModeComboBox.Items2")});
			this.sizeModeComboBox.Location = ((System.Drawing.Point)(resources.GetObject("sizeModeComboBox.Location")));
			this.sizeModeComboBox.MaxDropDownItems = ((int)(resources.GetObject("sizeModeComboBox.MaxDropDownItems")));
			this.sizeModeComboBox.MaxLength = ((int)(resources.GetObject("sizeModeComboBox.MaxLength")));
			this.sizeModeComboBox.Name = "sizeModeComboBox";
			this.sizeModeComboBox.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("sizeModeComboBox.RightToLeft")));
			this.sizeModeComboBox.Size = ((System.Drawing.Size)(resources.GetObject("sizeModeComboBox.Size")));
			this.sizeModeComboBox.TabIndex = ((int)(resources.GetObject("sizeModeComboBox.TabIndex")));
			this.sizeModeComboBox.Text = resources.GetString("sizeModeComboBox.Text");
			this.toolTip1.SetToolTip(this.sizeModeComboBox, resources.GetString("sizeModeComboBox.ToolTip"));
			this.sizeModeComboBox.Visible = ((bool)(resources.GetObject("sizeModeComboBox.Visible")));
			this.sizeModeComboBox.SelectedIndexChanged += new System.EventHandler(this.sizeModeComboBox_SelectedIndexChanged);
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
			this.checkBox2.Click += new System.EventHandler(this.checkBox2_Click);
			// 
			// appearanceComboBox
			// 
			this.appearanceComboBox.AccessibleDescription = resources.GetString("appearanceComboBox.AccessibleDescription");
			this.appearanceComboBox.AccessibleName = resources.GetString("appearanceComboBox.AccessibleName");
			this.appearanceComboBox.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("appearanceComboBox.Anchor")));
			this.appearanceComboBox.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("appearanceComboBox.BackgroundImage")));
			this.appearanceComboBox.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("appearanceComboBox.Dock")));
			this.appearanceComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.appearanceComboBox.Enabled = ((bool)(resources.GetObject("appearanceComboBox.Enabled")));
			this.appearanceComboBox.Font = ((System.Drawing.Font)(resources.GetObject("appearanceComboBox.Font")));
			this.appearanceComboBox.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("appearanceComboBox.ImeMode")));
			this.appearanceComboBox.IntegralHeight = ((bool)(resources.GetObject("appearanceComboBox.IntegralHeight")));
			this.appearanceComboBox.ItemHeight = ((int)(resources.GetObject("appearanceComboBox.ItemHeight")));
			this.appearanceComboBox.Items.AddRange(new object[] {
																	resources.GetString("appearanceComboBox.Items"),
																	resources.GetString("appearanceComboBox.Items1"),
																	resources.GetString("appearanceComboBox.Items2")});
			this.appearanceComboBox.Location = ((System.Drawing.Point)(resources.GetObject("appearanceComboBox.Location")));
			this.appearanceComboBox.MaxDropDownItems = ((int)(resources.GetObject("appearanceComboBox.MaxDropDownItems")));
			this.appearanceComboBox.MaxLength = ((int)(resources.GetObject("appearanceComboBox.MaxLength")));
			this.appearanceComboBox.Name = "appearanceComboBox";
			this.appearanceComboBox.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("appearanceComboBox.RightToLeft")));
			this.appearanceComboBox.Size = ((System.Drawing.Size)(resources.GetObject("appearanceComboBox.Size")));
			this.appearanceComboBox.TabIndex = ((int)(resources.GetObject("appearanceComboBox.TabIndex")));
			this.appearanceComboBox.Text = resources.GetString("appearanceComboBox.Text");
			this.toolTip1.SetToolTip(this.appearanceComboBox, resources.GetString("appearanceComboBox.ToolTip"));
			this.appearanceComboBox.Visible = ((bool)(resources.GetObject("appearanceComboBox.Visible")));
			this.appearanceComboBox.SelectedIndexChanged += new System.EventHandler(this.appearanceComboBox_SelectedIndexChanged);
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
			// groupBox1
			// 
			this.groupBox1.AccessibleDescription = resources.GetString("groupBox1.AccessibleDescription");
			this.groupBox1.AccessibleName = resources.GetString("groupBox1.AccessibleName");
			this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("groupBox1.Anchor")));
			this.groupBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("groupBox1.BackgroundImage")));
			this.groupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.checkBox3,
																					this.label4,
																					this.trackBar,
																					this.label3,
																					this.label2,
																					this.label1,
																					this.sizeModeComboBox,
																					this.checkBox2,
																					this.alignmentComboBox,
																					this.appearanceComboBox,
																					this.checkBox1});
			this.groupBox1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("groupBox1.Dock")));
			this.groupBox1.Enabled = ((bool)(resources.GetObject("groupBox1.Enabled")));
			this.groupBox1.Font = ((System.Drawing.Font)(resources.GetObject("groupBox1.Font")));
			this.groupBox1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("groupBox1.ImeMode")));
			this.groupBox1.Location = ((System.Drawing.Point)(resources.GetObject("groupBox1.Location")));
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("groupBox1.RightToLeft")));
			this.groupBox1.Size = ((System.Drawing.Size)(resources.GetObject("groupBox1.Size")));
			this.groupBox1.TabIndex = ((int)(resources.GetObject("groupBox1.TabIndex")));
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = resources.GetString("groupBox1.Text");
			this.toolTip1.SetToolTip(this.groupBox1, resources.GetString("groupBox1.ToolTip"));
			this.groupBox1.Visible = ((bool)(resources.GetObject("groupBox1.Visible")));
			// 
			// checkBox3
			// 
			this.checkBox3.AccessibleDescription = resources.GetString("checkBox3.AccessibleDescription");
			this.checkBox3.AccessibleName = resources.GetString("checkBox3.AccessibleName");
			this.checkBox3.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("checkBox3.Anchor")));
			this.checkBox3.Appearance = ((System.Windows.Forms.Appearance)(resources.GetObject("checkBox3.Appearance")));
			this.checkBox3.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("checkBox3.BackgroundImage")));
			this.checkBox3.CheckAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("checkBox3.CheckAlign")));
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
			this.checkBox3.Click += new System.EventHandler(this.checkBox3_Click);
			// 
			// label3
			// 
			this.label3.AccessibleDescription = resources.GetString("label3.AccessibleDescription");
			this.label3.AccessibleName = resources.GetString("label3.AccessibleName");
			this.label3.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("label3.Anchor")));
			this.label3.AutoSize = ((bool)(resources.GetObject("label3.AutoSize")));
			this.label3.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("label3.Dock")));
			this.label3.Enabled = ((bool)(resources.GetObject("label3.Enabled")));
			this.label3.Font = ((System.Drawing.Font)(resources.GetObject("label3.Font")));
			this.label3.Image = ((System.Drawing.Image)(resources.GetObject("label3.Image")));
			this.label3.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("label3.ImageAlign")));
			this.label3.ImageIndex = ((int)(resources.GetObject("label3.ImageIndex")));
			this.label3.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("label3.ImeMode")));
			this.label3.Location = ((System.Drawing.Point)(resources.GetObject("label3.Location")));
			this.label3.Name = "label3";
			this.label3.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("label3.RightToLeft")));
			this.label3.Size = ((System.Drawing.Size)(resources.GetObject("label3.Size")));
			this.label3.TabIndex = ((int)(resources.GetObject("label3.TabIndex")));
			this.label3.Text = resources.GetString("label3.Text");
			this.label3.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("label3.TextAlign")));
			this.toolTip1.SetToolTip(this.label3, resources.GetString("label3.ToolTip"));
			this.label3.Visible = ((bool)(resources.GetObject("label3.Visible")));
			// 
			// tabPage1
			// 
			this.tabPage1.AccessibleDescription = resources.GetString("tabPage1.AccessibleDescription");
			this.tabPage1.AccessibleName = resources.GetString("tabPage1.AccessibleName");
			this.tabPage1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tabPage1.Anchor")));
			this.tabPage1.AutoScroll = ((bool)(resources.GetObject("tabPage1.AutoScroll")));
			this.tabPage1.AutoScrollMargin = ((System.Drawing.Size)(resources.GetObject("tabPage1.AutoScrollMargin")));
			this.tabPage1.AutoScrollMinSize = ((System.Drawing.Size)(resources.GetObject("tabPage1.AutoScrollMinSize")));
			this.tabPage1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tabPage1.BackgroundImage")));
			this.tabPage1.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.tp1GroupBox1});
			this.tabPage1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tabPage1.Dock")));
			this.tabPage1.Enabled = ((bool)(resources.GetObject("tabPage1.Enabled")));
			this.tabPage1.Font = ((System.Drawing.Font)(resources.GetObject("tabPage1.Font")));
			this.tabPage1.ImageIndex = ((int)(resources.GetObject("tabPage1.ImageIndex")));
			this.tabPage1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tabPage1.ImeMode")));
			this.tabPage1.Location = ((System.Drawing.Point)(resources.GetObject("tabPage1.Location")));
			this.tabPage1.Name = "tabPage1";
			this.tabPage1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tabPage1.RightToLeft")));
			this.tabPage1.Size = ((System.Drawing.Size)(resources.GetObject("tabPage1.Size")));
			this.tabPage1.TabIndex = ((int)(resources.GetObject("tabPage1.TabIndex")));
			this.tabPage1.Text = resources.GetString("tabPage1.Text");
			this.toolTip1.SetToolTip(this.tabPage1, resources.GetString("tabPage1.ToolTip"));
			this.tabPage1.ToolTipText = resources.GetString("tabPage1.ToolTipText");
			this.tabPage1.Visible = ((bool)(resources.GetObject("tabPage1.Visible")));
			// 
			// tp2RadioButton1
			// 
			this.tp2RadioButton1.AccessibleDescription = resources.GetString("tp2RadioButton1.AccessibleDescription");
			this.tp2RadioButton1.AccessibleName = resources.GetString("tp2RadioButton1.AccessibleName");
			this.tp2RadioButton1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp2RadioButton1.Anchor")));
			this.tp2RadioButton1.Appearance = ((System.Windows.Forms.Appearance)(resources.GetObject("tp2RadioButton1.Appearance")));
			this.tp2RadioButton1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tp2RadioButton1.BackgroundImage")));
			this.tp2RadioButton1.CheckAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp2RadioButton1.CheckAlign")));
			this.tp2RadioButton1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp2RadioButton1.Dock")));
			this.tp2RadioButton1.Enabled = ((bool)(resources.GetObject("tp2RadioButton1.Enabled")));
			this.tp2RadioButton1.FlatStyle = ((System.Windows.Forms.FlatStyle)(resources.GetObject("tp2RadioButton1.FlatStyle")));
			this.tp2RadioButton1.Font = ((System.Drawing.Font)(resources.GetObject("tp2RadioButton1.Font")));
			this.tp2RadioButton1.Image = ((System.Drawing.Image)(resources.GetObject("tp2RadioButton1.Image")));
			this.tp2RadioButton1.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp2RadioButton1.ImageAlign")));
			this.tp2RadioButton1.ImageIndex = ((int)(resources.GetObject("tp2RadioButton1.ImageIndex")));
			this.tp2RadioButton1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp2RadioButton1.ImeMode")));
			this.tp2RadioButton1.Location = ((System.Drawing.Point)(resources.GetObject("tp2RadioButton1.Location")));
			this.tp2RadioButton1.Name = "tp2RadioButton1";
			this.tp2RadioButton1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp2RadioButton1.RightToLeft")));
			this.tp2RadioButton1.Size = ((System.Drawing.Size)(resources.GetObject("tp2RadioButton1.Size")));
			this.tp2RadioButton1.TabIndex = ((int)(resources.GetObject("tp2RadioButton1.TabIndex")));
			this.tp2RadioButton1.Text = resources.GetString("tp2RadioButton1.Text");
			this.tp2RadioButton1.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp2RadioButton1.TextAlign")));
			this.toolTip1.SetToolTip(this.tp2RadioButton1, resources.GetString("tp2RadioButton1.ToolTip"));
			this.tp2RadioButton1.Visible = ((bool)(resources.GetObject("tp2RadioButton1.Visible")));
			// 
			// tp3ComboBox2
			// 
			this.tp3ComboBox2.AccessibleDescription = resources.GetString("tp3ComboBox2.AccessibleDescription");
			this.tp3ComboBox2.AccessibleName = resources.GetString("tp3ComboBox2.AccessibleName");
			this.tp3ComboBox2.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp3ComboBox2.Anchor")));
			this.tp3ComboBox2.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tp3ComboBox2.BackgroundImage")));
			this.tp3ComboBox2.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp3ComboBox2.Dock")));
			this.tp3ComboBox2.Enabled = ((bool)(resources.GetObject("tp3ComboBox2.Enabled")));
			this.tp3ComboBox2.Font = ((System.Drawing.Font)(resources.GetObject("tp3ComboBox2.Font")));
			this.tp3ComboBox2.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp3ComboBox2.ImeMode")));
			this.tp3ComboBox2.IntegralHeight = ((bool)(resources.GetObject("tp3ComboBox2.IntegralHeight")));
			this.tp3ComboBox2.ItemHeight = ((int)(resources.GetObject("tp3ComboBox2.ItemHeight")));
			this.tp3ComboBox2.Location = ((System.Drawing.Point)(resources.GetObject("tp3ComboBox2.Location")));
			this.tp3ComboBox2.MaxDropDownItems = ((int)(resources.GetObject("tp3ComboBox2.MaxDropDownItems")));
			this.tp3ComboBox2.MaxLength = ((int)(resources.GetObject("tp3ComboBox2.MaxLength")));
			this.tp3ComboBox2.Name = "tp3ComboBox2";
			this.tp3ComboBox2.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp3ComboBox2.RightToLeft")));
			this.tp3ComboBox2.Size = ((System.Drawing.Size)(resources.GetObject("tp3ComboBox2.Size")));
			this.tp3ComboBox2.TabIndex = ((int)(resources.GetObject("tp3ComboBox2.TabIndex")));
			this.tp3ComboBox2.Text = resources.GetString("tp3ComboBox2.Text");
			this.toolTip1.SetToolTip(this.tp3ComboBox2, resources.GetString("tp3ComboBox2.ToolTip"));
			this.tp3ComboBox2.Visible = ((bool)(resources.GetObject("tp3ComboBox2.Visible")));
			// 
			// pictureBox1
			// 
			this.pictureBox1.AccessibleDescription = resources.GetString("pictureBox1.AccessibleDescription");
			this.pictureBox1.AccessibleName = resources.GetString("pictureBox1.AccessibleName");
			this.pictureBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("pictureBox1.Anchor")));
			this.pictureBox1.BackColor = System.Drawing.SystemColors.ControlLightLight;
			this.pictureBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("pictureBox1.BackgroundImage")));
			this.pictureBox1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.pictureBox1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("pictureBox1.Dock")));
			this.pictureBox1.Enabled = ((bool)(resources.GetObject("pictureBox1.Enabled")));
			this.pictureBox1.Font = ((System.Drawing.Font)(resources.GetObject("pictureBox1.Font")));
			this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
			this.pictureBox1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("pictureBox1.ImeMode")));
			this.pictureBox1.Location = ((System.Drawing.Point)(resources.GetObject("pictureBox1.Location")));
			this.pictureBox1.Name = "pictureBox1";
			this.pictureBox1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("pictureBox1.RightToLeft")));
			this.pictureBox1.Size = ((System.Drawing.Size)(resources.GetObject("pictureBox1.Size")));
			this.pictureBox1.SizeMode = ((System.Windows.Forms.PictureBoxSizeMode)(resources.GetObject("pictureBox1.SizeMode")));
			this.pictureBox1.TabIndex = ((int)(resources.GetObject("pictureBox1.TabIndex")));
			this.pictureBox1.TabStop = false;
			this.pictureBox1.Text = resources.GetString("pictureBox1.Text");
			this.toolTip1.SetToolTip(this.pictureBox1, resources.GetString("pictureBox1.ToolTip"));
			this.pictureBox1.Visible = ((bool)(resources.GetObject("pictureBox1.Visible")));
			// 
			// tabPage4
			// 
			this.tabPage4.AccessibleDescription = resources.GetString("tabPage4.AccessibleDescription");
			this.tabPage4.AccessibleName = resources.GetString("tabPage4.AccessibleName");
			this.tabPage4.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tabPage4.Anchor")));
			this.tabPage4.AutoScroll = ((bool)(resources.GetObject("tabPage4.AutoScroll")));
			this.tabPage4.AutoScrollMargin = ((System.Drawing.Size)(resources.GetObject("tabPage4.AutoScrollMargin")));
			this.tabPage4.AutoScrollMinSize = ((System.Drawing.Size)(resources.GetObject("tabPage4.AutoScrollMinSize")));
			this.tabPage4.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tabPage4.BackgroundImage")));
			this.tabPage4.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.tp4GroupBox1});
			this.tabPage4.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tabPage4.Dock")));
			this.tabPage4.Enabled = ((bool)(resources.GetObject("tabPage4.Enabled")));
			this.tabPage4.Font = ((System.Drawing.Font)(resources.GetObject("tabPage4.Font")));
			this.tabPage4.ImageIndex = ((int)(resources.GetObject("tabPage4.ImageIndex")));
			this.tabPage4.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tabPage4.ImeMode")));
			this.tabPage4.Location = ((System.Drawing.Point)(resources.GetObject("tabPage4.Location")));
			this.tabPage4.Name = "tabPage4";
			this.tabPage4.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tabPage4.RightToLeft")));
			this.tabPage4.Size = ((System.Drawing.Size)(resources.GetObject("tabPage4.Size")));
			this.tabPage4.TabIndex = ((int)(resources.GetObject("tabPage4.TabIndex")));
			this.tabPage4.Text = resources.GetString("tabPage4.Text");
			this.toolTip1.SetToolTip(this.tabPage4, resources.GetString("tabPage4.ToolTip"));
			this.tabPage4.ToolTipText = resources.GetString("tabPage4.ToolTipText");
			this.tabPage4.Visible = ((bool)(resources.GetObject("tabPage4.Visible")));
			// 
			// tp5GroupBox1
			// 
			this.tp5GroupBox1.AccessibleDescription = resources.GetString("tp5GroupBox1.AccessibleDescription");
			this.tp5GroupBox1.AccessibleName = resources.GetString("tp5GroupBox1.AccessibleName");
			this.tp5GroupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp5GroupBox1.Anchor")));
			this.tp5GroupBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tp5GroupBox1.BackgroundImage")));
			this.tp5GroupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					   this.tp5DomainUpDown1});
			this.tp5GroupBox1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp5GroupBox1.Dock")));
			this.tp5GroupBox1.Enabled = ((bool)(resources.GetObject("tp5GroupBox1.Enabled")));
			this.tp5GroupBox1.Font = ((System.Drawing.Font)(resources.GetObject("tp5GroupBox1.Font")));
			this.tp5GroupBox1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp5GroupBox1.ImeMode")));
			this.tp5GroupBox1.Location = ((System.Drawing.Point)(resources.GetObject("tp5GroupBox1.Location")));
			this.tp5GroupBox1.Name = "tp5GroupBox1";
			this.tp5GroupBox1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp5GroupBox1.RightToLeft")));
			this.tp5GroupBox1.Size = ((System.Drawing.Size)(resources.GetObject("tp5GroupBox1.Size")));
			this.tp5GroupBox1.TabIndex = ((int)(resources.GetObject("tp5GroupBox1.TabIndex")));
			this.tp5GroupBox1.TabStop = false;
			this.tp5GroupBox1.Text = resources.GetString("tp5GroupBox1.Text");
			this.toolTip1.SetToolTip(this.tp5GroupBox1, resources.GetString("tp5GroupBox1.ToolTip"));
			this.tp5GroupBox1.Visible = ((bool)(resources.GetObject("tp5GroupBox1.Visible")));
			// 
			// tp2GroupBox1
			// 
			this.tp2GroupBox1.AccessibleDescription = resources.GetString("tp2GroupBox1.AccessibleDescription");
			this.tp2GroupBox1.AccessibleName = resources.GetString("tp2GroupBox1.AccessibleName");
			this.tp2GroupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp2GroupBox1.Anchor")));
			this.tp2GroupBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tp2GroupBox1.BackgroundImage")));
			this.tp2GroupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					   this.tp2ComboBox1,
																					   this.tp2RadioButton1,
																					   this.tp2RadioButton2});
			this.tp2GroupBox1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp2GroupBox1.Dock")));
			this.tp2GroupBox1.Enabled = ((bool)(resources.GetObject("tp2GroupBox1.Enabled")));
			this.tp2GroupBox1.Font = ((System.Drawing.Font)(resources.GetObject("tp2GroupBox1.Font")));
			this.tp2GroupBox1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp2GroupBox1.ImeMode")));
			this.tp2GroupBox1.Location = ((System.Drawing.Point)(resources.GetObject("tp2GroupBox1.Location")));
			this.tp2GroupBox1.Name = "tp2GroupBox1";
			this.tp2GroupBox1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp2GroupBox1.RightToLeft")));
			this.tp2GroupBox1.Size = ((System.Drawing.Size)(resources.GetObject("tp2GroupBox1.Size")));
			this.tp2GroupBox1.TabIndex = ((int)(resources.GetObject("tp2GroupBox1.TabIndex")));
			this.tp2GroupBox1.TabStop = false;
			this.tp2GroupBox1.Text = resources.GetString("tp2GroupBox1.Text");
			this.toolTip1.SetToolTip(this.tp2GroupBox1, resources.GetString("tp2GroupBox1.ToolTip"));
			this.tp2GroupBox1.Visible = ((bool)(resources.GetObject("tp2GroupBox1.Visible")));
			// 
			// tp3ComboBox1
			// 
			this.tp3ComboBox1.AccessibleDescription = resources.GetString("tp3ComboBox1.AccessibleDescription");
			this.tp3ComboBox1.AccessibleName = resources.GetString("tp3ComboBox1.AccessibleName");
			this.tp3ComboBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp3ComboBox1.Anchor")));
			this.tp3ComboBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tp3ComboBox1.BackgroundImage")));
			this.tp3ComboBox1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp3ComboBox1.Dock")));
			this.tp3ComboBox1.Enabled = ((bool)(resources.GetObject("tp3ComboBox1.Enabled")));
			this.tp3ComboBox1.Font = ((System.Drawing.Font)(resources.GetObject("tp3ComboBox1.Font")));
			this.tp3ComboBox1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp3ComboBox1.ImeMode")));
			this.tp3ComboBox1.IntegralHeight = ((bool)(resources.GetObject("tp3ComboBox1.IntegralHeight")));
			this.tp3ComboBox1.ItemHeight = ((int)(resources.GetObject("tp3ComboBox1.ItemHeight")));
			this.tp3ComboBox1.Location = ((System.Drawing.Point)(resources.GetObject("tp3ComboBox1.Location")));
			this.tp3ComboBox1.MaxDropDownItems = ((int)(resources.GetObject("tp3ComboBox1.MaxDropDownItems")));
			this.tp3ComboBox1.MaxLength = ((int)(resources.GetObject("tp3ComboBox1.MaxLength")));
			this.tp3ComboBox1.Name = "tp3ComboBox1";
			this.tp3ComboBox1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp3ComboBox1.RightToLeft")));
			this.tp3ComboBox1.Size = ((System.Drawing.Size)(resources.GetObject("tp3ComboBox1.Size")));
			this.tp3ComboBox1.TabIndex = ((int)(resources.GetObject("tp3ComboBox1.TabIndex")));
			this.tp3ComboBox1.Text = resources.GetString("tp3ComboBox1.Text");
			this.toolTip1.SetToolTip(this.tp3ComboBox1, resources.GetString("tp3ComboBox1.ToolTip"));
			this.tp3ComboBox1.Visible = ((bool)(resources.GetObject("tp3ComboBox1.Visible")));
			// 
			// tp3Button1
			// 
			this.tp3Button1.AccessibleDescription = resources.GetString("tp3Button1.AccessibleDescription");
			this.tp3Button1.AccessibleName = resources.GetString("tp3Button1.AccessibleName");
			this.tp3Button1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp3Button1.Anchor")));
			this.tp3Button1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tp3Button1.BackgroundImage")));
			this.tp3Button1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp3Button1.Dock")));
			this.tp3Button1.Enabled = ((bool)(resources.GetObject("tp3Button1.Enabled")));
			this.tp3Button1.FlatStyle = ((System.Windows.Forms.FlatStyle)(resources.GetObject("tp3Button1.FlatStyle")));
			this.tp3Button1.Font = ((System.Drawing.Font)(resources.GetObject("tp3Button1.Font")));
			this.tp3Button1.Image = ((System.Drawing.Image)(resources.GetObject("tp3Button1.Image")));
			this.tp3Button1.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp3Button1.ImageAlign")));
			this.tp3Button1.ImageIndex = ((int)(resources.GetObject("tp3Button1.ImageIndex")));
			this.tp3Button1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp3Button1.ImeMode")));
			this.tp3Button1.Location = ((System.Drawing.Point)(resources.GetObject("tp3Button1.Location")));
			this.tp3Button1.Name = "tp3Button1";
			this.tp3Button1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp3Button1.RightToLeft")));
			this.tp3Button1.Size = ((System.Drawing.Size)(resources.GetObject("tp3Button1.Size")));
			this.tp3Button1.TabIndex = ((int)(resources.GetObject("tp3Button1.TabIndex")));
			this.tp3Button1.Text = resources.GetString("tp3Button1.Text");
			this.tp3Button1.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp3Button1.TextAlign")));
			this.toolTip1.SetToolTip(this.tp3Button1, resources.GetString("tp3Button1.ToolTip"));
			this.tp3Button1.Visible = ((bool)(resources.GetObject("tp3Button1.Visible")));
			// 
			// tabControl1
			// 
			this.tabControl1.AccessibleDescription = resources.GetString("tabControl1.AccessibleDescription");
			this.tabControl1.AccessibleName = resources.GetString("tabControl1.AccessibleName");
			this.tabControl1.Alignment = ((System.Windows.Forms.TabAlignment)(resources.GetObject("tabControl1.Alignment")));
			this.tabControl1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tabControl1.Anchor")));
			this.tabControl1.Appearance = ((System.Windows.Forms.TabAppearance)(resources.GetObject("tabControl1.Appearance")));
			this.tabControl1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tabControl1.BackgroundImage")));
			this.tabControl1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					  this.tabPage1,
																					  this.tabPage2,
																					  this.tabPage3,
																					  this.tabPage4,
																					  this.tabPage5});
			this.tabControl1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tabControl1.Dock")));
			this.tabControl1.Enabled = ((bool)(resources.GetObject("tabControl1.Enabled")));
			this.tabControl1.Font = ((System.Drawing.Font)(resources.GetObject("tabControl1.Font")));
			this.tabControl1.ImageList = this.imageList1;
			this.tabControl1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tabControl1.ImeMode")));
			this.tabControl1.ItemSize = ((System.Drawing.Size)(resources.GetObject("tabControl1.ItemSize")));
			this.tabControl1.Location = ((System.Drawing.Point)(resources.GetObject("tabControl1.Location")));
			this.tabControl1.Name = "tabControl1";
			this.tabControl1.Padding = ((System.Drawing.Point)(resources.GetObject("tabControl1.Padding")));
			this.tabControl1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tabControl1.RightToLeft")));
			this.tabControl1.SelectedIndex = 0;
			this.tabControl1.ShowToolTips = ((bool)(resources.GetObject("tabControl1.ShowToolTips")));
			this.tabControl1.Size = ((System.Drawing.Size)(resources.GetObject("tabControl1.Size")));
			this.tabControl1.TabIndex = ((int)(resources.GetObject("tabControl1.TabIndex")));
			this.tabControl1.Text = resources.GetString("tabControl1.Text");
			this.toolTip1.SetToolTip(this.tabControl1, resources.GetString("tabControl1.ToolTip"));
			this.tabControl1.Visible = ((bool)(resources.GetObject("tabControl1.Visible")));
			// 
			// tabPage2
			// 
			this.tabPage2.AccessibleDescription = resources.GetString("tabPage2.AccessibleDescription");
			this.tabPage2.AccessibleName = resources.GetString("tabPage2.AccessibleName");
			this.tabPage2.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tabPage2.Anchor")));
			this.tabPage2.AutoScroll = ((bool)(resources.GetObject("tabPage2.AutoScroll")));
			this.tabPage2.AutoScrollMargin = ((System.Drawing.Size)(resources.GetObject("tabPage2.AutoScrollMargin")));
			this.tabPage2.AutoScrollMinSize = ((System.Drawing.Size)(resources.GetObject("tabPage2.AutoScrollMinSize")));
			this.tabPage2.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tabPage2.BackgroundImage")));
			this.tabPage2.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.tp2GroupBox1});
			this.tabPage2.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tabPage2.Dock")));
			this.tabPage2.Enabled = ((bool)(resources.GetObject("tabPage2.Enabled")));
			this.tabPage2.Font = ((System.Drawing.Font)(resources.GetObject("tabPage2.Font")));
			this.tabPage2.ImageIndex = ((int)(resources.GetObject("tabPage2.ImageIndex")));
			this.tabPage2.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tabPage2.ImeMode")));
			this.tabPage2.Location = ((System.Drawing.Point)(resources.GetObject("tabPage2.Location")));
			this.tabPage2.Name = "tabPage2";
			this.tabPage2.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tabPage2.RightToLeft")));
			this.tabPage2.Size = ((System.Drawing.Size)(resources.GetObject("tabPage2.Size")));
			this.tabPage2.TabIndex = ((int)(resources.GetObject("tabPage2.TabIndex")));
			this.tabPage2.Text = resources.GetString("tabPage2.Text");
			this.toolTip1.SetToolTip(this.tabPage2, resources.GetString("tabPage2.ToolTip"));
			this.tabPage2.ToolTipText = resources.GetString("tabPage2.ToolTipText");
			this.tabPage2.Visible = ((bool)(resources.GetObject("tabPage2.Visible")));
			// 
			// tabPage3
			// 
			this.tabPage3.AccessibleDescription = resources.GetString("tabPage3.AccessibleDescription");
			this.tabPage3.AccessibleName = resources.GetString("tabPage3.AccessibleName");
			this.tabPage3.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tabPage3.Anchor")));
			this.tabPage3.AutoScroll = ((bool)(resources.GetObject("tabPage3.AutoScroll")));
			this.tabPage3.AutoScrollMargin = ((System.Drawing.Size)(resources.GetObject("tabPage3.AutoScrollMargin")));
			this.tabPage3.AutoScrollMinSize = ((System.Drawing.Size)(resources.GetObject("tabPage3.AutoScrollMinSize")));
			this.tabPage3.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tabPage3.BackgroundImage")));
			this.tabPage3.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.tp3GroupBox1});
			this.tabPage3.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tabPage3.Dock")));
			this.tabPage3.Enabled = ((bool)(resources.GetObject("tabPage3.Enabled")));
			this.tabPage3.Font = ((System.Drawing.Font)(resources.GetObject("tabPage3.Font")));
			this.tabPage3.ImageIndex = ((int)(resources.GetObject("tabPage3.ImageIndex")));
			this.tabPage3.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tabPage3.ImeMode")));
			this.tabPage3.Location = ((System.Drawing.Point)(resources.GetObject("tabPage3.Location")));
			this.tabPage3.Name = "tabPage3";
			this.tabPage3.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tabPage3.RightToLeft")));
			this.tabPage3.Size = ((System.Drawing.Size)(resources.GetObject("tabPage3.Size")));
			this.tabPage3.TabIndex = ((int)(resources.GetObject("tabPage3.TabIndex")));
			this.tabPage3.Text = resources.GetString("tabPage3.Text");
			this.toolTip1.SetToolTip(this.tabPage3, resources.GetString("tabPage3.ToolTip"));
			this.tabPage3.ToolTipText = resources.GetString("tabPage3.ToolTipText");
			this.tabPage3.Visible = ((bool)(resources.GetObject("tabPage3.Visible")));
			// 
			// tp3GroupBox1
			// 
			this.tp3GroupBox1.AccessibleDescription = resources.GetString("tp3GroupBox1.AccessibleDescription");
			this.tp3GroupBox1.AccessibleName = resources.GetString("tp3GroupBox1.AccessibleName");
			this.tp3GroupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp3GroupBox1.Anchor")));
			this.tp3GroupBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tp3GroupBox1.BackgroundImage")));
			this.tp3GroupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					   this.tp3ComboBox2,
																					   this.tp3Label1,
																					   this.tp3RadioButton2,
																					   this.tp3Button1,
																					   this.tp3ComboBox1,
																					   this.tp3RadioButton1});
			this.tp3GroupBox1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp3GroupBox1.Dock")));
			this.tp3GroupBox1.Enabled = ((bool)(resources.GetObject("tp3GroupBox1.Enabled")));
			this.tp3GroupBox1.Font = ((System.Drawing.Font)(resources.GetObject("tp3GroupBox1.Font")));
			this.tp3GroupBox1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp3GroupBox1.ImeMode")));
			this.tp3GroupBox1.Location = ((System.Drawing.Point)(resources.GetObject("tp3GroupBox1.Location")));
			this.tp3GroupBox1.Name = "tp3GroupBox1";
			this.tp3GroupBox1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp3GroupBox1.RightToLeft")));
			this.tp3GroupBox1.Size = ((System.Drawing.Size)(resources.GetObject("tp3GroupBox1.Size")));
			this.tp3GroupBox1.TabIndex = ((int)(resources.GetObject("tp3GroupBox1.TabIndex")));
			this.tp3GroupBox1.TabStop = false;
			this.tp3GroupBox1.Text = resources.GetString("tp3GroupBox1.Text");
			this.toolTip1.SetToolTip(this.tp3GroupBox1, resources.GetString("tp3GroupBox1.ToolTip"));
			this.tp3GroupBox1.Visible = ((bool)(resources.GetObject("tp3GroupBox1.Visible")));
			// 
			// tp3Label1
			// 
			this.tp3Label1.AccessibleDescription = resources.GetString("tp3Label1.AccessibleDescription");
			this.tp3Label1.AccessibleName = resources.GetString("tp3Label1.AccessibleName");
			this.tp3Label1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tp3Label1.Anchor")));
			this.tp3Label1.AutoSize = ((bool)(resources.GetObject("tp3Label1.AutoSize")));
			this.tp3Label1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tp3Label1.Dock")));
			this.tp3Label1.Enabled = ((bool)(resources.GetObject("tp3Label1.Enabled")));
			this.tp3Label1.Font = ((System.Drawing.Font)(resources.GetObject("tp3Label1.Font")));
			this.tp3Label1.Image = ((System.Drawing.Image)(resources.GetObject("tp3Label1.Image")));
			this.tp3Label1.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp3Label1.ImageAlign")));
			this.tp3Label1.ImageIndex = ((int)(resources.GetObject("tp3Label1.ImageIndex")));
			this.tp3Label1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tp3Label1.ImeMode")));
			this.tp3Label1.Location = ((System.Drawing.Point)(resources.GetObject("tp3Label1.Location")));
			this.tp3Label1.Name = "tp3Label1";
			this.tp3Label1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tp3Label1.RightToLeft")));
			this.tp3Label1.Size = ((System.Drawing.Size)(resources.GetObject("tp3Label1.Size")));
			this.tp3Label1.TabIndex = ((int)(resources.GetObject("tp3Label1.TabIndex")));
			this.tp3Label1.Text = resources.GetString("tp3Label1.Text");
			this.tp3Label1.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("tp3Label1.TextAlign")));
			this.toolTip1.SetToolTip(this.tp3Label1, resources.GetString("tp3Label1.ToolTip"));
			this.tp3Label1.Visible = ((bool)(resources.GetObject("tp3Label1.Visible")));
			// 
			// tabPage5
			// 
			this.tabPage5.AccessibleDescription = resources.GetString("tabPage5.AccessibleDescription");
			this.tabPage5.AccessibleName = resources.GetString("tabPage5.AccessibleName");
			this.tabPage5.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("tabPage5.Anchor")));
			this.tabPage5.AutoScroll = ((bool)(resources.GetObject("tabPage5.AutoScroll")));
			this.tabPage5.AutoScrollMargin = ((System.Drawing.Size)(resources.GetObject("tabPage5.AutoScrollMargin")));
			this.tabPage5.AutoScrollMinSize = ((System.Drawing.Size)(resources.GetObject("tabPage5.AutoScrollMinSize")));
			this.tabPage5.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("tabPage5.BackgroundImage")));
			this.tabPage5.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.tp5GroupBox1});
			this.tabPage5.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("tabPage5.Dock")));
			this.tabPage5.Enabled = ((bool)(resources.GetObject("tabPage5.Enabled")));
			this.tabPage5.Font = ((System.Drawing.Font)(resources.GetObject("tabPage5.Font")));
			this.tabPage5.ImageIndex = ((int)(resources.GetObject("tabPage5.ImageIndex")));
			this.tabPage5.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("tabPage5.ImeMode")));
			this.tabPage5.Location = ((System.Drawing.Point)(resources.GetObject("tabPage5.Location")));
			this.tabPage5.Name = "tabPage5";
			this.tabPage5.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("tabPage5.RightToLeft")));
			this.tabPage5.Size = ((System.Drawing.Size)(resources.GetObject("tabPage5.Size")));
			this.tabPage5.TabIndex = ((int)(resources.GetObject("tabPage5.TabIndex")));
			this.tabPage5.Text = resources.GetString("tabPage5.Text");
			this.toolTip1.SetToolTip(this.tabPage5, resources.GetString("tabPage5.ToolTip"));
			this.tabPage5.ToolTipText = resources.GetString("tabPage5.ToolTipText");
			this.tabPage5.Visible = ((bool)(resources.GetObject("tabPage5.Visible")));
			// 
			// TabControlCtl
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
																		  this.tabControl1,
																		  this.pictureBox1,
																		  this.groupBox1});
			this.Enabled = ((bool)(resources.GetObject("$this.Enabled")));
			this.Font = ((System.Drawing.Font)(resources.GetObject("$this.Font")));
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("$this.ImeMode")));
			this.Location = ((System.Drawing.Point)(resources.GetObject("$this.Location")));
			this.MaximumSize = ((System.Drawing.Size)(resources.GetObject("$this.MaximumSize")));
			this.MinimumSize = ((System.Drawing.Size)(resources.GetObject("$this.MinimumSize")));
			this.Name = "TabControlCtl";
			this.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("$this.RightToLeft")));
			this.StartPosition = ((System.Windows.Forms.FormStartPosition)(resources.GetObject("$this.StartPosition")));
			this.Text = resources.GetString("$this.Text");
			this.toolTip1.SetToolTip(this, resources.GetString("$this.ToolTip"));
			this.tp1GroupBox1.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.trackBar)).EndInit();
			this.tp4GroupBox1.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.tp4UpDown1)).EndInit();
			this.groupBox1.ResumeLayout(false);
			this.tabPage1.ResumeLayout(false);
			this.tabPage4.ResumeLayout(false);
			this.tp5GroupBox1.ResumeLayout(false);
			this.tp2GroupBox1.ResumeLayout(false);
			this.tabControl1.ResumeLayout(false);
			this.tabPage2.ResumeLayout(false);
			this.tabPage3.ResumeLayout(false);
			this.tp3GroupBox1.ResumeLayout(false);
			this.tabPage5.ResumeLayout(false);
			this.ResumeLayout(false);

		}

        // The main entry point for the application.
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new TabControlCtl());
        }

    }








