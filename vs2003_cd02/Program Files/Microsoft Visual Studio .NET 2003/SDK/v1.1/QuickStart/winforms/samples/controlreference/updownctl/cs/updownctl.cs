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


namespace Microsoft.Samples.Windows.Forms.Cs.UpDownCtl {

    using System;
    using System.Collections;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;

    // <doc>
    // <desc>
    //     This sample demonstrates how to use NumericUpDown and DomainUpDown controls
    // </desc>
    // </doc>
    //
    public class UpDownCtl : System.Windows.Forms.Form {

        public UpDownCtl() : base() {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            //Complete intialization of the Form
            this.updnTextAlign.Items.Add(new StringIntObject("Center",(int)HorizontalAlignment.Center));
            this.updnTextAlign.Items.Add(new StringIntObject("Left",(int)HorizontalAlignment.Left));
            this.updnTextAlign.Items.Add(new StringIntObject("Right",(int)HorizontalAlignment.Right));
            this.updnTextAlign.SelectedIndex = 1;

            this.updnUpDownAlignment.Items.Add(new StringIntObject("Left",(int)LeftRightAlignment.Left));
            this.updnUpDownAlignment.Items.Add(new StringIntObject("Right",(int)LeftRightAlignment.Right));
            this.updnUpDownAlignment.SelectedIndex = 1;

            this.domainUpDown1.Items.Add("King Kong");
            this.domainUpDown1.Items.Add("The Creature from the Black Lagoon");
            this.domainUpDown1.Items.Add("Dracula");
            this.domainUpDown1.Items.Add("Frankenstein's Monster");
            this.domainUpDown1.Items.Add("Godzilla");
            this.domainUpDown1.SelectedIndex = 0;

            this.updnDecimalPlaces.DecimalPlaces = 0;
        }

        // <doc>
        // <desc>
        //     UpDownCtl overrides dispose so it can clean up the
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

        private void updnUpDownAlignment_SelectedItemChanged(object sender, EventArgs e) {
            if ( updnUpDownAlignment.SelectedIndex != -1 ) {
                StringIntObject sio = (StringIntObject)(updnUpDownAlignment.Items[updnUpDownAlignment.SelectedIndex]) ;
                numericUpDown1.UpDownAlign = (LeftRightAlignment)(sio.i);
                domainUpDown1.UpDownAlign = (LeftRightAlignment)(sio.i);
            }
        }

        private void updnTextAlign_SelectedItemChanged(object sender, EventArgs e) {
            if ( updnTextAlign.SelectedIndex != -1 ) {
                StringIntObject sio = (StringIntObject)(updnTextAlign.Items[updnTextAlign.SelectedIndex]) ;
                numericUpDown1.TextAlign = (HorizontalAlignment)(sio.i);
                domainUpDown1.TextAlign = (HorizontalAlignment)(sio.i);
            }
        }

        private void chkInterceptArrowKeys_CheckedChanged(object sender, EventArgs e) {
            numericUpDown1.InterceptArrowKeys = chkInterceptArrowKeys.Checked;
            domainUpDown1.InterceptArrowKeys = chkInterceptArrowKeys.Checked;
        }

        private void chkSorted_CheckedChanged(object sender, EventArgs e) {
            domainUpDown1.Sorted = chkSorted.Checked;
        }

        private void chkWrap_CheckedChanged(object sender, EventArgs e) {
            domainUpDown1.Wrap = chkWrap.Checked;
        }

        private void updnIncrement_ValueChanged(object sender, EventArgs e) {
           numericUpDown1.Increment = updnIncrement.Value;
        }

        private void updnDecimalPlaces_ValueChanged(object sender, EventArgs e) {
            numericUpDown1.DecimalPlaces = (int)updnDecimalPlaces.Value;
            updnIncrement.Value = (int)updnIncrement.Value ; // Just so we don't increment by amounts we can't see.
            updnIncrement.DecimalPlaces = (int)updnDecimalPlaces.Value;
        }

        private System.ComponentModel.Container components;
        protected internal System.Windows.Forms.DomainUpDown updnUpDownAlignment;
        protected internal System.Windows.Forms.DomainUpDown updnTextAlign;
        protected internal System.Windows.Forms.Label lblIncrement;
        protected internal System.Windows.Forms.NumericUpDown updnIncrement;
        protected internal System.Windows.Forms.Label lblDecimalPlaces;
        protected internal System.Windows.Forms.NumericUpDown updnDecimalPlaces;
        protected internal System.Windows.Forms.CheckBox chkSorted;
        protected internal System.Windows.Forms.Label lblUpDownAlignment;
        protected internal System.Windows.Forms.Label lblTextAlign;
        protected internal System.Windows.Forms.CheckBox chkInterceptArrowKeys;
        protected internal System.Windows.Forms.CheckBox chkWrap;
        protected internal System.Windows.Forms.GroupBox grpCommonProperties;
        protected internal System.Windows.Forms.NumericUpDown numericUpDown1;
        protected internal System.Windows.Forms.DomainUpDown domainUpDown1;
        protected internal System.Windows.Forms.GroupBox grpDomainUpDown;
        protected internal System.Windows.Forms.GroupBox grpNumericUpDown;

