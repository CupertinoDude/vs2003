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
    using Microsoft.Samples.WinForms.Cs.CustomerControl;

    public class HostApp : System.Windows.Forms.Form {
		/// <summary>
		///    Required designer variable.
		/// </summary>
        private System.ComponentModel.Container components;
        protected internal System.Windows.Forms.Button buttonCancel;
        protected internal System.Windows.Forms.Button buttonSave;
        protected internal Microsoft.Samples.WinForms.Cs.CustomerControl.CustomerControl CustomerControl1;

        public HostApp() {
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

            CustomerControl1.Customer = Microsoft.Samples.WinForms.Cs.CustomerControl.Customer.ReadCustomer();

			// Wire up event handlers for buttons
			buttonSave.Click += new System.EventHandler(buttonSave_Click);
			buttonCancel.Click += new System.EventHandler(buttonCancel_Click);

            //Set the minimum form size to the client size + the height of the title bar
            this.MinimumSize = new Size(400, (373 + SystemInformation.CaptionHeight));
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
			this.buttonSave = new System.Windows.Forms.Button ();
			this.buttonCancel = new System.Windows.Forms.Button ();
			this.CustomerControl1 = new Microsoft.Samples.WinForms.Cs.CustomerControl.CustomerControl ();
			this.Text = "Control Example";
			this.AutoScaleBaseSize = new System.Drawing.Size (5, 13);
			this.CancelButton = this.buttonCancel;
			this.AcceptButton = this.buttonSave;
			this.ClientSize = new System.Drawing.Size (400, 373);
			buttonSave.DialogResult = System.Windows.Forms.DialogResult.OK;
			buttonSave.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
			buttonSave.Size = new System.Drawing.Size (96, 24);
			buttonSave.TabIndex = 1;
			buttonSave.Anchor = (System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Bottom);
			buttonSave.Location = new System.Drawing.Point (8, 328);
			buttonSave.Text = "&Save";
			buttonCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			buttonCancel.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
			buttonCancel.Size = new System.Drawing.Size (96, 24);
			buttonCancel.TabIndex = 2;
			buttonCancel.Anchor = (System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Bottom);
			buttonCancel.Location = new System.Drawing.Point (120, 328);
			buttonCancel.Text = "Cancel";
			CustomerControl1.Size = new System.Drawing.Size (400, 310);
			CustomerControl1.TabIndex = 0;
			CustomerControl1.Anchor = (System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right);
			CustomerControl1.Text = "Hello Windows Forms Control World";
			this.Controls.Add (this.buttonCancel);
			this.Controls.Add (this.buttonSave);
			this.Controls.Add (this.CustomerControl1);
		}

        private void buttonCancel_Click(object sender, System.EventArgs e) {
            CustomerControl1.RejectChanges();
        }

        private void buttonSave_Click(object sender, System.EventArgs e) {
            CustomerControl1.AcceptChanges();
            MessageBox.Show("Customer Changes Saved:\n" + CustomerControl1.Customer);

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










