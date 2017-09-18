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
    using System.Collections;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;

    // <doc>
    // <desc>
    //     This sample demonstrates the way that Windows does scrolling. The
    //     "value" of the scrollbar must be between minimum and
    //     (maximum - largeChange + 1).
    //     Windows does this because the size of the scrollbar's thumb is equal to
    //     the "largeChange" or "page" value. The value property of the
    //     scrollbar is the  position of the top of the thumb. Therefore, when the
    //     value points to the top of  the last page, the thumb is at the end of the
    //     scrollbar and we can scroll no further, even though the value is less than
    //     the maximum.
    // </desc>
    // </doc>
    //
    public class ScrollBarCtl : System.Windows.Forms.Form {
        // Variables for adjusting the position of the pictureBox when scrolling
        private bool  dragging = false;
        private int   oldX, oldY;
        private float vScrollMultiplier;
        private float vAbsPos;
        private float hScrollMultiplier;
        private float hAbsPos;

        public ScrollBarCtl() : base() {
            //
            // Required for Windows Forms Designer support.
            //
            InitializeComponent();

            comboBox1.SelectedIndex = 0;
            comboBox2.SelectedIndex = 0;

            VScrollBar1.LargeChange = Convert.ToInt16(comboBox1.SelectedItem.ToString());
            HScrollBar1.LargeChange = Convert.ToInt16(comboBox1.SelectedItem.ToString());
            VScrollBar1.SmallChange = Convert.ToInt16(comboBox2.SelectedItem.ToString());
            HScrollBar1.SmallChange = Convert.ToInt16(comboBox2.SelectedItem.ToString());

            SetVerticalScrollMultiplier();
            SetHorizontalScrollMultiplier();

            label11.Text = HScrollBar1.Value.ToString();
            label12.Text = VScrollBar1.Value.ToString();

            /*
             * Change the cursor give the user feedback for dragging the
             * picture around the picturebox
             */
            pictureBox1.Cursor = Cursors.SizeAll;

        }

        // <summary>
        //     ScrollBarCtl overrides dispose so it can clean up the
        //     component list.
        // </summary>
        protected override void Dispose(bool disposing)
        {
           if (disposing) {
                if (components != null) {
                    components.Dispose();
                }
           }
           base.Dispose(disposing);
        }

        /*
         * The vScrollMultiplier takes into account the height of the pictureBox
         * when scrolling.
         * It is essentially "pixels per tick", where a tick is the smallest
         * increment of the scrollbar.
         */
        private void SetVerticalScrollMultiplier() {
            float hsb = (float)(VScrollBar1.Height - pictureBox1.Height);
            float ticks = (float)(VScrollBar1.Maximum - VScrollBar1.Minimum);

            vScrollMultiplier = hsb / ticks;
        }

        /*
         * The hScrollMultiplier takes into account the width of the
         * pictureBox when scrolling.
         * It is essentially "pixels per tick", where a tick is the smallest
         * increment of the scrollbar.
         */
        private void SetHorizontalScrollMultiplier() {
            float hsb = (float)(HScrollBar1.Width - pictureBox1.Width) ;
            float ticks = (float)(HScrollBar1.Maximum - HScrollBar1.Minimum) ;

            hScrollMultiplier = hsb / ticks ;
        }

        /*
         * Vertical scrollbar handler - scrollbar action handled by Windows Forms Scrollbar.
         * Here we update the label displaying our value and the
         * set the  pictureBox y coordinate.
         */
        private void VScrollBar1_Scroll(object sender, ScrollEventArgs e) {
            label12.Text = VScrollBar1.Value.ToString();
            vAbsPos = (float)(VScrollBar1.Value - VScrollBar1.Minimum);
            pictureBox1.Top = VScrollBar1.Bottom
                        - (int)(vScrollMultiplier * vAbsPos)
                        - pictureBox1.Height;
        }

        /*
         * Horizontal scrollbar handler - scrollbar action handled by Windows Forms
         * Scrollbar. Here we update the label displaying our value and the set
         * the pictureBox y coordinate.
         */
        private void HScrollBar1_Scroll(object sender, ScrollEventArgs e) {
            label11.Text = HScrollBar1.Value.ToString() ;
            hAbsPos = (float)(HScrollBar1.Value - HScrollBar1.Minimum);
            pictureBox1.Left = HScrollBar1.Right
                       - (int)(hScrollMultiplier * hAbsPos)
                       - pictureBox1.Width;
        }

        /*
         * Changing the "LargeChange" (the number of ticks per page) property of
         * the ScrollBarCtl.
         */
        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e) {
            VScrollBar1.LargeChange = Convert.ToInt16(comboBox1.SelectedItem.ToString());
            HScrollBar1.LargeChange = Convert.ToInt16(comboBox1.SelectedItem.ToString());
            label11.Text = HScrollBar1.Value.ToString() ;
            label12.Text = VScrollBar1.Value.ToString() ;
        }

        /*
         * Changing the "SmallChange" (the number of ticks per line) property of
         * the ScrollBarCtl.
         */
        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e) {
            VScrollBar1.SmallChange = Convert.ToInt16(comboBox2.SelectedItem.ToString());
            HScrollBar1.SmallChange = Convert.ToInt16(comboBox2.SelectedItem.ToString());
            label11.Text = HScrollBar1.Value.ToString() ;
            label12.Text = VScrollBar1.Value.ToString() ;
        }


        // Mouse event handler to initiate dragging the pictureBox around
        private void pictureBox1_MouseDown(object sender, MouseEventArgs e) {
            dragging = true;

            /*
            * (e.x, e.y) represent the coordinates of the cursor relative to the
            * pictureBox's location. We need to save these on mouseDown in order
            * to calculate the distance dragged.
            */
            oldX = e.X;
            oldY = e.Y;
        }

        // Mouse event handler to effect dragging the pictureBox around.
        private void pictureBox1_MouseMove(object sender, MouseEventArgs e) {
            if (dragging) {
                int minY = VScrollBar1.Minimum;
                int maxY = VScrollBar1.Maximum;
                int minX = HScrollBar1.Minimum;
                int maxX = HScrollBar1.Maximum;

                /*
                * The new y position of the scrollbar is
                * (old_y_Position - y_distance_that_the_cursor_has_moved).
                * We want to simulate "real" scrolling so we move the
                * ScrollBarCtl in the opposite direction of the pictureBox.
                * We need the multiplier to convert pixels to scrollbar ticks.
                */
                int value = (int)(VScrollBar1.Value
                            - (e.Y - oldY)/vScrollMultiplier);
                if (value < minY) {
                    VScrollBar1.Value = minY;
                }
                else if (value > maxY - VScrollBar1.LargeChange + 1) {
                    VScrollBar1.Value = maxY - VScrollBar1.LargeChange + 1;
                }
                else {
                    VScrollBar1.Value = value;
                }

                // Similarly for the x position...
                value = (int)(HScrollBar1.Value
                        - (e.X - oldX)/hScrollMultiplier);
                if (value < minX) {
                    HScrollBar1.Value = minX;
                }
                else if (value > maxX - HScrollBar1.LargeChange + 1) {
                    HScrollBar1.Value = maxX - HScrollBar1.LargeChange + 1;
                }
                else {
                    HScrollBar1.Value = value;
                }

                label11.Text = HScrollBar1.Value.ToString() ;
                label12.Text = VScrollBar1.Value.ToString() ;

                /*
                    * The pictureBox moves with the mouse. Thus the new y coordinate is
                    * (old_y_Position + y_distance_that_the_cursor_has_moved), and similarly
                    * for the x coordinate.
                    */
                value = pictureBox1.Top + (e.Y - oldY);
                if (value < VScrollBar1.Top) {
                    value = VScrollBar1.Top;
                }
                else if (value > VScrollBar1.Bottom - pictureBox1.Height) {
                    value = VScrollBar1.Bottom - pictureBox1.Height;
                }
                pictureBox1.Top = value;

                value = pictureBox1.Left + (e.X - oldX);
                if (value < HScrollBar1.Left) {
                    value = HScrollBar1.Left;
                }
                else if (value > HScrollBar1.Right - pictureBox1.Width) {
                    value = HScrollBar1.Right - pictureBox1.Width;
                }
                pictureBox1.Left = value;
            }
        }

        /*
         * Mouse event handler to signal the end of the pictureBox dragging
         * sequence.
         */
        private void pictureBox1_MouseUp(object sender, MouseEventArgs e) {
            dragging = false;
        }


        // NOTE: The following code is required by the Windows Forms Designer
        // It can be modified using the Windows Forms Designer.
        // Do not modify it using the code editor.
        private System.ComponentModel.Container components;
        protected internal System.Windows.Forms.VScrollBar VScrollBar1;
        protected internal System.Windows.Forms.HScrollBar HScrollBar1;
        protected internal System.Windows.Forms.GroupBox groupBox1;
        protected internal System.Windows.Forms.Label label1;
        protected internal System.Windows.Forms.Label label2;
        protected internal System.Windows.Forms.ComboBox comboBox2;
        protected internal System.Windows.Forms.PictureBox pictureBox1;
        protected internal System.Windows.Forms.Label label3;
        protected internal System.Windows.Forms.Label label4;
        protected internal System.Windows.Forms.Label label5;
        protected internal System.Windows.Forms.Label label7;
        protected internal System.Windows.Forms.Label label6;
        protected internal System.Windows.Forms.Label label12;
        protected internal System.Windows.Forms.Label label11;
        protected internal System.Windows.Forms.Label label8;
        protected internal System.Windows.Forms.Label label9;
        protected internal System.Windows.Forms.Label label10;
        protected internal System.Windows.Forms.ComboBox comboBox1;

        private void InitializeComponent() {
            System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(ScrollBarCtl));

            this.components = new System.ComponentModel.Container();
            this.label11 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.VScrollBar1 = new System.Windows.Forms.VScrollBar();
            this.label12 = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.HScrollBar1 = new System.Windows.Forms.HScrollBar();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.comboBox2 = new System.Windows.Forms.ComboBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();

            label11.Location = new System.Drawing.Point(408, 160);
            label11.Text = "Label11";
            label11.Size = new System.Drawing.Size(72, 16);
            label11.TabIndex = 4;

            label10.Location = new System.Drawing.Point(216, 168);
            label10.Text = "100";
            label10.Size = new System.Drawing.Size(24, 16);
            label10.TabIndex = 13;

            VScrollBar1.Location = new System.Drawing.Point(200, 24);
            VScrollBar1.TabIndex = 2;
            VScrollBar1.Size = new System.Drawing.Size(16, 152);
            VScrollBar1.Scroll += new ScrollEventHandler(VScrollBar1_Scroll);
            VScrollBar1.Minimum = -100;
            VScrollBar1.Maximum = 100;

            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.Text = "VScrollBar";
            this.ClientSize = new System.Drawing.Size(520, 277);

            label12.Location = new System.Drawing.Point(408, 184);
            label12.Text = "label12";
            label12.Size = new System.Drawing.Size(72, 16);
            label12.TabIndex = 7;

            comboBox1.Text = "";
            comboBox1.Location = new System.Drawing.Point(136, 24);
            comboBox1.Size = new System.Drawing.Size(96, 21);
            comboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            comboBox1.TabIndex = 0;
            comboBox1.SelectedIndexChanged += new EventHandler(comboBox1_SelectedIndexChanged);
            comboBox1.Items.AddRange(new object[] {"20",
                "10",
                "5"});

            HScrollBar1.Location = new System.Drawing.Point(16, 176);
            HScrollBar1.TabIndex = 3;
            HScrollBar1.Size = new System.Drawing.Size(184, 16);
            HScrollBar1.Scroll += new ScrollEventHandler(HScrollBar1_Scroll);
            HScrollBar1.Minimum = -100;
            HScrollBar1.Maximum = 100;

            groupBox1.Location = new System.Drawing.Point(264, 16);
            groupBox1.TabIndex = 5;
            groupBox1.TabStop = false;
            groupBox1.Text = "HScrollBar and VScrollBar";
            groupBox1.Size = new System.Drawing.Size(248, 264);

            comboBox2.Text = "";
            comboBox2.Location = new System.Drawing.Point(136, 48);
            comboBox2.Size = new System.Drawing.Size(96, 21);
            comboBox2.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            comboBox2.TabIndex = 1;
            comboBox2.SelectedIndexChanged += new EventHandler(comboBox2_SelectedIndexChanged);
            comboBox2.Items.AddRange(new object[] {"5",
                "2",
                "1"});

            pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            pictureBox1.Location = new System.Drawing.Point(64, 32);
            pictureBox1.Size = new System.Drawing.Size(96, 96);
            pictureBox1.TabIndex = 6;
            pictureBox1.TabStop = false;
            pictureBox1.Image = (Image)resources.GetObject("pictureBox1.Image");
            pictureBox1.Text = "pictureBox1";
            pictureBox1.MouseDown += new MouseEventHandler(pictureBox1_MouseDown);
            pictureBox1.MouseUp += new MouseEventHandler(pictureBox1_MouseUp);
            pictureBox1.MouseMove += new MouseEventHandler(pictureBox1_MouseMove);

            label4.Location = new System.Drawing.Point(184, 192);
            label4.Text = "100";
            label4.Size = new System.Drawing.Size(24, 16);
            label4.TabIndex = 9;

            label5.Location = new System.Drawing.Point(112, 200);
            label5.Text = "0";
            label5.Size = new System.Drawing.Size(32, 16);
            label5.TabIndex = 10;

            label8.Location = new System.Drawing.Point(224, 24);
            label8.Text = "-100";
            label8.Size = new System.Drawing.Size(32, 16);
            label8.TabIndex = 11;

            label9.Location = new System.Drawing.Point(224, 96);
            label9.Text = "0";
            label9.Size = new System.Drawing.Size(16, 16);
            label9.TabIndex = 12;

            label6.Location = new System.Drawing.Point(16, 144);
            label6.Text = "HScrollBar.value";
            label6.Size = new System.Drawing.Size(92, 16);
            label6.TabIndex = 3;

            label2.Location = new System.Drawing.Point(280, 64);
            label2.Text = "SmallChange";
            label2.Size = new System.Drawing.Size(92, 16);
            label2.TabIndex = 1;

            label3.Location = new System.Drawing.Point(8, 200);
            label3.Text = "-100";
            label3.Size = new System.Drawing.Size(32, 16);
            label3.TabIndex = 8;

            label7.Location = new System.Drawing.Point(16, 168);
            label7.Text = "VScrollBar.value";
            label7.Size = new System.Drawing.Size(92, 16);
            label7.TabIndex = 2;

            label1.Location = new System.Drawing.Point(280, 40);
            label1.Text = "LargeChange";
            label1.Size = new System.Drawing.Size(92, 72);
            label1.TabIndex = 0;

            this.Controls.Add(label12);
            this.Controls.Add(label11);
            this.Controls.Add(label10);
            this.Controls.Add(label9);
            this.Controls.Add(label8);
            this.Controls.Add(label5);
            this.Controls.Add(label4);
            this.Controls.Add(label3);
            this.Controls.Add(label2);
            this.Controls.Add(label1);
            this.Controls.Add(groupBox1);
            this.Controls.Add(HScrollBar1);
            this.Controls.Add(VScrollBar1);
            this.Controls.Add(pictureBox1);
            groupBox1.Controls.Add(label7);
            groupBox1.Controls.Add(label6);
            groupBox1.Controls.Add(comboBox2);
            groupBox1.Controls.Add(comboBox1);
        }

        // The main entry point for the application.
        [STAThread]
        public static void Main(string[] args) {
            Application.Run(new ScrollBarCtl());
        }
    }
