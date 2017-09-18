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


namespace Microsoft.Samples.WinForms.Cs.ComboBoxBinding {

    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
    using System.Data;
    using System.Data.SqlClient;

    public class ComboBoxBinding : System.Windows.Forms.Form {
        private System.ComponentModel.Container components;
        private Microsoft.Samples.WinForms.Cs.ComboBoxBinding.Data.CustomersDataSet customersDataSet1;
        private System.Windows.Forms.TextBox textBoxZip;
        private System.Windows.Forms.ComboBox comboBoxState;
        private System.Windows.Forms.TextBox textBoxCity;
        private System.Windows.Forms.Label labelState;
        private System.Windows.Forms.Label labelZip;
        private System.Windows.Forms.Label labelCity;
        private System.Windows.Forms.TextBox textBoxPosition;
        private System.Windows.Forms.Button buttonMoveFirst;
        private System.Windows.Forms.Button buttonMovePrev;
        private System.Windows.Forms.Button buttonMoveNext;
        private System.Windows.Forms.Button buttonMoveLast;
        private System.Windows.Forms.TextBox textBoxCompany;
        private System.Windows.Forms.Label labelCompanyName;
        private System.Windows.Forms.TextBox textBoxAddress;
        private System.Windows.Forms.TextBox textBoxTitle;
        private System.Windows.Forms.TextBox textBoxContact;
        private System.Windows.Forms.TextBox textBoxID;
        private System.Windows.Forms.Label labelAddress;
        private System.Windows.Forms.Label labelContactTitle;
        private System.Windows.Forms.Label labelContact;
        private System.Windows.Forms.Label labelID;
        private System.Windows.Forms.Panel panelVCRControl;

        //Define the array of states for the drop-down list
        public State[] States  = new State[] {
            new State("Alabama","AL")
           ,new State("Alaska","AK")
           ,new State("Arizona" ,"AZ")
           ,new State("Arkansas","AR")
           ,new State("California" ,"CA")
           ,new State("Colorado","CO")
           ,new State("Connecticut","CT")
           ,new State("Delaware","DE")
           ,new State("District of Columbia","DC")
           ,new State("Florida" ,"FL")
           ,new State("Georgia" ,"GA")
           ,new State("Hawaii"  ,"HI")
           ,new State("Idaho","ID")
           ,new State("Illinois","IL")
           ,new State("Indiana" ,"IN")
           ,new State("Iowa","IA")
           ,new State("Kansas"  ,"KS")
           ,new State("Kentucky","KY")
           ,new State("Louisiana"  ,"LA")
           ,new State("Maine","ME")
           ,new State("Maryland","MD")
           ,new State("Massachusetts","MA")
           ,new State("Michigan","MI")
           ,new State("Minnesota"  ,"MN")
           ,new State("Mississippi","MS")
           ,new State("Missouri","MO")
           ,new State("Montana" ,"MT")
           ,new State("Nebraska","NE")
           ,new State("Nevada"  ,"NV")
           ,new State("New Hampshire","NH")
           ,new State("New Jersey" ,"NJ")
           ,new State("New Mexico" ,"NM")
           ,new State("New York","NY")
           ,new State("North Carolina","NC")
           ,new State("North Dakota" ,"ND")
           ,new State("Ohio","OH")
           ,new State("Oklahoma","OK")
           ,new State("Oregon"  ,"OR")
           ,new State("Pennsylvania" ,"PA")
           ,new State("Rhode Island" ,"RI")
           ,new State("South Carolina","SC")
           ,new State("South Dakota" ,"SD")
           ,new State("Tennessee"  ,"TN")
           ,new State("Texas","TX")
           ,new State("Utah","UT")
           ,new State("Vermont" ,"VT")
           ,new State("Virginia","VA")
           ,new State("Washington" ,"WA")
           ,new State("West Virginia","WV")
           ,new State("Wisconsin"  ,"WI")
           ,new State("Wyoming" ,"WY")
           } ;

