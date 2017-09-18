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


namespace Microsoft.Samples.WinForms.Cs.HelloWorldControl {
   using System;
   using System.Windows.Forms;
   using System.Drawing;

   public class HelloWorldControl : System.Windows.Forms.Control {
   
       protected override void OnPaint(PaintEventArgs e) {

           //Paint the Text property on the control
           e.Graphics.DrawString(Text, 
                                 Font, 
                                 new SolidBrush(ForeColor), 
                                 ClientRectangle);
       }
   }
}
