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


namespace Microsoft.Samples.WinForms.Cs.ThreadMarshal {
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
    using System.Threading;


    public class ThreadMarshal : System.Windows.Forms.Form {
        private System.ComponentModel.IContainer components;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.ProgressBar progressBar1;

        private Thread timerThread;

        public ThreadMarshal() {

            // Required by the Windows Forms Designer
            InitializeComponent();

        }

        //This function is executed on a background thread - it marshalls calls to
        //update the UI back to the foreground thread
        public void ThreadProc() {

            try {
                MethodInvoker mi = new MethodInvoker(this.UpdateProgress);
                while (true) {
                    //Call BeginInvoke on the Form
                    this.BeginInvoke(mi);
                    Thread.Sleep(500) ;
                }
            }
            //Thrown when the thread is interupted by the main thread - exiting the loop
            catch (ThreadInterruptedException) {
                //Simply exit....
            }
            catch (Exception) {
            }
        }

        //This function is called from the background thread
        private void UpdateProgress() {

            //Reset to start if required
            if (progressBar1.Value == progressBar1.Maximum) {
                progressBar1.Value = progressBar1.Minimum ;
            }

            progressBar1.PerformStep() ;
        }

        //Start the background thread to update the progress bar
        private void button1_Click(object sender, System.EventArgs e) {
            StopThread();
            timerThread = new Thread(new ThreadStart(ThreadProc));
            timerThread.IsBackground = true;
            timerThread.Start();
        }

        //Stop the background thread to update the progress bar
        private void button2_Click(object sender, System.EventArgs e) {
            StopThread();
        }

        //Stop the background thread
        private void StopThread()
        {
            if (timerThread != null)
            {
                timerThread.Interrupt();
                timerThread = null;
            }
        }

        protected override void Dispose(bool disposing)
        {
           StopThread();
           if (disposing) {
                if (components != null) {
                    components.Dispose();
                }
           }

           base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.progressBar1 = new System.Windows.Forms.ProgressBar();
            this.button1.Font = new System.Drawing.Font("Tahoma", 8, System.Drawing.FontStyle.Bold);
            this.button1.Location = new System.Drawing.Point(128, 64);
            this.button1.Size = new System.Drawing.Size(120, 40);
            this.button1.TabIndex = 1;
            this.button1.Text = "Start!";
            this.button1.Click += new System.EventHandler(this.button1_Click);
            this.button2.Font = new System.Drawing.Font("Tahoma", 8, System.Drawing.FontStyle.Bold);
            this.button2.Location = new System.Drawing.Point(256, 64);
            this.button2.Size = new System.Drawing.Size(120, 40);
            this.button2.TabIndex = 1;
            this.button2.Text = "Stop!";
            this.button2.Click += new System.EventHandler(this.button2_Click);
            this.progressBar1.Font = new System.Drawing.Font("Tahoma", 8, System.Drawing.FontStyle.Bold);
            this.progressBar1.Location = new System.Drawing.Point(10, 10);
            this.progressBar1.Size = new System.Drawing.Size(350, 40);
            this.progressBar1.TabIndex = 2;
            this.progressBar1.Text = "Start!";
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(392, 117);
            this.Controls.AddRange(new System.Windows.Forms.Control[] {this.button1,
																            this.button2,
																            this.progressBar1});
            this.Text = "Built using the Designer";

        }

        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new ThreadMarshal());
        }


    }
}










