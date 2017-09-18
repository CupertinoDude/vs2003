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


namespace Microsoft.Samples.WinForms.Cs.Menus {
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Drawing.Text;
    using System.Windows.Forms;

    public class Menus : System.Windows.Forms.Form {
        /// <summary>
        ///    Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components;
        protected internal System.Windows.Forms.Label label1;
        protected internal System.Windows.Forms.MainMenu mainMenu;
        protected internal System.Windows.Forms.ContextMenu label1ContextMenu;

        // Comment out this structure to view menus.cs in the WinForms Designer.
        // Remember not to edit the menus in the designer. It will conflict
        // with the hand-written menu code. Remember to uncomment this
        // structure when you are finished.
        private struct FontSizes {
            public static float Small = 8f;
            public static float Medium = 12f;
            public static float Large = 24f;
        }

        //Font face and size
        private float fontSize = FontSizes.Medium;

        //Used to track which menu items are checked/unchecked
        private MenuItem mmiSansSerif;
        private MenuItem mmiSerif;
        private MenuItem mmiMonoSpace;

        private MenuItem mmiSmall;
        private MenuItem mmiMedium;
        private MenuItem mmiLarge;

        private MenuItem cmiSansSerif;
        private MenuItem cmiSerif;
        private MenuItem cmiMonoSpace;

        private MenuItem cmiSmall;
        private MenuItem cmiMedium;
        private MenuItem cmiLarge;

        private MenuItem miMainFormatFontChecked ;
        private MenuItem miMainFormatSizeChecked ;
        private MenuItem miContextFormatFontChecked ;
        private MenuItem miContextFormatSizeChecked ;

        private FontFamily currentFontFamily ;
        private FontFamily monoSpaceFontFamily;
        private FontFamily sansSerifFontFamily;
        private FontFamily serifFontFamily;

        public Menus() {

            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            // Initialize Fonts - use generic fonts to avoid problems across
            // different versions of the OS
            monoSpaceFontFamily = new FontFamily (GenericFontFamilies.Monospace);
            sansSerifFontFamily = new FontFamily (GenericFontFamilies.SansSerif);
            serifFontFamily = new FontFamily (GenericFontFamilies.Serif);
            currentFontFamily = sansSerifFontFamily;

            //Add File Menu
            MenuItem miFile = mainMenu.MenuItems.Add("&File");
            miFile.MenuItems.Add(new MenuItem("&Open...", new EventHandler(this.FileOpen_Clicked), Shortcut.CtrlO));
            miFile.MenuItems.Add("-");     // Gives us a seperator
            miFile.MenuItems.Add(new MenuItem("E&xit", new EventHandler(this.FileExit_Clicked), Shortcut.CtrlX));

            //Add Format Menu
            MenuItem miFormat = mainMenu.MenuItems.Add("F&ormat");

            //Font Face sub-menu
            mmiSansSerif = new MenuItem("&1. " + sansSerifFontFamily.Name, new EventHandler(this.FormatFont_Clicked));
            mmiSansSerif.Checked = true ;
            mmiSansSerif.DefaultItem = true ;
            mmiSerif = new MenuItem("&2. " + serifFontFamily.Name, new EventHandler(this.FormatFont_Clicked));
            mmiMonoSpace = new MenuItem("&3. " + monoSpaceFontFamily.Name, new EventHandler(this.FormatFont_Clicked));

            miFormat.MenuItems.Add( "Font &Face",
                                    (new MenuItem[]{ mmiSansSerif, mmiSerif, mmiMonoSpace })
                                    );

            //Font Size sub-menu
            mmiSmall = new MenuItem("&Small", new EventHandler(this.FormatSize_Clicked));
            mmiMedium = new MenuItem("&Medium", new EventHandler(this.FormatSize_Clicked));
            mmiMedium.Checked = true ;
            mmiMedium.DefaultItem = true ;
            mmiLarge = new MenuItem("&Large", new EventHandler(this.FormatSize_Clicked));

            miFormat.MenuItems.Add( "Font &Size",
                                    (new MenuItem[]{ mmiSmall, mmiMedium, mmiLarge })
                                    );

            //Add Format to label context menu
            //Note have to add a clone because menus can't belong to 2 parents
            label1ContextMenu.MenuItems.Add(miFormat.CloneMenu());

            // Set up the context menu items - we use these to check and uncheck items
            cmiSansSerif = label1ContextMenu.MenuItems[0].MenuItems[0].MenuItems[0];
            cmiSerif = label1ContextMenu.MenuItems[0].MenuItems[0].MenuItems[1];
            cmiMonoSpace = label1ContextMenu.MenuItems[0].MenuItems[0].MenuItems[2];
            cmiSmall = label1ContextMenu.MenuItems[0].MenuItems[1].MenuItems[0];
            cmiMedium = label1ContextMenu.MenuItems[0].MenuItems[1].MenuItems[1];
            cmiLarge = label1ContextMenu.MenuItems[0].MenuItems[1].MenuItems[2];

            //We use these to track which menu items are checked
            //This is made more complex because we have both a menu and a context menu
            miMainFormatFontChecked = mmiSansSerif;
            miMainFormatSizeChecked = mmiMedium;
            miContextFormatFontChecked = cmiSansSerif;
            miContextFormatSizeChecked = cmiMedium;

        }

