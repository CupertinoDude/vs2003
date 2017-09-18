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
//
// File: StockQuote.cs
//
// Purpose: This application uses a web service to retrieve a DataSet
//			containing example quote data. It displays the data with
//			form components using DataBinding.
//
// Notes: 
//          Before building and deploying this sample, you need to have
//			access to a server running the StockQuoteService web service.
//			You will need to add a web reference to your server in this
//			project and you will need to replace the string "YOURSERVER"
//			in this file with the name of your target web server. Please
//			read the Samples documentation for more information.
//
//			To add the correct web reference in this sample: 
//			1.  On the View menu, click Solution Explorer. 
//			2.  In Solution Explorer, right-click References, and click
//			    Add Web Reference. 
//			3.  In Add Web Reference dialog box, do the following: 
//			    Type http://YOURSERVER/StockQuoteService/StockQuoter.asmx
//			    where YOURSERVER is the name of the computer hosting the
//			    Web Service Provider. 
//			4.  Press ENTER to verify that the Web Service is available. 
//			5.  Click the Add Reference button to add the reference to the project. 
//

using System;
using System.Data;
using System.IO;
using System.Reflection;
using System.Drawing;
using System.Collections;
using System.Windows.Forms;
using StockQuote.YOURSERVER;

namespace StockQuote
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class StockQuoteForm : System.Windows.Forms.Form
	{
		private System.Windows.Forms.ComboBox comboBox1;
		private System.Windows.Forms.Button btnGo;
		private System.Windows.Forms.PictureBox pictureBox1;
		private System.Windows.Forms.RadioButton radioButton1;
		private System.Windows.Forms.RadioButton radioButton2;
		private System.Windows.Forms.RadioButton radioButton3;
		private System.Windows.Forms.RadioButton radioButton4;
		private System.Windows.Forms.ListBox listBox1;
		private System.Windows.Forms.Timer tmrTicker;
		private System.Windows.Forms.CheckBox chkAutoRefresh;
		private System.Windows.Forms.Button btnClear;
		private System.Windows.Forms.TextBox txtQuoteData;
		private System.Windows.Forms.TextBox txtStatus;


		//
		// The app can being in one of three states, specified by 
		// the following enum and associated currectState value.

		private enum States {UserUpdate = 1, AutoUpdate = 2, Stopped = 3};
		private States currentState = States.UserUpdate;
		
		private enum Delays {Delay1 = 5, Delay2 = 15, Delay3 = 30, Delay4 = 60}; 
		private Delays currentDelay = Delays.Delay1;
		

		// Finally, we create a reference to the web service we are
		// querying, and declare a class-scope DataSet to hold the
		// result of each query.

		private StockQuoter sq;
		private DataSet ds;


		/// <summary>
		/// Additional constructor code is provided in StockQuoteForm
		/// after InitializeComponent() to populate the controls with
		/// data from the web service.
		/// </summary>

		public StockQuoteForm()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			// 
			// Additional contructor code to ensure that the
			// class starts in a suitable state
			//
			radioButton1.Text = (int)(Delays.Delay1) + " seconds";
			radioButton2.Text = (int)(Delays.Delay2) + " seconds";
			radioButton3.Text = (int)(Delays.Delay3) + " seconds";
			radioButton4.Text = (int)(Delays.Delay4) + " seconds";

			radioButton1.Checked = true;

			changeDelay(Delays.Delay1);
			changeState(States.UserUpdate);

			tmrTicker.Enabled = false;
			

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
			this.comboBox1 = new System.Windows.Forms.ComboBox();
			this.btnGo = new System.Windows.Forms.Button();
			this.pictureBox1 = new System.Windows.Forms.PictureBox();
			this.btnClear = new System.Windows.Forms.Button();
			this.chkAutoRefresh = new System.Windows.Forms.CheckBox();
			this.radioButton1 = new System.Windows.Forms.RadioButton();
			this.radioButton2 = new System.Windows.Forms.RadioButton();
			this.radioButton3 = new System.Windows.Forms.RadioButton();
			this.radioButton4 = new System.Windows.Forms.RadioButton();
			this.listBox1 = new System.Windows.Forms.ListBox();
			this.txtQuoteData = new System.Windows.Forms.TextBox();
			this.tmrTicker = new System.Windows.Forms.Timer();
			this.txtStatus = new System.Windows.Forms.TextBox();
			// 
			// comboBox1
			// 
			this.comboBox1.Location = new System.Drawing.Point(8, 8);
			this.comboBox1.Size = new System.Drawing.Size(80, 22);
			this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
			// 
			// btnGo
			// 
			this.btnGo.Location = new System.Drawing.Point(8, 168);
			this.btnGo.Size = new System.Drawing.Size(72, 24);
			this.btnGo.Click += new System.EventHandler(this.btnGo_Click);
			// 
			// pictureBox1
			// 
			this.pictureBox1.Location = new System.Drawing.Point(184, 168);
			this.pictureBox1.Size = new System.Drawing.Size(45, 55);
			// 
			// btnClear
			// 
			this.btnClear.Location = new System.Drawing.Point(88, 168);
			this.btnClear.Size = new System.Drawing.Size(72, 24);
			this.btnClear.Text = "Clear";
			this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
			// 
			// chkAutoRefresh
			// 
			this.chkAutoRefresh.Location = new System.Drawing.Point(8, 216);
			this.chkAutoRefresh.Size = new System.Drawing.Size(96, 24);
			this.chkAutoRefresh.Text = "Auto Refresh";
			this.chkAutoRefresh.CheckStateChanged += new System.EventHandler(this.chkAutoRefresh_CheckStateChanged);
			// 
			// radioButton1
			// 
			this.radioButton1.Checked = true;
			this.radioButton1.Enabled = false;
			this.radioButton1.Location = new System.Drawing.Point(16, 240);
			this.radioButton1.Size = new System.Drawing.Size(96, 24);
			this.radioButton1.CheckedChanged += new System.EventHandler(this.radioButton1_CheckedChanged);
			// 
			// radioButton2
			// 
			this.radioButton2.Enabled = false;
			this.radioButton2.Location = new System.Drawing.Point(120, 240);
			this.radioButton2.Size = new System.Drawing.Size(96, 24);
			this.radioButton2.CheckedChanged += new System.EventHandler(this.radioButton2_CheckedChanged);
			// 
			// radioButton3
			// 
			this.radioButton3.Enabled = false;
			this.radioButton3.Location = new System.Drawing.Point(16, 264);
			this.radioButton3.Size = new System.Drawing.Size(96, 24);
			this.radioButton3.CheckedChanged += new System.EventHandler(this.radioButton3_CheckedChanged);
			// 
			// radioButton4
			// 
			this.radioButton4.Enabled = false;
			this.radioButton4.Location = new System.Drawing.Point(120, 264);
			this.radioButton4.Size = new System.Drawing.Size(96, 24);
			this.radioButton4.CheckedChanged += new System.EventHandler(this.radioButton4_CheckedChanged);
			// 
			// listBox1
			// 
			this.listBox1.Items.Add("All");
			this.listBox1.Items.Add("Symbol");
			this.listBox1.Items.Add("Name");
			this.listBox1.Items.Add("Last");
			this.listBox1.Items.Add("Change");
			this.listBox1.Items.Add("% Change");
			this.listBox1.Items.Add("Volume");
			this.listBox1.Location = new System.Drawing.Point(8, 40);
			this.listBox1.Size = new System.Drawing.Size(80, 86);
			this.listBox1.SelectedIndexChanged += new System.EventHandler(this.listBox1_SelectedIndexChanged);
			// 
			// txtQuoteData
			// 
			this.txtQuoteData.AcceptsReturn = true;
			this.txtQuoteData.Enabled = false;
			this.txtQuoteData.Location = new System.Drawing.Point(96, 8);
			this.txtQuoteData.Multiline = true;
			this.txtQuoteData.Size = new System.Drawing.Size(136, 120);
			this.txtQuoteData.Text = "[quote information will be displayed here]";
			// 
			// tmrTicker
			// 
			this.tmrTicker.Tick += new System.EventHandler(this.tmrTicker_Tick);
			// 
			// txtStatus
			// 
			this.txtStatus.Enabled = false;
			this.txtStatus.Location = new System.Drawing.Point(8, 136);
			this.txtStatus.Size = new System.Drawing.Size(224, 22);
			this.txtStatus.Text = "Current info goes here";
			// 
			// StockQuoteForm
			// 
			this.ClientSize = new System.Drawing.Size(240, 295);
			this.Controls.Add(this.txtStatus);
			this.Controls.Add(this.txtQuoteData);
			this.Controls.Add(this.listBox1);
			this.Controls.Add(this.radioButton4);
			this.Controls.Add(this.radioButton3);
			this.Controls.Add(this.radioButton2);
			this.Controls.Add(this.radioButton1);
			this.Controls.Add(this.chkAutoRefresh);
			this.Controls.Add(this.btnClear);
			this.Controls.Add(this.pictureBox1);
			this.Controls.Add(this.btnGo);
			this.Controls.Add(this.comboBox1);
			this.MaximizeBox = false;
			this.Text = "StockQuote C#";
			this.Load += new System.EventHandler(this.StockQuoteForm_Load);

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>

		static void Main()
		{
			Application.Run(new StockQuoteForm());
		}


		private void comboBox1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			updateDisplayedData();
		}


		/// <summary>
		/// Changes the way that the application requests data from continuous to 
		/// user driven. When in continuous mode, btnGo will toggle between "Go!"
		/// and "Stop". When in user driver mode, btnGo will be used to "Update".
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>

		private void chkAutoRefresh_CheckStateChanged(object sender, System.EventArgs e)
		{
			radioButton1.Enabled = chkAutoRefresh.Checked;
			radioButton2.Enabled = chkAutoRefresh.Checked;
			radioButton3.Enabled = chkAutoRefresh.Checked;
			radioButton4.Enabled = chkAutoRefresh.Checked;
			
			if (chkAutoRefresh.Checked) 
			{
				changeState(States.AutoUpdate);
			} 
			else
			{
				changeState(States.UserUpdate);
			}

		}



		/// <summary>
		/// Requests a new dataset from the web service. In this version, the
		/// timer is stopped and then restarted to allow for possible delays
		/// in the web service greater than the timer delay.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void tmrTicker_Tick(object sender, System.EventArgs e)
		{
			tmrTicker.Enabled = false;
			updateQuote();
			tmrTicker.Enabled = true;
		}




		private void radioButton1_CheckedChanged(object sender, System.EventArgs e)
		{
			if (radioButton1.Checked) 
			{
				changeDelay(Delays.Delay1);
			}
		}

		private void radioButton2_CheckedChanged(object sender, System.EventArgs e)
		{
			if (radioButton2.Checked) 
			{
				changeDelay(Delays.Delay2);
			}
		}

		private void radioButton3_CheckedChanged(object sender, System.EventArgs e)
		{
			if (radioButton3.Checked) 
			{
				changeDelay(Delays.Delay3);
			}
		}

		private void radioButton4_CheckedChanged(object sender, System.EventArgs e)
		{
			if (radioButton4.Checked) 
			{
				changeDelay(Delays.Delay4);
			}
		}



		private void btnGo_Click(object sender, System.EventArgs e)
		{
			switch (currentState) 
			{
				case States.AutoUpdate:
					changeState(States.Stopped);
					break;

				case States.Stopped:
					changeState(States.AutoUpdate);
					break;

				case States.UserUpdate:
					updateQuote();
					break;
			}
		}
		
		/// <summary>
		/// Clears the data from txtQuoteData
		/// </summary>
		private void btnClear_Click(object sender, System.EventArgs e)
		{
			clearQuote();
		}

		/// <summary>
		/// Pauses the ticker and then gets new quote data.
		/// </summary>
		private void updateQuote () 
		{
			txtStatus.Text = "Updating quote for " + comboBox1.Items[comboBox1.SelectedIndex];
			
			try 
			{
				if (null==sq) 
				{
					sq = new StockQuoter();
				}
				ds = sq.getQuoteDataSet();
				txtStatus.Text = "Retreived dataset from web service";
				updateDisplayedData();
				txtStatus.Text = "Done at " + System.DateTime.Now;
				
			} 
			catch (Exception e) 
			{
				txtStatus.Text = "Error updating quote for " + comboBox1.Items[comboBox1.SelectedIndex] + ": " + e.Message;
				ds = null;
			}
		}


		/// <summary>
		/// This method will take any available data that is held in the DataSet ds.
		/// If the dataset is null, it clears the quote data box and returns. If the
		/// dataset is valid, it attempts to find the required stock and associated 
		/// value (or if "All", it formats all the stock's values for display)
		/// </summary>

		private void updateDisplayedData() 
		{

			string symbol = "";
			string item =  "All";
			string change = "";

			if (comboBox1.SelectedIndex >= 0 )
			{
				symbol = (string) comboBox1.Items[comboBox1.SelectedIndex];
			}
			if (listBox1.SelectedIndex >= 0) 
			{
				item = (string) listBox1.Items[listBox1.SelectedIndex];
			}

			// Check that the dataset isn't empty
			if (ds == null) 
			{
				txtStatus.Text = "Dataset is null";
				clearQuote();
			} 
			else
			{
				// Check that the stock symbol is valid
				if (symbol.Equals("")) 
				{
					txtStatus.Text = "Symbol is null";
					clearQuote();
				}
				else 
				{
					txtStatus.Text = "Finding " + item + " for " + symbol;
					txtQuoteData.Text = "";

					try 
					{
						
						// Iterate through all of the dataset records to find the correct stock
						for (int i = 0; i < ds.Tables[0].Rows.Count; i++) 
						{
							// If we have found the symbol, then update the display
							String s = (string) ds.Tables[0].Rows[i]["Symbol"];
							if(s.Equals(symbol)) 
							{

								change = ds.Tables[0].Rows[i]["Change"].ToString().Substring(0,1);

								// Either show all the quote data...
								if (item.Equals("All")) 
								{
									txtQuoteData.Text =
										(string) ds.Tables[0].Rows[i]["Symbol"] + "\r\n" + 
										(string) ds.Tables[0].Rows[i]["Name"] + "\r\n" + 
										(string) ds.Tables[0].Rows[i]["Last"] + "\r\n" + 
										(string) ds.Tables[0].Rows[i]["Change"] + "\r\n" + 
										(string) ds.Tables[0].Rows[i]["PercentChange"] + "\r\n" + 
										(string) ds.Tables[0].Rows[i]["Volume"];
    
								} //...or just one item
								else if (item.Equals("% Change"))
								{
									txtQuoteData.Text = (string) ds.Tables[0].Rows[i]["PercentChange"];	

								}		
								else 	
								{
									txtQuoteData.Text = (string) ds.Tables[0].Rows[i][item];
								}


								// Update the image displayed by pictureBox1 from an embedded 
                                // resource to reflect the status of the current quote
								Assembly assm = Assembly.GetExecutingAssembly();
								Stream stream;
								
								if (change == "-")
									stream = assm.GetManifestResourceStream("StockQuote.down.bmp");
								else if (change == "+")
									stream = assm.GetManifestResourceStream("StockQuote.up.bmp");
								else
									stream = assm.GetManifestResourceStream("StockQuote.even.bmp");
						
								StreamReader streamreader = null;
								streamreader = new StreamReader(stream);
								pictureBox1.Image = new System.Drawing.Bitmap(stream);


							}
						}
					
						txtStatus.Text = "Displaying " + item + " for " + symbol;
					} 
					catch (Exception e) 
					{
						txtStatus.Text = "Error updating symbols list";
						MessageBox.Show(e.Message);
					}
				}
			}
				
		}

		/// <summary>
		/// Updates the text of buttons depending on the current state 
		/// </summary>
		private void changeState (States newState) 
		{
			currentState = newState;
			switch (currentState) 
			{
				case States.AutoUpdate:
					this.tmrTicker.Enabled = true;
					btnGo.Text = "Stop";
					break;

				case States.Stopped:
					tmrTicker.Enabled = false;
					btnGo.Text = "Go!";
					break;

				case States.UserUpdate:
					tmrTicker.Enabled = false;
					btnGo.Text = "Update";
					break;
			}
		}



		/// <summary>
		/// Changes the Interval for auto-updating quote data
		/// </summary>
		/// <param name="newDelay">a valid delay</param>

		private void changeDelay (Delays newDelay) 
		{
			currentDelay = newDelay;
			tmrTicker.Interval = (int)(newDelay) * 1000;
		}


		/// <summary>
		/// Abstracts the action of removing all text from the Quote data box.
		/// </summary>
		/// 
		private void clearQuote () 
		{
			txtQuoteData.Text = "";
		}

		private void listBox1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			updateDisplayedData();
		}

		private void StockQuoteForm_Load(object sender, System.EventArgs e)
		{
			// Place in center of the screen
			this.Location = new Point((Screen.PrimaryScreen.Bounds.Width - this.Width) / 2, (Screen.PrimaryScreen.Bounds.Height - this.Height) / 2);

			// Ensure that the form gets the chance to paint itself
			this.Update();

			// A call to the web service is made using sq.getQuoteDataSet().
			// If this succeeds, the dataset is used to fill the list of
			// available symbols in comboBox1
			Cursor.Current = Cursors.WaitCursor;
			try 
			{
				txtStatus.Text = "Updating available symbols list...";
				if (null==sq)
				{
					sq = new StockQuoter();
				}
				ds = sq.getQuoteDataSet();
				comboBox1.Items.Clear();
				for (int i = 0; i < ds.Tables[0].Rows.Count; i++) 
				{
					comboBox1.Items.Add(ds.Tables[0].Rows[i]["Symbol"].ToString());
				}
				comboBox1.SelectedIndex = 0;
				txtStatus.Text = "Updating available symbols list...done";
			} 
			catch (Exception ex) 
			{
				txtStatus.Text = "Error updating symbols list";
				MessageBox.Show(ex.Message);
			}
			Cursor.Current = Cursors.Default;
		}


	}
}
