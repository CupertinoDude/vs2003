/*=====================================================================
  File:      MainForm.cs

  
  ---------------------------------------------------------------------
   Copyright (C) Microsoft Corporation.  All rights reserved.

  This source code is intended only as a supplement to Microsoft
  Development Tools and/or on-line documentation.  See these other
  materials for detailed information regarding Microsoft code samples.

  THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
  KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
  PARTICULAR PURPOSE.
=====================================================================*/

using System;
using System.Collections;
using System.Drawing;
using System.Windows.Forms;

namespace WebCrawler
{
	/// <summary>
	/// Main application form class
	/// </summary>
	public class MainForm : System.Windows.Forms.Form
	{
        /// <summary>
        /// Form controls
        /// </summary>
        private System.Windows.Forms.TextBox addressBox;
        private System.Windows.Forms.Button startButton;
        private System.Windows.Forms.Label addressLabel;
        private System.Windows.Forms.Label currentPageLabel;
        private System.Windows.Forms.TextBox currentPageBox;
        private System.Windows.Forms.Label linkCountLabel;
        private System.Windows.Forms.Label linkCount;
        private System.Windows.Forms.MainMenu appMenu;
        private System.Windows.Forms.PictureBox light0;
        private System.Windows.Forms.PictureBox light1;
        private System.Windows.Forms.CheckBox noProxyCheck;
        private System.Windows.Forms.Label crawlStartedLabel;
        private System.Windows.Forms.Label crawlStartTime;
        private System.Windows.Forms.Label crawlTimeLabel;
        private System.Windows.Forms.Label crawlTime;
		
        /// <summary>
        /// These are used to handle status updates.
        /// </summary>
        private string CurrentPageText = "";

        /// <summary>
		/// The form's thread
		/// </summary>
		private readonly System.Threading.Thread FormThread = System.Threading.Thread.CurrentThread;
        
        /// <summary>
		/// The crawler worker object
		/// </summary>
		private Crawler crawler = null;
		
        /// <summary>
        /// Is the crawler currently running?
        /// </summary>
        private bool Running = false;

		/// <summary>
		/// The time the current crawl started
		/// </summary>
		private DateTime CrawlStart = DateTime.MinValue;
		
		/// <summary>
		/// Timer to handle blinking the activity lights
		/// </summary>
		private Timer ActivityLightsTimer = null;
		
		/// <summary>
		/// Activity lights components and state
		/// </summary>
		private Bitmap BmpOff = new Bitmap(System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream("WebCrawler.Images.DarkGreen.bmp"));
        private Bitmap BmpOn = new Bitmap(System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream("WebCrawler.Images.Green.bmp"));
        private bool light0State = false;
        private bool light1State = false;
        
        /// <summary>
		/// Constructor
		/// </summary>
		public MainForm()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();
			
            // set the initial light images
			this.light0.Image = this.BmpOff;
            this.light1.Image = this.BmpOff;
            