        //File->Exit Menu item handler
        private void FileExit_Clicked(object sender, System.EventArgs e) {
            this.Close();
        }

        //File->Open Menu item handler
        private void FileOpen_Clicked(object sender, System.EventArgs e) {
            MessageBox.Show("And why would this open a file?");
        }

        //Format->Font Menu item handler
        private void FormatFont_Clicked(object sender, System.EventArgs e) {
            MenuItem miClicked = (MenuItem)sender;

            miMainFormatFontChecked.Checked = false;
            miContextFormatFontChecked.Checked = false;

            if ( miClicked == mmiSansSerif || miClicked == cmiSansSerif ) {
                miMainFormatFontChecked = mmiSansSerif;
                miContextFormatFontChecked = cmiSansSerif;
                currentFontFamily = sansSerifFontFamily;
            } else if (miClicked == mmiSerif || miClicked == cmiSerif) {
                miMainFormatFontChecked = mmiSerif;
                miContextFormatFontChecked = cmiSerif;
                currentFontFamily = serifFontFamily;
            } else {
                miMainFormatFontChecked = mmiMonoSpace;
                miContextFormatFontChecked = cmiMonoSpace;
                currentFontFamily = monoSpaceFontFamily;
            }

            miMainFormatFontChecked.Checked = true;
            miContextFormatFontChecked.Checked = true;

            label1.Font = new Font(currentFontFamily, fontSize);
        }

        //Format->Size Menu item handler
        private void FormatSize_Clicked(object sender, System.EventArgs e) {

            MenuItem miClicked = (MenuItem)sender;

            miMainFormatSizeChecked.Checked = false;
            miContextFormatSizeChecked.Checked = false;

            string fontSizeString = ((MenuItem)sender).Text;

            if (fontSizeString == "&Small") {
                miMainFormatSizeChecked = mmiSmall;
                miContextFormatSizeChecked = cmiSmall;
            	fontSize = FontSizes.Small ;
            } else if (fontSizeString == "&Large") {
                miMainFormatSizeChecked = mmiLarge;
                miContextFormatSizeChecked = cmiLarge;
            	fontSize = FontSizes.Large ;
            } else {
                miMainFormatSizeChecked = mmiMedium;
                miContextFormatSizeChecked = cmiMedium;
                fontSize = FontSizes.Medium ;
            }

            miMainFormatSizeChecked.Checked = true;
            miContextFormatSizeChecked.Checked = true;

            label1.Font = new Font(currentFontFamily, fontSize);
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
            this.mainMenu = new System.Windows.Forms.MainMenu ();
            this.label1 = new System.Windows.Forms.Label ();
            this.label1ContextMenu = new System.Windows.Forms.ContextMenu ();
            this.Text = "Menus 'R Us";
            this.AutoScaleBaseSize = new System.Drawing.Size (5, 13);
            this.Menu = this.mainMenu;
            this.ClientSize = new System.Drawing.Size (392, 117);
            label1.BackColor = System.Drawing.Color.LightSteelBlue;
            label1.Location = new System.Drawing.Point (16, 24);
            label1.TabIndex = 0;
            label1.Size = new System.Drawing.Size (360, 50);
            label1.Text = "Right Click on me - I have a context menu!";
            label1.ContextMenu = this.label1ContextMenu;
            this.Controls.Add (this.label1);
		}

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new Menus());
        }

    }
}











