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
    //     This sample control demonstrates various properties and
    //     methods for the DateTimePicker control.  Users should
    //     play with the various controls and then look at the code
    //     behind the behaviors that are most interesting.
    // </desc>
    // </doc>
    //
    public class DateTimePickerCtl : System.Windows.Forms.Form {

        private System.ComponentModel.Container components;
        protected internal System.Windows.Forms.GroupBox groupBox1;
        protected internal System.Windows.Forms.Label label1;
        protected internal System.Windows.Forms.Label label2;
        protected internal System.Windows.Forms.Label label4;
        protected internal System.Windows.Forms.DateTimePicker dateTimePicker;
        protected internal System.Windows.Forms.DateTimePicker dtpMinDate;
        protected internal System.Windows.Forms.DateTimePicker dtpMaxDate;
        protected internal System.Windows.Forms.CheckBox chkShowUpDown;
        protected internal System.Windows.Forms.ComboBox cmbFormat;
        protected internal System.Windows.Forms.Button btnChangeFont;
        protected internal System.Windows.Forms.Button btnChangeColor;
        protected internal System.Windows.Forms.FontDialog fontDialog;
        protected internal System.Windows.Forms.ToolTip toolTip1;
        protected internal System.Windows.Forms.ErrorProvider errorMax;
        protected internal System.Windows.Forms.ErrorProvider errorMin;

        // <doc>
        // <desc>
        //     Public Constructor
        // </desc>
        // </doc>
        //
        public DateTimePickerCtl() : base() {

            // This call is required for support of the Windows Forms Form Designer.
            InitializeComponent();

            // Make sure that we are starting in Long date format
            dateTimePicker.Format = DateTimePickerFormat.Long;
            cmbFormat.SelectedIndex = 0;

            // Initialize the control values
            DateTime now = DateTime.Now;
            dateTimePicker.Value = now;
            dtpMaxDate.Value = now.AddDays(30);
            dtpMinDate.Value = now.AddDays(-30);
            dateTimePicker.MaxDate = dtpMaxDate.Value;
            dateTimePicker.MinDate = dtpMinDate.Value;

            //Set the minimum form size to the client size + the height of the title bar
            this.MinimumSize = new Size(504, (293 + SystemInformation.CaptionHeight));
        }


        // <doc>
        // <desc>
        //     DateTimePickerCtl overrides dispose so it can clean up the
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

        // <doc>
        // <desc>
        //     Return the DateTimePicker control - used by the
        //     ChangeColorDlg
        // </desc>
        // </doc>
        //
        internal DateTimePicker DTPicker {
            get {
                return dateTimePicker;
            }
        }

        protected void btnChangeFont_Click(object sender, EventArgs e) {
            fontDialog.ShowDialog();
            Font newFont = fontDialog.Font;
            dateTimePicker.Font = newFont;
        }

        protected void btnChangeColor_Click(object sender, EventArgs e) {
            ChangeColorDlg dlg = new ChangeColorDlg(this);
            dlg.ShowDialog();
        }

        protected void dtpMinDate_ValueChanged(object sender, EventArgs e) {

            if (dtpMinDate.Value < dtpMaxDate.Value) {
                errorMin.SetError(dtpMinDate,"");
                dateTimePicker.MinDate = dtpMinDate.Value;
			}
            else {
                dtpMinDate.Value = dateTimePicker.MinDate;
                errorMin.SetError(dtpMinDate,"Max Date must be greater than Min Date");
			}
        }

        protected void dtpMaxDate_ValueChanged(object sender, EventArgs e) {
            if (dtpMaxDate.Value > dtpMinDate.Value) {
                dateTimePicker.MaxDate = dtpMaxDate.Value;
                errorMax.SetError(dtpMaxDate,"");
			}
            else {
                dtpMaxDate.Value = dateTimePicker.MaxDate;
                errorMax.SetError(dtpMaxDate,"Max Date must be greater than Min Date");
			}
        }

        protected void cmbFormat_SelectedIndexChanged(object sender, EventArgs e) {
            if (cmbFormat.SelectedIndex < 0)
                return;

            char firstChar = cmbFormat.SelectedItem.ToString()[0];
            DateTimePickerFormat format;
            switch (firstChar) {
                case 'S':
                    format = DateTimePickerFormat.Short;
                    break;
                case 'T':
                    format = DateTimePickerFormat.Time;
                    break;
                case 'C':
                    format = DateTimePickerFormat.Custom;
                    break;
                default:
                    format = DateTimePickerFormat.Long;
                    break;
            }
            dateTimePicker.Format = format;
        }

        protected void chkShowUpDown_Click(object sender, EventArgs e) {
            bool showUpDown = chkShowUpDown.Checked;
            this.dateTimePicker.ShowUpDown = showUpDown;
        }

        // NOTE: The following code is required by the Windows Forms Form Designer
        // It can be modified using the Windows Forms Form Designer.
        // Do not modify it using the code editor.
        private void InitializeComponent() {
            this.components = new System.ComponentModel.Container();
            this.label4 = new System.Windows.Forms.Label();
            this.errorMin = new System.Windows.Forms.ErrorProvider();
            this.cmbFormat = new System.Windows.Forms.ComboBox();
            this.dtpMinDate = new System.Windows.Forms.DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label1 = new System.Windows.Forms.Label();
            this.fontDialog = new System.Windows.Forms.FontDialog();
            this.toolTip1 = new System.Windows.Forms.ToolTip(components);
            this.btnChangeFont = new System.Windows.Forms.Button();
            this.dateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.btnChangeColor = new System.Windows.Forms.Button();
            this.errorMax = new System.Windows.Forms.ErrorProvider();
            this.dtpMaxDate = new System.Windows.Forms.DateTimePicker();
            this.chkShowUpDown = new System.Windows.Forms.CheckBox();

            this.Text = "DateTimePicker";
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(504, 293);

			toolTip1.Active = true;

            label4.Location = new System.Drawing.Point(16, 80);
            label4.Text = "Format:";
            label4.Size = new System.Drawing.Size(64, 16);
            label4.TabIndex = 0;

            errorMin.DataMember = "";
            errorMin.DataSource = null;
            errorMin.ContainerControl = null;

            cmbFormat.Location = new System.Drawing.Point(128, 72);
            cmbFormat.Size = new System.Drawing.Size(104, 21);
            cmbFormat.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            toolTip1.SetToolTip(cmbFormat, "A value indicating the whether the control displays date and time\r\ninformation in long date Format(for example, \"Wednesday, April 7, 1999\"),\r\nshort date Format(for example, \"4/7/99\"), time Format(for example,\r\n\"5:31:34 PM\"), or custom format.");
            cmbFormat.TabIndex = 7;
            cmbFormat.Anchor = System.Windows.Forms.AnchorStyles.Top |
                               System.Windows.Forms.AnchorStyles.Left |
                               System.Windows.Forms.AnchorStyles.Right;
            cmbFormat.Items.AddRange(new object[] {"Long",
              "Short",
              "Time",
              "Custom"});
            cmbFormat.SelectedIndexChanged += new System.EventHandler(cmbFormat_SelectedIndexChanged);

            dtpMinDate.Location = new System.Drawing.Point(128, 24);
            dtpMinDate.Size = new System.Drawing.Size(104, 20);
            dtpMinDate.CalendarForeColor = System.Drawing.SystemColors.WindowText;
            dtpMinDate.Checked = true;
            dtpMinDate.ForeColor = System.Drawing.SystemColors.WindowText;
            dtpMinDate.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            toolTip1.SetToolTip(dtpMinDate, "The value indicating the first date that\r\nthe control allows the user to select");
            dtpMinDate.TabIndex = 6;
            dtpMinDate.Anchor = System.Windows.Forms.AnchorStyles.Top |
                                System.Windows.Forms.AnchorStyles.Left |
                                System.Windows.Forms.AnchorStyles.Right;
            dtpMinDate.BackColor = System.Drawing.SystemColors.Window;
            dtpMinDate.ValueChanged += new System.EventHandler(dtpMinDate_ValueChanged);

            label2.Location = new System.Drawing.Point(16, 56);
            label2.Text = "MaxDate:";
            label2.Size = new System.Drawing.Size(96, 16);
            label2.TabIndex = 1;

            groupBox1.Location = new System.Drawing.Point(248, 16);
            groupBox1.ImeMode = System.Windows.Forms.ImeMode.Disable;
            groupBox1.TabIndex = 0;
            groupBox1.Anchor = System.Windows.Forms.AnchorStyles.Top |
                               System.Windows.Forms.AnchorStyles.Bottom |
                               System.Windows.Forms.AnchorStyles.Right;
            groupBox1.TabStop = false;
            groupBox1.Text = "DateTimePicker";
            groupBox1.Size = new System.Drawing.Size(248, 264);

            label1.Location = new System.Drawing.Point(16, 32);
            label1.Text = "MinDate:";
            label1.Size = new System.Drawing.Size(80, 16);
            label1.TabIndex = 3;

            btnChangeFont.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            btnChangeFont.Location = new System.Drawing.Point(16, 216);
            btnChangeFont.Text = "Change &Font";
            btnChangeFont.Size = new System.Drawing.Size(104, 32);
            btnChangeFont.TabIndex = 5;
            btnChangeFont.Anchor = System.Windows.Forms.AnchorStyles.Bottom |
                                   System.Windows.Forms.AnchorStyles.Right;
            btnChangeFont.Click += new System.EventHandler(btnChangeFont_Click);

            dateTimePicker.Location = new System.Drawing.Point(24, 24);
            dateTimePicker.Size = new System.Drawing.Size(200, 20);
            dateTimePicker.CalendarForeColor = System.Drawing.SystemColors.WindowText;
            dateTimePicker.Checked = true;
            dateTimePicker.ForeColor = System.Drawing.SystemColors.WindowText;
            dateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            dateTimePicker.TabIndex = 1;
            dateTimePicker.BackColor = System.Drawing.SystemColors.Window;
            dateTimePicker.CustomFormat = "\'The date is: \'yy MM d - HH\':\'mm\':\'s ddd";
            dateTimePicker.Anchor = System.Windows.Forms.AnchorStyles.Top |
                                    System.Windows.Forms.AnchorStyles.Bottom |
                                    System.Windows.Forms.AnchorStyles.Left |
                                    System.Windows.Forms.AnchorStyles.Right;
            btnChangeColor.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            btnChangeColor.Location = new System.Drawing.Point(128, 216);
            btnChangeColor.Text = "Change &Color";
            btnChangeColor.Size = new System.Drawing.Size(104, 32);
            btnChangeColor.TabIndex = 2;
            btnChangeColor.Anchor = System.Windows.Forms.AnchorStyles.Bottom |
                                    System.Windows.Forms.AnchorStyles.Right;
            btnChangeColor.Click += new System.EventHandler(btnChangeColor_Click);

            errorMax.DataMember = "";
            errorMax.DataSource = null;
            errorMax.ContainerControl = null;

            dtpMaxDate.Location = new System.Drawing.Point(128, 48);
            dtpMaxDate.Size = new System.Drawing.Size(104, 20);
            dtpMaxDate.CalendarForeColor = System.Drawing.SystemColors.WindowText;
            dtpMaxDate.Checked = true;
            dtpMaxDate.ForeColor = System.Drawing.SystemColors.WindowText;
            dtpMaxDate.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            toolTip1.SetToolTip(dtpMaxDate, "The value indicating the last date that \r\nthe control allows the user to select");
            dtpMaxDate.TabIndex = 4;
            dtpMaxDate.Anchor = System.Windows.Forms.AnchorStyles.Top |
                                System.Windows.Forms.AnchorStyles.Left |
                                System.Windows.Forms.AnchorStyles.Right;
            dtpMaxDate.BackColor = System.Drawing.SystemColors.Window;
            dtpMaxDate.ValueChanged += new System.EventHandler(dtpMaxDate_ValueChanged);

            chkShowUpDown.Location = new System.Drawing.Point(16, 104);
            chkShowUpDown.Text = "ShowUpDown:";
            chkShowUpDown.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            chkShowUpDown.Size = new System.Drawing.Size(100, 23);
            chkShowUpDown.AccessibleRole = System.Windows.Forms.AccessibleRole.CheckButton;
            chkShowUpDown.TabIndex = 8;
            chkShowUpDown.Click += new System.EventHandler(chkShowUpDown_Click);

            groupBox1.Controls.Add(chkShowUpDown);
            groupBox1.Controls.Add(btnChangeFont);
            groupBox1.Controls.Add(btnChangeColor);
            groupBox1.Controls.Add(dtpMaxDate);
            groupBox1.Controls.Add(dtpMinDate);
            groupBox1.Controls.Add(label4);
            groupBox1.Controls.Add(label2);
            groupBox1.Controls.Add(label1);
            groupBox1.Controls.Add(cmbFormat);
            this.Controls.Add(dateTimePicker);
            this.Controls.Add(groupBox1);
        }

        // The main entry point for the application.
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new DateTimePickerCtl());
        }

    }

}




