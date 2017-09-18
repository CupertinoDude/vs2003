//------------------------------------------------------------------------------
//  <copyright from='1997' to='2002' company='Microsoft Corporation'>
//   Copyright (c) Microsoft Corporation. All Rights Reserved.
//
//   This source code is intended only as a supplement to Microsoft
//   Development Tools and/or on-line documentation.  See these other
//   materials for detailed information regarding Microsoft code samples.
//
//   </copyright>
//-------------------------------------------------------------------------------

using System;
using System.Collections;
using System.Drawing;
using System.Windows.Forms;

#if NETCFDESIGNTIME
[assembly: System.CF.Design.RuntimeAssemblyAttribute("ClockControl, Version=1.0, Culture=neutral, PublicKeyToken=null")]
#endif

namespace ClockControl {
    /// <summary>
    /// The abstract base class ClockControl handles the timer implementation for
    /// DigitalClock and AnalogClock. By itself it cannot be used as a Windows Forms
    /// Control.
    /// </summary>
    public abstract class ClockControl : System.Windows.Forms.Control {
        // Internal variables
        private System.Windows.Forms.Timer timer;

        // Current time property
        protected System.DateTime current;
        protected System.DateTime old;
        public System.DateTime CurrentDateTime {
            get {
                return current;
            }
            set {
                current = value;
            }
        }

        public ClockControl() {
            // This call is required by the Windows.Forms Form Designer.
            InitializeComponent();
			
            // Set time defaults to current time in current timezone
            current = System.DateTime.Now;
			
            // 
            // timer
            // 
            this.timer = new System.Windows.Forms.Timer();
            this.timer.Enabled = true;
            this.timer.Interval = 1000;
            this.timer.Tick += new System.EventHandler(this.timer_Tick);			
        }
        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        protected override void Dispose( bool disposing ) {
            base.Dispose( disposing );
        }
        #region Component Designer generated code
        /// <summary>
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent() {
        }
        #endregion

        private void timer_Tick(object sender, System.EventArgs e) {
            // Get the current time in the set timezone
            // Second gets added before the display because the timer is running
            // for 1000 milliseconds (1 second) already
            old = current;
            current = current.AddSeconds(1);

            // Draw the clock
            this.DrawClock();
        }

        public abstract void DrawClock();
    }

    /// <summary>
    /// DigitalClock implements a digital clock for which the datetime format
    /// can be chosen. It is based on the abstract base class ClockControl
    /// </summary>
    public class DigitalClock : ClockControl {
        private System.Windows.Forms.Label lblTime;
        private string dcFormat = null;
        public string ClockFormat {
            get { 
                return dcFormat;
            }
            set { 
                dcFormat = value;
            }
        }

        public DigitalClock() {
            // 
            // lblTime
            // 
            this.lblTime = new System.Windows.Forms.Label();
            this.lblTime.Location = new System.Drawing.Point(0,0);
            this.lblTime.Text = this.CurrentDateTime.ToString(dcFormat);
            this.Controls.Add(this.lblTime);
        }

        public override void DrawClock() {
            // Set the caption to the current time
            lblTime.Text = this.CurrentDateTime.ToString(dcFormat);
        }

        protected override void OnResize(EventArgs ea) {
            this.lblTime.Size = this.ClientSize;
            this.Refresh();
        }

    }

    /// <summary>
    /// AnalogClock implements an analog clock.
    /// It is based on the abstract base class ClockControl
    /// </summary>
    public class AnalogClock : ClockControl {

        public AnalogClock() {
						
        }

        protected override void OnPaint(PaintEventArgs pe) {
            base.OnPaint(pe);
            double x, y;

            System.Drawing.Pen myPen = new System.Drawing.Pen(Color.Black);
            int w = this.ClientRectangle.Width;
            int h = this.ClientRectangle.Height;
			
            // Draw the hour marks (3, 6, 9, 12 o'clock longer)
            for(int i = 0; i <= 11; i++) {
                double t = i*Math.PI/6;
                double s = i%3==0?0.8:0.9;
                x = w/2*Math.Sin(t);
                y = h/2*Math.Cos(t);
                pe.Graphics.DrawLine(myPen,(int)(w/2+x*s),(int)(h/2-y*s),(int)(w/2+x),(int)(h/2-y));
            }
						
            // Draw minute, hour and second hands
            double min = Math.PI*this.CurrentDateTime.Minute/30+Math.PI*this.CurrentDateTime.Second/1800;
            x = w/2*Math.Sin(min);
            y = h/2*Math.Cos(min);
            pe.Graphics.DrawLine(myPen,(int)(w/2),(int)(h/2),(int)(w/2+x*0.8),(int)(h/2-y*0.8));

            double hr = Math.PI*(this.CurrentDateTime.Hour%12)/6+Math.PI*this.CurrentDateTime.Minute/360;
            x = w/2*Math.Sin(hr);
            y = h/2*Math.Cos(hr);
            pe.Graphics.DrawLine(myPen,(int)(w/2),(int)(h/2),(int)(w/2+x*0.6),(int)(h/2-y*0.6));

            myPen.Color = Color.Red;
            double sec = Math.PI*this.CurrentDateTime.Second/30;
            x = w/2*Math.Sin(sec);
            y = h/2*Math.Cos(sec);
            pe.Graphics.DrawLine(myPen,(int)(w/2),(int)(h/2),(int)(w/2+x),(int)(h/2-y));

        }

        protected override void OnResize(EventArgs ea) {
            this.Refresh();
        }

        public override void DrawClock() {
            this.Refresh();
        }
    }
}
