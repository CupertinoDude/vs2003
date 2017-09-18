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



namespace  Microsoft.Samples.Windows.Forms.Cs.MasterDetailsClient {
    using System;
    using System.ComponentModel;
    using System.Diagnostics;
    using System.Windows.Forms;
    using System.Drawing;
    using System.Data;
    using System.Data.OleDb;
    using System.Web.Services.Protocols;
    using Microsoft.Samples.Windows.Forms.Cs.MasterDetails.Data;
    using Microsoft.Samples.Windows.Forms.Cs.MasterDetails.localhost;

    public class CustomersForm : System.Windows.Forms.Form {
        private System.ComponentModel.Container components;
        private Microsoft.Samples.Windows.Forms.Cs.MasterDetails.
            Data.CustomersAndOrdersDataSet customersAndOrdersDataSet1;
        private System.Windows.Forms.StatusBar statusBar1;
        private System.Windows.Forms.Button buttonLoad;
        private System.Windows.Forms.Button buttonUpdate;
        private System.Windows.Forms.DataGrid dataGrid2;
        private System.Windows.Forms.DataGrid dataGrid1;
        private System.Windows.Forms.DataGridTableStyle dataGridTableStyle1;
        private System.Windows.Forms.DataGridTableStyle dataGridTableStyle2;

        public CustomersForm() {
            // Required for Windows Forms Designer support
            InitializeComponent();
        }

        private void LoadData() {
            Cursor currentCursor = Cursor.Current;
            try {
                Cursor.Current = Cursors.WaitCursor;

                statusBar1.Text ="Loading Customers...";

                //Execute the XML Web service to return a DataSet
                CustomersAndOrders custList1 = new CustomersAndOrders();
                custList1.Credentials = 
                    System.Net.CredentialCache.DefaultCredentials;
                DataSet ds1 = custList1.GetCustomersAndOrders();

                //Merge the new dataset into our customersDataSet
                customersAndOrdersDataSet1.Merge(ds1);

                statusBar1.Text ="Updating Grid...";
            } finally {
                Cursor.Current = currentCursor;
                statusBar1.Text ="Done";
            }
        }

        private void buttonLoad_Click(object sender, System.EventArgs e) {
            LoadData();
        }

