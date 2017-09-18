'-----------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
' 
'  Copyright (C) Microsoft Corporation.  All rights reserved.
' 
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
' 
'THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'-----------------------------------------------------------------------

' The following command=line can be used to compile this file...
' vbc /res:items.resources /r:System.Drawing.dll /r:System.Windows.Forms.dll /r:System.dll MultipleResources.vb

Imports System
Imports System.Drawing
Imports System.Windows.Forms
Imports System.Resources
Imports System.Reflection
Imports System.Globalization
Imports System.Threading

Class MultipleResources
	Public Shared Sub Main()

		Dim rm As ResourceManager = New ResourceManager("items", _
				System.Reflection.Assembly.GetExecutingAssembly())

		Dim f As Form = New Form()

		Dim p As PictureBox = New PictureBox()

		Dim ci As CultureInfo = Thread.CurrentThread.CurrentCulture

		Dim b As Bitmap = CType(rm.GetObject("flag", ci), Bitmap)

		Dim label1 As Label = New Label()
		Dim label2 As Label = New Label()
		Dim lblDist As Label = New Label()
		Dim lblWeight As Label = New Label()
		Dim lblTemp As Label = New Label()

		p.Image = CType(b, Image)

		label1.Location = new Point(30, 20)
		label1.Font = New Font( label1.Font.FontFamily, 12, FontStyle.Bold)
		label1.AutoSize = true
		label1.Text = rm.GetString("welcome", ci)

		label2.Location = new Point(30, 50)
		label2.AutoSize = true
		label2.Text = rm.GetString("measure", ci)

		lblDist.Location = new Point(30, 80)
		lblDist.AutoSize = true
		lblDist.Text = rm.GetString("basedist", ci) & " " & rm.GetString("distance", ci)

		lblWeight.Location = new Point(30, 110)
		lblWeight.AutoSize = true
		lblWeight.Text = rm.GetString("baseweight", ci) & " " & rm.GetString("weight", ci)

		lblTemp.Location = new Point(30, 140)
		lblTemp.AutoSize = true
		lblTemp.Text = rm.GetString("basetemp", ci) & " " & rm.GetString("temp", ci)

		p.Height = b.Height
		p.Width = b.Width
		p.Location = New Point(30, 180)

		f.Height = p.Height + 240
		f.Width = p.Width + 60

		f.Controls.Add(p)
		f.Controls.Add(label1)
		f.Controls.Add(label2)
		f.Controls.Add(lblDist)
		f.Controls.Add(lblWeight)
		f.Controls.Add(lblTemp)

		f.ShowDialog()
	End Sub
End Class