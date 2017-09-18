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


namespace Microsoft.Samples.WinForms.Cs.PrintingExample5 {
    using System;
    using System.ComponentModel;
    using System.Windows.Forms;
    using System.Drawing;
    using System.Drawing.Printing;
    using System.IO;

    public class PrintForm : System.Windows.Forms.Form {
        /// <summary>
        ///    Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components;
        protected internal System.Windows.Forms.Button printButton;
        protected internal System.Windows.Forms.Button pageSetupButton;
        protected internal System.Windows.Forms.Button printPreviewButton;

        private PageSettings storedPageSettings = null ;

        public PrintForm() {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            // Wire up event handlers for print buttons
            printButton.Click += new System.EventHandler(printButton_Click);
            pageSetupButton.Click += new System.EventHandler(pageSetupButton_Click);
            printPreviewButton.Click += new System.EventHandler(printPreviewButton_Click);
        }

        //Event fired when the user presses the page setup button
        private void pageSetupButton_Click(object sender, EventArgs e) {

            try {
                PageSetupDialog psDlg = new PageSetupDialog() ;

                if (storedPageSettings == null) {
                    storedPageSettings =  new PageSettings();
                }

                psDlg.PageSettings = storedPageSettings ;
                psDlg.ShowDialog();

            } catch(Exception ex) {
                MessageBox.Show("An error occurred - " + ex.Message);
            }

        }


        //Event fired when the user presses the print button
        private void printButton_Click(object sender, EventArgs e) {
            try {

                StreamReader streamToPrint = new StreamReader ("PrintMe.Txt");
                try {
                    TextFilePrintDocument pd = new TextFilePrintDocument(streamToPrint); //Assumes the default printer

                    if (storedPageSettings != null) {
                        pd.DefaultPageSettings = storedPageSettings ;
                    }

                    PrintDialog dlg = new PrintDialog() ;
                    dlg.Document = pd;
                    DialogResult result = dlg.ShowDialog();

                    if (result == DialogResult.OK) {
                        pd.Print();
                    }

                } finally {
                    streamToPrint.Close() ;
                }

            } catch(Exception ex) {
                MessageBox.Show("An error occurred printing the file - " + ex.Message);
            }
        }


        //Event fired when the user presses the print preview button
        private void printPreviewButton_Click(object sender, EventArgs e) {
            try {

                StreamReader streamToPrint = new StreamReader ("PrintMe.Txt");
                try {
                    TextFilePrintDocument pd = new TextFilePrintDocument(streamToPrint); //Assumes the default printer

                    if (storedPageSettings != null) {
                        pd.DefaultPageSettings = storedPageSettings ;
                    }

                    PrintPreviewDialog dlg = new PrintPreviewDialog() ;
                    dlg.Document = pd;
                    dlg.ShowDialog();

                } finally {
                    streamToPrint.Close() ;
                }

            } catch(Exception ex) {
                MessageBox.Show("An error occurred attempting to preview the file to print - " + ex.Message);
            }

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
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container ();
            this.printPreviewButton = new System.Windows.Forms.Button ();
            this.pageSetupButton = new System.Windows.Forms.Button ();
            this.printButton = new System.Windows.Forms.Button ();
            this.Text = "Print Example 5";
            this.AutoScaleBaseSize = new System.Drawing.Size (5, 13);
            this.ClientSize = new System.Drawing.Size (504, 381);
            printPreviewButton.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            printPreviewButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            printPreviewButton.Size = new System.Drawing.Size (136, 40);
            printPreviewButton.TabIndex = 0;
            printPreviewButton.Location = new System.Drawing.Point (32, 210);
            printPreviewButton.Text = "Print Preview";
            pageSetupButton.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            pageSetupButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            pageSetupButton.Size = new System.Drawing.Size (136, 40);
            pageSetupButton.TabIndex = 0;
            pageSetupButton.Location = new System.Drawing.Point (32, 160);
            pageSetupButton.Text = "Page Settings";
            printButton.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            printButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            printButton.Size = new System.Drawing.Size (136, 40);
            printButton.TabIndex = 0;
            printButton.Location = new System.Drawing.Point (32, 112);
            printButton.Text = "Print the file";
            this.Controls.Add (this.printButton);
            this.Controls.Add (this.pageSetupButton);
            this.Controls.Add (this.printPreviewButton);
        }

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new PrintForm());
        }

    }
}






