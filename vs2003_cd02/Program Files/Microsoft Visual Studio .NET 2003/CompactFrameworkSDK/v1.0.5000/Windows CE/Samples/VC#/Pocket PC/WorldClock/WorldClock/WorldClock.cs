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

// TODO: 1) Open a Visual Studio .NET Command Prompt;
// TODO: 2) Navigate to the folder containing this solution
// TODO: 3) Run "setupClockControl.bat"
// TODO: 4) Open the Toolbox, right click and go to "Add/Remove Items"
// TODO: 5) Browse to [VS2003 Folder]\CompactFrameworkSDK\v1.0.5000\Windows CE\Designer\
// TODO: 6) Add "Designer.ClockControl.dll" to your Toolbox
// TODO: 7) Add the following controls to your form:
// TODO: 8) AnalogClock named analogClock1 (place this in the empty area, top left)
// TODO: 9) DigitalClock named digitalClock1 (place this below the "Time" label)
// TODO: 10) DigitalClock named digitalClock2 (place this below the "UTC" label)
// TODO: 11) Set the property ClockFormat of digitalClock1 and digitalClock2 to "T"
// TODO: 12) Open Solution Explorer
// TODO: 13) Right click on the WorldClock project and click Add Reference
// TODO: 14) Select "ClockControl" which will be the first .NET component listed
// TODO: 15) Build and run your solution!

using System;
using System.Drawing;
using System.Collections;
using System.Windows.Forms;
using System.Data;
using System.Globalization;
using System.Resources;

namespace WorldClock {
    /// <summary>
    /// Summary description for Form1.
    /// </summary>
    public class ClockForm : System.Windows.Forms.Form {
        private System.Windows.Forms.Label lblTime;
        private System.Windows.Forms.Label lblDate;
        private System.Windows.Forms.Label lblDateValue;
        private System.Windows.Forms.Label lblDST;
        private System.Windows.Forms.Label lblDSTFrom;
        private System.Windows.Forms.Label lblDSTTo;
        private System.Windows.Forms.Label lblDSTFromValue;
        private System.Windows.Forms.Label lblDSTToValue;
        private System.Windows.Forms.Label lblUTC;
        private System.Windows.Forms.CheckBox chkDST;
        private System.Windows.Forms.MainMenu mainMenu1;

        private System.TimeZone tz;
        private System.Windows.Forms.Label lblTimezone;
        private System.Windows.Forms.Label lblTimezoneValue;
        private System.Windows.Forms.MenuItem menLangItem;
        private System.Windows.Forms.MenuItem menItemENU;
        private System.Windows.Forms.MenuItem menItemDEU;
        private System.Windows.Forms.MenuItem menItemFRA;
        private System.Resources.ResourceManager rm;
        private System.Globalization.CultureInfo uici;

