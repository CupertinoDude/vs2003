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

    // <doc>
    // <desc>
    //     This simple control displays the images selected in the ListBox
    // </desc>                                                            
    // </doc>
    //
    public class SampleImagePanel : System.Windows.Forms.Panel {
        internal System.Drawing.Image[] myImages = new System.Drawing.Image[4];
        private int imageCnt = 0;

        public SampleImagePanel() : base() {
        }

        public virtual void AddImage(Image img) {
            if (imageCnt >= myImages.Length) {
                return;
            }
            myImages[imageCnt++] = img;
        }

        public virtual void ClearImages() {
            imageCnt = 0;
        }

        protected override void OnPaint(PaintEventArgs pe) {
            base.OnPaint(pe);
            for (int i=0; i<imageCnt; i++) {
                pe.Graphics.DrawImage(myImages[i], new System.Drawing.Point(0, 30 * i + 5));
            }
        }
    }

