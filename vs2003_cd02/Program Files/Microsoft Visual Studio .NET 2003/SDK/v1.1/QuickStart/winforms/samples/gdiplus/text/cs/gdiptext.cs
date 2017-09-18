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


namespace Microsoft.Samples.WinForms.Cs.GDIPlus.GDIPText {
    using System;
    using System.Windows.Forms;
    using System.IO;
    using System.Drawing;
    using System.Drawing.Drawing2D;
    using System.Drawing.Text;
    using System.Reflection;

    public class TextSample : Form {
        /// <summary>
        ///    Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components;

        private Brush backgroundBrush;
        private Brush textTextureBrush;
        private Font titleFont;
        private Font textFont;
        private Brush titleShadowBrush;
        private string flowedText1="I went down to the St James Infirmary,\nSaw my baby there,\nStretched out on a long white table,\nSo sweet,so cold,so fair,\nLet her go,let her go,God bless her,\nWherever she may be,\nShe can look this wide world over,\nBut she'll never find a sweet man like me,\nWhen I die want you to dress me in straight lace shoes,\nI wanna a boxback coat and a Stetson hat,\nPut a twenty dollar gold piece on my watch chain,\nSo the boys'll know that I died standing up.";
        private string flowedText2="the sky seems full when you're in the cradle\nthe rain will fall and wash your dreams\nstars are stars and they shine so hard...\nnow spit out the sky because its empty\nand hollow and all your dreams are hanging out to dry\nstars are stars and they shine so cold...\nonce i like crying twice i like laughter\ncome tell me what i'm after";
        private Font japaneseFont ;
        private string japaneseText = new string(new char[] {(char)31169, (char)12398, (char)21517, (char)21069, (char)12399, (char)12463, (char)12522, (char)12473, (char)12391, (char)12377, (char)12290});
        private Brush linearGradBrush;
        private bool doJapaneseSample=true;

        private FontFamily serifFontFamily;

        public TextSample() {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            serifFontFamily = new FontFamily (GenericFontFamilies.Serif);

            this.SetStyle(System.Windows.Forms.ControlStyles.Opaque, true);

            //Make sure form redraws when it is resized
            this.SetStyle(ControlStyles.ResizeRedraw,true);

            //Load the image to be used for the background from the exe's resource fork
            Image backgroundImage = new Bitmap(Assembly.GetExecutingAssembly().GetManifestResourceStream("colorbars.jpg"));

            //Now create the brush we are going to use to paint the background
            backgroundBrush = new TextureBrush(backgroundImage);

            //Load the image to be used for the textured text from the exe's resource fork
            Image textImage = new Bitmap(Assembly.GetExecutingAssembly().GetManifestResourceStream("marble.jpg"));
            textTextureBrush = new TextureBrush(textImage);

            //Load the fonts we want to use
            this.Font = new Font(serifFontFamily, 20);
            titleFont = new Font(serifFontFamily, 60);
            textFont = new Font(serifFontFamily, 11);

            //Set up shadow brush - make it translucent
            titleShadowBrush = new SolidBrush(Color.FromArgb(70, Color.Black));

            //Set up fonts and brushes for printing japanese text
            try {
                japaneseFont = new Font("MS Mincho", 36);
                linearGradBrush = new LinearGradientBrush(new Point(0, 0), new Point(0, 45), Color.Blue, Color.Red);
            } catch (Exception ex) {
                MessageBox.Show("The Japanese font MS Mincho needs be present to run the Japanese part of this sample\n\n" + ex.Message);
                doJapaneseSample = false;
            }

        }

        protected override void OnPaint(PaintEventArgs e) {
            Graphics g = e.Graphics;

            e.Graphics.SmoothingMode = SmoothingMode.AntiAlias;

            //Fill the background use the texture brush
            //and then apply a white wash
            g.FillRectangle(backgroundBrush, ClientRectangle);
            g.FillRectangle(new SolidBrush(Color.FromArgb(180, Color.White)), ClientRectangle);

            //Simple draw hello world
            g.DrawString("Hello World", this.Font, new SolidBrush(Color.Black), 10,10);

            //Draw a textured string
            string titleText = "Graphics  Samples";
            g.DrawString(titleText, titleFont, titleShadowBrush, 15, 25);
            g.DrawString(titleText, titleFont, textTextureBrush, 10, 20);

            string textToDraw="Hello Symetrical World";

            //Use Measure string to display a string at the center of the window
            float windowCenter=this.DisplayRectangle.Width/2;
            SizeF stringSize=e.Graphics.MeasureString(textToDraw, textFont);
            float startPos=windowCenter-(stringSize.Width/2);
            g.DrawString(textToDraw, textFont, new SolidBrush(Color.Red), startPos, 10);

            //Now draw a string flowed into a rectangle
            RectangleF rectangle1 = new RectangleF(20, 150, 250, 300);
            g.FillRectangle(new SolidBrush(Color.Gainsboro), rectangle1);
            g.DrawString(flowedText1, textFont, new SolidBrush(Color.Blue), rectangle1);

            //Draw more flowed text but this time center it
            RectangleF rectangle2 = new RectangleF(450, 150, 250, 300);
            g.FillRectangle(new SolidBrush(Color.Gainsboro), rectangle2);
            StringFormat format = new StringFormat();
            format.Alignment=StringAlignment.Center;
            g.DrawString(flowedText2, textFont, new SolidBrush(Color.Blue), rectangle2,format);

            //Work out how many lines and characters we printed just now
            int characters=0;
            int lines=0;
            e.Graphics.MeasureString(flowedText2, textFont, rectangle2.Size, format, out characters, out lines);
            string whatRenderedText=String.Format("We printed {0} characters and {1} lines", characters, lines);
            e.Graphics.DrawString(whatRenderedText, textFont, new SolidBrush(Color.Black), 400,440);

            //If we have the Japanese language pack draw some text in Japanese
            //Rotate it to make life truly exciting
            if (doJapaneseSample) {
                g.RotateTransform(-30);
                g.TranslateTransform(-180, 300);
                g.DrawString(japaneseText, japaneseFont, linearGradBrush, 200, 140);
                g.ResetTransform();
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
        private void InitializeComponent() {
            this.components = new System.ComponentModel.Container ();
            this.Size = new System.Drawing.Size(750, 500);
            this.Text = "GDI+ Text Samples";
        }

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        public static void Main() {
            Application.Run(new TextSample());
        }
    }
}