        public ComboBoxBinding() {

            // Required by the Windows Forms Designer
            InitializeComponent();

            //Fill the DataSet
            SqlConnection con = new SqlConnection("server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
            SqlDataAdapter cmd = new SqlDataAdapter("Select * from Customers where country='USA'", con);
	    try {
                cmd.Fill(customersDataSet1, "Customers");

                //Set up the Combobox bindings
                comboBoxState.DataSource=States;            //Populate the list
                comboBoxState.DisplayMember="LongName";     //Define the field to be displayed
                comboBoxState.ValueMember="ShortName";      //Define the field to be used as the value

                //Bind the selected value of the combobox to the Region field of the current
                //Customer
                comboBoxState.DataBindings.Add("SelectedValue", customersDataSet1, "Customers.Region");

                //Set up the rest of the form bindings
                textBoxID.DataBindings.Add("Text", customersDataSet1, "Customers.CustomerID");
                textBoxCity.DataBindings.Add("Text", customersDataSet1, "Customers.City");
                textBoxTitle.DataBindings.Add("Text", customersDataSet1, "Customers.ContactTitle");
                textBoxAddress.DataBindings.Add("Text", customersDataSet1, "Customers.Address");
                textBoxCompany.DataBindings.Add("Text", customersDataSet1, "Customers.CompanyName");
                textBoxContact.DataBindings.Add("Text", customersDataSet1, "Customers.ContactName");
                textBoxZip.DataBindings.Add("Text", customersDataSet1, "Customers.PostalCode");

                //We want to handle position changing events for the DATA VCR Panel
                this.BindingContext[customersDataSet1,"Customers"].PositionChanged += new System.EventHandler(customers_PositionChanged);

                //Set up the initial text for the DATA VCR Panel
                textBoxPosition.Text = "Record " + (this.BindingContext[customersDataSet1,"Customers"].Position + 1) + " of " + customersDataSet1.Customers.Count;

                //Set the minimum form size
                this.MinimumSize = new Size(375, 361);
	    }
	    catch (Exception ex){
                throw (ex);
	    }
	    finally{
                con.Close();
	    }
        }


        //When the MoveFirst button is clicked set the position for the Customers table
        //to the first record
        private void buttonMoveFirst_Click(object sender, System.EventArgs e) {
            this.BindingContext[customersDataSet1,"Customers"].Position = 0 ;
        }


        //When the MoveLast button is clicked set the position for the Customers table
        //to the last record
        private void buttonMoveLast_Click(object sender, System.EventArgs e) {
            this.BindingContext[customersDataSet1,"Customers"].Position = customersDataSet1.Customers.Count - 1;
        }


        //When the MoveNext button is clicked increment the position for the Customers table
        private void buttonMoveNext_Click(object sender, System.EventArgs e) {
            if (this.BindingContext[customersDataSet1,"Customers"].Position < customersDataSet1.Customers.Count - 1) {
                this.BindingContext[customersDataSet1,"Customers"].Position++;
            }
        }


        //When the MovePrev button is clicked decrement the position for the Customers table
        private void buttonMovePrev_Click(object sender, System.EventArgs e) {
            if (this.BindingContext[customersDataSet1,"Customers"].Position > 0) {
                this.BindingContext[customersDataSet1,"Customers"].Position--;
            }
        }


        //Position has changed - update the DATA VCR panel
        private void customers_PositionChanged(object sender, System.EventArgs e) {
            textBoxPosition.Text = "Record " + (this.BindingContext[customersDataSet1,"Customers"].Position + 1) + " of " + customersDataSet1.Customers.Count;
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
            this.labelCity = new System.Windows.Forms.Label();
            this.buttonMoveNext = new System.Windows.Forms.Button();
            this.customersDataSet1 = new Microsoft.Samples.WinForms.Cs.ComboBoxBinding.Data.CustomersDataSet();
            this.labelContact = new System.Windows.Forms.Label();
            this.buttonMoveFirst = new System.Windows.Forms.Button();
            this.textBoxID = new System.Windows.Forms.TextBox();
            this.textBoxCity = new System.Windows.Forms.TextBox();
            this.labelContactTitle = new System.Windows.Forms.Label();
            this.labelCompanyName = new System.Windows.Forms.Label();
            this.textBoxTitle = new System.Windows.Forms.TextBox();
            this.textBoxPosition = new System.Windows.Forms.TextBox();
            this.labelState = new System.Windows.Forms.Label();
            this.buttonMovePrev = new System.Windows.Forms.Button();
            this.labelZip = new System.Windows.Forms.Label();
            this.textBoxAddress = new System.Windows.Forms.TextBox();
            this.textBoxCompany = new System.Windows.Forms.TextBox();
            this.panelVCRControl = new System.Windows.Forms.Panel();
            this.comboBoxState = new System.Windows.Forms.ComboBox();
            this.labelAddress = new System.Windows.Forms.Label();
            this.labelID = new System.Windows.Forms.Label();
            this.textBoxContact = new System.Windows.Forms.TextBox();
            this.buttonMoveLast = new System.Windows.Forms.Button();
            this.textBoxZip = new System.Windows.Forms.TextBox();

            this.labelCity.Location = new System.Drawing.Point(16, 176);
            this.labelCity.Size = new System.Drawing.Size(64, 16);
            this.labelCity.TabIndex = 11;
            this.labelCity.Text = "City:";

            this.buttonMoveNext.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            this.buttonMoveNext.Click += new System.EventHandler(buttonMoveNext_Click);
            this.buttonMoveNext.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonMoveNext.Location = new System.Drawing.Point(280, 8);
            this.buttonMoveNext.Size = new System.Drawing.Size(32, 32);
            this.buttonMoveNext.TabIndex = 2;
            this.buttonMoveNext.Text = ">";

            this.customersDataSet1.DataSetName = "CustomersDataSet";

            this.labelContact.Location = new System.Drawing.Point(16, 80);
            this.labelContact.Size = new System.Drawing.Size(64, 16);
            this.labelContact.TabIndex = 7;
            this.labelContact.Text = "Contact:";

            this.buttonMoveFirst.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonMoveFirst.Click += new System.EventHandler(buttonMoveFirst_Click);
            this.buttonMoveFirst.Location = new System.Drawing.Point(8, 8);
            this.buttonMoveFirst.Size = new System.Drawing.Size(32, 32);
            this.buttonMoveFirst.TabIndex = 0;
            this.buttonMoveFirst.Text = "|<";

            this.textBoxID.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;

            this.textBoxID.Enabled = false;
            this.textBoxID.Location = new System.Drawing.Point(88, 16);
            this.textBoxID.ReadOnly = true;
            this.textBoxID.Size = new System.Drawing.Size(299, 20);
            this.textBoxID.TabIndex = 0;
            this.textBoxID.Text = "";

            this.textBoxCity.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            this.textBoxCity.Location = new System.Drawing.Point(88, 176);
            this.textBoxCity.Text = "";
            this.textBoxCity.TabIndex = 5;
            this.textBoxCity.Size = new System.Drawing.Size(216, 20);

            this.labelContactTitle.Location = new System.Drawing.Point(16, 112);
            this.labelContactTitle.Size = new System.Drawing.Size(64, 16);
            this.labelContactTitle.TabIndex = 8;
            this.labelContactTitle.Text = "Title:";

            this.labelCompanyName.Location = new System.Drawing.Point(16, 48);
            this.labelCompanyName.Size = new System.Drawing.Size(64, 16);
            this.labelCompanyName.TabIndex = 6;
            this.labelCompanyName.Text = "Company:";

            this.textBoxTitle.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            this.textBoxTitle.Location = new System.Drawing.Point(88, 112);
            this.textBoxTitle.Size = new System.Drawing.Size(216, 20);
            this.textBoxTitle.TabIndex = 3;
            this.textBoxTitle.Text = "";

            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(464, 357);
            this.Text = "Customer Details";

            this.textBoxPosition.Anchor = AnchorStyles.Left | AnchorStyles.Right;
            this.textBoxPosition.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.textBoxPosition.Enabled = false;
            this.textBoxPosition.Location = new System.Drawing.Point(88, 14);
            this.textBoxPosition.ReadOnly = true;
            this.textBoxPosition.Size = new System.Drawing.Size(184, 20);
            this.textBoxPosition.TabIndex = 1;
            this.textBoxPosition.Text = "";

            this.labelState.Location = new System.Drawing.Point(16, 208);
            this.labelState.Size = new System.Drawing.Size(64, 16);
            this.labelState.TabIndex = 13;
            this.labelState.Text = "State:";

            this.buttonMovePrev.Click += new System.EventHandler(buttonMovePrev_Click);
            this.buttonMovePrev.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonMovePrev.Location = new System.Drawing.Point(48, 8);
            this.buttonMovePrev.Size = new System.Drawing.Size(32, 32);
            this.buttonMovePrev.TabIndex = 1;
            this.buttonMovePrev.Text = "<";

            this.labelZip.Location = new System.Drawing.Point(16, 240);
            this.labelZip.Size = new System.Drawing.Size(64, 16);
            this.labelZip.TabIndex = 12;
            this.labelZip.Text = "Zip:";

            this.textBoxAddress.AcceptsReturn = true;
            this.textBoxAddress.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right;
            this.textBoxAddress.Location = new System.Drawing.Point(88, 144);
            this.textBoxAddress.Size = new System.Drawing.Size(360, 20);
            this.textBoxAddress.Text = "";
            this.textBoxAddress.TabIndex = 4;

            this.textBoxCompany.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            this.textBoxCompany.Location = new System.Drawing.Point(88, 48);
            this.textBoxCompany.Size = new System.Drawing.Size(296, 20);
            this.textBoxCompany.Text = "";
            this.textBoxCompany.TabIndex = 1;

            this.panelVCRControl.Anchor = AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right;
            this.panelVCRControl.AutoScrollMinSize = new System.Drawing.Size(0, 0);
            this.panelVCRControl.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panelVCRControl.Location = new System.Drawing.Point(88, 288);
            this.panelVCRControl.Size = new System.Drawing.Size(360, 48);
            this.panelVCRControl.TabIndex = 8;
            this.panelVCRControl.Text = "panel1";

            this.comboBoxState.Location = new System.Drawing.Point(88, 208);
            this.comboBoxState.Size = new System.Drawing.Size(176, 20);
            this.comboBoxState.Text = "";
            this.comboBoxState.TabIndex = 6;

            this.labelAddress.Location = new System.Drawing.Point(16, 144);
            this.labelAddress.Size = new System.Drawing.Size(64, 16);
            this.labelAddress.TabIndex = 9;
            this.labelAddress.Text = "Address:";

            this.labelID.Location = new System.Drawing.Point(16, 16);
            this.labelID.Size = new System.Drawing.Size(64, 16);
            this.labelID.TabIndex = 5;
            this.labelID.Text = "ID:";

            this.textBoxContact.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            this.textBoxContact.Location = new System.Drawing.Point(88, 80);
            this.textBoxContact.Size = new System.Drawing.Size(339, 20);
            this.textBoxContact.TabIndex = 2;
            this.textBoxContact.Text = "";

            this.buttonMoveLast.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            this.buttonMoveLast.Click += new System.EventHandler(buttonMoveLast_Click);
            this.buttonMoveLast.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonMoveLast.Location = new System.Drawing.Point(320, 8);
            this.buttonMoveLast.Size = new System.Drawing.Size(32, 32);
            this.buttonMoveLast.TabIndex = 3;
            this.buttonMoveLast.Text = ">|";

            this.textBoxZip.Location = new System.Drawing.Point(88, 240);
            this.textBoxZip.Size = new System.Drawing.Size(112, 20);
            this.textBoxZip.TabIndex = 7;
            this.textBoxZip.Text = "";

            this.panelVCRControl.Controls.AddRange(new System.Windows.Forms.Control[] {this.textBoxPosition,
                                                                                          this.buttonMoveFirst,
                                                                                          this.buttonMovePrev,
                                                                                          this.buttonMoveNext,
                                                                                          this.buttonMoveLast});
            this.Controls.AddRange(new System.Windows.Forms.Control[] {this.textBoxZip,
                                                                          this.comboBoxState,
                                                                          this.textBoxCity,
                                                                          this.labelState,
                                                                          this.labelZip,
                                                                          this.labelCity,
                                                                          this.panelVCRControl,
                                                                          this.textBoxCompany,
                                                                          this.labelCompanyName,
                                                                          this.textBoxAddress,
                                                                          this.textBoxTitle,
                                                                          this.textBoxContact,
                                                                          this.textBoxID,
                                                                          this.labelAddress,
                                                                          this.labelContactTitle,
                                                                          this.labelContact,
                                                                          this.labelID});
        }

        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new ComboBoxBinding());
        }

    }
}

















