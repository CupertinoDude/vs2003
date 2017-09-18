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


namespace Microsoft.Samples.WinForms.Cs.Accessible
{
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;

    public class Accessible : System.Windows.Forms.Form {
        private System.ComponentModel.Container components;
        protected internal System.Windows.Forms.Button button1;
        protected internal System.Windows.Forms.TextBox textBox1;

        public Accessible() {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            //Wire up event handler for button1
            button1.Click += new System.EventHandler(this.button1_Click);

            //Set the minimum form size to the client size + the height of the title bar
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
            this.Text = "Accessibility";
            this.AutoScaleBaseSize = new System.Drawing.Size (5, 13);
            this.AccessibleRole = System.Windows.Forms.AccessibleRole.Window;
            this.AccessibleName = "AccessibleForm";
            this.AcceptButton = this.button1;
            this.AccessibleDescription = "Simple Form that demonstrates accessibility";
            this.ClientSize = new System.Drawing.Size (392, 117);
            button1.AccessibleDescription = "Once you've entered some text push this button";
            button1.Size = new System.Drawing.Size (120, 40);
            button1.TabIndex = 1;
            button1.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
            button1.Location = new System.Drawing.Point (256, 64);
            button1.Text = "Click Me!";
            button1.AccessibleName = "DefaultAction";
            textBox1.Location = new System.Drawing.Point (16, 24);
            textBox1.Text = "Hello WinForms World";
            textBox1.AccessibleName = "TextEntryField";
            textBox1.TabIndex = 0;
            textBox1.AccessibleDescription = "Please enter some text in the box";
            textBox1.Anchor = (System.Windows.Forms.AnchorStyles) 13;
            textBox1.Size = new System.Drawing.Size (360, 20);
            this.Controls.Add (this.button1);
            this.Controls.Add (this.textBox1);
        }

        private void button1_Click (object sender, System.EventArgs e)
        {
            MessageBox.Show("Text is: '" + textBox1.Text + "'");
        }

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new Accessible());
        }
    }
}











