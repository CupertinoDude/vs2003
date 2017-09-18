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


namespace Microsoft.Samples.WinForms.Cs.HelloWorldForm {
    using System;
    using System.Windows.Forms;
    using System.Drawing;

    // Do not load this form into the Windows Form Designer.
    // This QuickStart is an example of a simple hand-written
    // form with controls.
    public class HelloWorldForm : System.Windows.Forms.Form {

        private Button button1 = new Button() ;
        private TextBox textBox1 = new TextBox();

        //When the application is started show the Form
        [STAThread]
        public static int Main(string[] args) {
            Application.Run(new HelloWorldForm());
            return 0;
        }

        public HelloWorldForm() {

            //Set up the Form
            this.Text = "Hello Windows Forms World";
            this.AutoScaleBaseSize = new Size(5, 13);
            this.ClientSize = new Size(392, 117);

            //Set the minimum form size to the client size + the height of the title bar
            this.MinimumSize = new Size(392, (117 + SystemInformation.CaptionHeight));

            //Set the default button on the Form
            this.AcceptButton=button1;

            //Create the button
            button1.Location = new Point(256, 64);
            button1.Size = new Size(120, 40);
            button1.TabIndex = 2;
            button1.Text = "Click Me!";

            //Register the event handler
            button1.Click += new System.EventHandler(button1_Click);

            //Create the text box
            textBox1.Text = "Hello Windows Forms World";
            textBox1.TabIndex = 1;
            textBox1.Size = new Size(360, 20);
            textBox1.Location = new Point(16, 24);

            //Add the controls to the form
            this.Controls.Add(button1);
            this.Controls.Add(textBox1);
        }

        //Called when the Form closes
        //Note that the MessageBox call is simply to
        //demonstrate that Dispose is called. You
        //should keep your Dispose method code as simple and
        //robust as possible
        protected override void Dispose(bool disposing)
        {
            try {
                MessageBox.Show("Disposed!");
            } catch(Exception) {}
            base.Dispose(disposing);
        }

        //The event handling method
        private void button1_Click(object sender, EventArgs evArgs) {
            MessageBox.Show("Text is: '" + textBox1.Text + "'");
        }
    }
}









