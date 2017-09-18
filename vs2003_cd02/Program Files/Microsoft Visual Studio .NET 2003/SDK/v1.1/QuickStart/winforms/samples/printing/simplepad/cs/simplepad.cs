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


namespace Microsoft.Samples.WinForms.Cs.SimplePad {

    using System;
    using System.Drawing;
    using System.Drawing.Printing;
    using System.Collections;
    using System.Globalization;
    using System.IO;
    using System.ComponentModel;
    using System.Windows.Forms;

    public class SimplePad : System.Windows.Forms.Form {
        /// <summary>
        ///    Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components;
        protected internal System.Windows.Forms.MenuItem menuItem22;
        protected internal System.Windows.Forms.MenuItem selectAllMenu;
        protected internal System.Windows.Forms.MenuItem menuItem20;
        protected internal System.Windows.Forms.MenuItem gotoMenu;
        protected internal System.Windows.Forms.MenuItem menuItem18;
        protected internal System.Windows.Forms.MenuItem menuItem17;
        protected internal System.Windows.Forms.MenuItem menuItem16;
        protected internal System.Windows.Forms.MenuItem menuItem15;
        protected internal System.Windows.Forms.MenuItem DeleteMenu;
        protected internal System.Windows.Forms.MenuItem pasteMenu;
        protected internal System.Windows.Forms.MenuItem copyMenu;
        protected internal System.Windows.Forms.MenuItem CutMenu;
        protected internal System.Windows.Forms.MenuItem menuItem8;
        protected internal System.Windows.Forms.MenuItem UndoMenu;
        protected internal System.Windows.Forms.MenuItem optionsMenu;
        protected internal System.Windows.Forms.MenuItem menuItem7;
        protected internal System.Windows.Forms.MenuItem fontMenu;
        protected internal System.Windows.Forms.MenuItem wordWrapMenu;
        protected internal System.Windows.Forms.PrintDialog printDialog1;
        protected internal System.Windows.Forms.FontDialog fontDialog1;
        protected internal System.Windows.Forms.SaveFileDialog saveFileDialog1;
        protected internal System.Windows.Forms.OpenFileDialog openFileDialog1;
        protected internal System.Windows.Forms.StatusBarPanel linePanel;
        protected internal System.Windows.Forms.StatusBarPanel statusPanel;
        protected internal System.Windows.Forms.StatusBar statusBar1;
        protected internal System.Windows.Forms.RichTextBox textArea;
        protected internal System.Windows.Forms.MenuItem exitMenu;
        protected internal System.Windows.Forms.MenuItem menuItem12;
        protected internal System.Windows.Forms.MenuItem printMenu;
        protected internal System.Windows.Forms.MenuItem pageSetupMenu;
        protected internal System.Windows.Forms.MenuItem menuItem9;
        protected internal System.Windows.Forms.MenuItem saveAsMenu;
        protected internal System.Windows.Forms.MenuItem saveMenu;
        protected internal System.Windows.Forms.MenuItem openMenu;
        protected internal System.Windows.Forms.MenuItem newMenu;
        protected internal System.Windows.Forms.MenuItem menuItem4;
        protected internal System.Windows.Forms.MenuItem menuItem3;
        protected internal System.Windows.Forms.MenuItem menuItem2;
        protected internal System.Windows.Forms.MenuItem menuItem1;
        protected internal System.Windows.Forms.MainMenu mainMenu;
        protected internal System.Windows.Forms.MenuItem printPreviewMenu;
        protected internal System.IO.FileSystemWatcher dirWatcher;

        private static readonly string noFilename = "Untitled";
        private static readonly string notDirtyCaptionFormat = "{0} - SimplePad+";
        private static readonly string dirtyCaptionFormat = "{0}* - SimplePad+";
        private string editingFileName = null;
        private bool dirty = false;
        private bool fileOnDiskModified = false;
        private PageSettings storedPageSettings = null ;