            // create the actvity lights timer
            this.ActivityLightsTimer = new Timer();
            this.ActivityLightsTimer.Interval = 1000;
            this.ActivityLightsTimer.Enabled = false;
            this.ActivityLightsTimer.Tick += new EventHandler(HandleActivityLightsEvent);
        }

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			base.Dispose( disposing );
		}
		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.addressBox = new System.Windows.Forms.TextBox();
			this.startButton = new System.Windows.Forms.Button();
			this.addressLabel = new System.Windows.Forms.Label();
			this.appMenu = new System.Windows.Forms.MainMenu();
			this.currentPageLabel = new System.Windows.Forms.Label();
			this.currentPageBox = new System.Windows.Forms.TextBox();
			this.linkCountLabel = new System.Windows.Forms.Label();
			this.linkCount = new System.Windows.Forms.Label();
			this.light0 = new System.Windows.Forms.PictureBox();
			this.light1 = new System.Windows.Forms.PictureBox();
			this.noProxyCheck = new System.Windows.Forms.CheckBox();
			this.crawlStartedLabel = new System.Windows.Forms.Label();
			this.crawlStartTime = new System.Windows.Forms.Label();
			this.crawlTimeLabel = new System.Windows.Forms.Label();
			this.crawlTime = new System.Windows.Forms.Label();
			// 
			// addressBox
			// 
			this.addressBox.Location = new System.Drawing.Point(10, 20);
			this.addressBox.Size = new System.Drawing.Size(224, 22);
			this.addressBox.Text = "";
			// 
			// startButton
			// 
			this.startButton.Location = new System.Drawing.Point(8, 240);
			this.startButton.Size = new System.Drawing.Size(226, 20);
			this.startButton.Text = "Start";
			this.startButton.Click += new System.EventHandler(this.startButton_Click);
			// 
			// addressLabel
			// 
			this.addressLabel.Location = new System.Drawing.Point(10, 4);
			this.addressLabel.Size = new System.Drawing.Size(50, 16);
			this.addressLabel.Text = "Address";
			// 
			// currentPageLabel
			// 
			this.currentPageLabel.Location = new System.Drawing.Point(10, 68);
			this.currentPageLabel.Size = new System.Drawing.Size(100, 16);
			this.currentPageLabel.Text = "Current Page";
			// 
			// currentPageBox
			// 
			this.currentPageBox.BackColor = System.Drawing.SystemColors.Window;
			this.currentPageBox.ForeColor = System.Drawing.SystemColors.WindowText;
			this.currentPageBox.Location = new System.Drawing.Point(10, 84);
			this.currentPageBox.Multiline = true;
			this.currentPageBox.ReadOnly = true;
			this.currentPageBox.Size = new System.Drawing.Size(224, 90);
			this.currentPageBox.Text = "";
			// 
			// linkCountLabel
			// 
			this.linkCountLabel.Location = new System.Drawing.Point(10, 182);
			this.linkCountLabel.Size = new System.Drawing.Size(64, 16);
			this.linkCountLabel.Text = "Link count : ";
			// 
			// linkCount
			// 
			this.linkCount.Location = new System.Drawing.Point(74, 182);
			this.linkCount.Size = new System.Drawing.Size(160, 16);
			this.linkCount.Text = "0";
			this.linkCount.TextAlign = System.Drawing.ContentAlignment.TopRight;
			// 
			// light0
			// 
			this.light0.Location = new System.Drawing.Point(198, 66);
			this.light0.Size = new System.Drawing.Size(16, 16);
			// 
			// light1
			// 
			this.light1.Location = new System.Drawing.Point(218, 66);
			this.light1.Size = new System.Drawing.Size(16, 16);
			// 
			// noProxyCheck
			// 
			this.noProxyCheck.Location = new System.Drawing.Point(10, 42);
			this.noProxyCheck.Size = new System.Drawing.Size(224, 20);
			this.noProxyCheck.Text = "Do not use proxy server";
			// 
			// crawlStartedLabel
			// 
			this.crawlStartedLabel.Location = new System.Drawing.Point(10, 200);
			this.crawlStartedLabel.Size = new System.Drawing.Size(52, 16);
			this.crawlStartedLabel.Text = "Started:";
			// 
			// crawlStartTime
			// 
			this.crawlStartTime.Location = new System.Drawing.Point(62, 200);
			this.crawlStartTime.Size = new System.Drawing.Size(172, 16);
			this.crawlStartTime.TextAlign = System.Drawing.ContentAlignment.TopRight;
			// 
			// crawlTimeLabel
			// 
			this.crawlTimeLabel.Location = new System.Drawing.Point(10, 220);
			this.crawlTimeLabel.Size = new System.Drawing.Size(52, 16);
			this.crawlTimeLabel.Text = "Time:";
			// 
			// crawlTime
			// 
			this.crawlTime.Location = new System.Drawing.Point(62, 220);
			this.crawlTime.Size = new System.Drawing.Size(172, 16);
			this.crawlTime.TextAlign = System.Drawing.ContentAlignment.TopRight;
			// 
			// MainForm
			// 
			this.ClientSize = new System.Drawing.Size(240, 270);
			this.Controls.Add(this.crawlTime);
			this.Controls.Add(this.crawlTimeLabel);
			this.Controls.Add(this.crawlStartTime);
			this.Controls.Add(this.crawlStartedLabel);
			this.Controls.Add(this.light1);
			this.Controls.Add(this.light0);
			this.Controls.Add(this.linkCount);
			this.Controls.Add(this.linkCountLabel);
			this.Controls.Add(this.currentPageBox);
			this.Controls.Add(this.currentPageLabel);
			this.Controls.Add(this.addressLabel);
			this.Controls.Add(this.noProxyCheck);
			this.Controls.Add(this.startButton);
			this.Controls.Add(this.addressBox);
			this.ForeColor = System.Drawing.SystemColors.WindowText;
			this.Menu = this.appMenu;
			this.Text = ".NETCF Web Crawler";

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		static void Main() 
		{
            Application.Run(new MainForm());
		}

        /// <summary>
        /// Click event handler for the Start/Stop button
        /// </summary>
        private void startButton_Click(object sender, System.EventArgs e)
        {
            if(!this.Running)
            {
                this.Running = true;
                
                // get form control states
                bool noProxy = this.noProxyCheck.Checked;
                string startingPage = this.addressBox.Text;
                
                // disable form controls
                this.addressLabel.Enabled = false;
                this.addressBox.Enabled = false;
                this.noProxyCheck.Enabled = false;
                
                // update form control text
                this.startButton.Text = "Stop";
                
                // create our crawler object
                this.crawler = new Crawler(startingPage,
                                        noProxy);
                
                // register our event handlers
                this.crawler.CurrentPageEvent += new Crawler.CurrentPage(this.HandleCurrentPageEvent);
                this.crawler.PageFoundEvent += new EventHandler(this.HandlePageFoundEvent);
                this.crawler.CrawlFinishedEvent += new EventHandler(this.HandleCrawlFinishedEvent);
                
                // get the activity lights blinking
                this.ActivityLightsTimer.Enabled = true;
                
                // start the crawl
                this.linkCount.Text = "0";
                this.crawlTime.Text = "0000:00:00:00";
                this.CrawlStart = DateTime.Now;
                this.crawlStartTime.Text = this.CrawlStart.ToString();
                this.crawler.Start();
                
            }
            else
            {
                // we've been asked to stop
                this.crawler.Stop();
                
                // disable the start/stop button 
                //  we don't want it clicked more than once
                this.startButton.Text = "Please wait, crawler stopping";
                this.startButton.Enabled = false;
            }
        }                                                        

        /// <summary>
        /// Process CurrentPage events
        /// </summary>
        /// <param name="currentPage">
        /// Text to display in the Current Page box
        /// </param>
        private void HandleCurrentPageEvent(string currentPage)
        {
            // since the .NET Compact Framework does not provide an instance of 
            //  Control.Invoke that accepts parameter data, store the current page
            //  value in a class global variable
            lock(this)
            {
                this.CurrentPageText = currentPage;
            }
            
            // check to see if we have been called on our creation thread
            if(CustomInvokeRequired())
            {
                this.currentPageBox.Invoke(new EventHandler(this.HandleCurrentPageEvent));
                return;
            }
            
            // invoke was not required, directly update the value
            this.currentPageBox.Text = currentPage;
        }
        
        /// <summary>
        /// Process CurrentPage events.  This implementation sets the text to 
        //  the value stored in the class global variable CurrentPageText
        /// </summary>
        private void HandleCurrentPageEvent(object sender, EventArgs e)
        {
            // check to see if we have been called on our creation thread
            if(CustomInvokeRequired())
            {
                this.currentPageBox.Invoke(new EventHandler(this.HandleCurrentPageEvent));
                return;
            }
            this.currentPageBox.Text = this.CurrentPageText;
        }
        
        /// <summary>
        /// Process PageFound events
        /// </summary>
        private void HandlePageFoundEvent(object sender, EventArgs e)
        {
            if(CustomInvokeRequired())
            {
                this.linkCount.Invoke(new EventHandler(this.HandlePageFoundEvent));
                return;
            }
            
            try
            {
                this.linkCount.Text = string.Format("{0}", Int32.Parse(this.linkCount.Text)+1);
            }
            catch(FormatException)
            { }
        }
        
        /// <summary>
        /// Process CrawlFinished events
        /// </summary>
        private void HandleCrawlFinishedEvent(object sender, EventArgs e)
        {
            if(CustomInvokeRequired())
            {
                this.linkCount.Invoke(new EventHandler(this.HandleCrawlFinishedEvent));
                return;
            }
            
            this.Running = false;
            this.crawler = null;
            
            if(null == this.crawler)
            {
                this.startButton.Text = "Start";
            }
            
            // re-enable form controls
            this.addressLabel.Enabled = true;
            this.addressBox.Enabled = true;
            this.noProxyCheck.Enabled = true;
            this.startButton.Enabled = true;
            
            // stop the blinking lights
            this.ActivityLightsTimer.Enabled = false;
            this.light0State = false;
            this.light1State = false;
            this.light0.Image = this.BmpOff;
            this.light1.Image = this.BmpOff;
        }

        /// <summary>
        /// Process ActivityLights events
        /// </summary>
        private void HandleActivityLightsEvent(object unused,
                                            EventArgs notused)
        {
            this.light0State = !this.light0State;
            this.light1State = !this.light1State;
            if(this.light0State)
            {
                // turn off light0
                this.light0.Image = this.BmpOff;
                // turn on light1
                this.light1.Image = this.BmpOn;
            }
            else
            {
                // turn off light1
                this.light1.Image = this.BmpOff;
                // turn on light0
                this.light0.Image = this.BmpOn;
            }
            
            // update run time display
            TimeSpan runTime = DateTime.Now - this.CrawlStart;
            this.crawlTime.Text = string.Format("{0:D4}:{1:D2}:{2:D2}:{3:D2}",
                                            runTime.Days,
                                            runTime.Hours,
                                            runTime.Minutes,
                                            runTime.Seconds);
        }

        /// <summary>
        /// Determine if the call that we are servicing came in on this form's thread.
        /// <para>
        /// The .NET Compact Framework does not provide an implementation for Control.InvokeRequired(),
        /// this is a custom implementation of that method.
        /// </para>
        /// </summary>
        /// <returns>
        /// False if the current thread equals the form's thread, true otherwise.
        /// </returns>
        private bool CustomInvokeRequired()
        {
            if(this.FormThread.Equals(System.Threading.Thread.CurrentThread))
            {
                // the call was made on the form's thread
                return false;
            }
            
            // the call was made on a thread other than the form's thread
            return true;
        }
	}
}
