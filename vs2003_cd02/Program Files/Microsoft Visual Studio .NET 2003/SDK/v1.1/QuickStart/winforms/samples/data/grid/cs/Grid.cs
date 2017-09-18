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


namespace Microsoft.Samples.WinForms.Cs.Grid {
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;

    using System.Data;
    using System.Data.SqlClient;

    public class Grid : System.Windows.Forms.Form {
        private System.ComponentModel.Container components;
        private System.Windows.Forms.StatusBar statusBar1;
        private Microsoft.Samples.WinForms.Cs.Grid.Data.CustomersDataSet customersDataSet1;
        private System.Windows.Forms.Button buttonLoad;
        private System.Windows.Forms.DataGrid dataGrid1;

        public Grid() {
            // Required by the Windows Forms Designer
            InitializeComponent();

            if ( dataGrid1.TableStyles.Count == 0 ) {
                dataGrid1.TableStyles.Add(new DataGridTableStyle());
            }
            this.dataGrid1.TableStyles[0].PreferredRowHeight = 16;
            this.dataGrid1.TableStyles[0].AlternatingBackColor = System.Drawing.Color.WhiteSmoke;
        }

        //Handle the Load Button Click
        //Load the Customers, Orders and OrderDetails Tables and display in the Grid
        private void buttonLoad_Click(object sender, System.EventArgs e) {
            Cursor currentCursor = Cursor.Current;
	    SqlConnection con = new SqlConnection("server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
            try {
                Cursor.Current = Cursors.WaitCursor;

                //Fill the DataSet
                SqlDataAdapter cmdCustomers = new SqlDataAdapter("Select * from Customers", con);
                SqlDataAdapter cmdOrders = new SqlDataAdapter("Select * from Orders", con);
                SqlDataAdapter cmdOrderDetails = new SqlDataAdapter("Select * from [Order Details]", con);
		customersDataSet1.Clear();
                statusBar1.Text ="Loading Customers...";
                cmdCustomers.Fill(customersDataSet1, "Customers");
                statusBar1.Text ="Loading Orders...";
                cmdOrders.Fill(customersDataSet1, "Orders");
                statusBar1.Text ="Loading Order Details...";
                cmdOrderDetails.Fill(customersDataSet1, "Order_Details");
                statusBar1.Text ="Updating Grid...";
            } finally {
                statusBar1.Text ="Done";
                Cursor.Current = currentCursor;
                con.Close();
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
            this.customersDataSet1 = new Microsoft.Samples.WinForms.Cs.Grid.Data.CustomersDataSet();
            this.buttonLoad = new System.Windows.Forms.Button();

            dataGrid1.BeginInit();
            this.dataGrid1.Text = "dataGrid1";
            this.dataGrid1.Size = new System.Drawing.Size(584, 336);
            this.dataGrid1.DataSource = customersDataSet1;
            this.dataGrid1.DataMember = "Customers";
            this.dataGrid1.ForeColor = System.Drawing.Color.Navy;
            this.dataGrid1.TabIndex = 0;
            this.dataGrid1.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right;
            this.dataGrid1.Location = new System.Drawing.Point(8, 8);
            this.dataGrid1.BackColor = System.Drawing.Color.Gainsboro;

            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.Text = "Customer Details";
            this.AcceptButton = buttonLoad;
            this.ClientSize = new System.Drawing.Size(600, 413);

            this.statusBar1.BackColor = System.Drawing.SystemColors.Control;
            this.statusBar1.Location = new System.Drawing.Point(0, 397);
            this.statusBar1.Size = new System.Drawing.Size(600, 16);
            this.statusBar1.TabIndex = 2;
            this.statusBar1.Text = "Click on Load";

            this.customersDataSet1.DataSetName = "CustomersDataSet";

            this.buttonLoad.Anchor = AnchorStyles.Right | AnchorStyles.Bottom;
            this.buttonLoad.Click += new System.EventHandler(buttonLoad_Click);
            this.buttonLoad.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonLoad.Location = new System.Drawing.Point(480, 352);
            this.buttonLoad.Size = new System.Drawing.Size(112, 32);
            this.buttonLoad.TabIndex = 1;
            this.buttonLoad.Text = "&Load";
            this.Controls.AddRange(new System.Windows.Forms.Control[] {statusBar1,
                                                                          buttonLoad,
                                                                          dataGrid1});
            this.dataGrid1.EndInit();
        }

        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new Grid());
        }

    }
}






