        private void buttonUpdate_Click(object sender, System.EventArgs e) {
            Cursor currentCursor = Cursor.Current;
            try {
                this.BindingContext[customersAndOrdersDataSet1, 
                    "Customers"].EndCurrentEdit();

                Cursor.Current = Cursors.WaitCursor;
                statusBar1.Text ="Updating Customers...";
                CustomersAndOrders custList1 = new CustomersAndOrders();
                custList1.Credentials = 
                    System.Net.CredentialCache.DefaultCredentials;

                DataSet changesDS = customersAndOrdersDataSet1.GetChanges();

                if (changesDS != null) {
                    //Execute the XML Web service to update the DataSet
                    DataSet ds1 = custList1.UpdateCustomersAndOrders(changesDS);
                    statusBar1.Text = "Updating Grid...";
                    customersAndOrdersDataSet1.Merge(ds1,false);

                    //Check for errors - if there are none accept the changes
                    if (customersAndOrdersDataSet1.HasErrors) {
                        MessageBox.Show("Save Failed - examine the row errors for details",
                            "Save Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    } else {
                        //Accept all the changes - this puts all the rows in the dataset
                        //back into unchanged or "Original" state
                        customersAndOrdersDataSet1.AcceptChanges();
                    }
                }
            } catch(Exception ex) {
                MessageBox.Show("Save Failed:\n\n" + ex.ToString(), 
                    "Save Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);
            } finally {
                Cursor.Current = currentCursor;
                statusBar1.Text ="Done";
            }
        }

        /**
         * CustomersForm overrides dispose so it can clean up the
         * component list.
         */
        protected override void Dispose(bool disposing) {
            if (disposing) {
                if (components != null) {
                    components.Dispose();
                }
            }
            base.Dispose(disposing);  
        }


        private void InitializeComponent() {
            this.components = new System.ComponentModel.Container();
            this.dataGrid2 = new System.Windows.Forms.DataGrid();
            this.customersAndOrdersDataSet1 = new Microsoft.Samples.Windows.
                Forms.Cs.MasterDetails.Data.CustomersAndOrdersDataSet();
            this.dataGrid1 = new System.Windows.Forms.DataGrid();
            this.buttonLoad = new System.Windows.Forms.Button();
            this.buttonUpdate = new System.Windows.Forms.Button();
            this.statusBar1 = new System.Windows.Forms.StatusBar();
            this.dataGridTableStyle1 = new System.Windows.Forms.DataGridTableStyle();
            this.dataGridTableStyle2 = new System.Windows.Forms.DataGridTableStyle();

            this.dataGrid1.BeginInit();
            this.dataGrid2.BeginInit();

            this.dataGrid1.TableStyles.AddRange(
                new System.Windows.Forms.DataGridTableStyle[] {this.dataGridTableStyle1});
            // 
            // dataGridTableStyle1
            // 
            this.dataGridTableStyle1.DataGrid = this.dataGrid1;
            this.dataGridTableStyle1.PreferredColumnWidth = 50;
            this.dataGridTableStyle1.SelectionBackColor = 
                System.Drawing.SystemColors.ActiveCaption;

            this.dataGrid2.TableStyles.AddRange(
                new System.Windows.Forms.DataGridTableStyle[] {this.dataGridTableStyle2});
            // 
            // dataGridTableStyle2
            // 
            this.dataGridTableStyle2.DataGrid = this.dataGrid2;
            this.dataGridTableStyle2.PreferredColumnWidth = 50;
            this.dataGridTableStyle2.SelectionBackColor = 
                System.Drawing.SystemColors.ActiveCaption;

            this.dataGrid2.Location = new System.Drawing.Point(8, 256);
            this.dataGrid2.Text = "dataGrid2";
            this.dataGrid2.Size = new System.Drawing.Size(584, 248);
            this.dataGrid2.ForeColor = System.Drawing.SystemColors.WindowText;
            this.dataGrid2.TabIndex = 1;
            this.dataGrid2.BackColor = System.Drawing.SystemColors.Window;
            this.dataGrid2.DataSource = customersAndOrdersDataSet1;
            this.dataGrid2.DataMember = "Customers.CustomersOrders";
            this.dataGrid2.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | 
                AnchorStyles.Left | AnchorStyles.Right;

            this.customersAndOrdersDataSet1.DataSetName = "CustomersAndOrdersDataSet";

            this.dataGrid1.Location = new System.Drawing.Point(8, 8);
            this.dataGrid1.Text = "dataGrid1";
            this.dataGrid1.Size = new System.Drawing.Size(584, 240);
            this.dataGrid1.ForeColor = System.Drawing.SystemColors.WindowText;
            this.dataGrid1.TabIndex = 0;
            this.dataGrid1.BackColor = System.Drawing.SystemColors.Window;
            this.dataGrid1.AllowNavigation = false;
            this.dataGrid1.DataSource = customersAndOrdersDataSet1;
            this.dataGrid1.DataMember = "Customers";
            this.dataGrid1.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | 
                AnchorStyles.Left | AnchorStyles.Right;

            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.Text = "Customer Orders";
            this.ClientSize = new System.Drawing.Size(600, 581);

            this.buttonLoad.Location = new System.Drawing.Point(376, 512);
            this.buttonLoad.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonLoad.Size = new System.Drawing.Size(104, 40);
            this.buttonLoad.TabIndex = 2;
            this.buttonLoad.Text = "&Load";
            this.buttonLoad.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
            this.buttonLoad.Click += new System.EventHandler(buttonLoad_Click);

            this.buttonUpdate.Location = new System.Drawing.Point(488, 512);
            this.buttonUpdate.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonUpdate.Size = new System.Drawing.Size(104, 40);
            this.buttonUpdate.TabIndex = 2;
            this.buttonUpdate.Text = "&Update";
            this.buttonUpdate.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
            this.buttonUpdate.Click += new System.EventHandler(buttonUpdate_Click);

            this.statusBar1.Location = new System.Drawing.Point(0, 561);
            this.statusBar1.BackColor = System.Drawing.SystemColors.Control;
            this.statusBar1.TabIndex = 3;
            this.statusBar1.Text = "Click on Load";
            this.statusBar1.Size = new System.Drawing.Size(600, 20);

            this.Controls.AddRange(new System.Windows.Forms.Control[] {this.statusBar1,
                                                                          this.buttonLoad,
                                                                          this.buttonUpdate,
                                                                          this.dataGrid2,
                                                                          this.dataGrid1});
            this.dataGrid1.EndInit();
            this.dataGrid2.EndInit();
        }

        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new CustomersForm());
        }
    }
}



