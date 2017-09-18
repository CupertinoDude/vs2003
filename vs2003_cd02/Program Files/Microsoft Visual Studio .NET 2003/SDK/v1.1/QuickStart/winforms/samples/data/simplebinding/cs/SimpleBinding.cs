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


namespace Microsoft.Samples.WinForms.Cs.SimpleBinding {
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;

    using System.Data;
    using System.Data.OleDb;
    using Microsoft.Samples.WinForms.Cs.SimpleBinding.Data;

    public class SimpleBinding : System.Windows.Forms.Form {
        private System.ComponentModel.Container components;
        private System.Windows.Forms.TextBox textBoxDOB;
        private System.Windows.Forms.Label labelDOB;
        private System.Windows.Forms.TextBox textBoxPosition;
        private System.Windows.Forms.Button buttonMoveFirst;
        private System.Windows.Forms.Button buttonMovePrev;
        private System.Windows.Forms.Button buttonMoveNext;
        private System.Windows.Forms.Button buttonMoveLast;
        private System.Windows.Forms.TextBox textBoxTitle;
        private System.Windows.Forms.Label labelTitle;
        private System.Windows.Forms.TextBox textBoxAddress;
        private System.Windows.Forms.TextBox textBoxLastName;
        private System.Windows.Forms.TextBox textBoxFirstName;
        private System.Windows.Forms.TextBox textBoxID;
        private System.Windows.Forms.Label labelAddress;
        private System.Windows.Forms.Label labelLastName;
        private System.Windows.Forms.Label labelFirstName;
        private System.Windows.Forms.Label labelID;
        private System.Windows.Forms.Panel panelVCRControl;
        private CustomerList custList;

        public SimpleBinding() {

            // Required by the Windows Forms Designer
            InitializeComponent();

            //Get the list of customers
            custList = CustomerList.GetCustomers();

            //Set up the bindings so that each field on the form is
            //bound to a property of Customer
            textBoxID.DataBindings.Add("Text", custList, "ID");
            textBoxTitle.DataBindings.Add("Text", custList, "Title");
            textBoxLastName.DataBindings.Add("Text", custList, "LastName");
            textBoxFirstName.DataBindings.Add("Text", custList, "FirstName");

            //We want to format the date so handle the format and parse events for the
            //DOB text box
            Binding dobBinding = new Binding("Text", custList, "DateOfBirth");
            dobBinding.Format += new ConvertEventHandler(this.textBoxDOB_FormatDate) ;
            dobBinding.Parse += new ConvertEventHandler(this.textBoxDOB_ParseDate) ;
            textBoxDOB.DataBindings.Add(dobBinding);

            textBoxAddress.DataBindings.Add("Text", custList, "Address");

            //We want to handle position changing events for the DATA VCR Panel
            //Position is managed by the Form's BindingContext so hook the position changed
            //event on the BindingContext
            this.BindingContext[custList].PositionChanged += new System.EventHandler(customers_PositionChanged);

            //Set up the initial text for the DATA VCR Panel
            textBoxPosition.Text = String.Format("Record {0} of {1}", (this.BindingContext[custList].Position + 1), custList.Count);

            //Set the minimum form size to the client size + the height of the title bar
            this.MinimumSize = new Size(368, (413 + SystemInformation.CaptionHeight));

        }


        //Format the Date Field in long date form for display in the TextBox
        private void textBoxDOB_FormatDate(object sender, ConvertEventArgs e) {

            //We only deal with converting to strings from dates
            if (e.DesiredType != typeof(string)) return ;
            if (e.Value.GetType() != typeof(DateTime)) return ;

            DateTime dt = (DateTime)e.Value;
            e.Value = dt.ToLongDateString();

        }

        //Parse the textbox contents and turn them back into a date
        private void textBoxDOB_ParseDate(object sender, ConvertEventArgs e) {

            //We only deal with converting to dates and strings
            if (e.DesiredType != typeof(DateTime)) return ;
            if (e.Value.GetType() != typeof(string)) return ;

            string value = (string)e.Value;

            try {
                e.Value = DateTime.Parse(value);
            }
            catch(Exception ex) {
                MessageBox.Show(ex.Message);
            }
        }

        //When the MoveFirst button is clicked set the position for the CustomersList
        //to the first record
        private void buttonMoveFirst_Click(object sender, System.EventArgs e) {
            this.BindingContext[custList].Position = 0 ;
        }


