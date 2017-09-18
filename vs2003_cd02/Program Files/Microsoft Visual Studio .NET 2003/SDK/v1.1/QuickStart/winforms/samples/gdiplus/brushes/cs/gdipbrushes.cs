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


namespace Microsoft.Samples.WinForms.Cs.GDIPlus.GDIPBrushes {
    using System;
    using System.Drawing;
    using System.Drawing.Drawing2D;
    using System.IO;
    using System.Reflection;
    using System.Windows.Forms;

    public class BrushesSample : System.Windows.Forms.Form {
        /// <summary>
        ///    Required designer variable.
        /// </summary>+
        private System.ComponentModel.Container components;

        private System.Drawing.Brush backgroundBrush;

        public BrushesSample() {

            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            this.SetStyle(System.Windows.Forms.ControlStyles.Opaque, true);

            //Load the image to be used for the background from the exe's resource fork
            Image backgroundImage = new Bitmap(Assembly.GetExecutingAssembly().GetManifestResourceStream("colorbars.jpg"));

            //Now create the brush we are going to use to paint the background
            backgroundBrush = new TextureBrush(backgroundImage);
        }

        protected override void OnPaint(PaintEventArgs e) {
            Graphics g = e.Graphics;

            g.SmoothingMode = SmoothingMode.AntiAlias;

            //Fill the background use the texture brush
            //and then apply a white wash
            g.FillRectangle(backgroundBrush, ClientRectangle);
            g.FillRectangle(new SolidBrush(Color.FromArgb(180, Color.White)), ClientRectangle);

            //Add a Red rectangle and a yellow one that overlaps it
            g.FillRectangle(new SolidBrush(Color.Red), 20, 20, 50, 50);
            g.FillRectangle(new SolidBrush(Color.FromArgb(180, Color.Yellow)), 40, 40, 50, 50);

            //Add a circle that is filled with a translucent hatch
            HatchBrush hb = new HatchBrush(HatchStyle.ForwardDiagonal, Color.Green, Color.FromArgb(100, Color.Yellow));
            g.FillEllipse(hb, 250, 10, 100, 100);

            //Now create a rectangle filled with a gradient brush
            Rectangle r = new Rectangle(300, 250, 100, 100);
            LinearGradientBrush lb = new LinearGradientBrush(r, Color.Red, Color.Yellow,LinearGradientMode.BackwardDiagonal);
            g.FillRectangle(lb, r);

            //Now add a shape drawn with a path gradient brush
            GraphicsPath path = new GraphicsPath(new Point[] {
                                                                new Point(40, 140),
                                                                new Point(275, 200),
                                                                new Point(105, 225),
                                                                new Point(190, 300),
                                                                new Point(50, 350),
                                                                new Point(20, 180),
                                                            },
                                                new byte[] {
                                                                (byte)PathPointType.Start,
                                                                (byte)PathPointType.Bezier,
                                                                (byte)PathPointType.Bezier,
                                                                (byte)PathPointType.Bezier,
                                                                (byte)PathPointType.Line,
                                                                (byte)PathPointType.Line,
                                                            }
            );

            PathGradientBrush pgb = new PathGradientBrush(path);
            pgb.SurroundColors = new Color[] {
                                                Color.Green,
                                                Color.Yellow,
                                                Color.Red,
                                                Color.Blue,
                                                Color.Orange,
                                                Color.White,
            };

            g.FillPath(pgb, path);

            //Now add a simple rectangle that has been rotated
            g.RotateTransform(-30);
            g.FillRectangle(new SolidBrush(Color.SlateBlue), 100, 250, 75, 100);
            g.ResetTransform();
        }

        /// <summary>
        ///    Clean up any resources being used.
        /// </summary>
        protected override void Dispose(bool disposing) {
            base.Dispose(disposing);
            components.Dispose();
        }

        /// <summary>
        ///    Required method for Designer support - do not modify
        ///    the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent () {
            this.components = new System.ComponentModel.Container ();
            this.Text = "GDI+ Brush Samples";
            this.Size = new System.Drawing.Size(450, 400);
        }

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        public static void Main() {
            Application.Run(new BrushesSample());
        }
    }
}
