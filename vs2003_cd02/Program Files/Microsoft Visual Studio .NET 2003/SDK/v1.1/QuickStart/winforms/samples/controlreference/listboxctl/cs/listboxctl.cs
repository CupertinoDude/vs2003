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



    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
    using System.Resources;

    // <doc>
    // <desc>
    //     This sample control demonstrates various properties and
    //     methods for the ListBox control.
    // </desc>
    // </doc>
    //
    public class ListBoxCtl : System.Windows.Forms.Form {
        private Color[] listBoxColors = new System.Drawing.Color[] {Color.Green, Color.Red, Color.Magenta, Color.Yellow};
        private SampleImagePanel imgPanel;

        // <doc>
        // <desc>
        //     Public Constructor
        // </desc>
        // </doc>
        //
        public ListBoxCtl() : base() {

            // This call is required for support of the Windows Forms Form Designer.
            InitializeComponent();

            ResourceManager resources = new ResourceManager(typeof(ListBoxCtl));


            //Add the simple custom control that displays the images selected in the
            //List Box
            imgPanel = new SampleImagePanel();
            imgPanel.Location = new System.Drawing.Point(64, 90);
            imgPanel.Size = new System.Drawing.Size(64, 168);
            imgPanel.TabIndex = 12;
            this.Controls.Add(imgPanel);

            // item Height selection only matters for OWNERDRAW modes.
            integralHeightCheckBox.Enabled = false;

            // Initialize the combo boxes
            borderStyleComboBox.SelectedIndex = 0;
            selectionModeComboBox.SelectedIndex = 2;
            drawModeComboBox.SelectedIndex = 0;
        }

        // <doc>
        // <desc>
        //     ListBoxCtl overrides dispose so it can clean up the
        //     component list.
        // </desc>
        // </doc>
        //
        protected override void Dispose(bool disposing) {
            if (disposing) {
                if (components != null) {
                    components.Dispose();
                }
            }
            base.Dispose(disposing);
        }

        private void sortedCheckBox_Click(object sender, EventArgs e) {
            /*
             * If the List Box is already populated, setting the
             * Sorted property will cause the list to be sorted.
             * Items subsequently added to the List Box will be
             * inserted in sorting position.
             * If the sorted property is not set (false), then
             * items added to the list will appear at the end of
             * the list.  The 'else' branch below demonstrates this,
             * and was purposely used instead of the more efficient
             * "setItems" method, as in the "InitializeComponent" method.
             */
            if (sortedCheckBox.CheckState == CheckState.Checked) {
                listBox1.Sorted = true;
            }
            else {
                listBox1.Items.Clear();
                listBox1.Items.Add("First Image");
                listBox1.Sorted = false;
                listBox1.Items.Add("Second Image");
                listBox1.Items.Add("Third Image");
                listBox1.Items.Add("Fourth Image");
            }
            ClearSelections();
            imgPanel.ClearImages();
        }

        private void borderStyleComboBox_SelectedIndexChanged(object sender, EventArgs e) {
            int index = borderStyleComboBox.SelectedIndex;
            if (index == 0) {
                listBox1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            }
            else if (index == 1) {
                listBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            }
            else {
                listBox1.BorderStyle = System.Windows.Forms.BorderStyle.None;
            }
        }

        private void integralHeightCheckBox_Click(object sender, EventArgs e) {
            if (integralHeightCheckBox.CheckState == CheckState.Checked) {
                listBox1.ItemHeight = 25;
            }
            else {
                listBox1.ItemHeight = 15;
            }
        }

        private void FGColorButton_Click(object sender, EventArgs e) {
            if (LBColorDialog.ShowDialog() == DialogResult.OK) {
                listBox1.ForeColor = LBColorDialog.Color;
            }
        }

        private void BGColorButton_Click(object sender, EventArgs e) {
            if (LBColorDialog.ShowDialog() == DialogResult.OK) {
                listBox1.BackColor = LBColorDialog.Color;
            }
        }

        private void multiColumnCheckBox_Click(object sender, EventArgs e) {
            int selection = drawModeComboBox.SelectedIndex;
            drawModeComboBox.Items.Clear();

            if (multiColumnCheckBox.CheckState == CheckState.Checked) {
                // Disable OWNERDRAWVARIABLE
                drawModeComboBox.Items.AddRange(new object[] {
                    "Normal",
                    "OwnerDrawFixed"});

                /*
                 * To show multiple columns, we size the ListBox so that 3 rows
                 * appear, and the last item in the list appears in the 2nd column
                 */
                listBox1.MultiColumn = true;
                listBox1.ColumnWidth = 70;
            }
            else {
                // enable OWNERDRAWVARIABLE
                drawModeComboBox.Items.AddRange(new object[] {
                    "Normal",
                    "OwnerDrawFixed",
                    "OwnerDrawVariable"});
                listBox1.MultiColumn = false;
                listBox1.ColumnWidth = 144;
            }

            drawModeComboBox.SelectedIndex = selection;
        }

        private void selectionModeComboBox_SelectedIndexChanged(object sender, EventArgs e) {
            int index = selectionModeComboBox.SelectedIndex;
            if (index == 0) {
                listBox1.SelectionMode = SelectionMode.None;
            }
            else if (index == 1) {
                listBox1.SelectionMode = SelectionMode.One;
            }
            else if (index == 2) {
                listBox1.SelectionMode = SelectionMode.MultiSimple;
            }
            else {
                listBox1.SelectionMode = SelectionMode.MultiExtended;
            }
            /*
             * After changing the selection mode, it's a good idea to
             * remove all selections.  Also invalidate the selection.
             */
            ClearSelections();
            imgPanel.ClearImages();
        }

        private void ClearSelections() {
            int index = selectionModeComboBox.SelectedIndex;
            if (index != 0) {
                /*
                 * Calling setSelected with selectionMode "None" throws
                 * an exception.
                 */
                for (int selectIndex = 0; selectIndex<listBox1.Items.Count; selectIndex++) {
                    listBox1.SetSelected(selectIndex, false);
                }
            }
            imgPanel.Invalidate();
        }

        private void listBox1_DrawItem(object sender, DrawItemEventArgs e) {
            /*
             * The method e.drawFocusRect();
             * should be called to fill in a handy focus rectangle if this item
             * is currently selected.  This call should be made AFTER all other
             * drawing, else it will get overwritten!
             * The following method should generally be called before drawing.
             * It is actually superfluous here, since the subsequent drawing
             * will completely cover the area of interest.
            */
            e.DrawBackground();
            DrawMode mode = listBox1.DrawMode;
            if (mode == DrawMode.Normal) {
                // NORMAL Draw: The control handles the drawing.
                return;
            }
            else if (mode == DrawMode.OwnerDrawFixed ||
                     mode == DrawMode.OwnerDrawVariable) {
                /*
                 * In either owner-draw mode, the system provides the context
                 * into which the owner custom-draws the required graphics.
                 * The context into which to draw is e.graphics.
                 * The index of the item to be painted is e.index.
                 * The painting should be done into the area described by e.rect.
                 */
                Brush brush = new SolidBrush(listBoxColors[e.Index]);
                e.Graphics.FillRectangle(brush, e.Bounds);
                e.Graphics.DrawRectangle(SystemPens.WindowText, e.Bounds);
                bool selected = ((e.State & DrawItemState.Selected) == DrawItemState.Selected) ? true : false;
                /*
                 * The ul-corner of the text's bounding box is placed on the
                 * point specified in the drawString call.
                 * The '+1's are to leave the background border as drawn above.
                 */
                string selText = selected ? "SEL." : "";
                e.Graphics.DrawString("Bmp #" + e.Index.ToString() + " " + selText, Font, new SolidBrush(Color.Black),
                                         e.Bounds.X + 1, e.Bounds.Y + 1);
                /*
                 * After all other drawing is complete, the next method will
                 * add a rectangle that indicates whether this item has the
                 * focus.
                 */
                e.DrawFocusRectangle();
            }
        }

        private void drawModeComboBox_SelectedIndexChanged(object sender, EventArgs e) {
            int index = drawModeComboBox.SelectedIndex;
            if (index == 0) {
                listBox1.DrawMode = DrawMode.Normal;
                integralHeightCheckBox.Enabled = false;
                multiColumnCheckBox.Enabled = true;
            }
            else if (index == 1) {
                listBox1.DrawMode = DrawMode.OwnerDrawFixed;
                integralHeightCheckBox.Enabled = true;
                multiColumnCheckBox.Enabled = true;
            }
            else {
                // if OWNERDRAWVARIABLE is selected, Multi-column is not allowed.
                multiColumnCheckBox.Enabled = false;
                multiColumnCheckBox.CheckState = CheckState.Unchecked;
                listBox1.MultiColumn = false;
                listBox1.DrawMode = DrawMode.OwnerDrawVariable;
                integralHeightCheckBox.Enabled = true;
            }
            listBox1.ItemHeight = (int)itemHeightUpDown.Value;
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e) {
            imgPanel.ClearImages();
			int[] selected = new int[listBox1.SelectedIndices.Count];
			listBox1.SelectedIndices.CopyTo(selected, 0);
            for (int i=0; i<selected.Length; i++) {
                int index = selected[i];
                object item = listBox1.Items[index];
                string str = item.ToString();
                Image img = GetImage(str);
                imgPanel.AddImage(img);
            }
            /*
             * To update (paint) the image area, call the invalidate method.
             * This causes the onPaint method for that control to be called.
             */
            imgPanel.Invalidate();
        }

        private Image GetImage(string bmpName) {
            if (bmpName.Equals("First Image")) {
                return imageList1.Images[0];
            }
            else if (bmpName.Equals("Second Image")) {
                return imageList1.Images[1];
            }
            else if (bmpName.Equals("Third Image")) {
                return imageList1.Images[2];
            }
            else if (bmpName.Equals("Fourth Image")) {
                return imageList1.Images[3];
            }
            else {
                return null;
            }
        }

        private void itemHeightUpDown_ValueChanged(Object sender, EventArgs e) {
            listBox1.ItemHeight = (int)itemHeightUpDown.Value;
        }

        private void listBox1_MeasureItem(object sender, MeasureItemEventArgs mie) {
            int nominalHeight = listBox1.ItemHeight;
            mie.ItemHeight = 2 * (mie.Index % 5) + nominalHeight;
        }

        // NOTE: The following code is required by the Windows Forms Form Designer
        // It can be modified using the Windows Forms Form Designer.
        // Do not modify it using the code editor.
        private System.ComponentModel.Container components;
        protected internal System.Windows.Forms.GroupBox groupBox1;
        protected internal System.Windows.Forms.ComboBox selectionModeComboBox;
        protected internal System.Windows.Forms.CheckBox sortedCheckBox;
        protected internal System.Windows.Forms.ListBox listBox1;
        protected internal System.Windows.Forms.CheckBox integralHeightCheckBox;
        protected internal System.Windows.Forms.ComboBox borderStyleComboBox;
        protected internal System.Windows.Forms.Label label1;
        protected internal System.Windows.Forms.ComboBox drawModeComboBox;
        protected internal System.Windows.Forms.Label label2;
        protected internal System.Windows.Forms.Label label3;
        protected internal System.Windows.Forms.CheckBox multiColumnCheckBox;
        protected internal System.Windows.Forms.Button FGColorButton;
        protected internal System.Windows.Forms.Button BGColorButton;
        protected internal System.Windows.Forms.ColorDialog LBColorDialog;
        protected internal System.Windows.Forms.NumericUpDown itemHeightUpDown;
        protected internal System.Windows.Forms.Label label4;
        protected internal System.Windows.Forms.ToolTip toolTip1;
        protected internal System.Windows.Forms.ImageList imageList1;

        private void InitializeComponent() {
            ResourceManager resources = new ResourceManager(typeof(ListBoxCtl));
            this.components = new System.ComponentModel.Container();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.toolTip1 = new System.Windows.Forms.ToolTip(components);
            this.integralHeightCheckBox = new System.Windows.Forms.CheckBox();
            this.borderStyleComboBox = new System.Windows.Forms.ComboBox();
            this.sortedCheckBox = new System.Windows.Forms.CheckBox();
            this.multiColumnCheckBox = new System.Windows.Forms.CheckBox();
            this.FGColorButton = new System.Windows.Forms.Button();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.drawModeComboBox = new System.Windows.Forms.ComboBox();
            this.selectionModeComboBox = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.imageList1 = new System.Windows.Forms.ImageList();
            this.itemHeightUpDown = new System.Windows.Forms.NumericUpDown();
            this.BGColorButton = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.LBColorDialog = new System.Windows.Forms.ColorDialog();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();

            groupBox1.TabIndex = 1;
            groupBox1.Size = new System.Drawing.Size(248, 272);
            groupBox1.TabStop = false;
            groupBox1.Location = new System.Drawing.Point(248, 16);
            groupBox1.Text = "ListBox";

            toolTip1.Active = true;

            integralHeightCheckBox.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            integralHeightCheckBox.Location = new System.Drawing.Point(16, 48);
            integralHeightCheckBox.TabIndex = 9;
            integralHeightCheckBox.Text = "IntegralHeight";
            integralHeightCheckBox.Size = new System.Drawing.Size(112, 16);
            toolTip1.SetToolTip(integralHeightCheckBox, "If clicked, owner-drawn items take up more room.");
            integralHeightCheckBox.Click += new System.EventHandler(integralHeightCheckBox_Click);

            borderStyleComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            borderStyleComboBox.ForeColor = (Color)System.Drawing.SystemColors.WindowText;
            borderStyleComboBox.Location = new System.Drawing.Point(128, 96);
            borderStyleComboBox.MaxDropDownItems = 3;
            borderStyleComboBox.ItemHeight = 13;
            borderStyleComboBox.Size = new System.Drawing.Size(104, 21);
            borderStyleComboBox.TabIndex = 1;
            borderStyleComboBox.Text = "";
            toolTip1.SetToolTip(borderStyleComboBox, "Selects the ListBox border style.");
            borderStyleComboBox.SelectedIndexChanged += new EventHandler(borderStyleComboBox_SelectedIndexChanged);
            borderStyleComboBox.Items.AddRange(new object[] {"Fixed 3d", "Fixed Single", "None"});

            sortedCheckBox.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            sortedCheckBox.Location = new System.Drawing.Point(16, 72);
            sortedCheckBox.TabIndex = 11;
            sortedCheckBox.Text = "Sorted";
            sortedCheckBox.Size = new System.Drawing.Size(120, 16);
            toolTip1.SetToolTip(sortedCheckBox, "If clicked, the List Box items appear in sorted order.");
            sortedCheckBox.Click += new System.EventHandler(sortedCheckBox_Click);

            multiColumnCheckBox.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            multiColumnCheckBox.Location = new System.Drawing.Point(16, 24);
            multiColumnCheckBox.TabIndex = 7;
            multiColumnCheckBox.Text = "MultiColumn";
            multiColumnCheckBox.Size = new System.Drawing.Size(104, 16);
            toolTip1.SetToolTip(multiColumnCheckBox, "Sets the multicolumn property to true.  Only matters if ListBox height is small.");
            multiColumnCheckBox.Click += new System.EventHandler(multiColumnCheckBox_Click);

            FGColorButton.Location = new System.Drawing.Point(16, 200);
            FGColorButton.TabIndex = 10;
            FGColorButton.Text = "&ForeColor";
            FGColorButton.Size = new System.Drawing.Size(75, 23);
            toolTip1.SetToolTip(FGColorButton, "Button to change the text foreground color.");
            FGColorButton.Click += new System.EventHandler(FGColorButton_Click);

            this.TabIndex = 0;
            this.Size = new System.Drawing.Size(512, 320);
            this.Text = "ListBox";

            listBox1.ForeColor = (Color)System.Drawing.SystemColors.WindowText;
            listBox1.Location = new System.Drawing.Point(8, 24);
            listBox1.IntegralHeight = false;
            listBox1.TabIndex = 0;
            listBox1.UseTabStops = true;
			listBox1.Size = new System.Drawing.Size(232, 60);
            listBox1.ColumnWidth = 144;
            toolTip1.SetToolTip(listBox1, "The control being demonstrated.  In response to selections, Images will be displayed elsewhere on the form.");
            listBox1.MeasureItem += new MeasureItemEventHandler(listBox1_MeasureItem);
            listBox1.DrawItem += new DrawItemEventHandler(listBox1_DrawItem);
            listBox1.SelectedIndexChanged += new EventHandler(listBox1_SelectedIndexChanged);
            listBox1.Items.AddRange(new object[] {"First Image", "Second Image", "Third Image", "Fourth Image"});

            drawModeComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            drawModeComboBox.ForeColor = (Color)System.Drawing.SystemColors.WindowText;
            drawModeComboBox.Location = new System.Drawing.Point(128, 144);
            drawModeComboBox.Size = new System.Drawing.Size(104, 21);
            drawModeComboBox.TabIndex = 5;
            drawModeComboBox.Text = "";
            toolTip1.SetToolTip(drawModeComboBox, "Selects the mode in which ListBox items are drawn.");
            drawModeComboBox.SelectedIndexChanged += new EventHandler(drawModeComboBox_SelectedIndexChanged);
            drawModeComboBox.Items.AddRange((object[])new object[] {"Normal", "OwnerDrawFixed", "OwnerDrawVariable"});

            selectionModeComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            selectionModeComboBox.ForeColor = (Color)System.Drawing.SystemColors.WindowText;
            selectionModeComboBox.Location = new System.Drawing.Point(128, 120);
            selectionModeComboBox.Size = new System.Drawing.Size(104, 21);
            selectionModeComboBox.TabIndex = 3;
            selectionModeComboBox.Text = "";
            toolTip1.SetToolTip(selectionModeComboBox, "Selects the mode by which ListBox items are selected.");
            selectionModeComboBox.SelectedIndexChanged += new EventHandler(selectionModeComboBox_SelectedIndexChanged);
            selectionModeComboBox.Items.AddRange((object[])new object[] {"None", "One", "Multi Simple", "Multi Extended"});

            label4.Location = new System.Drawing.Point(16, 168);
            label4.TabIndex = 8;
            label4.TabStop = false;
            label4.Text = "ItemHeight:";
            label4.Size = new System.Drawing.Size(72, 16);

            imageList1.ImageSize = new System.Drawing.Size(24, 22);
            imageList1.ColorDepth = System.Windows.Forms.ColorDepth.Depth8Bit;
            imageList1.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imageList1.ImageStream")));
            imageList1.TransparentColor = System.Drawing.Color.Transparent;

            itemHeightUpDown.Location = new System.Drawing.Point(128, 168);

            itemHeightUpDown.Maximum = new System.Decimal(45d);
            itemHeightUpDown.Minimum = new System.Decimal(15d);

            itemHeightUpDown.TabIndex = 6;
            itemHeightUpDown.Text = "30";
            itemHeightUpDown.Size = new System.Drawing.Size(104, 20);
            toolTip1.SetToolTip(itemHeightUpDown, "Changes the target size of the ListBox.  The ListBox may change the size it is actually drawn.");
            itemHeightUpDown.ValueChanged += new EventHandler(itemHeightUpDown_ValueChanged);

            BGColorButton.Location = new System.Drawing.Point(96, 200);
            BGColorButton.TabIndex = 12;
            BGColorButton.Text = "&BackColor";
            BGColorButton.Size = new System.Drawing.Size(75, 23);
            toolTip1.SetToolTip(BGColorButton, "Button to set the text background color.");
            BGColorButton.Click += new EventHandler(BGColorButton_Click);

            label3.Location = new System.Drawing.Point(16, 144);
            label3.TabIndex = 4;
            label3.TabStop = false;
            label3.Text = "DrawMode:";
            label3.Size = new System.Drawing.Size(80, 16);

            label1.Location = new System.Drawing.Point(16, 96);
            label1.TabIndex = 0;
            label1.TabStop = false;
            label1.Text = "BorderStyle:";
            label1.Size = new System.Drawing.Size(80, 16);

            label2.Location = new System.Drawing.Point(16, 120);
            label2.TabIndex = 2;
            label2.TabStop = false;
            label2.Text = "SelectionMode:";
            label2.Size = new System.Drawing.Size(80, 16);

            groupBox1.Controls.Add(label4);
            groupBox1.Controls.Add(itemHeightUpDown);
            groupBox1.Controls.Add(multiColumnCheckBox);
            groupBox1.Controls.Add(BGColorButton);
            groupBox1.Controls.Add(FGColorButton);
            groupBox1.Controls.Add(label3);
            groupBox1.Controls.Add(label2);
            groupBox1.Controls.Add(drawModeComboBox);
            groupBox1.Controls.Add(selectionModeComboBox);
            groupBox1.Controls.Add(label1);
            groupBox1.Controls.Add(borderStyleComboBox);
            groupBox1.Controls.Add(integralHeightCheckBox);
            groupBox1.Controls.Add(sortedCheckBox);
            this.Controls.Add(listBox1);
            this.Controls.Add(groupBox1);

        }

        // The main entry point for the application.
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new ListBoxCtl());
        }
    }






