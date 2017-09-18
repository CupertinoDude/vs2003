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


    public class OptionsForm : System.Windows.Forms.Form {
        /// <summary>
        ///    Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components;
        protected internal Button okButton;
        protected internal PropertyGrid grid;

        private object customizer;

        public OptionsForm(object customizer) {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            this.customizer = customizer;
            grid.SelectedObject = customizer;
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
            this.okButton = new System.Windows.Forms.Button ();
            this.grid = new System.Windows.Forms.PropertyGrid ();
            this.Text = "SimplePad+ Options";
            this.MaximizeBox = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.CancelButton = this.okButton;
            this.Icon = null;
            this.AcceptButton = this.okButton;
            this.ControlBox = false;
            this.MinimizeBox = false;
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(328, 325);
            okButton.DialogResult = System.Windows.Forms.DialogResult.OK;
            okButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            okButton.TabIndex = 0;
            okButton.Anchor = (System.Windows.Forms.AnchorStyles) 10;
            okButton.Text = "OK";
            okButton.Size = new System.Drawing.Size(75, 23);
            okButton.Location = new System.Drawing.Point(232, 297);
            grid.Text = "PropertyGrid";
            grid.LargeButtons = false;
            grid.ToolbarVisible = false;
            grid.TabIndex = 1;
            grid.Anchor = (System.Windows.Forms.AnchorStyles) 15;
            grid.CommandsVisibleIfAvailable = true;
            grid.AutoScrollMinSize = new System.Drawing.Size(0, 0);
            grid.Size = new System.Drawing.Size(312, 281);
            grid.Location = new System.Drawing.Point(8, 8);
            this.Controls.Add (this.okButton);
            this.Controls.Add (this.grid);
        }

    }
}