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

Imports System
Imports System.Resources
Imports System.Reflection
Imports System.Globalization

Public Class myApp

	'  an assembly aware constructor...
	Public Shared rm As ResourceManager = New ResourceManager("strings", _
			System.Reflection.Assembly.GetExecutingAssembly())

	Dim age As Int32 = 0
	Dim culture As Int32 = 0
	Dim degrees As Int32 = 0
	Dim distToWork As Int32 = 0
	Dim name As String = ""
	Dim ci As CultureInfo = New CultureInfo(CultureInfo.CurrentUICulture.Name)

	Public Shared Sub Main()

		Dim ma As myApp = New myApp()

		'  show the base cultures for which the app was designed to handle...
		Console.WriteLine("1. New Zealand English")
		Console.WriteLine("2. US English")
		Console.WriteLine("3. German (Germany)")

		ma.ShowPrompt( "promptCulture", 1, 3)
		Console.WriteLine()
		Console.WriteLine()
		Console.WriteLine()

		' set the current culture to the choice made!
		Select Case ma.culture
		
		Case 1 '  New Zealand
			ma.ci = new CultureInfo("en-NZ")

		Case 3 '  German
			ma.ci = new CultureInfo("de-DE")

		Case Else '  use the default...
			ma.ci = new CultureInfo("en")

		End Select

		ma.ShowName()
		ma.ShowAge( 15, 120 )
		ma.ShowDegrees()
		ma.ShowDistance()
		ma.PrintOutputs()
	End Sub

	Sub ShowName()

		Console.WriteLine()

		'  show the inital prompt until a valid entry is made...
		Do While true
			Console.Write( rm.GetString( "promptName", ci ) & " " )

			name = Console.ReadLine()

			If name <> "" Then
				Exit Sub
			End If

			Console.WriteLine()
			Console.WriteLine( rm.GetString( "promptMissing", ci ) )
		Loop
	End Sub

	Sub ShowDegrees()

		Console.WriteLine()

		'  show the inital prompt until a valid entry is made...
		Do While true
			Console.Write( rm.GetString( "promptDegrees", ci ) & " " & rm.GetString( "degree1", ci ) & " ")

			Try
				degrees = Convert.ToInt32(Console.ReadLine())
			Catch
			End Try

			If degrees >= Convert.ToInt32(rm.GetString( "degree2", ci )) And _ 
						degrees <= Convert.ToInt32(rm.GetString( "degree3", ci )) Then
				Exit Sub
			End If

			Console.WriteLine()
			Console.WriteLine( rm.GetString( "promptValidDeg", ci ) )
		Loop
	End Sub

	Sub ShowAge( lb As Int32, ub As Int32)

		Console.WriteLine()

		'  show the inital prompt until a valid entry is made...
		Do While true
			Console.Write( rm.GetString( "promptAge", ci ) & " " )

			Try
				age = Convert.ToInt32(Console.ReadLine())
			Catch
			End Try

			If age >= lb And age <= ub Then
				Exit Sub
			End If

			Console.WriteLine()
			Console.WriteLine( rm.GetString( "promptValidAge", ci ) )
		Loop
	End Sub

	Sub ShowPrompt( RetrieveString As String, lb As Int32, ub As Int32)

		Console.WriteLine()

		'  show the inital prompt until a valid entry is made...
		Do While true
			Console.Write( rm.GetString( RetrieveString, ci ) & " " )

			Try
				culture = Convert.ToInt32(Console.ReadLine())
			Catch
			End Try

			If culture >= lb And culture <= ub Then
				Exit Sub
			End If

			Console.WriteLine()
			Console.WriteLine( rm.GetString( "promptMissing", ci ) )
		Loop
	End Sub

	Sub ShowDistance()

		Console.WriteLine()

		'  show the inital prompt until a valid entry is made...
		Do While true
			Console.Write( rm.GetString( "promptDist", ci ) & " " & rm.GetString( "dist1", ci ) & " ")

			Try
				distToWork = Convert.ToInt32(Console.ReadLine())
			Catch
			End Try

			If distToWork > 0 And distToWork <= 2000 Then
				Exit Sub
			End If

			Console.WriteLine()
			Console.WriteLine( rm.GetString( "promptValidDist", ci ) )
		Loop
	End Sub

	Sub PrintOutputs()

		Console.WriteLine()
		Console.Write( rm.GetString( "promptEntries", ci ) )

		Console.WriteLine()
		Console.WriteLine("{0,-20}{1}", rm.GetString( "outputName", ci ), name)
		Console.WriteLine("{0,-20}{1}", rm.GetString( "outputAge", ci ), age)
		Console.WriteLine("{0,-20}{1}", rm.GetString( "outputDegrees", ci ), degrees)
		Console.WriteLine("{0,-20}{1}", rm.GetString( "outputDist", ci ), distToWork)
	End Sub
End Class