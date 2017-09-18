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


namespace Microsoft.Samples.WinForms.Cs.GDIPlus.GDIPPens {
    using System;
    using System.Windows.Forms;
    using System.IO;
    using System.Drawing;
    using System.Drawing.Drawing2D;
    using System.Reflection;

    public class PensSample : Form {
        /// <summary>
        ///    Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components;

        private Brush backgroundBrush;
        private Brush penTextureBrush;

        public PensSample() {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            this.SetStyle(System.Windows.Forms.ControlStyles.Opaque, true);

            //Load the image to be used for the background from the exe's resource fork
            Image backgroundImage = new Bitmap(Assembly.GetExecutingAssembly().GetManifestResourceStream("colorbars.jpg"));

            //Now create the brush we are going to use to paint the background
            backgroundBrush = new TextureBrush(backgroundImage);

            //Load the image to be used for the textured pen from the exe's resource fork
            Image penImage = new Bitmap(Assembly.GetExecutingAssembly().GetManifestResourceStream("BoilingPoint.jpg"));
            penTextureBrush = new TextureBrush(penImage);
        }


        protected override void OnPaint(PaintEventArgs e) {
            Graphics g = e.Graphics;

            e.Graphics.SmoothingMode = SmoothingMode.AntiAlias;

            //Fill the background use the texture brush 
            //and then apply a white wash 
            g.FillRectangle(backgroundBrush, ClientRectangle);
            g.FillRectangle(new SolidBrush(Color.FromArgb(180, Color.White)), ClientRectangle);

            //Create a pen 20 pixels wide that is and purple and partially transparent 
            Pen penExample1 = new Pen(Color.FromArgb(150, Color.Purple), 20);
            //Make it a dashed pen
            penExample1.DashStyle = DashStyle.Dash;
            //Make the ends round
            penExample1.StartCap = LineCap.Round;
            penExample1.EndCap = LineCap.Round;

            //Now draw a curve using the pen 
            g.DrawCurve(penExample1, new Point[] {
                                                 new Point(200, 140),
                                                 new Point(700, 240),
                                                 new Point(500, 340),
                                                 new Point(140, 140),
                                                 new Point(40, 340),
                                                 });


            //Now draw a line using a bitmap as the fill 
            Pen penExample2 = new Pen(penTextureBrush, 25);
            penExample2.DashStyle = DashStyle.DashDotDot;
            penExample2.StartCap = LineCap.Triangle;
            penExample2.EndCap = LineCap.Round;
            g.DrawLine(penExample2, 10,450,550,400);

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
            this.components = new System.ComponentModel.Container ();
            this.Size = new System.Drawing.Size(750, 500);
            this.Text = "GDI+ Brush Samples";
        }

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        public static void Main() {
            Application.Run(new PensSample());
        }
    }
}
