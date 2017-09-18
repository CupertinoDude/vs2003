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


namespace Microsoft.Samples.WinForms.Cs.PrintingExample1 {
    using System;
    using System.ComponentModel;
    using System.Windows.Forms;
    using System.Drawing;
    using System.Drawing.Printing;
    using System.IO;

    public class PrintingExample1 : System.Windows.Forms.Form {
        /// <summary>
        ///    Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components;
        protected internal System.Windows.Forms.Button printButton;

        private Font printFont;
        private StreamReader streamToPrint;


        public PrintingExample1() {

            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            // Wire up event handler for print button
            printButton.Click += new System.EventHandler(printButton_Click);
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

        //Event fired when the user presses the print button
        private void printButton_Click(object sender, EventArgs e) {
            try {

                streamToPrint = new StreamReader ("PrintMe.Txt");
                try {
                    printFont = new Font("Arial", 10);
                    PrintDocument pd = new PrintDocument(); //Assumes the default printer
                    pd.PrintPage += new PrintPageEventHandler(this.pd_PrintPage);
                    pd.Print();
                } finally {
                    streamToPrint.Close() ;
                }

            } catch(Exception ex) {
                MessageBox.Show("An error occurred printing the file - " + ex.Message);
            }
        }

        //Event fired for each page to print
        private void pd_PrintPage(object sender, PrintPageEventArgs ev) {
            float lpp = 0 ;
            float yPos =  0 ;
            int count = 0 ;
            float leftMargin = ev.MarginBounds.Left;
            float topMargin = ev.MarginBounds.Top;
            String line=null;

            //Work out the number of lines per page
            //Use the MarginBounds on the event to do this
            lpp = ev.MarginBounds.Height  / printFont.GetHeight(ev.Graphics) ;

            //Now iterate over the file printing out each line
            //NOTE WELL: This assumes that a single line is not wider than the page width
            //Check count first so that we don't read line that we won't print
            while (count < lpp && ((line=streamToPrint.ReadLine()) != null)) {
                yPos = topMargin + (count * printFont.GetHeight(ev.Graphics));

                ev.Graphics.DrawString (line, printFont, Brushes.Black, leftMargin, yPos, new StringFormat());

                count++;
            }

            //If we have more lines then print another page
            if (line != null)
                ev.HasMorePages = true ;
            else
                ev.HasMorePages = false ;
        }


        /// <summary>
        ///    Required method for Designer support - do not modify
        ///    the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container ();
            this.printButton = new System.Windows.Forms.Button ();
            this.Text = "Print Example 1";
            this.AutoScaleBaseSize = new System.Drawing.Size (5, 13);
            this.ClientSize = new System.Drawing.Size (504, 381);
            printButton.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            printButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            printButton.Size = new System.Drawing.Size (136, 40);
            printButton.TabIndex = 0;
            printButton.Location = new System.Drawing.Point (32, 112);
            printButton.Text = "Print the file";
            this.Controls.Add (this.printButton);
        }

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new PrintingExample1());
        }

    }
}






