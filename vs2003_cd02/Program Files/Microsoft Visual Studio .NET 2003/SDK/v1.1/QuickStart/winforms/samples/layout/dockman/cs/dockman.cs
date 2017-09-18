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


namespace Microsoft.Samples.WinForms.Cs.DockMan {
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;

    public class DockMan : System.Windows.Forms.Form {
        /// <summary>
        ///    Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components;
        protected internal System.Windows.Forms.Panel panel1;
        protected internal System.Windows.Forms.Panel panel2;
        protected internal System.Windows.Forms.GroupBox groupBox1;
        protected internal System.Windows.Forms.GroupBox groupBox2;
        protected internal System.Windows.Forms.ToolTip toolTip1;
        protected internal System.Windows.Forms.Button btnDemo;
        protected internal System.Windows.Forms.RadioButton rdbSet;
        protected internal System.Windows.Forms.RadioButton rdbNone;
        protected internal System.Windows.Forms.RadioButton rdbTop;
        protected internal System.Windows.Forms.RadioButton rdbLeft;
        protected internal System.Windows.Forms.RadioButton rdbBottom;
        protected internal System.Windows.Forms.RadioButton rdbRight;
        protected internal System.Windows.Forms.RadioButton rdbFill;
        protected internal System.Windows.Forms.CheckBox chkTop;
        protected internal System.Windows.Forms.CheckBox chkLeft;
        protected internal System.Windows.Forms.CheckBox chkBottom;
        protected internal System.Windows.Forms.CheckBox chkRight;

        // <doc>
        // <desc>
        //     Public Constructor
        // </desc>
        // </doc>
        //
        public DockMan() {

            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            // Wire up event handlers
            rdbRight.Click += new System.EventHandler(radiobutton_Click);
            rdbFill.Click += new System.EventHandler(radiobutton_Click);
            rdbBottom.Click += new System.EventHandler(radiobutton_Click);
            rdbNone.Click += new System.EventHandler(radiobutton_Click);
            rdbLeft.Click += new System.EventHandler(radiobutton_Click);
            chkTop.Click += new System.EventHandler(checkbox_Click);
            chkLeft.Click += new System.EventHandler(checkbox_Click);
            chkRight.Click += new System.EventHandler(checkbox_Click);
            chkBottom.Click += new System.EventHandler(checkbox_Click);
            rdbTop.Click += new System.EventHandler(radiobutton_Click);

            // Complete intialization of the form
            rdbSet = rdbNone;
            ApplyChanges();
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
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container ();
            this.rdbRight = new System.Windows.Forms.RadioButton ();
            this.groupBox1 = new System.Windows.Forms.GroupBox ();
            this.panel2 = new System.Windows.Forms.Panel ();
            this.rdbNone = new System.Windows.Forms.RadioButton ();
            this.groupBox2 = new System.Windows.Forms.GroupBox ();
            this.btnDemo = new System.Windows.Forms.Button ();
            this.rdbSet = new System.Windows.Forms.RadioButton ();
            this.toolTip1 = new System.Windows.Forms.ToolTip (this.components);
            this.rdbBottom = new System.Windows.Forms.RadioButton ();
            this.chkBottom = new System.Windows.Forms.CheckBox ();
            this.rdbTop = new System.Windows.Forms.RadioButton ();
            this.rdbLeft = new System.Windows.Forms.RadioButton ();
            this.chkLeft = new System.Windows.Forms.CheckBox ();
            this.chkTop = new System.Windows.Forms.CheckBox ();
            this.rdbFill = new System.Windows.Forms.RadioButton ();
            this.chkRight = new System.Windows.Forms.CheckBox ();
            this.panel1 = new System.Windows.Forms.Panel ();
            this.Text = "Docking and Anchoring Example";
            this.AutoScaleBaseSize = new System.Drawing.Size (5, 13);
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Show;
            this.Location = new System.Drawing.Point (100, 100);
            this.ClientSize = new System.Drawing.Size (448, 400);
            rdbRight.Location = new System.Drawing.Point (8, 120);
            rdbRight.Size = new System.Drawing.Size (72, 24);
            rdbRight.TabIndex = 4;
            rdbRight.Text = "&Right";
            groupBox1.Location = new System.Drawing.Point (16, 16);
            groupBox1.Size = new System.Drawing.Size (88, 128);
            groupBox1.TabIndex = 0;
            groupBox1.TabStop = false;
            groupBox1.Text = "A&nchor";
            panel2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            panel2.Dock = System.Windows.Forms.DockStyle.Right;
            toolTip1.SetToolTip (panel2, "Resize the form to see the layout effects.");
            panel2.Location = new System.Drawing.Point (325, 0);
            panel2.Size = new System.Drawing.Size (120, 400);
            panel2.TabIndex = 0;
            panel2.Text = "ControlsPanel";
            rdbNone.Location = new System.Drawing.Point (8, 24);
            rdbNone.Size = new System.Drawing.Size (72, 24);
            rdbNone.TabIndex = 5;
            rdbNone.TabStop = true;
            rdbNone.Text = "&None";
            rdbNone.Checked = true;
            groupBox2.Location = new System.Drawing.Point (16, 152);
            groupBox2.Size = new System.Drawing.Size (88, 176);
            groupBox2.TabIndex = 1;
            groupBox2.TabStop = false;
            groupBox2.Text = "&Dock";
            btnDemo.BackColor = System.Drawing.SystemColors.Control;
            toolTip1.SetToolTip (btnDemo, "Nothing happens if you click this button.");
            btnDemo.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            btnDemo.Size = new System.Drawing.Size (120, 24);
            btnDemo.TabIndex = 0;
            btnDemo.Anchor = System.Windows.Forms.AnchorStyles.None;
            btnDemo.Text = "Demo Button";
            rdbSet.Size = new System.Drawing.Size (100, 23);
            rdbSet.TabIndex = 0;
            rdbSet.Text = "rdbSet";
            toolTip1.Active = true;
            rdbBottom.Location = new System.Drawing.Point (8, 96);
            rdbBottom.Size = new System.Drawing.Size (72, 24);
            rdbBottom.TabIndex = 1;
            rdbBottom.Text = "&Bottom";
            chkBottom.Location = new System.Drawing.Point (8, 72);
            chkBottom.Size = new System.Drawing.Size (72, 24);
            chkBottom.TabIndex = 3;
            chkBottom.Text = "&Bottom";
            rdbTop.Location = new System.Drawing.Point (8, 48);
            rdbTop.Size = new System.Drawing.Size (72, 24);
            rdbTop.TabIndex = 0;
            rdbTop.Text = "&Top";
            rdbLeft.Location = new System.Drawing.Point (8, 72);
            rdbLeft.Size = new System.Drawing.Size (72, 24);
            rdbLeft.TabIndex = 3;
            rdbLeft.Text = "&Left";
            chkLeft.Location = new System.Drawing.Point (8, 48);
            chkLeft.Size = new System.Drawing.Size (72, 24);
            chkLeft.TabIndex = 2;
            chkLeft.Text = "&Left";
            chkTop.Location = new System.Drawing.Point (8, 24);
            chkTop.Size = new System.Drawing.Size (72, 24);
            chkTop.TabIndex = 0;
            chkTop.Text = "&Top";
            rdbFill.Location = new System.Drawing.Point (8, 144);
            rdbFill.Size = new System.Drawing.Size (72, 24);
            rdbFill.TabIndex = 2;
            rdbFill.Text = "&Fill";
            chkRight.Location = new System.Drawing.Point (8, 96);
            chkRight.Size = new System.Drawing.Size (72, 24);
            chkRight.TabIndex = 1;
            chkRight.Text = "&Right";
            panel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            panel1.BackColor = System.Drawing.Color.Green;
            panel1.Dock = DockStyle.Fill;
            panel1.TabIndex = 1;
            panel1.Text = "ButtonPanel";
            this.Controls.Add (this.panel1);
            this.Controls.Add (this.panel2);
            panel1.Controls.Add (this.btnDemo);
            panel2.Controls.Add (this.groupBox1);
            panel2.Controls.Add (this.groupBox2);
            groupBox1.Controls.Add (this.chkRight);
            groupBox1.Controls.Add (this.chkBottom);
            groupBox1.Controls.Add (this.chkLeft);
            groupBox1.Controls.Add (this.chkTop);
            groupBox2.Controls.Add (this.rdbBottom);
            groupBox2.Controls.Add (this.rdbLeft);
            groupBox2.Controls.Add (this.rdbNone);
            groupBox2.Controls.Add (this.rdbRight);
            groupBox2.Controls.Add (this.rdbFill);
            groupBox2.Controls.Add (this.rdbTop);
        }

