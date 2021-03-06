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


namespace Microsoft.Samples.Windows.Forms.Cs.ProgressBarCtl {
    using System;
    using System.Collections;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
    using System.Threading;

    // <doc>
    // <desc>
    //     This class demonstrates the ProgressBar control.
    //     The ProgressBar is updated periodically via another thread based on the
    //     settings in this control
    // </desc>
    // </doc>
    //
    public class ProgressBarCtl : System.Windows.Forms.Form {

        private System.ComponentModel.Container components;
        protected internal System.Windows.Forms.Label label3;
        protected internal System.Windows.Forms.Label lblCompleted;
        protected internal System.Windows.Forms.TrackBar sldrSpeed;
        protected internal System.Windows.Forms.ProgressBar progbar;
        protected internal System.Windows.Forms.Label label5;
        protected internal System.Windows.Forms.GroupBox grpBehavior;
        protected internal System.Windows.Forms.Label label4;
        protected internal System.Windows.Forms.Label label6;
        protected internal System.Windows.Forms.Label lblValue;
        protected internal System.Windows.Forms.ComboBox cmbStep;

        private int     iSleepTime ;
        private Thread  timedProgress ;

        public ProgressBarCtl() : base() {
            //
            // Required for Win Form Designer support
            //
            InitializeComponent();

            iSleepTime = 100 ;
            cmbStep.SelectedIndex = 0 ;
            progbar.Step = 1 ;

        }

        protected override void OnLoad(EventArgs e) {
            // Spin off a new thread to update the ProgressBar control
            timedProgress = new Thread(new ThreadStart(TimedProgressProc));
            timedProgress.IsBackground = true;
            timedProgress.Start();
        }

        // <doc>
        // <desc>
        //     This code executes on the Windows.Forms thread.
        // </desc>
        // </doc>
        //
        private void UpdateProgress() {
            int min ;
            double numerator, denominator, completed ;

            //Reset to start if required
            if (progbar.Value == progbar.Maximum) {
                progbar.Value = progbar.Minimum ;
            }
            else {
                progbar.PerformStep();
            }

            lblValue.Text = progbar.Value.ToString();

            min         = progbar.Minimum ;
            numerator   = progbar.Value - min ;
            denominator = progbar.Maximum - min ;
            completed   = (numerator / denominator) * 100.0 ;

            lblCompleted.Text = Math.Round(completed).ToString() + "%" ;
        }

        // <doc>
        // <desc>
        //     This function runs in the timedProgress thread and updates the
        //     ProgressBar on the form.
        // </desc>
        // </doc>
        //
        private void TimedProgressProc() {
            try {
                MethodInvoker mi = new MethodInvoker(UpdateProgress);
                while (true) {
                    Invoke(mi);
                    int iSleepTime = this.SleepTime;
                    Thread.Sleep(iSleepTime) ;
                }
            }
            //Thrown when the thread is interupted by the main thread - exiting the loop
            catch (ThreadInterruptedException e) {
                if (e != null) {}
            }
            catch (Exception we) {
                if (we != null) {
                    MessageBox.Show(we.ToString());
                }
            }
        }

        // <doc>
        // <desc>
        //     Property controlling the progress of the progress bar - used by the background thread
        // </desc>
        // </doc>
        //
        private int SleepTime {
            get {
                lock(this) {
                    return iSleepTime ;
                }
            }
            set {
                lock(this) {
                    iSleepTime = value ;
                }
            }
        }

        /// <summary>
        ///    Clean up any resources being used
        /// </summary>
        protected override void Dispose(bool disposing) {
            /*
             * We have to make sure that our thread doesn't attempt
             * to access our controls after we dispose them.
             */
            if (timedProgress != null) {
                timedProgress.Interrupt();
                timedProgress = null;
            }
            if (disposing) {
                if (components != null) {
                    components.Dispose();
                }
            }
            base.Dispose(disposing);
        }

        protected void sldrSpeed_Scroll(object sender, EventArgs e) {
            TrackBar tb = (TrackBar) sender ;
            int time = 110 - tb.Value ;
            this.SleepTime = time ;
        }

        protected void cmbStep_SelectedIndexChanged(object sender, EventArgs e) {
            try {
                progbar.Step = Int32.Parse((string)cmbStep.SelectedItem);
            }
            catch (Exception ex) {
                // thrown if Int32.Parse can't convert
                if (ex !=null) {}
            }
        }


