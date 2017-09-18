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
    using System.Resources;
    using System.Windows.Forms;

    // <doc>
    // <desc>
    //     This class demonstrates the StatusBar control.
    // </desc>
    // </doc>
    //
    public class StatusBarCtl : System.Windows.Forms.Form {

        public StatusBarCtl() : base() {
            //
            // Required for Windows Forms Designer support
            //
            InitializeComponent();

            trackBar.Maximum = panel1.Width;
            trackBar.Minimum = panel1.Width/2;
            comboBox1.SelectedIndex = 0;
            comboBox2.SelectedIndex = 1;
            trackBar.Value = panel1.Width;

            //Set the initial state of the Keyboard Status StatusBarPanel
            this.sbPnlInsOvr.Text = "OVR";
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

        private void chkSizingGrip_Click(object sender, EventArgs e) {
            statusBar.SizingGrip = chkSizingGrip.Checked;
        }

        private void chkShowPanels_Click(object sender, EventArgs e) {
            statusBar.ShowPanels = chkShowPanels.Checked;
        }

        private void trackBar1_Scroll(object sender, EventArgs e) {
            panel1.Width = trackBar.Value;
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e) {
            this.statusBarPanel1.BorderStyle = (StatusBarPanelBorderStyle)(comboBox1.SelectedIndex+1);
        }

        private void statusBarSample_KeyUp(object sender, KeyEventArgs e) {
            if (e.KeyCode == Keys.Insert) {
                string s = this.sbPnlInsOvr.Text;
                if (s.Equals("INS"))
                    this.sbPnlInsOvr.Text = "OVR";
                else
                    this.sbPnlInsOvr.Text = "INS";
            }
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e) {
            sbPnlTime.AutoSize = (StatusBarPanelAutoSize)comboBox2.SelectedIndex+1;
        }

        private void timer1_Timer(object sender, EventArgs e) {
            DateTime t = DateTime.Now;
            string s = t.ToLongTimeString() ;
            sbPnlTime.Text = s ;
        }

        private System.ComponentModel.Container components;
        protected internal System.Windows.Forms.Panel panel1;
        protected internal System.Windows.Forms.GroupBox groupBox1;
        protected internal System.Windows.Forms.GroupBox groupBox2;
        protected internal System.Windows.Forms.StatusBar statusBar;
        protected internal System.Windows.Forms.CheckBox chkSizingGrip;
        protected internal System.Windows.Forms.StatusBarPanel statusBarPanel1;
        protected internal System.Windows.Forms.StatusBarPanel sbPnlTime;
        protected internal System.Windows.Forms.StatusBarPanel sbPnlInsOvr;
        protected internal System.Windows.Forms.TrackBar trackBar;
        protected internal System.Windows.Forms.CheckBox chkShowPanels;
        protected internal System.Windows.Forms.Label label1;
        protected internal System.Windows.Forms.Label label2;
        protected internal System.Windows.Forms.Label label4;
        protected internal System.Windows.Forms.ComboBox comboBox1;
        protected internal System.Windows.Forms.GroupBox groupBox3;
        protected internal System.Windows.Forms.ComboBox comboBox2;
        protected internal System.Windows.Forms.ToolTip toolTip1;
        protected internal System.Windows.Forms.Timer timer1;
        protected internal System.Windows.Forms.Label label3;
        protected internal System.Windows.Forms.Label label6;

        /// <summary>
        ///    Required method for Designer support - do not modify
        ///    the contents of this method with the code editor
        /// </summary>
        private void InitializeComponent() {
            System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(StatusBarCtl));

            this.components = new System.ComponentModel.Container();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.comboBox2 = new System.Windows.Forms.ComboBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.trackBar = new System.Windows.Forms.TrackBar();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.toolTip1 = new System.Windows.Forms.ToolTip(components);
            this.chkShowPanels = new System.Windows.Forms.CheckBox();
            this.chkSizingGrip = new System.Windows.Forms.CheckBox();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.sbPnlTime = new System.Windows.Forms.StatusBarPanel();
            this.label3 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.timer1 = new System.Windows.Forms.Timer(components);
            this.label4 = new System.Windows.Forms.Label();
            this.statusBar = new System.Windows.Forms.StatusBar();
            this.label6 = new System.Windows.Forms.Label();
            this.sbPnlInsOvr = new System.Windows.Forms.StatusBarPanel();
            this.statusBarPanel1 = new System.Windows.Forms.StatusBarPanel();
            this.label2 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();

            groupBox3.TabIndex = 2;
            groupBox3.Size = new System.Drawing.Size(216, 8);
            groupBox3.TabStop = false;
            groupBox3.Location = new System.Drawing.Point(16, 120);
            groupBox3.Text = " ";

            comboBox2.ForeColor = (Color)System.Drawing.SystemColors.WindowText;
            comboBox2.Location = new System.Drawing.Point(128, 144);
            comboBox2.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            comboBox2.TabIndex = 5;
            comboBox2.Text = "";
            comboBox2.Size = new System.Drawing.Size(104, 21);
            toolTip1.SetToolTip(comboBox2, "Determines how a panel will resize when the prent changes size.");
            comboBox2.SelectedIndexChanged += new EventHandler(comboBox2_SelectedIndexChanged);
            comboBox2.Items.AddRange((object[])new object[] {"None", "Spring", "Contents"});

            groupBox2.TabIndex = 11;
            groupBox2.Size = new System.Drawing.Size(216, 8);
            groupBox2.TabStop = false;
            groupBox2.Location = new System.Drawing.Point(16, 64);
            groupBox2.Text = " ";

            trackBar.Location = new System.Drawing.Point(16, 208);
            trackBar.TickFrequency = 10;
            trackBar.TabIndex = 10;
            trackBar.TabStop = false;
            trackBar.SmallChange = 10;
            trackBar.Text = "trackBar";
            trackBar.Size = new System.Drawing.Size(216, 42);
            trackBar.Scroll += new EventHandler(trackBar1_Scroll);
            trackBar.KeyUp += new KeyEventHandler(statusBarSample_KeyUp);
                      trackBar.BackColor = System.Drawing.SystemColors.Control;

            groupBox1.TabIndex = 1;
            groupBox1.Size = new System.Drawing.Size(248, 264);
            groupBox1.Anchor = AnchorStyles.Top | AnchorStyles.Left;
            groupBox1.TabStop = false;
            groupBox1.Location = new System.Drawing.Point(248, 16);
            groupBox1.Text = "StatusBar";

            toolTip1.Active = true;

            chkShowPanels.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            chkShowPanels.Location = new System.Drawing.Point(16, 40);
            chkShowPanels.TabIndex = 9;
            chkShowPanels.CheckState = System.Windows.Forms.CheckState.Checked;
            chkShowPanels.Text = "Show&Panels";
            chkShowPanels.Size = new System.Drawing.Size(96, 16);
            chkShowPanels.Checked = true;
            toolTip1.SetToolTip(chkShowPanels, "Determines if a status bar displays panels, or if it displays a single line of text.");
            chkShowPanels.Click += new EventHandler(chkShowPanels_Click);
            chkShowPanels.KeyUp += new KeyEventHandler(statusBarSample_KeyUp);

            chkSizingGrip.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            chkSizingGrip.Location = new System.Drawing.Point(16, 16);
            chkSizingGrip.TabIndex = 8;
            chkSizingGrip.CheckState = System.Windows.Forms.CheckState.Checked;
            chkSizingGrip.Text = "Sizing&Grip";
            chkSizingGrip.Size = new System.Drawing.Size(100, 16);
            chkSizingGrip.Checked = true;
            toolTip1.SetToolTip(chkSizingGrip, "Determines whether a status bar has a sizing grip.");
            chkSizingGrip.Click += new EventHandler(chkSizingGrip_Click);
            chkSizingGrip.KeyUp += new KeyEventHandler(statusBarSample_KeyUp);

            comboBox1.ForeColor = (Color)System.Drawing.SystemColors.WindowText;
            comboBox1.Location = new System.Drawing.Point(128, 88);
            comboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            comboBox1.TabIndex = 3;
            comboBox1.Text = "";
            comboBox1.Size = new System.Drawing.Size(104, 21);
            toolTip1.SetToolTip(comboBox1, "Determines what type of border a panel has.");
            comboBox1.KeyUp += new KeyEventHandler(statusBarSample_KeyUp);
            comboBox1.SelectedIndexChanged += new EventHandler(comboBox1_SelectedIndexChanged);
            comboBox1.Items.AddRange((object[])new object[] {"None", "Raised", "Sunken"});

            sbPnlTime.Alignment = System.Windows.Forms.HorizontalAlignment.Right;
            sbPnlTime.Width = 76;
            sbPnlTime.Text = "sbPnlTime";

            label3.Location = new System.Drawing.Point(26, 64);
            label3.AutoSize = true;
            label3.TabIndex = 6;
            label3.TabStop = false;
            label3.Text = "\"Ready\" StatusBarPanel ";
            label3.Size = new System.Drawing.Size(120, 13);

            this.TabIndex = 0;
            this.Size = new System.Drawing.Size(512, 320);
            this.Text = "StatusBar";
            this.KeyUp += new KeyEventHandler(statusBarSample_KeyUp);

            label1.Location = new System.Drawing.Point(16, 184);
            label1.TabIndex = 1;
            label1.TabStop = false;
            label1.Text = "Panel Width:";
            label1.Size = new System.Drawing.Size(72, 16);

            timer1.Interval = 1000;
            timer1.Enabled = true;
            timer1.Tick += new EventHandler(timer1_Timer);

            label4.Location = new System.Drawing.Point(16, 144);
            label4.TabIndex = 7;
            label4.TabStop = false;
            label4.Text = "&AutoSize";
            label4.Size = new System.Drawing.Size(72, 16);

            statusBar.ShowPanels = true;
            statusBar.TabIndex = 0;
            statusBar.Size = new System.Drawing.Size(212, 20);
            statusBar.Location = new System.Drawing.Point(0, 216);
            statusBar.BackColor = (Color)System.Drawing.SystemColors.Control;
            statusBar.Text = "StatusBar";
            statusBar.Panels.AddRange((StatusBarPanel[])new StatusBarPanel[] {statusBarPanel1, sbPnlTime, sbPnlInsOvr});

            label6.Location = new System.Drawing.Point(26, 120);
            label6.AutoSize = true;
            label6.TabIndex = 4;
            label6.TabStop = false;
            label6.Text = "\"Time\" StatusBarPanel ";
            label6.Size = new System.Drawing.Size(112, 13);

            sbPnlInsOvr.AutoSize = StatusBarPanelAutoSize.Contents;
            sbPnlInsOvr.Width = 20;

            statusBarPanel1.BorderStyle = StatusBarPanelBorderStyle.None;
            statusBarPanel1.Icon = (System.Drawing.Icon)resources.GetObject("statusBarPanel1.Icon");
            statusBarPanel1.AutoSize = StatusBarPanelAutoSize.Contents;
            statusBarPanel1.Width = 62;
            statusBarPanel1.Text = "Ready";

            label2.Location = new System.Drawing.Point(16, 88);
            label2.TabIndex = 0;
            label2.TabStop = false;
            label2.Text = "&BorderStyle";
            label2.Size = new System.Drawing.Size(64, 16);

            panel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            panel1.TabIndex = 0;
            panel1.Size = new System.Drawing.Size(216, 240);
            panel1.Location = new System.Drawing.Point(16, 24);
            panel1.BackColor = (Color)System.Drawing.SystemColors.Window;
            panel1.Text = "Panel1";

            this.Controls.Add(groupBox1);
            this.Controls.Add(panel1);
            panel1.Controls.Add(statusBar);
            groupBox1.Controls.Add(trackBar);
            groupBox1.Controls.Add(label6);
            groupBox1.Controls.Add(label3);
            groupBox1.Controls.Add(comboBox2);
            groupBox1.Controls.Add(label4);
            groupBox1.Controls.Add(groupBox3);
            groupBox1.Controls.Add(comboBox1);
            groupBox1.Controls.Add(label2);
            groupBox1.Controls.Add(groupBox2);
            groupBox1.Controls.Add(label1);
            groupBox1.Controls.Add(chkShowPanels);
            groupBox1.Controls.Add(chkSizingGrip);

        }

        // The main entry point for the application.
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new StatusBarCtl());
        }
    }
