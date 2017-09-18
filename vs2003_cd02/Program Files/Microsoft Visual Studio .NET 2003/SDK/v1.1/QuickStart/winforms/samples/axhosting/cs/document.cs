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


namespace Microsoft.Samples.WinForms.Cs.AxHosting {
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
    using AxSHDocVw;

    public class Document : System.Windows.Forms.Form {
        private System.ComponentModel.Container components;
        private AxSHDocVw.AxWebBrowser AxWebBrowser1;
        private System.Windows.Forms.Button buttonGo;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panel1;

        public Document() : base() {

            // Required by the Windows Forms Designer
            InitializeComponent();

            this.components = new System.ComponentModel.Container();
            this.AxWebBrowser1 = new AxSHDocVw.AxWebBrowser();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.buttonGo = new System.Windows.Forms.Button();

            AxWebBrowser1.BeginInit();
            AxWebBrowser1.Size = new System.Drawing.Size(292, 273);
            AxWebBrowser1.TabIndex = 3;
            AxWebBrowser1.Dock = System.Windows.Forms.DockStyle.Fill;

            textBox1.Text = "http://localhost/quickstart/";
            textBox1.Anchor = AnchorStyles.Left | AnchorStyles.Right;
            textBox1.TabIndex = 1;
            textBox1.Size = new System.Drawing.Size(450, 20);
            textBox1.Location = new System.Drawing.Point(56, 2);
            textBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;


            panel1.Dock = System.Windows.Forms.DockStyle.Top;
            panel1.AutoScrollMinSize = new System.Drawing.Size(0, 0);
            panel1.Size = new System.Drawing.Size(600, 24);
            panel1.TabIndex = 0;
            panel1.Text = "panel1";

            label1.Size = new System.Drawing.Size(64, 16);
            label1.Anchor = System.Windows.Forms.AnchorStyles.Left;
            label1.TabIndex = 0;
            label1.Text = "Address:";
            label1.Location = new System.Drawing.Point(0, 4);

            buttonGo.Anchor = System.Windows.Forms.AnchorStyles.Right;
            buttonGo.Size = new System.Drawing.Size(88, 24);
            buttonGo.TabIndex = 2;
            buttonGo.Text = "&Go";
            buttonGo.Location = new System.Drawing.Point(510, 0);
            buttonGo.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            buttonGo.Click += new System.EventHandler(buttonGo_Click);

            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.Text = "";
            this.ClientSize = new System.Drawing.Size(650, 480);
            this.AcceptButton = buttonGo;

            this.Controls.Add(AxWebBrowser1);
            this.Controls.Add(panel1);
            panel1.Controls.Add(textBox1);
            panel1.Controls.Add(buttonGo);
            panel1.Controls.Add(label1);

            AxWebBrowser1.EndInit();

            this.Text = "New Web Browser";

            //Handle the Title Change event so that we can update the caption and the
            //status bar on our parent
            AxWebBrowser1.TitleChange += new DWebBrowserEvents2_TitleChangeEventHandler(this.AxWebBrowser1_TitleChanged);

            //Once the Browser Control has been created we can interact with it
            //So hook the handle created event and use  this to navigate
            //to the start page
            AxWebBrowser1.HandleCreated += new EventHandler(this.AxWebBrowser1_Created);

            //Set the minimum form size
            this.MinimumSize = new Size(100, 100);
        }


        //The WebBrowser has been created so complete initialisation
      public void AxWebBrowser1_Created(object sender, EventArgs evArgs) {

            //Navigate to the starting page
          buttonGo_Click(buttonGo, EventArgs.Empty);

            //Don't need this event handler any more so remove it
            AxWebBrowser1.HandleCreated -= new EventHandler(this.AxWebBrowser1_Created);
      }


        //Handle the title changed event
        private void AxWebBrowser1_TitleChanged(object sender, DWebBrowserEvents2_TitleChangeEvent e) {
            this.Text =  e.text;
            ((MainForm)(this.MdiParent)).statusBar1.Text=this.Text;
        }


        //Handle the click of the go button
        private void buttonGo_Click(object sender, EventArgs evArgs) {

            Cursor currentCursor = Cursor.Current;
            try {
                Cursor.Current = Cursors.WaitCursor;

                object arg1 = 0; object arg2 = ""; object arg3 = ""; object arg4 = "";
        if (textBox1.Text == null) {
          Console.WriteLine("textBox1.Text = null");
          textBox1.Text = "";
        }
                AxWebBrowser1.Navigate(textBox1.Text,ref arg1,ref arg2, ref arg3, ref arg4);

            } finally {
                Cursor.Current = currentCursor ;
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

      }


    }
}










