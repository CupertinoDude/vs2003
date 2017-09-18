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
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
    using System.Reflection;

    public class DesignableHelloWorld : System.Windows.Forms.Form {
        /// <summary>
        ///    Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components;
        protected internal System.Windows.Forms.Button button1;
        protected internal System.Windows.Forms.TextBox textBox1;

        public DesignableHelloWorld() {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            //Set the minimum form size to the client size + the height of the title bar
            this.MinimumSize = new Size(392, (117 + SystemInformation.CaptionHeight));

            //Wire up event handler for button
            button1.Click += new System.EventHandler(button1_Click);
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
            System.Resources.ResourceManager resources = new System.Resources.ResourceManager (typeof(DesignableHelloWorld));
            this.components = new System.ComponentModel.Container ();
            this.textBox1 = new System.Windows.Forms.TextBox ();
            this.button1 = new System.Windows.Forms.Button ();
            this.Text = "Built using the Designer";
            this.AutoScaleBaseSize = new System.Drawing.Size (5, 13);
            this.ClientSize = new System.Drawing.Size (392, 117);
            textBox1.Location = new System.Drawing.Point (16, 24);
            textBox1.Text = "Hello WinForms World";
            textBox1.TabIndex = 0;
            textBox1.Size = new System.Drawing.Size (360, 20);
            button1.ForeColor = System.Drawing.Color.LawnGreen;
            button1.BackgroundImage = (System.Drawing.Image) resources.GetObject ("button1.BackgroundImage");
            button1.Size = new System.Drawing.Size (120, 40);
            button1.TabIndex = 1;
            button1.Location = new System.Drawing.Point (256, 64);
            button1.Text = "Click Me!";
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
            Application.Run(new DesignableHelloWorld());
        }
    }
