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


namespace Microsoft.Samples.WinForms.Cs.CustomerControl {
	using System;
	using System.Windows.Forms;
	using System.Drawing;

	public class CustomerControl : System.Windows.Forms.UserControl {
		/// <summary>
		///    Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components;
		protected internal System.Windows.Forms.TextBox textBoxTitle;
		protected internal System.Windows.Forms.Label labelTitle;
		protected internal System.Windows.Forms.TextBox textBoxAddress;
		protected internal System.Windows.Forms.TextBox textBoxLastName;
		protected internal System.Windows.Forms.TextBox textBoxFirstName;
		protected internal System.Windows.Forms.TextBox textBoxID;
		protected internal System.Windows.Forms.Label labelAddress;
		protected internal System.Windows.Forms.Label labelLastName;
		protected internal System.Windows.Forms.Label labelFirstName;
		protected internal System.Windows.Forms.Label labelID;

		private Microsoft.Samples.WinForms.Cs.CustomerControl.Customer customer1;

        public CustomerControl() {
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

        }

        public Customer Customer {
            get {
                return customer1;
            }
            set {
				if (value == null)
				{
					customer1 = Microsoft.Samples.WinForms.Cs.CustomerControl.Customer.ReadCustomer();
				}
				else
				{
					customer1 = value;
				}
				LoadCustomer();
            }
        }

        public void AcceptChanges() {
            customer1.Title = textBoxTitle.Text;
            customer1.FirstName = textBoxFirstName.Text;
            customer1.LastName = textBoxLastName.Text;
            customer1.Address = textBoxAddress.Text;
        }

        public void RejectChanges() {
            LoadCustomer();
        }

        private void LoadCustomer() {
            textBoxID.Text = customer1.ID;
            textBoxTitle.Text = customer1.Title;
            textBoxFirstName.Text = customer1.FirstName;
            textBoxLastName.Text = customer1.LastName;
            textBoxAddress.Text =  customer1.Address;
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
			this.labelAddress = new System.Windows.Forms.Label ();
			this.labelLastName = new System.Windows.Forms.Label ();
			this.textBoxFirstName = new System.Windows.Forms.TextBox ();
			this.textBoxLastName = new System.Windows.Forms.TextBox ();
			this.labelFirstName = new System.Windows.Forms.Label ();
			this.labelTitle = new System.Windows.Forms.Label ();
			this.textBoxTitle = new System.Windows.Forms.TextBox ();
			this.textBoxAddress = new System.Windows.Forms.TextBox ();
			this.labelID = new System.Windows.Forms.Label ();
			this.textBoxID = new System.Windows.Forms.TextBox ();
			this.Text = "CustomerControl";
			this.Size = new System.Drawing.Size (384, 304);
			labelAddress.Location = new System.Drawing.Point (8, 194);
			labelAddress.TabIndex = 9;
			labelAddress.Size = new System.Drawing.Size (64, 16);
			labelAddress.Text = "Address:";
			labelLastName.Location = new System.Drawing.Point (8, 154);
			labelLastName.TabIndex = 8;
			labelLastName.Size = new System.Drawing.Size (64, 16);
			labelLastName.Text = "LastName:";
			textBoxFirstName.Location = new System.Drawing.Point (88, 112);
			textBoxFirstName.TabIndex = 2;
			textBoxFirstName.Anchor = (System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right);
			textBoxFirstName.Size = new System.Drawing.Size (240, 20);
			textBoxLastName.Location = new System.Drawing.Point (88, 152);
			textBoxLastName.TabIndex = 3;
			textBoxLastName.Anchor = (System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right);
			textBoxLastName.Size = new System.Drawing.Size (240, 20);
			labelFirstName.Location = new System.Drawing.Point (8, 112);
			labelFirstName.TabIndex = 7;
			labelFirstName.Size = new System.Drawing.Size (64, 16);
			labelFirstName.Text = "First Name:";
			labelTitle.Location = new System.Drawing.Point (8, 72);
			labelTitle.TabIndex = 6;
			labelTitle.Size = new System.Drawing.Size (64, 16);
			labelTitle.Text = "Title:";
			textBoxTitle.Location = new System.Drawing.Point (88, 70);
			textBoxTitle.TabIndex = 1;
			textBoxTitle.Anchor = (System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right);
			textBoxTitle.Size = new System.Drawing.Size (88, 20);
			textBoxAddress.Location = new System.Drawing.Point (88, 192);
			textBoxAddress.Multiline = true;
			textBoxAddress.AcceptsReturn = true;
			textBoxAddress.TabIndex = 4;
			textBoxAddress.Anchor = (System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right);
			textBoxAddress.Size = new System.Drawing.Size (264, 96);
			labelID.Location = new System.Drawing.Point (8, 32);
			labelID.TabIndex = 5;
			labelID.Size = new System.Drawing.Size (64, 16);
			labelID.Text = "ID:";
			textBoxID.Location = new System.Drawing.Point (88, 32);
			textBoxID.Enabled = false;
			textBoxID.ReadOnly = true;
			textBoxID.TabIndex = 0;
			textBoxID.Anchor = (System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right);
			textBoxID.Size = new System.Drawing.Size (200, 20);
			this.Controls.Add (this.textBoxTitle);
			this.Controls.Add (this.labelTitle);
			this.Controls.Add (this.textBoxAddress);
			this.Controls.Add (this.textBoxLastName);
			this.Controls.Add (this.textBoxFirstName);
			this.Controls.Add (this.textBoxID);
			this.Controls.Add (this.labelAddress);
			this.Controls.Add (this.labelLastName);
			this.Controls.Add (this.labelFirstName);
			this.Controls.Add (this.labelID);
		}
	}
}