        /// <summary>
        ///    Required method for Designer support - do not modify
        ///    the contents of this method with the code editor
        /// </summary>
        private void InitializeComponent() {
            this.components = new System.ComponentModel.Container();
            this.label4 = new System.Windows.Forms.Label();
            this.lblCompleted = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.lblValue = new System.Windows.Forms.Label();
            this.cmbStep = new System.Windows.Forms.ComboBox();
            this.progbar = new System.Windows.Forms.ProgressBar();
            this.sldrSpeed = new System.Windows.Forms.TrackBar();
            this.label6 = new System.Windows.Forms.Label();
            this.grpBehavior = new System.Windows.Forms.GroupBox();

            sldrSpeed.BeginInit();

            this.Text = "ProgressBar";
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.ClientSize = new System.Drawing.Size(506, 175);
                        this.MaximizeBox = false;
            this.MinimizeBox = false;

            label4.Location = new System.Drawing.Point(16, 80);
            label4.Text = "Completion Speed:";
            label4.Size = new System.Drawing.Size(225, 16);
            label4.TabIndex = 0;

            lblCompleted.Location = new System.Drawing.Point(128, 56);
            lblCompleted.Size = new System.Drawing.Size(56, 16);
            lblCompleted.TabIndex = 2;

            label5.Location = new System.Drawing.Point(24, 56);
            label5.Text = "Percent Completed:";
            label5.Size = new System.Drawing.Size(112, 24);
            label5.TabIndex = 1;

            label3.Location = new System.Drawing.Point(16, 24);
            label3.Text = "Step:";
            label3.Size = new System.Drawing.Size(48, 16);
            label3.TabIndex = 6;

            lblValue.Location = new System.Drawing.Point(128, 80);
            lblValue.Size = new System.Drawing.Size(56, 16);
            lblValue.TabIndex = 4;

            cmbStep.Location = new System.Drawing.Point(136, 24);
            cmbStep.Size = new System.Drawing.Size(96, 21);
            cmbStep.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            cmbStep.TabIndex = 7;
            cmbStep.SelectedIndexChanged += new System.EventHandler(cmbStep_SelectedIndexChanged);
            cmbStep.Items.AddRange(new object[] {"1",
              "5",
              "10",
              "20"});

            progbar.BackColor = System.Drawing.SystemColors.Control;
            progbar.Location = new System.Drawing.Point(24, 24);
            progbar.TabIndex = 0;
            progbar.Size = new System.Drawing.Size(192, 16);
            progbar.Step = 1;
            progbar.Text = "progbar";

            sldrSpeed.BackColor = System.Drawing.SystemColors.Control;
            sldrSpeed.TickFrequency = 10;
            sldrSpeed.Location = new System.Drawing.Point(16, 96);
            sldrSpeed.TabIndex = 1;
            sldrSpeed.TabStop = false;
            sldrSpeed.Value = 10;
            sldrSpeed.Maximum = 100;
            sldrSpeed.Size = new System.Drawing.Size(216, 42);
            sldrSpeed.Text = "trackBar1";
            sldrSpeed.Minimum = 10;
            sldrSpeed.Scroll += new System.EventHandler(sldrSpeed_Scroll);

            label6.Location = new System.Drawing.Point(24, 80);
            label6.Text = "Value:";
            label6.Size = new System.Drawing.Size(100, 16);
            label6.TabIndex = 3;

            grpBehavior.Location = new System.Drawing.Point(248, 16);
            grpBehavior.TabIndex = 5;
            grpBehavior.TabStop = false;
            grpBehavior.Text = "ProgressBar";
            grpBehavior.Size = new System.Drawing.Size(248, 152);
            grpBehavior.Controls.Add(cmbStep);
            grpBehavior.Controls.Add(label3);
            grpBehavior.Controls.Add(sldrSpeed);
            grpBehavior.Controls.Add(label4);
            this.Controls.Add(grpBehavior);
            this.Controls.Add(lblValue);
            this.Controls.Add(label6);
            this.Controls.Add(lblCompleted);
            this.Controls.Add(label5);
            this.Controls.Add(progbar);

            sldrSpeed.EndInit();
        }


        // The main entry point for the application.
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new ProgressBarCtl());
        }

    }

}

