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

' this small application is made to create the resource files to be used by the
' MultipleResources application. To compile this application, use the following command:
' vbc /r:System.Drawing.dll MakeResources.vb
' then, actually run the application


' Once made, you need to move the non-default resources
' into their appropriate directories, and compile them

' use the following command, inside the satellite directories
' al /t:lib /culture:<culture> /link:items.<culture>.resources /out:MultipleResources.resources.dll
' E.g.
' al /t:lib /culture:de /link:items.de.resources /out:MultipleResources.resources.dll

Imports System
Imports System.Drawing
Imports System.Resources

Class MakeResources
	Public Shared Sub Main()

		' the New Zealand resources
		Dim rw As ResourceWriter = New ResourceWriter("items.en-NZ.resources")
		Dim b As Bitmap = New Bitmap("flags\nz.gif")
		rw.AddResource("flag", b)
		rw.AddResource("welcome", "Kia Ora. This is the New Zealand Version.")
		rw.AddResource("measure", "New Zealand uses the following measurements:")
		rw.AddResource("distance", "millimetres, centimetres, metres, and kilometres")
		rw.AddResource("weight", "milligrams, grams, and kilograms")
		rw.AddResource("temp", "Celsius (Freezing = 0 degrees)")
		rw.Generate()

		' the Japanese resources
		rw = new ResourceWriter("items.ja.resources")
		b = new Bitmap("flags/ja.gif")
		rw.AddResource("flag", b)
		rw.AddResource("welcome", "ようこそ。これは日本語バージョンです。")
		rw.AddResource("measure", "日本では以下の度量衡を使用しています:")
		rw.AddResource("basedist", "長さ:")
		rw.AddResource("baseweight", "重さ:")
		rw.AddResource("basetemp", "温度:")
		rw.AddResource("distance", "ミリメートル、センチメートル、メートル、キロメートル")
		rw.AddResource("weight", "ミリグラム、グラム、キログラム")
		rw.AddResource("temp", "摂氏 ( 氷点は0度です)")
		rw.Generate()

		' the German resources
		rw = new ResourceWriter("items.de.resources")
		b = new Bitmap("flags/de.gif")
		rw.AddResource("flag", b)
		rw.AddResource("welcome", "Willkommen.  Dieses ist die deutsche Version")
		rw.AddResource("measure", "Deutschland verwendet die folgenden Messen:")
		rw.AddResource("basedist", "Abstand:")
		rw.AddResource("baseweight", "Gewicht:")
		rw.AddResource("basetemp", "Temperatur:")
		rw.AddResource("distance", "Millimeter, Zentimeter, Meßinstrumente und Kilometer")
		rw.AddResource("weight", "Milligramme, Gramm und Kilogramm")
		rw.AddResource("temp", "Celsius (Grad einfrierend = 0)")
		rw.Generate()

		' the default resources
		rw = New ResourceWriter("items.resources")
		b = New Bitmap("flags\us50.gif")
		rw.AddResource("flag", b)
		rw.AddResource("welcome", "Welcome! This is the US Version.")
		rw.AddResource("measure", "The US uses the following measurements:")
		rw.AddResource("basedist", "Distance:")
		rw.AddResource("baseweight", "Weight:")
		rw.AddResource("basetemp", "Temperature:")
		rw.AddResource("distance", "Inches, Feet, Yards and Miles")
		rw.AddResource("weight", "Ounces, Pounds, and Stones")
		rw.AddResource("temp", "Fahrenheit (Freezing = 32 degrees)")
		rw.Generate()
	End Sub
End Class