        public SimplePad() {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            UpdateFormText();
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
        private void InitializeComponent() {
            this.components = new System.ComponentModel.Container();
            this.wordWrapMenu = new System.Windows.Forms.MenuItem();
            this.mainMenu = new System.Windows.Forms.MainMenu();
            this.statusBar1 = new System.Windows.Forms.StatusBar();
            this.menuItem4 = new System.Windows.Forms.MenuItem();
            this.menuItem20 = new System.Windows.Forms.MenuItem();
            this.textArea = new System.Windows.Forms.RichTextBox();
            this.linePanel = new System.Windows.Forms.StatusBarPanel();
            this.newMenu = new System.Windows.Forms.MenuItem();
            this.saveMenu = new System.Windows.Forms.MenuItem();
            this.menuItem18 = new System.Windows.Forms.MenuItem();
            this.pasteMenu = new System.Windows.Forms.MenuItem();
            this.exitMenu = new System.Windows.Forms.MenuItem();
            this.statusPanel = new System.Windows.Forms.StatusBarPanel();
            this.selectAllMenu = new System.Windows.Forms.MenuItem();
            this.gotoMenu = new System.Windows.Forms.MenuItem();
            this.DeleteMenu = new System.Windows.Forms.MenuItem();
            this.menuItem15 = new System.Windows.Forms.MenuItem();
            this.menuItem17 = new System.Windows.Forms.MenuItem();
            this.copyMenu = new System.Windows.Forms.MenuItem();
            this.menuItem16 = new System.Windows.Forms.MenuItem();
            this.optionsMenu = new System.Windows.Forms.MenuItem();
            this.menuItem9 = new System.Windows.Forms.MenuItem();
            this.saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
            this.fontMenu = new System.Windows.Forms.MenuItem();
            this.UndoMenu = new System.Windows.Forms.MenuItem();
            this.menuItem12 = new System.Windows.Forms.MenuItem();
            this.CutMenu = new System.Windows.Forms.MenuItem();
            this.menuItem22 = new System.Windows.Forms.MenuItem();
            this.menuItem8 = new System.Windows.Forms.MenuItem();
            this.dirWatcher = new System.IO.FileSystemWatcher();
            this.menuItem7 = new System.Windows.Forms.MenuItem();
            this.printMenu = new System.Windows.Forms.MenuItem();
            this.printDialog1 = new System.Windows.Forms.PrintDialog();
            this.saveAsMenu = new System.Windows.Forms.MenuItem();
            this.fontDialog1 = new System.Windows.Forms.FontDialog();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.menuItem1 = new System.Windows.Forms.MenuItem();
            this.openMenu = new System.Windows.Forms.MenuItem();
            this.menuItem2 = new System.Windows.Forms.MenuItem();
            this.pageSetupMenu = new System.Windows.Forms.MenuItem();
            this.menuItem3 = new System.Windows.Forms.MenuItem();
            this.printPreviewMenu = new System.Windows.Forms.MenuItem();

            dirWatcher.BeginInit();

            wordWrapMenu.BarBreak = false;
            wordWrapMenu.Break = false;
            wordWrapMenu.Text = "&Word Wrap";
            wordWrapMenu.Index = 0;
            wordWrapMenu.DefaultItem = false;
            wordWrapMenu.Click += new System.EventHandler(WordWrapMenu_Click);

            mainMenu.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {menuItem1, menuItem2, menuItem3, menuItem4});

            statusBar1.Location = new System.Drawing.Point(0, 379);
            statusBar1.BackColor = SystemColors.Control;
            statusBar1.Size = new System.Drawing.Size(512, 20);
            statusBar1.TabIndex = 1;
            statusBar1.ShowPanels = true;
            statusBar1.Text = "statusBar1";
            statusBar1.Panels.AddRange(new System.Windows.Forms.StatusBarPanel[] {statusPanel, linePanel});

            menuItem4.BarBreak = false;
            menuItem4.Break = false;
            menuItem4.Text = "&Help";
            menuItem4.Index = 3;
            menuItem4.DefaultItem = false;

            menuItem20.BarBreak = false;
            menuItem20.Break = false;
            menuItem20.Text = "-";
            menuItem20.Index = 11;
            menuItem20.DefaultItem = false;

            textArea.Text = "";
            textArea.Size = new System.Drawing.Size(512, 379);
            textArea.TabIndex = 0;
            textArea.Dock = System.Windows.Forms.DockStyle.Fill;
            textArea.WordWrap = false;
            textArea.AcceptsTab = true;
            textArea.TextChanged += new System.EventHandler(this.TextArea_TextChanged);

            this.AutoScaleBaseSize = new System.Drawing.Size(6, 16);
            this.Text = "SimplePad+";
            this.Menu = mainMenu;
            this.ClientSize = new System.Drawing.Size(512, 399);

            newMenu.BarBreak = false;
            newMenu.Break = false;
            newMenu.Text = "&New";
            newMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlN;
            newMenu.Index = 0;
            newMenu.DefaultItem = false;
            newMenu.Click += new System.EventHandler(NewMenu_Click);

            saveMenu.BarBreak = false;
            saveMenu.Break = false;
            saveMenu.Text = "&Save";
            saveMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlS;
            saveMenu.Index = 2;
            saveMenu.DefaultItem = false;
            saveMenu.Click += new System.EventHandler(SaveMenu_Click);

            pasteMenu.BarBreak = false;
            pasteMenu.Break = false;
            pasteMenu.Text = "&Paste";
            pasteMenu.Index = 4;
            pasteMenu.DefaultItem = false;
            pasteMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlV;
            pasteMenu.Click += new System.EventHandler(PasteMenu_Click);

            exitMenu.BarBreak = false;
            exitMenu.Break = false;
            exitMenu.Text = "E&xit";
            exitMenu.Index = 8;
            exitMenu.DefaultItem = false;
            exitMenu.Click += new System.EventHandler(ExitMenu_Click);

            statusPanel.Text = "Ready";
            statusPanel.BorderStyle = StatusBarPanelBorderStyle.None;
            statusPanel.Width = 396;
            statusPanel.AutoSize = StatusBarPanelAutoSize.Spring;

            selectAllMenu.BarBreak = false;
            selectAllMenu.Break = false;
            selectAllMenu.Text = "Select &All";
            selectAllMenu.Index = 12;
            selectAllMenu.DefaultItem = false;
            selectAllMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlA;
            selectAllMenu.Click += new System.EventHandler(this.SelectAllMenu_Click);

            gotoMenu.BarBreak = false;
            gotoMenu.Break = false;
            gotoMenu.Text = "&Go To...";
            gotoMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlG;
            gotoMenu.Index = 10;
            gotoMenu.DefaultItem = false;
            gotoMenu.Click += new System.EventHandler(this.GotoMenu_Click);

            DeleteMenu.BarBreak = false;
            DeleteMenu.Break = false;
            DeleteMenu.Text = "De&lete";
            DeleteMenu.Index = 5;
            DeleteMenu.DefaultItem = false;
            DeleteMenu.Click += new System.EventHandler(this.DeleteMenu_Click);

            menuItem15.BarBreak = false;
            menuItem15.Break = false;
            menuItem15.Text = "-";
            menuItem15.Index = 6;
            menuItem15.DefaultItem = false;

            copyMenu.BarBreak = false;
            copyMenu.Break = false;
            copyMenu.Text = "&Copy";
            copyMenu.Index = 3;
            copyMenu.DefaultItem = false;
            copyMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlC;
            copyMenu.Click += new System.EventHandler(CopyMenu_Click);

            optionsMenu.BarBreak = false;
            optionsMenu.Break = false;
            optionsMenu.Text = "&Options...";
            optionsMenu.Index = 3;
            optionsMenu.DefaultItem = false;
            optionsMenu.Click += new System.EventHandler(OptionsMenu_Click);

            menuItem9.BarBreak = false;
            menuItem9.Break = false;
            menuItem9.Text = "-";
            menuItem9.Index = 4;
            menuItem9.DefaultItem = false;

            saveFileDialog1.Filter = "Text Files (*.txt)|*.txt|Rich Text Format (*.rtf)|*.rtf|All Files (*.*)|*.*";
            saveFileDialog1.Title = "Save As";

            fontMenu.BarBreak = false;
            fontMenu.Break = false;
            fontMenu.Text = "&Font...";
            fontMenu.Index = 1;
            fontMenu.DefaultItem = false;
            fontMenu.Click += new System.EventHandler(FontMenu_Click);

            UndoMenu.BarBreak = false;
            UndoMenu.Break = false;
            UndoMenu.Text = "&Undo";
            UndoMenu.Index = 0;
            UndoMenu.DefaultItem = false;
            UndoMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlZ;
            UndoMenu.Click += new System.EventHandler(UndoMenu_Click);

            menuItem12.BarBreak = false;
            menuItem12.Break = false;
            menuItem12.Text = "-";
            menuItem12.Index = 7;
            menuItem12.DefaultItem = false;

            CutMenu.BarBreak = false;
            CutMenu.Break = false;
            CutMenu.Text = "Cu&t";
            CutMenu.Index = 2;
            CutMenu.DefaultItem = false;
            CutMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlX;
            CutMenu.Click += new System.EventHandler(CutMenu_Click);

            menuItem8.BarBreak = false;
            menuItem8.Break = false;
            menuItem8.Text = "-";
            menuItem8.Index = 1;
            menuItem8.DefaultItem = false;

            dirWatcher.Changed += new System.IO.FileSystemEventHandler(DirWatcher_Changed);

            menuItem7.BarBreak = false;
            menuItem7.Break = false;
            menuItem7.Text = "-";
            menuItem7.Index = 2;
            menuItem7.DefaultItem = false;

            printMenu.BarBreak = false;
            printMenu.Break = false;
            printMenu.Text = "&Print...";
            printMenu.Index = 6;
            printMenu.DefaultItem = false;
            printMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlP;
            printMenu.Click += new System.EventHandler(PrintMenu_Click);

            printPreviewMenu.BarBreak = false;
            printPreviewMenu.Break = false;
            printPreviewMenu.Text = "Print Pre&view...";
            printPreviewMenu.Index = 6;
            printPreviewMenu.DefaultItem = false;
            printPreviewMenu.Click += new System.EventHandler(PrintPreviewMenu_Click);

            saveAsMenu.BarBreak = false;
            saveAsMenu.Break = false;
            saveAsMenu.Text = "Save &As...";
            saveAsMenu.Index = 3;
            saveAsMenu.DefaultItem = false;
            saveAsMenu.Click += new System.EventHandler(SaveAsMenu_Click);

            fontDialog1.ShowColor = true;
            fontDialog1.ShowEffects = true;

            openFileDialog1.Filter = "Text Files (*.txt)|*.txt|Rich Text Format (*.rtf)|*.rtf|All Files (*.*)|*.*";
            openFileDialog1.Title = "Open";
            openFileDialog1.DefaultExt = ".rtf";

            menuItem1.BarBreak = false;
            menuItem1.Break = false;
            menuItem1.Text = "&File";
            menuItem1.Index = 0;
            menuItem1.DefaultItem = false;
            menuItem1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {newMenu, openMenu, saveMenu, saveAsMenu, menuItem9, printMenu, printPreviewMenu, pageSetupMenu, menuItem12, exitMenu});

