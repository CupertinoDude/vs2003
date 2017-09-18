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


namespace Microsoft.Samples.WinForms.Cs.HostApp {
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
    using Microsoft.Samples.WinForms.Cs.HelloWorldControl;

    public class HostApp : System.Windows.Forms.Form {
        /// <summary>
        ///    Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components;
        protected internal Microsoft.Samples.WinForms.Cs.HelloWorldControl.HelloWorldControl helloWorldControl1;

        public HostApp() {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            helloWorldControl1.Font = new Font(Control.DefaultFont.FontFamily, 14, FontStyle.Bold);
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
            this.helloWorldControl1 = new Microsoft.Samples.WinForms.Cs.HelloWorldControl.HelloWorldControl ();
            this.Text = "Control Example";
            this.AutoScaleBaseSize = new System.Drawing.Size (5, 13);
            this.ClientSize = new System.Drawing.Size (600, 450);
            helloWorldControl1.Dock = System.Windows.Forms.DockStyle.None;
            helloWorldControl1.Size = new System.Drawing.Size (600, 450);
            helloWorldControl1.TabIndex = 0;
            helloWorldControl1.Text = "Hello Windows Forms Control World";
            this.Controls.Add (this.helloWorldControl1);
        }

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new HostApp());
        }

    }
}