        //When the MoveLast button is clicked set the position for the CustomersList
        //to the last record
        private void buttonMoveLast_Click(object sender, System.EventArgs e) {
            this.BindingContext[custList].Position = custList.Count - 1;
        }


        //When the MoveNext button is clicked increment the position for the CustomersList
        private void buttonMoveNext_Click(object sender, System.EventArgs e) {
            if (this.BindingContext[custList].Position < custList.Count - 1) {
                this.BindingContext[custList].Position++;
            }
        }


        //When the MovePrev button is clicked decrement the position for the CustomersList
        private void buttonMovePrev_Click(object sender, System.EventArgs e) {
            if (this.BindingContext[custList].Position > 0) {
                this.BindingContext[custList].Position--;
            }
        }


        //Position has changed - update the DATA VCR panel
        private void customers_PositionChanged(object sender, System.EventArgs e) {
            textBoxPosition.Text = String.Format("Record {0} of {1}", (this.BindingContext[custList].Position + 1), custList.Count);
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
            this.textBoxTitle = new System.Windows.Forms.TextBox();
            this.labelFirstName = new System.Windows.Forms.Label();
            this.textBoxID = new System.Windows.Forms.TextBox();
            this.buttonMoveNext = new System.Windows.Forms.Button();
            this.buttonMovePrev = new System.Windows.Forms.Button();
            this.labelTitle = new System.Windows.Forms.Label();
            this.textBoxLastName = new System.Windows.Forms.TextBox();
            this.labelDOB = new System.Windows.Forms.Label();
            this.textBoxPosition = new System.Windows.Forms.TextBox();
            this.textBoxDOB = new System.Windows.Forms.TextBox();
            this.panelVCRControl = new System.Windows.Forms.Panel();
            this.textBoxAddress = new System.Windows.Forms.TextBox();
            this.labelLastName = new System.Windows.Forms.Label();
            this.labelID = new System.Windows.Forms.Label();
            this.buttonMoveFirst = new System.Windows.Forms.Button();
            this.labelAddress = new System.Windows.Forms.Label();
            this.textBoxFirstName = new System.Windows.Forms.TextBox();
            this.buttonMoveLast = new System.Windows.Forms.Button();

            this.Text = "Customer Details";
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(368, 413);

            this.labelID.Location = new System.Drawing.Point(8, 32);
            this.labelID.Text = "ID:";
            this.labelID.Size = new System.Drawing.Size(64, 16);
            this.labelID.TabIndex = 1;
            this.textBoxID.Location = new System.Drawing.Point(88, 30);
            this.textBoxID.ReadOnly = true;
            this.textBoxID.Enabled = false;
            this.textBoxID.TabStop = false;
            this.textBoxID.TabIndex = 2;
            this.textBoxID.Size = new System.Drawing.Size(203, 20);

            this.labelTitle.Location = new System.Drawing.Point(8, 72);
            this.labelTitle.Text = "&Title:";
            this.labelTitle.Size = new System.Drawing.Size(64, 16);
            this.labelTitle.TabIndex = 3;
            this.textBoxTitle.Location = new System.Drawing.Point(88, 70);
            this.textBoxTitle.TabIndex = 4;
            this.textBoxTitle.Size = new System.Drawing.Size(70, 20);

            this.labelFirstName.Location = new System.Drawing.Point(8, 112);
            this.labelFirstName.Text = "&First Name:";
            this.labelFirstName.Size = new System.Drawing.Size(64, 16);
            this.labelFirstName.TabIndex = 5;
            this.textBoxFirstName.Location = new System.Drawing.Point(88, 112);
            this.textBoxFirstName.TabIndex = 6;
            this.textBoxFirstName.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            this.textBoxFirstName.Size = new System.Drawing.Size(243, 20);

            this.labelLastName.Location = new System.Drawing.Point(8, 154);
            this.labelLastName.Text = "&Last Name:";
            this.labelLastName.Size = new System.Drawing.Size(64, 16);
            this.labelLastName.TabIndex = 7;
            this.textBoxLastName.Location = new System.Drawing.Point(88, 152);
            this.textBoxLastName.TabIndex = 8;
            this.textBoxLastName.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            this.textBoxLastName.Size = new System.Drawing.Size(243, 20);

            this.labelDOB.Location = new System.Drawing.Point(8, 194);
            this.labelDOB.Text = "&Date of Birth:";
            this.labelDOB.Size = new System.Drawing.Size(92, 16);
            this.labelDOB.TabIndex = 9;
            this.textBoxDOB.Location = new System.Drawing.Point(88, 192);
            this.textBoxDOB.TabIndex = 10;
            this.textBoxDOB.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            this.textBoxDOB.Size = new System.Drawing.Size(243, 20);


            this.labelAddress.Location = new System.Drawing.Point(8, 232);
            this.labelAddress.Text = "&Address:";
            this.labelAddress.Size = new System.Drawing.Size(64, 16);
            this.labelAddress.TabIndex = 11;
            this.textBoxAddress.Location = new System.Drawing.Point(88, 232);
            this.textBoxAddress.Multiline = true;
            this.textBoxAddress.AcceptsReturn = true;
            this.textBoxAddress.TabIndex = 12;
            this.textBoxAddress.Anchor = AnchorStyles.Top | AnchorStyles.Bottom |
                                    AnchorStyles.Right | AnchorStyles.Left;
            this.textBoxAddress.Size = new System.Drawing.Size(264, 88);

            this.buttonMoveNext.Location = new System.Drawing.Point(184, 8);
            this.buttonMoveNext.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonMoveNext.Size = new System.Drawing.Size(32, 32);
            this.buttonMoveNext.TabIndex = 33;
            this.buttonMoveNext.Anchor = AnchorStyles.Top;
            this.buttonMoveNext.Text = ">";
            this.buttonMoveNext.Click += new System.EventHandler(buttonMoveNext_Click);

            this.buttonMovePrev.Location = new System.Drawing.Point(48, 8);
            this.buttonMovePrev.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonMovePrev.Size = new System.Drawing.Size(32, 32);
            this.buttonMovePrev.TabIndex = 31;
            this.buttonMovePrev.Text = "<";
            this.buttonMovePrev.Click += new System.EventHandler(buttonMovePrev_Click);

            this.textBoxPosition.Location = new System.Drawing.Point(88, 14);
            this.textBoxPosition.ReadOnly = true;
            this.textBoxPosition.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.textBoxPosition.Enabled = false;
            this.textBoxPosition.TabStop = false;
            this.textBoxPosition.Anchor = AnchorStyles.Left;
            this.textBoxPosition.Size = new System.Drawing.Size(88, 20);

            this.panelVCRControl.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panelVCRControl.Location = new System.Drawing.Point(88, 344);
            this.panelVCRControl.Size = new System.Drawing.Size(264, 48);
            this.panelVCRControl.TabIndex = 32;
            this.panelVCRControl.Anchor = AnchorStyles.Bottom;
            this.panelVCRControl.Text = "panel1";

            this.buttonMoveFirst.Location = new System.Drawing.Point(8, 8);
            this.buttonMoveFirst.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonMoveFirst.Size = new System.Drawing.Size(32, 32);
            this.buttonMoveFirst.TabIndex = 30;
            this.buttonMoveFirst.Text = "|<";
            this.buttonMoveFirst.Click += new System.EventHandler(buttonMoveFirst_Click);


            this.buttonMoveLast.Location = new System.Drawing.Point(224, 8);
            this.buttonMoveLast.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonMoveLast.Size = new System.Drawing.Size(32, 32);
            this.buttonMoveLast.TabIndex = 34;
            this.buttonMoveLast.Anchor = AnchorStyles.Top;
            this.buttonMoveLast.Text = ">|";
            this.buttonMoveLast.Click += new System.EventHandler(buttonMoveLast_Click);

            this.panelVCRControl.Controls.AddRange(new System.Windows.Forms.Control[] {this.textBoxPosition,
                                                                                     this.buttonMoveFirst,
                                                                                     this.buttonMovePrev,
                                                                                     this.buttonMoveNext,
                                                                                     this.buttonMoveLast});
            this.Controls.AddRange(new System.Windows.Forms.Control[] {this.textBoxDOB,
                                                                          this.labelDOB,
                                                                          this.panelVCRControl,
                                                                          this.textBoxTitle,
                                                                          this.labelTitle,
                                                                          this.textBoxAddress,
                                                                          this.textBoxLastName,
                                                                          this.textBoxFirstName,
                                                                          this.textBoxID,
                                                                          this.labelAddress,
                                                                          this.labelLastName,
                                                                          this.labelFirstName,
                                                                          this.labelID});
        }


        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new SimpleBinding());
        }

    }
}