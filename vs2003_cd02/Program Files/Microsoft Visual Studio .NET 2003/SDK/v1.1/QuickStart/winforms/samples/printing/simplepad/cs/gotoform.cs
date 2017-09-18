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


namespace Microsoft.Samples.WinForms.Cs.SimplePad {
    using System;
    using System.Drawing;
    using System.Collections;
    using System.ComponentModel;
    using System.Windows.Forms;


    public class GotoForm : System.Windows.Forms.Form {
        /// <summary>
        ///    Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components;
        protected internal Button button1;
        protected internal TextBox edit1;

        private Size initSize;

        public GotoForm() {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            initSize = Size;
        }

        public int Line {
            get {
                int retVal;

				try
				{
					retVal = int.Parse(edit1.Text);
				}
				catch (FormatException)
				{
					retVal = -1;
				}
				return retVal;
            }
            set {
                edit1.Text = Convert.ToString(value);
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
        private void InitializeComponent() {
            this.components = new System.ComponentModel.Container ();
            this.button1 = new System.Windows.Forms.Button ();
            this.edit1 = new System.Windows.Forms.TextBox ();
            this.Text = "Go To";
            this.MaximizeBox = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.SizableToolWindow;
            this.ShowInTaskbar = false;
            this.AcceptButton = this.button1;
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Show;
            this.ControlBox = false;
            this.MinimizeBox = false;
            this.AutoScaleBaseSize = new System.Drawing.Size(6, 16);
            this.ClientSize = new System.Drawing.Size(184, 36);
            button1.DialogResult = System.Windows.Forms.DialogResult.OK;
            button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            button1.TabIndex = 1;
            button1.Anchor = (System.Windows.Forms.AnchorStyles) 11;
            button1.Text = "Go";
            button1.Size = new System.Drawing.Size(48, 24);
            button1.Location = new System.Drawing.Point(120, 8);
            edit1.TabIndex = 0;
            edit1.Anchor = (System.Windows.Forms.AnchorStyles) 15;
            edit1.Size = new System.Drawing.Size(104, 23);
            edit1.Location = new System.Drawing.Point(8, 8);
            this.Controls.Add (this.button1);
            this.Controls.Add (this.edit1);
        }
    }
}