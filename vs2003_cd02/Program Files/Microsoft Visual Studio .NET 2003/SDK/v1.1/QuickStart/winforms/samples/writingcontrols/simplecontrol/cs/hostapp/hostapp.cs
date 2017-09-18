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
    using Microsoft.Samples.WinForms.Cs.SimpleControl;

    public class HostApp : System.Windows.Forms.Form {
        /// <summary>
        ///    Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components;
        protected internal System.Windows.Forms.RadioButton radioButton3;
        protected internal System.Windows.Forms.RadioButton radioButton2;
        protected internal System.Windows.Forms.RadioButton radioButton1;
        protected internal System.Windows.Forms.GroupBox groupBox1;
        protected internal Microsoft.Samples.WinForms.Cs.SimpleControl.SimpleControl simpleControl1;

        public HostApp() {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            simpleControl1.Font = new Font(Control.DefaultFont.FontFamily, 14, FontStyle.Bold);
        }


        private void radioButton3_CheckedChanged(object sender, System.EventArgs e) {
          if (radioButton3.Checked) {
                simpleControl1.DrawingMode = DrawingMode.Angry;
            }
        }

        private void radioButton2_CheckedChanged(object sender, System.EventArgs e) {
          if (radioButton2.Checked) {
                simpleControl1.DrawingMode = DrawingMode.Sad;
            }
        }

        private void radioButton1_CheckedChanged(object sender, System.EventArgs e) {
          if (radioButton1.Checked) {
                simpleControl1.DrawingMode = DrawingMode.Happy;
            }
        }

        private void simpleControl1_DrawingModeChanged(object sender, System.EventArgs e) {

            switch (simpleControl1.DrawingMode) {

                case DrawingMode.Happy:
                    MessageBox.Show("Well that's good to know");
                    break ;

                case DrawingMode.Sad:
                    MessageBox.Show("Come on cheer up!");
                    break ;

               case DrawingMode.Angry:
                   MessageBox.Show("Well calm down then!");
                   break ;

                default:
                    MessageBox.Show("Please make up your mind");
					break;
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
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container ();
            this.radioButton1 = new System.Windows.Forms.RadioButton ();
            this.radioButton3 = new System.Windows.Forms.RadioButton ();
            this.groupBox1 = new System.Windows.Forms.GroupBox ();
            this.simpleControl1 = new Microsoft.Samples.WinForms.Cs.SimpleControl.SimpleControl ();
            this.radioButton2 = new System.Windows.Forms.RadioButton ();
            this.Text = "Control Example";
            this.AutoScaleBaseSize = new System.Drawing.Size (5, 13);
            this.ClientSize = new System.Drawing.Size (528, 325);
            radioButton1.Location = new System.Drawing.Point (24, 24);
            radioButton1.Size = new System.Drawing.Size (128, 24);
            radioButton1.TabIndex = 0;
            radioButton1.TabStop = true;
            radioButton1.Text = "Happy";
            radioButton1.Checked = true;
            radioButton1.CheckedChanged += new System.EventHandler(radioButton1_CheckedChanged);
            radioButton3.Location = new System.Drawing.Point (24, 104);
            radioButton3.Size = new System.Drawing.Size (128, 24);
            radioButton3.TabIndex = 2;
            radioButton3.Text = "Angry";
            radioButton3.CheckedChanged += new System.EventHandler(radioButton3_CheckedChanged);
            groupBox1.Location = new System.Drawing.Point (320, 24);
            groupBox1.Size = new System.Drawing.Size (192, 152);
            groupBox1.TabIndex = 1;
            groupBox1.Anchor = System.Windows.Forms.AnchorStyles.None;
            groupBox1.TabStop = false;
            groupBox1.Text = "I am";
            simpleControl1.BackColor = System.Drawing.Color.Yellow;
            simpleControl1.ForeColor = System.Drawing.Color.Green;
            simpleControl1.Size = new System.Drawing.Size (304, 328);
            simpleControl1.TabIndex = 0;
            simpleControl1.Anchor = System.Windows.Forms.AnchorStyles.None;
            simpleControl1.Text = "Windows Forms Mood Control";
            simpleControl1.DrawingMode = DrawingMode.Happy;
            simpleControl1.DrawingModeChanged += new System.EventHandler(simpleControl1_DrawingModeChanged);
            radioButton2.Location = new System.Drawing.Point (24, 64);
            radioButton2.Size = new System.Drawing.Size (128, 24);
            radioButton2.TabIndex = 1;
            radioButton2.Text = "Sad";
            radioButton2.CheckedChanged += new System.EventHandler(radioButton2_CheckedChanged);
            this.Controls.Add (this.groupBox1);
            this.Controls.Add (this.simpleControl1);
            groupBox1.Controls.Add (this.radioButton3);
            groupBox1.Controls.Add (this.radioButton2);
            groupBox1.Controls.Add (this.radioButton1);
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










