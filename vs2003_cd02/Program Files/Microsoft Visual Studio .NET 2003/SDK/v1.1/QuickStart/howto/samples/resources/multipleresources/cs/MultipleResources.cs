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

//The following command=line can be used to compile this file...
//csc /res:items.resources /r:System.Drawing.dll /r:System.Windows.Forms.dll /r:System.dll MultipleResources.cs

using System;
using System.Drawing;
using System.Windows.Forms;
using System.Resources;
using System.Reflection;
using System.Globalization;
using System.Threading;

class MultipleResources {
	public static void Main() {

		ResourceManager rm = new ResourceManager("items", Assembly.GetExecutingAssembly());

		Form f = new Form();

		PictureBox p = new PictureBox();

//		CultureInfo ci = Thread.CurrentThread.CurrentCulture;
		CultureInfo ci = Application.CurrentCulture;

		Bitmap b = (Bitmap)rm.GetObject("flag", ci);

		Label label1 = new Label();
		Label label2 = new Label();
		Label lblDist = new Label();
		Label lblWeight = new Label();
		Label lblTemp = new Label();

		p.Image = (Image)b;

		label1.Location = new Point(30, 20);
		label1.Font = new Font( label1.Font.FontFamily, 12, FontStyle.Bold);
		label1.AutoSize = true;
		label1.Text = rm.GetString("welcome", ci);

		label2.Location = new Point(30, 50);
		label2.AutoSize = true;
		label2.Text = rm.GetString("measure", ci);

		lblDist.Location = new Point(30, 80);
		lblDist.AutoSize = true;
		lblDist.Text = rm.GetString("basedist", ci) + " " + rm.GetString("distance", ci);

		lblWeight.Location = new Point(30, 110);
		lblWeight.AutoSize = true;
		lblWeight.Text = rm.GetString("baseweight", ci) + " " + rm.GetString("weight", ci);

		lblTemp.Location = new Point(30, 140);
		lblTemp.AutoSize = true;
		lblTemp.Text = rm.GetString("basetemp", ci) + " " + rm.GetString("temp", ci);

		p.Height = b.Height;
		p.Width = b.Width;
		p.Location = new Point(30, 180);

		f.Height = p.Height + 240;
		f.Width = p.Width + 60;

		f.Controls.Add(p);
		f.Controls.Add(label1);
		f.Controls.Add(label2);
		f.Controls.Add(lblDist);
		f.Controls.Add(lblWeight);
		f.Controls.Add(lblTemp);

		f.ShowDialog();
	}
}