            openMenu.BarBreak = false;
            openMenu.Break = false;
            openMenu.Text = "&Open...";
            openMenu.Index = 1;
            openMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlO;
            openMenu.DefaultItem = false;
            openMenu.Click += new System.EventHandler(OpenMenu_Click);

            menuItem2.BarBreak = false;
            menuItem2.Break = false;
            menuItem2.Text = "&Edit";
            menuItem2.Index = 1;
            menuItem2.DefaultItem = false;
            menuItem2.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {UndoMenu, menuItem8, CutMenu, copyMenu, pasteMenu, DeleteMenu, menuItem15, gotoMenu, menuItem20, selectAllMenu});

            pageSetupMenu.BarBreak = false;
            pageSetupMenu.Break = false;
            pageSetupMenu.Text = "Page Set&up...";
            pageSetupMenu.Index = 5;
            pageSetupMenu.DefaultItem = false;
            pageSetupMenu.Click += new System.EventHandler(PageSetupMenu_Click);

            menuItem3.BarBreak = false;
            menuItem3.Break = false;
            menuItem3.Text = "F&ormat";
            menuItem3.Index = 2;
            menuItem3.DefaultItem = false;
            menuItem3.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {wordWrapMenu, fontMenu, menuItem7, optionsMenu});

            this.Controls.Add(statusBar1);
            this.Controls.Add(textArea);

            dirWatcher.EndInit();
        }

        private void PromptForReload() {
            fileOnDiskModified = false;

            System.Windows.Forms.DialogResult dr = MessageBox.Show(this,
                "The current file has been changed, do you want to reload it?",
                "File Change Notification",
                MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            if (dr == System.Windows.Forms.DialogResult.Yes) {

                ReadEditingFile();
            }
        }

        protected override void OnActivated(EventArgs e) {
            base.OnActivated(e);

            if (fileOnDiskModified) {
                PromptForReload();
            }
        }

        protected override void OnClosing(CancelEventArgs e) {
            base.OnClosing(e);

            if (dirty) {
                System.Windows.Forms.DialogResult dr = MessageBox.Show(this,
                    "Do you want to save the current changes?",
                    "Save Changes?",
                    MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);

                switch (dr) {
                    case System.Windows.Forms.DialogResult.Yes:
                        Save();
                        break;
                    case System.Windows.Forms.DialogResult.No:
                        break;
                    case System.Windows.Forms.DialogResult.Cancel:
                        e.Cancel = true;
                        break;
                }
            }
        }

        private void DirWatcher_Changed(object sender, FileSystemEventArgs e) {
            if (this.ContainsFocus) {
                PromptForReload();
            }
            else {
                fileOnDiskModified = true;
            }
        }

        private void TextArea_TextChanged(object sender, EventArgs e) {
            if (!dirty) {
                dirty = true;
                UpdateFormText();
            }
        }

        private void SaveAs() {
            System.Windows.Forms.DialogResult dr = saveFileDialog1.ShowDialog();
            if (dr == System.Windows.Forms.DialogResult.OK) {
                editingFileName = saveFileDialog1.FileName;
                FileInfo efInfo = new FileInfo(editingFileName);
                dirWatcher.EnableRaisingEvents = false;
                dirWatcher.Path = efInfo.DirectoryName;
                dirWatcher.Filter = efInfo.Name;
                Save();
                UpdateFormText();
            }
        }

        private void Save() {

            if (editingFileName == null || editingFileName.Length < 1) {
                SaveAs();
                return;
            }

            dirWatcher.EnableRaisingEvents = false;
            FileStream fs = null;
            try {
                if (File.Exists(editingFileName)) {
                    fs = new FileStream(editingFileName, FileMode.Open);
                }
                else {
                    fs = new FileStream(editingFileName, FileMode.Create);
                }

                string fext = (new FileInfo(editingFileName)).Extension.ToUpper(CultureInfo.InvariantCulture);

                Console.WriteLine(editingFileName);

                if (fext.Equals(".RTF"))
                    textArea.SaveFile(fs, RichTextBoxStreamType.RichText);
                else
                    textArea.SaveFile(fs, RichTextBoxStreamType.PlainText);

            }
            finally {
                if (fs != null) {
                    fs.Flush();
                    fs.Close();
                    dirty = false;
                }
                dirWatcher.EnableRaisingEvents = true;
            }
        }

        private void ExitMenu_Click(object sender, EventArgs e) {
            this.Close();
        }



        private void SaveMenu_Click(object sender, EventArgs e) {
            Save();
        }

        private void Goto(int line) {
            string text = textArea.Text;
            int cur = 0;
			if (line > textArea.Lines.Length) {
				line = textArea.Lines.Length;
			}
            for (int i=1; i<line; i++) {
                int next = text.IndexOf("\n", cur + 1);
                if (next == -1) {
                    break;
                }
                cur = next;
            }
            if (line > 1) {
                textArea.Select(cur + 1, 0);
            }
            else {
                textArea.Select(cur, 0);
            }
        }

        private int GetCurrentLine() {
            char[] text = textArea.Text.ToCharArray();
            int cur = textArea.SelectionStart;
            int line = 1;
            for (int i=0; i<cur; i++) {
                if (text[i] == '\n') {
                    line++;
                }
            }
            return line;
        }

        private void GotoMenu_Click(object sender, EventArgs e) {
            System.Windows.Forms.DialogResult dr;
            GotoForm f = new GotoForm();
            f.Line = GetCurrentLine();
            dr = f.ShowDialog(this);
            if (dr == System.Windows.Forms.DialogResult.OK && f.Line != -1) {
                Goto(f.Line);
            }
        }

        private void SaveAsMenu_Click(object sender, EventArgs e) {
            SaveAs();
        }

        private void WordWrapMenu_Click(object sender, EventArgs e) {
            wordWrapMenu.Checked = !wordWrapMenu.Checked;
            textArea.WordWrap = wordWrapMenu.Checked;
        }

        private void NewMenu_Click(object sender, EventArgs e) {
            MessageBox.Show("Not implemented");
        }

        private void OpenMenu_Click(object sender, EventArgs e) {
            if (openFileDialog1.ShowDialog() == System.Windows.Forms.DialogResult.OK) {
                editingFileName = openFileDialog1.FileName;
                ReadEditingFile();
            }
        }

        private void FontMenu_Click(object sender, EventArgs e) {
            if (fontDialog1.ShowDialog() == System.Windows.Forms.DialogResult.OK) {
                textArea.SelectionFont = fontDialog1.Font;
                textArea.SelectionColor = fontDialog1.Color;
            }
        }

        private void OptionsMenu_Click(object sender, EventArgs e) {
            OptionsForm f = new OptionsForm(new SimplePadOptions(this));
            f.ShowDialog(this);
        }

        private void CutMenu_Click(object sender, EventArgs e) {
            if (textArea.SelectedText.Equals("")) return;
            Clipboard.SetDataObject(textArea.SelectedRtf,true);
            textArea.SelectedRtf = "" ;
        }

        private void UndoMenu_Click(object sender, EventArgs e) {
            textArea.Undo();
        }

        private void CopyMenu_Click(object sender, EventArgs e) {
            if (textArea.SelectedText.Equals("")) return;
            Clipboard.SetDataObject(textArea.SelectedRtf,true);
        }

        private void SelectAllMenu_Click(object sender, EventArgs e) {
            textArea.SelectAll();
        }

        private void DeleteMenu_Click(object sender, EventArgs e) {
            textArea.SelectedRtf = "" ;
        }

        private void PasteMenu_Click(object sender, EventArgs e) {
            try {
                 DataObject data = (DataObject)Clipboard.GetDataObject();
                 if (data.GetDataPresent(DataFormats.Rtf)) {
                     string text = (string)data.GetData(DataFormats.Rtf);
                     if (!text.Equals("")) textArea.SelectedRtf = text;
                 }
                 else if (data.GetDataPresent(DataFormats.Text)) {
                     string text = (string)data.GetData(DataFormats.Text);
                     if (!text.Equals("")) textArea.SelectedText = text;
                 }
            } catch (Exception ex) {
                MessageBox.Show(ex.Message);
            }
        }


        private void PrintMenu_Click(object sender, EventArgs e) {
            StringReader streamToPrint = new StringReader (textArea.Text);

            //Assumes the default printer
            TextPrintDocument pd = new TextPrintDocument(streamToPrint,textArea.Font);

            if (storedPageSettings != null) {
                pd.DefaultPageSettings = storedPageSettings ;
            }

            PrintDialog dlg = new PrintDialog() ;
            dlg.Document = pd;
            DialogResult result = dlg.ShowDialog();

            if (result == DialogResult.OK) {
                pd.Print();
            }
        }

        private void PageSetupMenu_Click(object sender, EventArgs e) {
            try {
                PageSetupDialog psDlg = new PageSetupDialog() ;

                if (storedPageSettings == null) {
                    storedPageSettings =  new PageSettings();
                }

                psDlg.PageSettings = storedPageSettings ;
                psDlg.ShowDialog();

            } catch(Exception ex) {
                MessageBox.Show("An error occurred - " + ex.Message);
            }
        }

        private void PrintPreviewMenu_Click(object sender, EventArgs e) {

            try {
                StringReader streamToPrint = new StringReader (textArea.Text);

                //Assumes the default printer
                TextPrintDocument pd = new TextPrintDocument(streamToPrint,textArea.Font);

                if (storedPageSettings != null) {
                    pd.DefaultPageSettings = storedPageSettings ;
                }

                PrintPreviewDialog dlg = new PrintPreviewDialog() ;
                dlg.Document = pd;
                dlg.ShowDialog();
            } catch(Exception ex) {
                MessageBox.Show("An error occurred attempting to preview the file to print - " + ex.Message);
            }

        }


        private void ReadEditingFile() {
            textArea.TextChanged -= new System.EventHandler(this.TextArea_TextChanged);
            dirWatcher.EnableRaisingEvents = false;
            try {

                Stream s = new FileStream(editingFileName, FileMode.Open);
                FileInfo efInfo = new FileInfo(editingFileName);

                string fext = efInfo.Extension.ToUpper(CultureInfo.InvariantCulture);

                if (fext.Equals(".RTF"))
                    textArea.LoadFile(s, RichTextBoxStreamType.RichText);
                else
                    textArea.LoadFile(s, RichTextBoxStreamType.PlainText);

                s.Close();

                dirWatcher.Path = efInfo.DirectoryName;
                dirWatcher.Filter = efInfo.Name;

                dirty = false;
                UpdateFormText();
            }
            finally {
                textArea.TextChanged += new System.EventHandler(this.TextArea_TextChanged);
                dirWatcher.EnableRaisingEvents = true;
            }
        }

        private void UpdateFormText() {
            string file = noFilename;
            if (editingFileName != null && editingFileName.Length > 1) {
                file = editingFileName;
            }

            if (dirty) {
                this.Text = string.Format(dirtyCaptionFormat, file);
            }
            else {
                this.Text = string.Format(notDirtyCaptionFormat, file);
            }
        }

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new SimplePad());
        }

        internal class SimplePadOptions {
            private SimplePad owner;

            public SimplePadOptions(SimplePad owner) {
                this.owner = owner;
            }

            [
                Description("Color used for the background of the text"),
                Category("Text Display")
            ]
            public Color BackColor {
                get {
                    return owner.textArea.BackColor;
                }
                set {
                    owner.textArea.BackColor = value;
                }
            }

            [
                Description("Color used for the forecolor of the text"),
                Category("Text Display")
            ]
            public Color ForeColor {
                get {
                    return owner.textArea.ForeColor;
                }
                set {
                    owner.textArea.ForeColor = value;
                }
            }

            [
                Description("Adjusts the font used to display text in SimplePad+"),
                Category("Text Display")
            ]
            public Font DefaultFont {
                get {
                    return owner.textArea.Font;
                }
                set {
                    owner.textArea.Font = value;
                }
            }

            [
                Description("Determines if text will word wrap"),
                Category("Text Display"),
                DefaultValue(false)
            ]
            public bool WordWrap {
                get {
                    return owner.wordWrapMenu.Checked;
                }
                set {
                    owner.wordWrapMenu.Checked = owner.textArea.WordWrap = value;
                }
            }

            [
                Description("Modifies the opacity of SimplePad+. Windows 2000 only."),
                Category("Application"),
                TypeConverterAttribute(typeof(OpacityConverter)),
                DefaultValue(1.0)
            ]
            public double Opacity {
                get {
                    return owner.Opacity;
                }
                set {
                    owner.Opacity = value;
                }
            }
        }
    }
}