        private void InitializeComponent() {
            this.components = new System.ComponentModel.Container();
            this.grpDomainUpDown = new System.Windows.Forms.GroupBox();
            this.updnDecimalPlaces = new System.Windows.Forms.NumericUpDown();
            this.chkWrap = new System.Windows.Forms.CheckBox();
            this.grpNumericUpDown = new System.Windows.Forms.GroupBox();
            this.chkSorted = new System.Windows.Forms.CheckBox();
            this.lblUpDownAlignment = new System.Windows.Forms.Label();
            this.lblIncrement = new System.Windows.Forms.Label();
            this.chkInterceptArrowKeys = new System.Windows.Forms.CheckBox();
            this.grpCommonProperties = new System.Windows.Forms.GroupBox();
            this.lblTextAlign = new System.Windows.Forms.Label();
            this.domainUpDown1 = new System.Windows.Forms.DomainUpDown();
            this.updnTextAlign = new System.Windows.Forms.DomainUpDown();
            this.updnIncrement = new System.Windows.Forms.NumericUpDown();
            this.lblDecimalPlaces = new System.Windows.Forms.Label();
            this.updnUpDownAlignment = new System.Windows.Forms.DomainUpDown();
            this.numericUpDown1 = new System.Windows.Forms.NumericUpDown();

            grpDomainUpDown.Location = new System.Drawing.Point(260, 24);
            grpDomainUpDown.TabIndex = 1;
            grpDomainUpDown.TabStop = false;
            grpDomainUpDown.Text = "DomainUpDown";
            grpDomainUpDown.Size = new System.Drawing.Size(230, 176);

            updnDecimalPlaces.Location = new System.Drawing.Point(120, 80);
            updnDecimalPlaces.Maximum = new System.Decimal(10d);
            updnDecimalPlaces.Minimum = new System.Decimal(0d);
            updnDecimalPlaces.DecimalPlaces = 0;
            updnDecimalPlaces.TabIndex = 1;
            updnDecimalPlaces.Text = "2";
            updnDecimalPlaces.Size = new System.Drawing.Size(105, 23);
            updnDecimalPlaces.ValueChanged += new System.EventHandler(this.updnDecimalPlaces_ValueChanged);

            chkWrap.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            chkWrap.Location = new System.Drawing.Point(10, 80);
            chkWrap.TabIndex = 1;
            chkWrap.Text = "Wrap";
            chkWrap.Size = new System.Drawing.Size(104, 24);
            chkWrap.CheckedChanged += new System.EventHandler(this.chkWrap_CheckedChanged);

            grpNumericUpDown.Location = new System.Drawing.Point(16, 24);
            grpNumericUpDown.TabIndex = 0;
            grpNumericUpDown.TabStop = false;
            grpNumericUpDown.Text = "NumericUpDown";
            grpNumericUpDown.Size = new System.Drawing.Size(232, 176);

            chkSorted.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            chkSorted.Location = new System.Drawing.Point(10, 120);
            chkSorted.TabIndex = 2;
            chkSorted.Text = "Sorted";
            chkSorted.Size = new System.Drawing.Size(104, 24);
            chkSorted.CheckedChanged += new System.EventHandler(this.chkSorted_CheckedChanged);

            lblUpDownAlignment.Location = new System.Drawing.Point(16, 64);
            lblUpDownAlignment.TabIndex = 2;
            lblUpDownAlignment.TabStop = false;
            lblUpDownAlignment.Text = "UpDownAlignment";
            lblUpDownAlignment.Size = new System.Drawing.Size(120, 24);

            lblIncrement.Location = new System.Drawing.Point(10, 120);
            lblIncrement.TabIndex = 4;
            lblIncrement.TabStop = false;
            lblIncrement.Text = "Increment";
            lblIncrement.Size = new System.Drawing.Size(72, 24);

            chkInterceptArrowKeys.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            chkInterceptArrowKeys.Location = new System.Drawing.Point(304, 32);
            chkInterceptArrowKeys.TabIndex = 0;
            chkInterceptArrowKeys.CheckState = System.Windows.Forms.CheckState.Checked;
            chkInterceptArrowKeys.Text = "InterceptArrowKeys";
            chkInterceptArrowKeys.Size = new System.Drawing.Size(144, 24);
            chkInterceptArrowKeys.Checked = true;
            chkInterceptArrowKeys.CheckedChanged += new System.EventHandler(this.chkInterceptArrowKeys_CheckedChanged);

            grpCommonProperties.Location = new System.Drawing.Point(16, 224);
            grpCommonProperties.TabIndex = 2;
            grpCommonProperties.TabStop = false;
            grpCommonProperties.Text = "CommonProperties";
            grpCommonProperties.Size = new System.Drawing.Size(472, 112);

            lblTextAlign.Location = new System.Drawing.Point(16, 32);
            lblTextAlign.TabIndex = 1;
            lblTextAlign.TabStop = false;
            lblTextAlign.Text = "TextAlign";
            lblTextAlign.Size = new System.Drawing.Size(120, 24);

            domainUpDown1.Location = new System.Drawing.Point(5, 32);
            domainUpDown1.TabIndex = 0;
            domainUpDown1.Size = new System.Drawing.Size(220, 23);
            domainUpDown1.ReadOnly = true;

            updnTextAlign.Location = new System.Drawing.Point(152, 32);
            updnTextAlign.TabIndex = 3;
            updnTextAlign.Size = new System.Drawing.Size(120, 23);
            updnTextAlign.SelectedItemChanged += new System.EventHandler(this.updnTextAlign_SelectedItemChanged);

            updnIncrement.Location = new System.Drawing.Point(120, 120);
            updnIncrement.Maximum = new System.Decimal(100d);
            updnIncrement.Minimum = new System.Decimal(1d);
            updnIncrement.TabIndex = 2;
            updnIncrement.DecimalPlaces = 2;
            updnIncrement.Text = "1.00";
            updnIncrement.Size = new System.Drawing.Size(105, 23);
            updnIncrement.ValueChanged += new System.EventHandler(this.updnIncrement_ValueChanged);

            this.AutoScaleBaseSize = new System.Drawing.Size(6, 16);
            this.ClientSize = new System.Drawing.Size(504, 352);
            this.Text = "UpDownCtlForm";

            lblDecimalPlaces.Location = new System.Drawing.Point(10, 80);
            lblDecimalPlaces.TabIndex = 3;
            lblDecimalPlaces.TabStop = false;
            lblDecimalPlaces.Text = "DecimalPlaces";
            lblDecimalPlaces.Size = new System.Drawing.Size(96, 24);

            updnUpDownAlignment.Location = new System.Drawing.Point(152, 64);
            updnUpDownAlignment.TabIndex = 4;
            updnUpDownAlignment.Size = new System.Drawing.Size(120, 23);
            updnUpDownAlignment.SelectedItemChanged += new System.EventHandler(this.updnUpDownAlignment_SelectedItemChanged);

            numericUpDown1.Location = new System.Drawing.Point(10, 32);
            numericUpDown1.Maximum = new System.Decimal(100d);
            numericUpDown1.Minimum = new System.Decimal(0d);
            numericUpDown1.TabIndex = 0;
            numericUpDown1.DecimalPlaces = 2;
            numericUpDown1.Text = "0.00";
            numericUpDown1.Size = new System.Drawing.Size(215, 23);

            this.Controls.Add(grpCommonProperties);
            this.Controls.Add(grpDomainUpDown);
            this.Controls.Add(grpNumericUpDown);
            grpCommonProperties.Controls.Add(updnUpDownAlignment);
            grpCommonProperties.Controls.Add(updnTextAlign);
            grpCommonProperties.Controls.Add(lblUpDownAlignment);
            grpCommonProperties.Controls.Add(lblTextAlign);
            grpCommonProperties.Controls.Add(chkInterceptArrowKeys);
            grpNumericUpDown.Controls.Add(lblIncrement);
            grpNumericUpDown.Controls.Add(updnIncrement);
            grpNumericUpDown.Controls.Add(lblDecimalPlaces);
            grpNumericUpDown.Controls.Add(updnDecimalPlaces);
            grpNumericUpDown.Controls.Add(numericUpDown1);
            grpDomainUpDown.Controls.Add(chkSorted);
            grpDomainUpDown.Controls.Add(chkWrap);
            grpDomainUpDown.Controls.Add(domainUpDown1);
        }

        // <doc>
        // <desc>
        //        The main entry point for the application.
        // </desc>
        // <param term='args'>
        //        Array of parameters passed to the application via the command line.
        // </param>
        // </doc>
        //
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new UpDownCtl());
        }

    }
}
