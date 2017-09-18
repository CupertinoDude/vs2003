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
using System.Resources;
using System.Reflection;
using System.Globalization;

public class myApp {

	// an assembly aware constructor...
	static ResourceManager rm = new ResourceManager("strings",Assembly.GetExecutingAssembly());

	Int32 age = 0;
	Int32 culture = 0;
	Int32 degrees = 0;
	Int32 distToWork = 0;
	String name = "";
	CultureInfo ci = new CultureInfo(CultureInfo.CurrentUICulture.Name);

	public static void Main() {

		myApp ma = new myApp();

		// show the base cultures for which the app was designed to handle...
		Console.WriteLine("1. New Zealand English");
		Console.WriteLine("2. US English");
		Console.WriteLine("3. German (Germany)");

		ma.ShowPrompt( "promptCulture", 1, 3);
		Console.WriteLine("\r\n");

		//set the current culture to the choice made!
		switch ( ma.culture )
		{
			case 1: // New Zealand
				ma.ci = new CultureInfo("en-NZ");
				break;

			case 3: // German
				ma.ci = new CultureInfo("de-DE");
				break;

			default: // use the default...
				ma.ci = new CultureInfo("en");
				break;
		}

		ma.ShowName();
		ma.ShowAge( 15, 120 );
		ma.ShowDegrees();
		ma.ShowDistance();
		ma.PrintOutputs();
	}

	void ShowName() {

		Console.WriteLine();

		// show the inital prompt until a valid entry is made...
		while (true) {
			Console.Write( rm.GetString( "promptName", ci ) + " " );

			name = Console.ReadLine();

			if ( name != "" )
				return;

			Console.WriteLine();
			Console.WriteLine( rm.GetString( "promptMissing", ci ) );
		}
	}

	void ShowDegrees() {

		Console.WriteLine();

		// show the inital prompt until a valid entry is made...
		while (true) {
			Console.Write( rm.GetString( "promptDegrees", ci ) + " " + rm.GetString( "degree1", ci ) + " ");

			try {
				degrees = Convert.ToInt32(Console.ReadLine());
			}
			catch (Exception) {}

			if ( degrees >= Convert.ToInt32(rm.GetString( "degree2", ci )) &&
						degrees <= Convert.ToInt32(rm.GetString( "degree3", ci )) )
				return;

			Console.WriteLine();
			Console.WriteLine( rm.GetString( "promptValidDeg", ci ) );
		}
	}



	void ShowAge( Int32 lb, Int32 ub ) {

		Console.WriteLine();

		// show the inital prompt until a valid entry is made...
		while (true) {
			Console.Write( rm.GetString( "promptAge", ci ) + " " );

			try {
				age = Convert.ToInt32(Console.ReadLine());
			}
			catch (Exception) {}

			if ( age >= lb && age <= ub )
				return;

			Console.WriteLine();
			Console.WriteLine( rm.GetString( "promptValidAge", ci ) );
		}
	}

	void ShowPrompt( String RetrieveString, Int32 lb, Int32 ub ) {

		Console.WriteLine();

		// show the inital prompt until a valid entry is made...
		while (true) {
			Console.Write( rm.GetString( RetrieveString, ci ) + " " );

			try {
				culture = Convert.ToInt32(Console.ReadLine());
			}
			catch (Exception) {}

			if ( culture >= lb && culture <= ub )
				break;

			Console.WriteLine();
			Console.WriteLine( rm.GetString( "promptMissing", ci ) );
		}
	}

	void ShowDistance() {

		Console.WriteLine();

		// show the inital prompt until a valid entry is made...
		while (true) {
			Console.Write( rm.GetString( "promptDist", ci ) + " " + rm.GetString( "dist1", ci ) + " ");

			try {
				distToWork = Convert.ToInt32(Console.ReadLine());
			}
			catch (Exception) {}

			if ( distToWork > 0 && distToWork <= 2000 )
				break;

			Console.WriteLine();
			Console.WriteLine( rm.GetString( "promptValidDist", ci ) );
		}
	}

	void PrintOutputs() {

		Console.WriteLine();
		Console.Write( rm.GetString( "promptEntries", ci ) );

		Console.WriteLine();
		Console.WriteLine("{0,-20}{1}", rm.GetString( "outputName", ci ), name);
		Console.WriteLine("{0,-20}{1}", rm.GetString( "outputAge", ci ), age);
		Console.WriteLine("{0,-20}{1}", rm.GetString( "outputDegrees", ci ), degrees);
		Console.WriteLine("{0,-20}{1}", rm.GetString( "outputDist", ci ), distToWork);
	}
}