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


namespace Microsoft.Samples.WinForms.Cs.Anchoring {
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;

    public class Anchoring : System.Windows.Forms.Form {
        /// <summary>
        ///    Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components;
        protected internal System.Windows.Forms.Button button1;
        protected internal System.Windows.Forms.TextBox textBox1;

        public Anchoring() {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            //Wire up event for button1
            button1.Click += new System.EventHandler(button1_Click);

            this.MinimumSize = new Size(392, (117 + SystemInformation.CaptionHeight));
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
            this.button1 = new System.Windows.Forms.Button ();
            this.textBox1 = new System.Windows.Forms.TextBox ();
            this.Text = "Anchoring Sample";
            this.AutoScaleBaseSize = new System.Drawing.Size (5, 13);
            this.ClientSize = new System.Drawing.Size (392, 117);
            button1.Size = new System.Drawing.Size (120, 40);
            button1.TabIndex = 1;
            button1.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
            button1.Location = new System.Drawing.Point (256, 64);
            button1.Text = "Click Me!";
            textBox1.Location = new System.Drawing.Point (16, 24);
            textBox1.Text = "Hello Windows Forms World";
            textBox1.TabIndex = 0;
            textBox1.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            textBox1.Size = new System.Drawing.Size (360, 20);
            this.Controls.Add (this.button1);
            this.Controls.Add (this.textBox1);
        }

        private void button1_Click(object sender, System.EventArgs e) {
            MessageBox.Show("Text is: '" + textBox1.Text + "'");
        }

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new Anchoring());
        }

    }
}










