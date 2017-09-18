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


namespace Microsoft.Samples.Windows.Forms.Cs.DateTimePickerCtl {
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;

    // <doc>
    // <desc>
    //     This form is used to customise the DateTime picker
    //     It demonstrates how to use the common color dialog
    // </desc>
    // </doc>
    //
    public class ChangeColorDlg : System.Windows.Forms.Form {
        private DateTimePicker dtp;

        // <doc>
        // <desc>
        //     Public Constructor
        // </desc>
        // </doc>
        //
        public ChangeColorDlg(DateTimePickerCtl parent) : base() {

            // This call is required for support of the Windows Forms Form Designer.
            InitializeComponent();

            dtp = parent.DTPicker;

            SynchronizePanelColors();
        }

        // <doc>
        // <desc>
        //     Make sure that the color display panels are displaying the
        //     Color used by the date time picker
        // </desc>
        // </doc>
        //
        private void SynchronizePanelColors() {
            pnlForeColor.BackColor = dtp.CalendarForeColor;
            pnlMonthBackground.BackColor = dtp.CalendarMonthBackground;
            pnlTitleBackColor.BackColor = dtp.CalendarTitleBackColor;
            pnlTitleForeColor.BackColor = dtp.CalendarTitleForeColor;
            pnlTrailingForeColor.BackColor = dtp.CalendarTrailingForeColor;
        }

        // <doc>
        // <desc>
        //     ChangeColorDlg overrides dispose so it can clean up the
        //     component list.
        // </desc>
        // </doc>
        //
        protected override void Dispose(bool disposing)
        {
           if (disposing) {
                if (components != null) {
                    components.Dispose();
                }
           }
           base.Dispose(disposing);
        }

        protected void btnForeColor_Click(object sender, EventArgs e) {
            colorDialog1.Color = dtp.CalendarForeColor;
            DialogResult res = colorDialog1.ShowDialog();
            if (res == DialogResult.OK) {
                dtp.CalendarForeColor = colorDialog1.Color;
                SynchronizePanelColors();
            }
        }

        protected void btnMonthBackground_Click(object sender, EventArgs e) {
            colorDialog1.Color = dtp.CalendarMonthBackground;
            DialogResult res = colorDialog1.ShowDialog();
            if (res == DialogResult.OK) {
                dtp.CalendarMonthBackground = colorDialog1.Color;
                SynchronizePanelColors();
            }
        }

        protected void btnTitleBackColor_Click(object sender, EventArgs e) {
            colorDialog1.Color = dtp.CalendarTitleBackColor;
            DialogResult res = colorDialog1.ShowDialog();
            if (res == DialogResult.OK) {
                dtp.CalendarTitleBackColor = colorDialog1.Color;
                SynchronizePanelColors();
            }
        }

        protected void btnTitleForeColor_Click(object sender, EventArgs e) {
            colorDialog1.Color = dtp.CalendarTitleForeColor;
            DialogResult res = colorDialog1.ShowDialog();
            if (res == DialogResult.OK) {
                dtp.CalendarTitleForeColor = colorDialog1.Color;
                SynchronizePanelColors();
            }
        }

        protected void btnTrailingForeColor_Click(object sender, EventArgs e) {
            colorDialog1.Color = dtp.CalendarTrailingForeColor;
            DialogResult res = colorDialog1.ShowDialog();
            if (res == DialogResult.OK) {
                dtp.CalendarTrailingForeColor = colorDialog1.Color;
                SynchronizePanelColors();
            }
        }

        // NOTE: The following code is required by the Windows Forms Form Designer
        // It can be modified using the Windows Forms Form Designer.
        // Do not modify it using the code editor.
        private System.ComponentModel.Container components;
		private System.Windows.Forms.ColorDialog colorDialog1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnOK;
        private System.Windows.Forms.Panel pnlForeColor;
        private System.Windows.Forms.Panel pnlMonthBackground;
        private System.Windows.Forms.Panel pnlTitleBackColor;
        private System.Windows.Forms.Panel pnlTitleForeColor;
        private System.Windows.Forms.Panel pnlTrailingForeColor;
        private System.Windows.Forms.Button btnForeColor;
        private System.Windows.Forms.Button btnMonthBackground;
        private System.Windows.Forms.Button btnTitleBackColor;
        private System.Windows.Forms.Button btnTitleForeColor;
        private System.Windows.Forms.Button btnTrailingForeColor;
        //private System.Windows.Forms.ColorDialog colorDialog;

        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.btnTrailingForeColor = new System.Windows.Forms.Button();
            this.btnOK = new System.Windows.Forms.Button();
            this.pnlMonthBackground = new System.Windows.Forms.Panel();
            this.btnTitleBackColor = new System.Windows.Forms.Button();
            this.pnlForeColor = new System.Windows.Forms.Panel();
            this.pnlTitleForeColor = new System.Windows.Forms.Panel();
            this.btnMonthBackground = new System.Windows.Forms.Button();
            this.pnlTitleBackColor = new System.Windows.Forms.Panel();
            this.btnTitleForeColor = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.btnForeColor = new System.Windows.Forms.Button();
            this.pnlTrailingForeColor = new System.Windows.Forms.Panel();
            this.label4 = new System.Windows.Forms.Label();
            this.colorDialog1 = new System.Windows.Forms.ColorDialog();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();

