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


namespace Microsoft.Samples.WinForms.Cs.Docking {
    using System;
    using System.Collections;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;

    public class Docking : System.Windows.Forms.Form {
		/// <summary>
		///    Required designer variable.
		/// </summary>
        private System.ComponentModel.Container components;
        protected internal System.Windows.Forms.Button button1;
        protected internal System.Windows.Forms.ToolBarButton toolBarButton6;
        protected internal System.Windows.Forms.ToolBarButton toolBarButton5;
        protected internal System.Windows.Forms.ToolBarButton toolBarButton4;
        protected internal System.Windows.Forms.ToolBarButton toolBarButton3;
        protected internal System.Windows.Forms.ToolBarButton toolBarButton2;
        protected internal System.Windows.Forms.ToolBarButton toolBarButton1;
        protected internal System.Windows.Forms.ToolBar toolBar1;
        protected internal System.Windows.Forms.StatusBarPanel statusBarPanel2;
        protected internal System.Windows.Forms.StatusBarPanel statusBarPanel1;
        protected internal System.Windows.Forms.StatusBar statusBar1;

        private Hashtable d;

        public Docking() {

			//
			// Required for Windows Form Designer support
			//
            InitializeComponent();

            toolBar1.ButtonClick += new System.Windows.Forms.ToolBarButtonClickEventHandler(toolBar1_ButtonClick);
			button1.Click += new System.EventHandler(button1_Click);

            d = new Hashtable();
            d.Add("Left", DockStyle.Left);
            d.Add("Right", DockStyle.Right);
            d.Add("None", DockStyle.None);
            d.Add("Bottom", DockStyle.Bottom);
            d.Add("Top", DockStyle.Top);
            d.Add("Fill", DockStyle.Fill);

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
			this.toolBarButton2 = new System.Windows.Forms.ToolBarButton ();
			this.toolBarButton3 = new System.Windows.Forms.ToolBarButton ();
			this.toolBarButton1 = new System.Windows.Forms.ToolBarButton ();
			this.statusBar1 = new System.Windows.Forms.StatusBar ();
			this.statusBarPanel1 = new System.Windows.Forms.StatusBarPanel ();
			this.toolBar1 = new System.Windows.Forms.ToolBar ();
			this.button1 = new System.Windows.Forms.Button ();
			this.toolBarButton5 = new System.Windows.Forms.ToolBarButton ();
			this.toolBarButton6 = new System.Windows.Forms.ToolBarButton ();
			this.toolBarButton4 = new System.Windows.Forms.ToolBarButton ();
			this.statusBarPanel2 = new System.Windows.Forms.StatusBarPanel ();
			statusBarPanel1.BeginInit ();
			statusBarPanel2.BeginInit ();
			this.Text = "Docking";
			this.AutoScaleBaseSize = new System.Drawing.Size (5, 13);
			this.ClientSize = new System.Drawing.Size (528, 405);
			toolBarButton2.Text = "Right";
			toolBarButton3.Text = "Top";
			toolBarButton1.Text = "Left";
			statusBar1.BackColor = System.Drawing.SystemColors.Control;
			statusBar1.Location = new System.Drawing.Point (0, 384);
			statusBar1.Size = new System.Drawing.Size (528, 21);
			statusBar1.TabIndex = 1;
            this.statusBar1.Panels.AddRange(new System.Windows.Forms.StatusBarPanel[] {this.statusBarPanel1,
                        this.statusBarPanel2});
            statusBar1.ShowPanels=true;
			statusBarPanel1.Text = "Panel1";
			toolBar1.ButtonSize = new System.Drawing.Size (40, 36);
			toolBar1.Size = new System.Drawing.Size (528, 40);
			toolBar1.TabIndex = 2;
			toolBar1.DropDownArrows = true;
			toolBar1.ShowToolTips = true;
			this.toolBar1.Buttons.AddRange(new System.Windows.Forms.ToolBarButton[] {this.toolBarButton1, this.toolBarButton2, this.toolBarButton3, this.toolBarButton4, this.toolBarButton5, this.toolBarButton6});
			button1.BackColor = System.Drawing.SystemColors.Desktop;
			button1.Size = new System.Drawing.Size (176, 56);
			button1.TabIndex = 3;
			button1.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Right | AnchorStyles.Left;
			button1.Location = new System.Drawing.Point (168, 168);
			button1.Text = "button1\n(click to set Dock to DockStyle.None)";
			toolBarButton5.Text = "None";
			toolBarButton6.Text = "Fill";
			toolBarButton4.Text = "Bottom";
			statusBarPanel2.Text = "Panel2";
			this.Controls.Add (this.button1);
			this.Controls.Add (this.toolBar1);
			this.Controls.Add (this.statusBar1);
			statusBarPanel1.EndInit ();
			statusBarPanel2.EndInit ();
		}

        protected void button1_Click(object sender, System.EventArgs e) {
            button1.Dock = DockStyle.None;
            button1.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Right | AnchorStyles.Left;
        }

        protected void toolBar1_ButtonClick(object sender, System.Windows.Forms.ToolBarButtonClickEventArgs e) {
            button1.Dock = (DockStyle) d[e.Button.Text];
            if (e.Button.Text == "None")
                button1.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Right | AnchorStyles.Left;
        }

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new Docking());
        }
    }
}










