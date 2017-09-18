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


namespace Microsoft.Samples.WinForms.Cs.SimpleControl {
    using System;
    using System.ComponentModel;
    using System.Windows.Forms;
    using System.Drawing;

    [
    DefaultProperty("DrawingMode"),
    DefaultEvent("DrawingModeChanged"),
    ]
    public class SimpleControl : System.Windows.Forms.Control {

        private DrawingMode drawingMode ;
        private System.EventHandler onDrawingModeChanged;

        //*** Constructors

        public SimpleControl() :base() {

            //Initialise drawingMode
            drawingMode = DrawingMode.Happy;

            //Initialise BackColor and ForeColor based on DrawingMode
            SetColors();

            //Make sure the control repaints as it is resized
            SetStyle(ControlStyles.ResizeRedraw, true);
        }


        //*** Properties

        //Remove the BackColor property from the properties window
        [Browsable(false)]
        public override Color BackColor {
            get {return base.BackColor;}
            set {}
        }


        //DrawingMode - controls how the control paints
        [
            Category("Appearance"),
            Description("Controls how the control paints"),
            DefaultValue(DrawingMode.Happy),
            Bindable(true),
        ]
        public DrawingMode DrawingMode {
            get { return drawingMode;}
            set {
                drawingMode=value;

                //Raise property changed event for DrawingMode
                OnDrawingModeChanged(EventArgs.Empty);
            }
        }


        //Remove the ForeColor property from the properties window
        [Browsable(false)]
        public override Color ForeColor  {
            get {return base.ForeColor;}
            set {}
        }


        //*** Events

        //Handle the paint event
        protected override void OnPaint(PaintEventArgs e) {

            e.Graphics.FillRectangle(new SolidBrush(BackColor), ClientRectangle);

            Size textSize = e.Graphics.MeasureString(Text, Font).ToSize();

            float xPos = (ClientRectangle.Width/2) - (textSize.Width/2);
            float yPos = (ClientRectangle.Height/2) - (textSize.Height/2);

            e.Graphics.DrawString(Text,
                                  Font,
                                  new SolidBrush(ForeColor),
                                  xPos, yPos);

        }

        protected override void OnTextChanged(EventArgs e) {
            base.OnTextChanged(e);
            Invalidate();
        }

        //DrawingModeChanged Event
        [Description("Raised when the DrawingMode changes")]
        public event EventHandler DrawingModeChanged {
            add {
                onDrawingModeChanged += value;
            }
            remove {
                onDrawingModeChanged -= value;
            }
        }

        protected virtual void OnDrawingModeChanged(EventArgs e) {

            //Set BackColor and ForeColor based on DrawingMode
            SetColors();

            Invalidate();

            if (onDrawingModeChanged != null) onDrawingModeChanged.Invoke(this, e);
        }


        //Set the ForeColor and BackColor based on the value of DrawingMode
        private void SetColors() {

            switch (drawingMode) {

               case DrawingMode.Happy:
                   base.BackColor = Color.Yellow ;
                   base.ForeColor = Color.Green ;
                   break ;

               case DrawingMode.Sad:
                   base.BackColor = Color.LightSlateGray ;
                   base.ForeColor = Color.White ;
                   break ;

              case DrawingMode.Angry:
                  base.BackColor = Color.Red ;
                  base.ForeColor = Color.Teal ;
                  break ;

               default:
                   base.BackColor = Color.Black ;
                   base.ForeColor = Color.White ;
					break;
           }

        }


    }
}