        public ClockForm() {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            // Initialize resource manager and culture info
            rm = new System.Resources.ResourceManager("WorldClock.Resources.strings",typeof(ClockForm).Assembly);
            uici = (CultureInfo)System.Globalization.CultureInfo.CurrentUICulture.Clone();

            // Load resources
            LoadResources();
			
            // Initialization clocks & date
            this.analogClock1.CurrentDateTime = System.DateTime.Now;
            this.digitalClock1.CurrentDateTime = System.DateTime.Now;
            this.digitalClock2.CurrentDateTime = System.DateTime.UtcNow;
            this.lblDateValue.Text = System.DateTime.Now.ToShortDateString();

            // Initialization timezone information
            tz = System.TimeZone.CurrentTimeZone;
            this.chkDST.Checked = tz.IsDaylightSavingTime(System.DateTime.Now);
            this.lblTimezoneValue.Text = 
            tz.GetUtcOffset(System.DateTime.Now).ToString();
            System.Globalization.DaylightTime dstChanges = 
            tz.GetDaylightChanges(System.DateTime.Now.Year);
            this.lblDSTFromValue.Text = dstChanges.Start.ToString();
            this.lblDSTToValue.Text = dstChanges.End.ToString();
        }
        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        protected override void Dispose( bool disposing ) {
            base.Dispose( disposing );
        }
        #region Windows Form Designer generated code
        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent() {
            this.mainMenu1 = new System.Windows.Forms.MainMenu();
            this.menLangItem = new System.Windows.Forms.MenuItem();
            this.menItemENU = new System.Windows.Forms.MenuItem();
            this.menItemDEU = new System.Windows.Forms.MenuItem();
            this.menItemFRA = new System.Windows.Forms.MenuItem();
            this.lblTime = new System.Windows.Forms.Label();
            this.lblDate = new System.Windows.Forms.Label();
            this.lblDateValue = new System.Windows.Forms.Label();
            this.lblDST = new System.Windows.Forms.Label();
            this.chkDST = new System.Windows.Forms.CheckBox();
            this.lblDSTFrom = new System.Windows.Forms.Label();
            this.lblDSTTo = new System.Windows.Forms.Label();
            this.lblDSTFromValue = new System.Windows.Forms.Label();
            this.lblDSTToValue = new System.Windows.Forms.Label();
            this.lblUTC = new System.Windows.Forms.Label();
            this.lblTimezone = new System.Windows.Forms.Label();
            this.lblTimezoneValue = new System.Windows.Forms.Label();
            // 
            // mainMenu1
            // 
            this.mainMenu1.MenuItems.Add(this.menLangItem);
            // 
            // menLangItem
            // 
            this.menLangItem.MenuItems.Add(this.menItemENU);
            this.menLangItem.MenuItems.Add(this.menItemDEU);
            this.menLangItem.MenuItems.Add(this.menItemFRA);
            this.menLangItem.Text = "Lang.";
            // 
            // menItemENU
            // 
            this.menItemENU.Text = "English";
            this.menItemENU.Click += new System.EventHandler(this.menItemENU_Click);
            // 
            // menItemDEU
            // 
            this.menItemDEU.Text = "German";
            this.menItemDEU.Click += new System.EventHandler(this.menItemDEU_Click);
            // 
            // menItemFRA
            // 
            this.menItemFRA.Text = "French";
            this.menItemFRA.Click += new System.EventHandler(this.menItemFRA_Click);
            // 
            // lblTime
            // 
            this.lblTime.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold);
            this.lblTime.Location = new System.Drawing.Point(120, 64);
            this.lblTime.Size = new System.Drawing.Size(112, 16);
            this.lblTime.Text = "Time:";
            // 
            // lblDate
            // 
            this.lblDate.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold);
            this.lblDate.Location = new System.Drawing.Point(120, 8);
            this.lblDate.Size = new System.Drawing.Size(112, 16);
            this.lblDate.Text = "Date:";
            // 
            // lblDateValue
            // 
            this.lblDateValue.Location = new System.Drawing.Point(120, 32);
            this.lblDateValue.Size = new System.Drawing.Size(112, 16);
            this.lblDateValue.Text = "<Placeholder Date>";
            // 
            // lblDST
            // 
            this.lblDST.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold);
            this.lblDST.Location = new System.Drawing.Point(0, 165);
            this.lblDST.Size = new System.Drawing.Size(144, 16);
            this.lblDST.Text = "Daylight Saving Time:";
            // 
            // chkDST
            // 
            this.chkDST.Enabled = false;
            this.chkDST.Location = new System.Drawing.Point(152, 165);
            this.chkDST.Size = new System.Drawing.Size(16, 16);
            // 
            // lblDSTFrom
            // 
            this.lblDSTFrom.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold);
            this.lblDSTFrom.Location = new System.Drawing.Point(0, 187);
            this.lblDSTFrom.Size = new System.Drawing.Size(72, 16);
            this.lblDSTFrom.Text = "From: ";
            // 
            // lblDSTTo
            // 
            this.lblDSTTo.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold);
            this.lblDSTTo.Location = new System.Drawing.Point(0, 208);
            this.lblDSTTo.Size = new System.Drawing.Size(72, 16);
            this.lblDSTTo.Text = "To:";
            // 
            // lblDSTFromValue
            // 
            this.lblDSTFromValue.Location = new System.Drawing.Point(80, 187);
            this.lblDSTFromValue.Size = new System.Drawing.Size(152, 16);
            this.lblDSTFromValue.Text = "<PH DSTFrom>";
            // 
            // lblDSTToValue
            // 
            this.lblDSTToValue.Location = new System.Drawing.Point(80, 208);
            this.lblDSTToValue.Size = new System.Drawing.Size(152, 16);
            this.lblDSTToValue.Text = "<PH DSTTo>";
            // 
            // lblUTC
            // 
            this.lblUTC.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold);
            this.lblUTC.Location = new System.Drawing.Point(0, 227);
            this.lblUTC.Size = new System.Drawing.Size(72, 16);
            this.lblUTC.Text = "UTC (GMT):";
            // 
            // lblTimezone
            // 
            this.lblTimezone.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold);
            this.lblTimezone.Location = new System.Drawing.Point(0, 120);
            this.lblTimezone.Size = new System.Drawing.Size(232, 16);
            this.lblTimezone.Text = "Time zone offset (hours):";
            // 
            // lblTimezoneValue
            // 
            this.lblTimezoneValue.Location = new System.Drawing.Point(0, 137);
            this.lblTimezoneValue.Size = new System.Drawing.Size(232, 16);
            this.lblTimezoneValue.Text = "<PH time zone offset>";
            // 
            // ClockForm
            // 
            this.ClientSize = new System.Drawing.Size(240, 265);
            this.Controls.Add(this.lblTimezoneValue);
            this.Controls.Add(this.lblTimezone);
            this.Controls.Add(this.lblUTC);
            this.Controls.Add(this.lblDSTToValue);
            this.Controls.Add(this.lblDSTFromValue);
            this.Controls.Add(this.lblDSTTo);
            this.Controls.Add(this.lblDSTFrom);
            this.Controls.Add(this.chkDST);
            this.Controls.Add(this.lblDST);
            this.Controls.Add(this.lblDateValue);
            this.Controls.Add(this.lblDate);
            this.Controls.Add(this.lblTime);
            this.Menu = this.mainMenu1;
            this.Text = "Clock";

        }
        #endregion

		
        private void LoadResources() {
            // Form elements
            this.lblDate.Text = rm.GetString("txtDate",uici);
            this.lblTime.Text = rm.GetString("txtTime",uici);
            this.lblDST.Text = rm.GetString("txtDST",uici);
            this.lblDSTFrom.Text = rm.GetString("txtDSTFrom",uici);
            this.lblDSTTo.Text = rm.GetString("txtDSTTo",uici);
            this.lblUTC.Text = rm.GetString("txtUTC",uici);
            this.lblTimezone.Text = rm.GetString("txtTimezone",uici);
            this.Text = rm.GetString("txtFormName",uici);

            // Menu elements
            this.menLangItem.Text = rm.GetString("txtMenLang",uici);
            this.menItemDEU.Text = rm.GetString("txtMenDEU",uici);
            this.menItemFRA.Text = rm.GetString("txtMenFRA",uici);
            this.menItemENU.Text = rm.GetString("txtMenENU",uici);
        }
        /// <summary>
        /// The main entry point for the application.
        /// </summary>

        static void Main() {
            Application.Run(new ClockForm());
        }

        private void menItemENU_Click(object sender, System.EventArgs e) {
            uici = new CultureInfo("en");
            LoadResources();
        }

        private void menItemDEU_Click(object sender, System.EventArgs e) {
            uici = new CultureInfo("de");
            LoadResources();
        }

        private void menItemFRA_Click(object sender, System.EventArgs e) {
            uici = new CultureInfo("fr");
            LoadResources();
        }
    }
}
