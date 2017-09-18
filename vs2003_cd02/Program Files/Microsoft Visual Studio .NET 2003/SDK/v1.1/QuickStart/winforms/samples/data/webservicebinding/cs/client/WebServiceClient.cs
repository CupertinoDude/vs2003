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


namespace Microsoft.Samples.Windows.Forms.Cs.WebServiceClient {
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;

    using System.Data;
    using System.Data.OleDb;

    using Microsoft.Samples.Windows.Forms.Cs.WebServiceBinding.localhost;

    using System.Net;
    using System.IO;


    public class WebServiceClient : System.Windows.Forms.Form {
        private System.ComponentModel.Container components;
        private System.Windows.Forms.StatusBar statusBar1;
        private Microsoft.Samples.Windows.Forms.Cs.WebServiceBinding.Data.CustomersAndOrdersDataSet customersAndOrdersDataSet1;
        private System.Windows.Forms.Button buttonLoad;
        private System.Windows.Forms.DataGrid dataGrid1;

        public WebServiceClient() {

            // Required by the Windows Forms Designer
            InitializeComponent();
            if ( dataGrid1.TableStyles.Count == 0 ) {
                dataGrid1.TableStyles.Add(new DataGridTableStyle());
            }
            dataGrid1.TableStyles[0].PreferredRowHeight = 16;
            dataGrid1.TableStyles[0].AlternatingBackColor = System.Drawing.Color.WhiteSmoke;
        }

        protected void buttonLoad_Click(object sender, System.EventArgs e) {
            Cursor currentCursor = Cursor.Current;
            try {
                Cursor.Current = Cursors.WaitCursor;

                statusBar1.Text ="Loading Customers...";

                //Execute the XML Web service to return a DataSet
                CustomersList custList1 = new CustomersList();
                custList1.Credentials =
                   System.Net.CredentialCache.DefaultCredentials;
                DataSet ds1 = custList1.GetCustomers();

                //Merge the new dataset into our customersDataSet
                customersAndOrdersDataSet1.Merge(ds1);

                statusBar1.Text ="Updating Grid...";
            } finally {
                Cursor.Current = currentCursor;
                statusBar1.Text ="Done";
            }
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
            this.dataGrid1 = new System.Windows.Forms.DataGrid();
            this.statusBar1 = new System.Windows.Forms.StatusBar();
            this.customersAndOrdersDataSet1 = new Microsoft.Samples.Windows.Forms.Cs.WebServiceBinding.Data.CustomersAndOrdersDataSet();
            this.buttonLoad = new System.Windows.Forms.Button();

            dataGrid1.BeginInit();

            dataGrid1.Text = "dataGrid1";
            dataGrid1.Size = new System.Drawing.Size(584, 336);
            dataGrid1.DataSource = customersAndOrdersDataSet1;
            dataGrid1.DataMember = "Customers";
            dataGrid1.ForeColor = System.Drawing.Color.Navy;
            dataGrid1.TabIndex = 0;
            dataGrid1.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right;
            dataGrid1.Location = new System.Drawing.Point(8, 8);
            dataGrid1.BackColor = System.Drawing.Color.Gainsboro;

            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.Text = "Customer Details";
            this.AcceptButton = buttonLoad;
            this.ClientSize = new System.Drawing.Size(600, 413);

            statusBar1.BackColor = System.Drawing.SystemColors.Control;
            statusBar1.Size = new System.Drawing.Size(600, 16);
            statusBar1.TabIndex = 2;
            statusBar1.Text = "Click on Load";
            statusBar1.Location = new System.Drawing.Point(0, 397);

            customersAndOrdersDataSet1.DataSetName = "CustomersDataSet";

            buttonLoad.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            buttonLoad.Size = new System.Drawing.Size(112, 32);
            buttonLoad.TabIndex = 1;
            buttonLoad.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
            buttonLoad.Text = "&Load";
            buttonLoad.Location = new System.Drawing.Point(480, 352);
            buttonLoad.Click += new System.EventHandler(buttonLoad_Click);

            this.Controls.Add(statusBar1);
            this.Controls.Add(buttonLoad);
            this.Controls.Add(dataGrid1);

            dataGrid1.EndInit();
        }


        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new WebServiceClient());
        }

    }
}






