            this.Text = "Change Color";
            this.MaximizeBox = false;
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MinimizeBox = false;
            this.ClientSize = new System.Drawing.Size(406, 194);

            btnTrailingForeColor.Location = new System.Drawing.Point(232, 112);
            btnTrailingForeColor.Size = new System.Drawing.Size(75, 23);
            btnTrailingForeColor.TabIndex = 12;
            btnTrailingForeColor.Text = "Change";
            btnTrailingForeColor.Click += new System.EventHandler(btnTrailingForeColor_Click);

            btnOK.Location = new System.Drawing.Point(320, 160);
            btnOK.DialogResult = System.Windows.Forms.DialogResult.OK;
            btnOK.Size = new System.Drawing.Size(75, 23);
            btnOK.TabIndex = 9;
            btnOK.Text = "&OK";

            pnlMonthBackground.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            pnlMonthBackground.Location = new System.Drawing.Point(160, 43);
            pnlMonthBackground.Size = new System.Drawing.Size(48, 16);
            pnlMonthBackground.TabIndex = 3;
            pnlMonthBackground.Text = "panel1";

            btnTitleBackColor.Location = new System.Drawing.Point(232, 64);
            btnTitleBackColor.Size = new System.Drawing.Size(75, 23);
            btnTitleBackColor.TabIndex = 14;
            btnTitleBackColor.Text = "Change";
            btnTitleBackColor.Click += new System.EventHandler(btnTitleBackColor_Click);

            pnlForeColor.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            pnlForeColor.Location = new System.Drawing.Point(160, 19);
            pnlForeColor.Size = new System.Drawing.Size(48, 16);
            pnlForeColor.TabIndex = 10;
            pnlForeColor.Text = "panel1";

            pnlTitleForeColor.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            pnlTitleForeColor.Location = new System.Drawing.Point(160, 91);
            pnlTitleForeColor.Size = new System.Drawing.Size(48, 16);
            pnlTitleForeColor.TabIndex = 1;
            pnlTitleForeColor.Text = "panel1";

            btnMonthBackground.Location = new System.Drawing.Point(232, 40);
            btnMonthBackground.Size = new System.Drawing.Size(75, 23);
            btnMonthBackground.TabIndex = 15;
            btnMonthBackground.Text = "Change";
            btnMonthBackground.Click += new System.EventHandler(btnMonthBackground_Click);

            pnlTitleBackColor.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            pnlTitleBackColor.Location = new System.Drawing.Point(160, 67);
            pnlTitleBackColor.Size = new System.Drawing.Size(48, 16);
            pnlTitleBackColor.TabIndex = 2;
            pnlTitleBackColor.Text = "panel1";

            btnTitleForeColor.Location = new System.Drawing.Point(232, 88);
            btnTitleForeColor.Size = new System.Drawing.Size(75, 23);
            btnTitleForeColor.TabIndex = 13;
            btnTitleForeColor.Text = "Change";
            btnTitleForeColor.Click += new System.EventHandler(btnTitleForeColor_Click);

            label5.Location = new System.Drawing.Point(16, 115);
            label5.Text = "CalendarTrailingForeColor:";
            label5.Size = new System.Drawing.Size(136, 16);
            label5.TabIndex = 4;

            btnForeColor.Location = new System.Drawing.Point(232, 16);
            btnForeColor.Size = new System.Drawing.Size(75, 23);
            btnForeColor.TabIndex = 11;
            btnForeColor.Text = "Change";
            btnForeColor.Click += new System.EventHandler(btnForeColor_Click);

            pnlTrailingForeColor.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            pnlTrailingForeColor.Location = new System.Drawing.Point(160, 115);
            pnlTrailingForeColor.Size = new System.Drawing.Size(48, 16);
            pnlTrailingForeColor.TabIndex = 0;
            pnlTrailingForeColor.Text = "panel1";

            label4.Location = new System.Drawing.Point(16, 91);
            label4.Text = "CalendarTitleForeColor:";
            label4.Size = new System.Drawing.Size(136, 16);
            label4.TabIndex = 5;

            label2.Location = new System.Drawing.Point(16, 43);
            label2.Text = "CalendarMonthBackground:";
            label2.Size = new System.Drawing.Size(144, 16);
            label2.TabIndex = 7;

            label3.Location = new System.Drawing.Point(16, 67);
            label3.Text = "CalendarTitleBackColor:";
            label3.Size = new System.Drawing.Size(136, 16);
            label3.TabIndex = 6;

            label1.Location = new System.Drawing.Point(16, 19);
            label1.Text = "CalendarForeColor:";
            label1.Size = new System.Drawing.Size(136, 16);
            label1.TabIndex = 8;
            this.Controls.Add(btnTrailingForeColor);
            this.Controls.Add(btnTitleForeColor);
            this.Controls.Add(btnTitleBackColor);
            this.Controls.Add(btnMonthBackground);
            this.Controls.Add(btnForeColor);
            this.Controls.Add(pnlTrailingForeColor);
            this.Controls.Add(pnlTitleForeColor);
            this.Controls.Add(pnlTitleBackColor);
            this.Controls.Add(pnlMonthBackground);
            this.Controls.Add(pnlForeColor);
            this.Controls.Add(btnOK);
            this.Controls.Add(label5);
            this.Controls.Add(label4);
            this.Controls.Add(label3);
            this.Controls.Add(label2);
            this.Controls.Add(label1);
        }
    }
}