        // <doc>
        // <desc>
        //      Update control with new anchor and dock settings.
        //      Note that anchor == NONE is the same as (TOP && LEFT).
        // </desc>
        // </doc>
        //
        private void ApplyChanges() {

            //Apply Anchoring Settings - maybe multiple
            AnchorStyles nSettings = AnchorStyles.None;
            if (chkTop.Checked)    nSettings |= AnchorStyles.Top;
            if (chkLeft.Checked)   nSettings |= AnchorStyles.Left;
            if (chkBottom.Checked) nSettings |= AnchorStyles.Bottom;
            if (chkRight.Checked)  nSettings |= AnchorStyles.Right;
            btnDemo.Anchor = nSettings ;

            //Apply Docking settings - one only
            if (rdbSet == rdbNone)
                btnDemo.Dock = System.Windows.Forms.DockStyle.None;
            else if (rdbSet == rdbTop)
                btnDemo.Dock = System.Windows.Forms.DockStyle.Top;
            else if (rdbSet == rdbLeft)
                btnDemo.Dock = System.Windows.Forms.DockStyle.Left;
            else if (rdbSet == rdbBottom)
                btnDemo.Dock = System.Windows.Forms.DockStyle.Bottom;
            else if (rdbSet == rdbRight)
                btnDemo.Dock = System.Windows.Forms.DockStyle.Right;
            else // The default is: if (rdbSet is rbFill)
                btnDemo.Dock = System.Windows.Forms.DockStyle.Fill;
        }

        // <doc>
        // <desc>
        //      Whenever a checkbox is clicked, apply the changes from all
        //      controls.  Note all checkboxes use this same handler.
        // </desc>
        // </doc>
        //
        protected void checkbox_Click(object sender, EventArgs e) {
            ApplyChanges();
        }

        // <doc>
        // <desc>
        //      Save the radio button that was clicked so we know which one is
        //      checked when we apply the changes.  Note, all radio buttons use
        //      this same click handler.
        // </desc>
        // </doc>
        //
        protected void radiobutton_Click(object sender, EventArgs e) {
            rdbSet = (RadioButton)sender;
            ApplyChanges();
        }

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new DockMan());
        }
    }
}





