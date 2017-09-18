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


namespace Microsoft.Samples.WinForms.Cs.GDIPlus.GDIPImages {
    using System;
    using System.Windows.Forms;
    using System.IO;
    using System.Net;
    using System.Drawing;
    using System.Drawing.Drawing2D;
    using System.Drawing.Imaging;
    using System.Drawing.Text;
    using System.Reflection;

    public class ImagesSample : System.Windows.Forms.Form {
        /// <summary>
        ///    Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components;
        protected internal System.Windows.Forms.Button button1;

        private System.Drawing.Brush backgroundBrush;
        private System.Drawing.Image sample1;
        private System.Drawing.Image webLogo;
        private System.Drawing.Image createdImage;

        private FontFamily serifFontFamily;

        public ImagesSample() {

            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            serifFontFamily = new FontFamily (GenericFontFamilies.Serif);

            this.SetStyle(System.Windows.Forms.ControlStyles.Opaque, true);

            Image backgroundImage;

            //Load the image to be used for the background from the exe's resource fork
            backgroundImage = new Bitmap(System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream("colorbars.jpg"));

            //Now create the brush we are going to use to paint the background
            backgroundBrush = new TextureBrush(backgroundImage);

            //Now load the other images we are going to use
            sample1 = new Bitmap("sample.jpg");

            //Load an image from the web and display that - if it fails load one from a local resource
            try {
                WebRequest request = WebRequest.Create("http://www.microsoft.com/net/images/bnrWindowsNgws1.gif");
                request.Credentials = CredentialCache.DefaultCredentials;

                Stream source = request.GetResponse().GetResponseStream();
                MemoryStream ms = new MemoryStream();

                byte[] data = new byte[256];
                int c = source.Read(data, 0, data.Length);

                while (c > 0) {
                    ms.Write(data, 0, c);
                    c = source.Read(data, 0, data.Length);
                }

                source.Close();
                ms.Position = 0;
                webLogo = new Bitmap(ms);

            } catch(Exception) {
                // MessageBox.Show("Failed to load Image from the Web- using default image\n\n " + ex.Message + " \n\n" + ex.StackTrace, "Error");
                webLogo = sample1;
            }

            //Wire up event handler for button that renders bitmap
            button1.Click += new System.EventHandler(DrawImage);

        }


        //Fired when the button is pressed
        private void DrawImage(object sender, EventArgs e) {

            Bitmap newBitmap = null;
            Graphics g = null ;

            try {
                newBitmap = new Bitmap(800,600,PixelFormat.Format32bppArgb);
                g = Graphics.FromImage(newBitmap);
                g.FillRectangle(new SolidBrush(Color.White), new Rectangle(0,0,800,600));

                Font textFont = new Font(serifFontFamily, 12);
                RectangleF rectangle = new RectangleF(100, 100, 250, 350);
                string flowedText="I went down to the St James Infirmary,\nSaw my baby there,\nStretched out on a long white table,\nSo sweet,so cold,so fair,\nLet her go,let her go,God bless her,\nWherever she may be,\nShe can look this wide world over,\nBut she'll never find a sweet man like me,\nWhen I die want you to dress me in straight lace shoes,\nI wanna a boxback coat and a Stetson hat,\nPut a twenty dollar gold piece on my watch chain,\nSo the boys'll know that I died standing up.";

                g.FillRectangle(new SolidBrush(Color.Gainsboro), rectangle);
                g.DrawString(flowedText, textFont, new SolidBrush(Color.Blue), rectangle);
                Pen penExample = new Pen(Color.FromArgb(150, Color.Purple), 20);
                penExample.DashStyle = DashStyle.Dash;
                penExample.StartCap = LineCap.Round;
                penExample.EndCap = LineCap.Round;
                g.DrawCurve(penExample, new Point[] {
                            new Point(200, 140),
                            new Point(700, 240),
                            new Point(500, 340),
                            new Point(140, 140),
                            new Point(40, 340),
                            });

                newBitmap.Save("TestImage.png", ImageFormat.Png) ;

                MessageBox.Show("Done - image written to TestImage.png");

                //Add image to paint and repaint
                createdImage = newBitmap;
                this.Invalidate();

            } finally {

                //Note well: Must dispose of graphics object
                //before disposing of the bitmap

                //Dispose of the graphics object we created
                //as its no longer needed
                if (null != g) {
                    g.Dispose();
                }

                //Typically we'd dispose of the bitmap here
                //but as we're going to display it on the
                //form don't dispose of it
                // if (null != newBitmap) {
                //     newBitmap.Dispose();
                // }
            }

        }


        protected override void OnPaint(PaintEventArgs e) {
            Graphics g = e.Graphics;

            e.Graphics.SmoothingMode = SmoothingMode.AntiAlias;

            //Fill the background use the texture brush
            //and then apply a white wash
            g.FillRectangle(backgroundBrush, ClientRectangle);
            g.FillRectangle(new SolidBrush(Color.FromArgb(180, Color.White)), ClientRectangle);

            //Simply render an image
            g.DrawImage(sample1, 29, 20, 283, 212);

            //Now rotate and image and display it
            g.RotateTransform(-30);
            g.DrawImage(webLogo, 175, 420);
            g.ResetTransform();

            //Finally draw the image we created if there is one
            if (createdImage != null) {
                g.DrawImage(createdImage, 50, 200, 200, 200);
            }
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
        void InitializeComponent () {
            this.components = new System.ComponentModel.Container ();
            this.button1 = new System.Windows.Forms.Button ();
            this.Size = new System.Drawing.Size(750, 500);
            this.Text = "GDI+ Brush Samples";
            button1.TabIndex = 0;
            button1.Text = "Draw a bitmap to a file";
            button1.Size = new System.Drawing.Size(100,50);
            button1.Location = new System.Drawing.Point(600,20);
            this.Controls.Add(button1);
        }

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        public static void Main() {
            Application.Run(new ImagesSample());
        }
    }
}
