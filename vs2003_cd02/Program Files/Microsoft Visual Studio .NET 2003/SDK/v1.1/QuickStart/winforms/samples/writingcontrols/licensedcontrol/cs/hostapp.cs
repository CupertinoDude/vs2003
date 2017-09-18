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

    public class HostApp : System.Windows.Forms.Form {
        private System.ComponentModel.Container components;
	    private LicensedControl LicensedControl1;

        public HostApp() {

            // Required by the Windows Forms Designer
            InitializeComponent();

        }

        protected override void Dispose(bool disposing)
        {
           if (disposing) {
                if (components != null) {
                    components.Dispose();
                }
           }
           base.Dispose(disposing);
        }

        private void InitializeComponent() {
		    this.components = new System.ComponentModel.Container();
		    this.LicensedControl1 = new LicensedControl();

		    LicensedControl1.Dock = System.Windows.Forms.DockStyle.Fill;
		    LicensedControl1.Size = new System.Drawing.Size(600, 450);
		    LicensedControl1.TabIndex = 0;
		    LicensedControl1.Text = "Hello from the licensed control!";

		    this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
		    this.Text = "Control Example";
		    this.ClientSize = new System.Drawing.Size(600, 450);

		    this.Controls.Add(LicensedControl1);
	    }


        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new HostApp());
        }

    }
}










