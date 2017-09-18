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


namespace Microsoft.Samples.Windows.Forms.Cs.Update {
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
    using System.Data;
    using System.Data.OleDb;
    using System.IO;
    using Microsoft.Samples.Windows.Forms.Cs.Update.Data;

    //Proxies to XML Web services
    using Microsoft.Samples.Windows.Forms.Cs.Update.localhost;

    public class UpdateForm : System.Windows.Forms.Form {
        private System.ComponentModel.Container components;
        private System.Windows.Forms.Label labelCountry;
        private System.Windows.Forms.TextBox textBoxCountry;
        private System.Windows.Forms.ErrorProvider errorProvider1;
        private System.Windows.Forms.StatusBar statusBar1;
        private System.Windows.Forms.Button buttonClose;
        private System.Windows.Forms.Button buttonNew;
        private System.Windows.Forms.Button buttonDiscard;
        private System.Windows.Forms.Button buttonDiscardAll;
        private System.Windows.Forms.Button buttonSave;
        private System.Windows.Forms.Button buttonLoad;
        private Microsoft.Samples.Windows.Forms.Cs.Update.Data.CustomersDataSet customersDataSet1;
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

        private State[] States  = new State[] {
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

        //Used to determine form state
        private bool dataSetHasChanges=false;
        private bool addingNew=false;

        public UpdateForm() {

            // Required by the Windows Forms Designer
            InitializeComponent();

            //Set up the Combobox bindings
            comboBoxState.DataSource=States;            //Populate the list
            comboBoxState.DisplayMember="LongName";     //Define the field to be displayed
            comboBoxState.ValueMember="ShortName";      //Define the field to be used as the value

            //Bind the selected value of the combobox to the Region field of the current
            //Customer
            comboBoxState.DataBindings.Add("SelectedValue", customersDataSet1, "Customers.Region");

            //Set up the rest of the form bindings
            textBoxID.DataBindings.Add("Text", customersDataSet1, "Customers.CustomerID");
            textBoxTitle.DataBindings.Add("Text", customersDataSet1, "Customers.ContactTitle");
            textBoxAddress.DataBindings.Add("Text", customersDataSet1, "Customers.Address");
            textBoxCity.DataBindings.Add("Text", customersDataSet1, "Customers.City");
            textBoxCompany.DataBindings.Add("Text", customersDataSet1, "Customers.CompanyName");
            textBoxContact.DataBindings.Add("Text", customersDataSet1, "Customers.ContactName");
            textBoxZip.DataBindings.Add("Text", customersDataSet1, "Customers.PostalCode");
            textBoxCountry.DataBindings.Add("Text", customersDataSet1, "Customers.Country");

            //We want to handle position changing events for the DATA VCR Panel
            //Position is managed by the Form's BindingContext so hook the position changed
            //event on the BindingContext
            this.BindingContext[customersDataSet1, "Customers"].PositionChanged += new System.EventHandler(customers_PositionChanged);

            //Set the minimum form size
            this.MinimumSize = new Size(544, 380);
        }

        //*** Methods

        //Load the CustomersDataSet using the ListCustomers XML Web service
        private void LoadData() {

            //Make sure that we don't fire column changing events whilst we are loading the data
            this.customersDataSet1.Customers.ColumnChanging -=
                            new DataColumnChangeEventHandler(customers_ColumnChanging);

            try
            {
                //Execute the XML Web service to return a DataSet
                ListCustomers custList1 = new ListCustomers();
                custList1.Credentials = 
                    System.Net.CredentialCache.DefaultCredentials;
                DataSet ds1 = custList1.GetCustomers();

                //Merge the new dataset into our customersDataSet
                customersDataSet1.Merge(ds1);

                //Make sure that the dataset is in "original" state
                customersDataSet1.AcceptChanges();
            }
            catch (System.Exception e)
            {
                MessageBox.Show("Load Data Failed:\n\n" + e.ToString(), "Load Data Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            //We want to know when any data fields have changed so hook the column changing
            //event
            this.customersDataSet1.Customers.ColumnChanging += new DataColumnChangeEventHandler(customers_ColumnChanging);
        }

        //Save any changes back to the database via the UpdateCustomers XML Web service
        //The XML Web service will return a set of rows that reflect the state of the
        //database on completion of the save operation
        private void SaveData() {

            //Clear all old errors in the Customers table before
            //we attempt to save
            DataRow[] errorRows = customersDataSet1.Customers.GetErrors();
            foreach (DataRow row in errorRows) {
                row.ClearErrors();
            }

            //Get a dataset containing just the changes
            DataSet changes = customersDataSet1.GetChanges();

            //Execute the XML Web service to perform the update
            UpdateCustomers custUpdate1 = new UpdateCustomers();
            custUpdate1.Credentials = 
                System.Net.CredentialCache.DefaultCredentials;

            //Save the changes back to the database
            DataSet updatesDS = custUpdate1.Save(changes);

            //Merge any changes that came back form the server into our dataset
            customersDataSet1.Merge(updatesDS,false);

        }

        //Update the state of the form based on the current state
        //of the dataset
        void UpdateViewState() {

            //If we are adding a new record then allow the user to
            //set the Customer ID
            if (addingNew) {
                textBoxID.Enabled=true;
                textBoxID.ReadOnly=false;
            } else {
                textBoxID.Enabled=false;
                textBoxID.ReadOnly=true;
            }

            //If we have a DataSet with data in it then disable the
            //Load button and enable all the update buttons
            //Also change the default button for the Form to be the
            //Save Button
            if (customersDataSet1.Customers.Count != 0) {
                buttonLoad.Enabled=false;
                buttonNew.Enabled=true;
                buttonLoad.Enabled=false;
                buttonSave.Enabled=true;
                buttonDiscard.Enabled=true;
                buttonDiscardAll.Enabled=true;
                this.AcceptButton=buttonSave;
            }

            //If the dataset has changed then update the status bar
            if (dataSetHasChanges)
                statusBar1.Text ="Data has changed";
            else
                statusBar1.Text ="Customers";
        }


        //*** Event Handlers

        //Handle the Close Button Click
        protected void buttonClose_Click(object sender, System.EventArgs e) {
            this.Close();
        }


        //Handle the Discard Button Click - this discards only changes to the
        //current item
        protected void buttonDiscard_Click(object sender, System.EventArgs e) {

            //Reset the item currently being edited
            this.BindingContext[customersDataSet1, "Customers"].CancelCurrentEdit();
            addingNew=false;

            //Clear errors
            DataRowView currentRowView = (DataRowView)(this.BindingContext[customersDataSet1, "Customers"].Current);

            //Reset the dataset
            currentRowView.Row.RejectChanges();
            currentRowView.Row.ClearErrors();

            //Update the state of the view
            UpdateViewState();
        }


        //Handle the Discard All Button Click - cancels all changes in the dataset
        protected void buttonDiscardAll_Click(object sender, System.EventArgs e) {

            //Reset the item currently being edited
            this.BindingContext[customersDataSet1, "Customers"].CancelCurrentEdit();

            //Clear all old errors
            DataRow[] errorRows = customersDataSet1.Customers.GetErrors();
            foreach (DataRow row in errorRows) {
                row.ClearErrors();
            }

            //Reset the dataset
            customersDataSet1.RejectChanges();
            dataSetHasChanges = false;
            addingNew=false;

            //Update the state of the view
            UpdateViewState();
        }


        //Handle the Load Button Click
        protected void buttonLoad_Click(object sender, System.EventArgs e) {

            Cursor currentCursor = Cursor.Current;
            try {
                Cursor.Current = Cursors.WaitCursor;

                statusBar1.Text ="Loading Customers...";

                //Load the customers
                LoadData();

                //Update the state of the view
                UpdateViewState();

                //Set up the initial text for the DATA VCR Panel
                textBoxPosition.Text = String.Format("Record {0} of {1}", (this.BindingContext[customersDataSet1, "Customers"].Position + 1), customersDataSet1.Customers.Count);

            } finally {
                Cursor.Current = currentCursor;
                statusBar1.Text ="Done";
            }

        }


        //When the MoveFirst button is clicked set the position for Customers
        //to the first record
        protected void buttonMoveFirst_Click(object sender, System.EventArgs e) {
            this.BindingContext[customersDataSet1, "Customers"].Position = 0 ;
        }


        //When the MoveLast button is clicked set the position for Customers
        //to the last record
        protected void buttonMoveLast_Click(object sender, System.EventArgs e) {
            this.BindingContext[customersDataSet1, "Customers"].Position = customersDataSet1.Customers.Count - 1;
        }


        //When the MoveNext button is clicked increment the position for Customers
        protected void buttonMoveNext_Click(object sender, System.EventArgs e) {
            if (this.BindingContext[customersDataSet1, "Customers"].Position < customersDataSet1.Customers.Count - 1) {
                this.BindingContext[customersDataSet1, "Customers"].Position++;
            }
        }


        //When the MovePrev button is clicked decrement the position for Customers
        protected void buttonMovePrev_Click(object sender, System.EventArgs e) {
            if (this.BindingContext[customersDataSet1, "Customers"].Position > 0) {
                this.BindingContext[customersDataSet1, "Customers"].Position--;
            }
        }


        //Handle the New Button Click
        protected void buttonNew_Click(object sender, System.EventArgs e) {

            //Ask the BindingContext to create a new record
            this.BindingContext[customersDataSet1, "Customers"].AddNew();

            //Update the state of the view
            addingNew=true;
            UpdateViewState();
        }


        //Handle the Save Button Click
        protected void buttonSave_Click(object sender, System.EventArgs e) {

            Cursor currentCursor = Cursor.Current;
            try {
                Cursor.Current = Cursors.WaitCursor;

                statusBar1.Text ="Saving Customers...";

                //Make sure we've flushed any changes in the current row back into the
                //dataset
                this.BindingContext[customersDataSet1, "Customers"].EndCurrentEdit();

                //If the dataset has changes then save them
                if (dataSetHasChanges) {

                    //Save the changes to the dataset
                    this.SaveData();

                    //Check for errors - if there are none accept the changes
                    if (customersDataSet1.HasErrors) {

                        DataRow[] errorRows = customersDataSet1.Customers.GetErrors();
                        StringWriter sw = new StringWriter();
                        sw.WriteLine("Your changes were not saved. Examine the individual records for detailed information. Errors occurred in the following records:\n");

                        foreach (DataRow row in errorRows) {
                            sw.Write(row["CompanyName"]);
                            sw.Write(" - ");
                            sw.WriteLine(row.RowError);
                        }

                        MessageBox.Show(sw.ToString(), "Save Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);

                    } else {
                        //Accept all the changes - this puts all the rows in the dataset
                        //back into unchanged or "Original" state
                        customersDataSet1.AcceptChanges();
                        dataSetHasChanges=false;
                    }

                    //Update the view state
                    UpdateViewState();
                }

            } catch (Exception ex) {
                MessageBox.Show("Save Failed:\n\n" + ex.ToString(), "Save Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);
            } finally {
                Cursor.Current = currentCursor;
                statusBar1.Text ="Done";
            }

        }

        //Handle the column changing event on the Customers table
        //We use this to determine whether any changes have been made to
        //the dataset
        protected void customers_ColumnChanging(object sender, System.Data.DataColumnChangeEventArgs e) {
            dataSetHasChanges = true;
            UpdateViewState();
        }

        //Position has changed - update the DATA VCR panel
        protected void customers_PositionChanged(object sender, System.EventArgs e) {
            textBoxPosition.Text = String.Format("Record {0} of {1}", (this.BindingContext[customersDataSet1, "Customers"].Position + 1), customersDataSet1.Customers.Count);
        }

        //The form is closing - if there are unsaved changed then confirm that this is OK
        protected void UpdateForm_Closing(object sender, System.ComponentModel.CancelEventArgs e) {

            //Make sure we've flushed any changes in the current row back into the
            //dataset
            this.BindingContext[customersDataSet1, "Customers"].EndCurrentEdit();

            if (dataSetHasChanges) {
            DialogResult res = MessageBox.Show(  "Do you want to save your changes?"
                                                   , "Changes not Saved"
                                                   , MessageBoxButtons.YesNoCancel
                                                   , MessageBoxIcon.Warning);

                if (res==DialogResult.Yes || res==DialogResult.Cancel) {
                    //If the user chose Save or Cancel then cancel the form close
                    e.Cancel=true;
                }
            }
      }

        protected override void Dispose(bool disposing) {
            if (disposing) {
                if (components != null) {
                    components.Dispose();
                }
            }
            base.Dispose(disposing);
        }

        protected void InitializeComponent() {
            this.components = new System.ComponentModel.Container();
            this.textBoxAddress = new System.Windows.Forms.TextBox();
            this.labelContactTitle = new System.Windows.Forms.Label();
            this.comboBoxState = new System.Windows.Forms.ComboBox();
            this.textBoxCountry = new System.Windows.Forms.TextBox();
            this.panelVCRControl = new System.Windows.Forms.Panel();
            this.textBoxID = new System.Windows.Forms.TextBox();
            this.labelCountry = new System.Windows.Forms.Label();
            this.statusBar1 = new System.Windows.Forms.StatusBar();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider();
            this.buttonNew = new System.Windows.Forms.Button();
            this.buttonDiscardAll = new System.Windows.Forms.Button();
            this.labelCity = new System.Windows.Forms.Label();
            this.labelState = new System.Windows.Forms.Label();
            this.buttonSave = new System.Windows.Forms.Button();
            this.buttonDiscard = new System.Windows.Forms.Button();
            this.labelID = new System.Windows.Forms.Label();
            this.labelCompanyName = new System.Windows.Forms.Label();
            this.textBoxTitle = new System.Windows.Forms.TextBox();
            this.textBoxCompany = new System.Windows.Forms.TextBox();
            this.buttonMoveLast = new System.Windows.Forms.Button();
            this.textBoxCity = new System.Windows.Forms.TextBox();
            this.buttonMovePrev = new System.Windows.Forms.Button();
            this.customersDataSet1 = new Microsoft.Samples.Windows.Forms.Cs.Update.Data.CustomersDataSet();
            this.labelContact = new System.Windows.Forms.Label();
            this.buttonLoad = new System.Windows.Forms.Button();
            this.buttonMoveFirst = new System.Windows.Forms.Button();
            this.labelAddress = new System.Windows.Forms.Label();
            this.textBoxPosition = new System.Windows.Forms.TextBox();
            this.buttonMoveNext = new System.Windows.Forms.Button();
            this.textBoxZip = new System.Windows.Forms.TextBox();
            this.labelZip = new System.Windows.Forms.Label();
            this.textBoxContact = new System.Windows.Forms.TextBox();
            this.buttonClose = new System.Windows.Forms.Button();

            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.Text = "Customer Details";
            this.AcceptButton = buttonLoad;
            this.ClientSize = new System.Drawing.Size(544, 357);
            this.Closing += new System.ComponentModel.CancelEventHandler(UpdateForm_Closing);

            textBoxAddress.Location = new System.Drawing.Point(88, 144);
            textBoxAddress.Text="";
            textBoxAddress.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right;
            textBoxAddress.AcceptsReturn = true;
            textBoxAddress.TabIndex = 4;
            textBoxAddress.Size = new System.Drawing.Size(344, 20);

            labelContactTitle.Location = new System.Drawing.Point(16, 112);
            labelContactTitle.Text = "Title:";
            labelContactTitle.Size = new System.Drawing.Size(64, 16);
            labelContactTitle.TabIndex = 8;

            comboBoxState.Text="";
            comboBoxState.Location = new System.Drawing.Point(88, 208);
            comboBoxState.Size = new System.Drawing.Size(176, 21);
            comboBoxState.TabIndex = 6;

            textBoxCountry.Location = new System.Drawing.Point(288, 240);
            textBoxCountry.Text="";
            textBoxCountry.TabIndex = 20;
            textBoxCountry.Size = new System.Drawing.Size(112, 20);

            panelVCRControl.Location = new System.Drawing.Point(32, 280);
            panelVCRControl.Text = "panel1";
            panelVCRControl.Anchor = AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right;
            panelVCRControl.Size = new System.Drawing.Size(488, 48);
            panelVCRControl.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            panelVCRControl.TabIndex = 8;

            textBoxID.Location = new System.Drawing.Point(88, 16);
            textBoxID.Text="";
            textBoxID.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            textBoxID.Enabled = false;
            textBoxID.ReadOnly = true;
            textBoxID.TabIndex = 0;
            textBoxID.Size = new System.Drawing.Size(168, 20);

            labelCountry.Location = new System.Drawing.Point(232, 242);
            labelCountry.Text = "Country:";
            labelCountry.Size = new System.Drawing.Size(56, 16);
            labelCountry.TabIndex = 21;

            statusBar1.BackColor = System.Drawing.SystemColors.Control;
            statusBar1.Location = new System.Drawing.Point(0, 337);
            statusBar1.Size = new System.Drawing.Size(544, 20);
            statusBar1.TabIndex = 19;
            statusBar1.Text = "Click on Load";

            //BUG errorProvider1.DataMember = "Customers";
            //BUG errorProvider1.DataSource = customersDataSet1;
            errorProvider1.ContainerControl = this;

            buttonNew.Location = new System.Drawing.Point(448, 88);
            buttonNew.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            buttonNew.Size = new System.Drawing.Size(80, 32);
            buttonNew.TabIndex = 17;
            buttonNew.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            buttonNew.Enabled = false;
            buttonNew.Text = "&New";
            buttonNew.Click += new System.EventHandler(buttonNew_Click);

            buttonDiscardAll.Location = new System.Drawing.Point(448, 168);
            buttonDiscardAll.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            buttonDiscardAll.Size = new System.Drawing.Size(80, 32);
            buttonDiscardAll.TabIndex = 17;
            buttonDiscardAll.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            buttonDiscardAll.Enabled = false;
            buttonDiscardAll.Text = "Discard &All";
            buttonDiscardAll.Click += new System.EventHandler(buttonDiscardAll_Click);

            labelCity.Location = new System.Drawing.Point(16, 176);
            labelCity.Text = "City:";
            labelCity.Size = new System.Drawing.Size(64, 16);
            labelCity.TabIndex = 11;

            labelState.Location = new System.Drawing.Point(16, 208);
            labelState.Text = "State:";
            labelState.Size = new System.Drawing.Size(64, 16);
            labelState.TabIndex = 13;

            buttonSave.Location = new System.Drawing.Point(448, 48);
            buttonSave.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            buttonSave.Size = new System.Drawing.Size(80, 32);
            buttonSave.TabIndex = 15;
            buttonSave.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            buttonSave.Enabled = false;
            buttonSave.Text = "&Save";
            buttonSave.Click += new System.EventHandler(buttonSave_Click);

            buttonDiscard.Location = new System.Drawing.Point(448, 128);
            buttonDiscard.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            buttonDiscard.Size = new System.Drawing.Size(80, 32);
            buttonDiscard.TabIndex = 16;
            buttonDiscard.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            buttonDiscard.Enabled = false;
            buttonDiscard.Text = "&Discard";
            buttonDiscard.Click += new System.EventHandler(buttonDiscard_Click);

            labelID.Location = new System.Drawing.Point(16, 16);
            labelID.Text = "ID:";
            labelID.Size = new System.Drawing.Size(64, 16);
            labelID.TabIndex = 5;

            labelCompanyName.Location = new System.Drawing.Point(16, 48);
            labelCompanyName.Text = "Company:";
            labelCompanyName.Size = new System.Drawing.Size(64, 16);
            labelCompanyName.TabIndex = 6;

            textBoxTitle.Location = new System.Drawing.Point(88, 112);
            textBoxTitle.Text="";
            textBoxTitle.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            textBoxTitle.TabIndex = 3;
            textBoxTitle.Size = new System.Drawing.Size(264, 20);

            textBoxCompany.Location = new System.Drawing.Point(88, 48);
            textBoxCompany.Text="";
            textBoxCompany.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            textBoxCompany.TabIndex = 1;
            textBoxCompany.Size = new System.Drawing.Size(304, 20);

            buttonMoveLast.Location = new System.Drawing.Point(446, 8);
            buttonMoveLast.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            buttonMoveLast.Size = new System.Drawing.Size(32, 32);
            buttonMoveLast.TabIndex = 3;
            buttonMoveLast.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            buttonMoveLast.Text = ">|";
            buttonMoveLast.Click += new System.EventHandler(buttonMoveLast_Click);

            textBoxCity.Location = new System.Drawing.Point(88, 176);
            textBoxCity.Text="";
            textBoxCity.TabIndex = 5;
            textBoxCity.Size = new System.Drawing.Size(216, 20);

            buttonMovePrev.Location = new System.Drawing.Point(48, 8);
            buttonMovePrev.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            buttonMovePrev.Size = new System.Drawing.Size(32, 32);
            buttonMovePrev.TabIndex = 1;
            buttonMovePrev.Text = "<";
            buttonMovePrev.Click += new System.EventHandler(buttonMovePrev_Click);

            customersDataSet1.DataSetName = "CustomersDataSet";

            labelContact.Location = new System.Drawing.Point(16, 80);
            labelContact.Text = "Contact:";
            labelContact.Size = new System.Drawing.Size(64, 16);
            labelContact.TabIndex = 7;

            buttonLoad.Location = new System.Drawing.Point(448, 8);
            buttonLoad.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            buttonLoad.Size = new System.Drawing.Size(80, 32);
            buttonLoad.TabIndex = 14;
            buttonLoad.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            buttonLoad.Text = "&Load";
            buttonLoad.Click += new System.EventHandler(buttonLoad_Click);

            buttonMoveFirst.Location = new System.Drawing.Point(8, 8);
            buttonMoveFirst.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            buttonMoveFirst.Size = new System.Drawing.Size(32, 32);
            buttonMoveFirst.TabIndex = 0;
            buttonMoveFirst.Text = "|<";
            buttonMoveFirst.Click += new System.EventHandler(buttonMoveFirst_Click);

            labelAddress.Location = new System.Drawing.Point(16, 144);
            labelAddress.Text = "Address:";
            labelAddress.Size = new System.Drawing.Size(64, 16);
            labelAddress.TabIndex = 9;

            textBoxPosition.Location = new System.Drawing.Point(88, 13);
            textBoxPosition.Text="";
            textBoxPosition.Anchor = AnchorStyles.Left | AnchorStyles.Right;
            textBoxPosition.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            textBoxPosition.Enabled = false;
            textBoxPosition.ReadOnly = true;
            textBoxPosition.TabIndex = 1;
            textBoxPosition.Size = new System.Drawing.Size(310, 20);

            buttonMoveNext.Location = new System.Drawing.Point(406, 8);
            buttonMoveNext.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            buttonMoveNext.Size = new System.Drawing.Size(32, 32);
            buttonMoveNext.TabIndex = 2;
            buttonMoveNext.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            buttonMoveNext.Text = ">";
            buttonMoveNext.Click += new System.EventHandler(buttonMoveNext_Click);

            textBoxZip.Location = new System.Drawing.Point(88, 240);
            textBoxZip.Text="";
            textBoxZip.TabIndex = 7;
            textBoxZip.Size = new System.Drawing.Size(112, 20);

            labelZip.Location = new System.Drawing.Point(16, 240);
            labelZip.Text = "Zip:";
            labelZip.Size = new System.Drawing.Size(64, 16);
            labelZip.TabIndex = 12;

            textBoxContact.Location = new System.Drawing.Point(88, 80);
            textBoxContact.Text="";
            textBoxContact.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            textBoxContact.TabIndex = 2;
            textBoxContact.Size = new System.Drawing.Size(304, 20);

            buttonClose.Location = new System.Drawing.Point(448, 204);
            buttonClose.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            buttonClose.Size = new System.Drawing.Size(80, 32);
            buttonClose.TabIndex = 18;
            buttonClose.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            buttonClose.Text = "Close";
            buttonClose.Click += new System.EventHandler(buttonClose_Click);

            panelVCRControl.Controls.Add(textBoxPosition);
            panelVCRControl.Controls.Add(buttonMoveFirst);
            panelVCRControl.Controls.Add(buttonMovePrev);
            panelVCRControl.Controls.Add(buttonMoveNext);
            panelVCRControl.Controls.Add(buttonMoveLast);
            this.Controls.Add(labelCountry);
            this.Controls.Add(textBoxCountry);
            this.Controls.Add(statusBar1);
            this.Controls.Add(buttonClose);
            this.Controls.Add(buttonNew);
            this.Controls.Add(buttonDiscard);
            this.Controls.Add(buttonDiscardAll);
            this.Controls.Add(buttonSave);
            this.Controls.Add(buttonLoad);
            this.Controls.Add(textBoxZip);
            this.Controls.Add(comboBoxState);
            this.Controls.Add(textBoxCity);
            this.Controls.Add(labelState);
            this.Controls.Add(labelZip);
            this.Controls.Add(labelCity);
            this.Controls.Add(panelVCRControl);
            this.Controls.Add(textBoxCompany);
            this.Controls.Add(labelCompanyName);
            this.Controls.Add(textBoxAddress);
            this.Controls.Add(textBoxTitle);
            this.Controls.Add(textBoxContact);
            this.Controls.Add(textBoxID);
            this.Controls.Add(labelAddress);
            this.Controls.Add(labelContactTitle);
            this.Controls.Add(labelContact);
            this.Controls.Add(labelID);

        }


        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new UpdateForm());
        }

    }

}




