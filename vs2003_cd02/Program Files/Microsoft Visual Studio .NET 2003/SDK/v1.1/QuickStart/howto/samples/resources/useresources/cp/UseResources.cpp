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

#using <mscorlib.dll>
#using <System.Drawing.dll>

using namespace System;
using namespace System::Resources;
using namespace System::Reflection;
using namespace System::Globalization;

public __gc class UseResources {
public:

    // an assembly aware constructor...
	static ResourceManager* rm = new ResourceManager( S"UseResources", Assembly::GetExecutingAssembly() );

	Int32 age;
	Int32 culture;
	Int32 degrees;
	Int32 distToWork;
	String* name;
	CultureInfo* ci;

	// Default constructor
	UseResources() {
        Int32 age = 0;
		Int32 culture = 0;
		Int32 degrees = 0;
		Int32 distToWork = 0;
		String* name = S"";
		CultureInfo* ci = new CultureInfo( CultureInfo::CurrentUICulture->Name );
	}

    void ShowName() {

		Console::WriteLine();

        // show the inital prompt until a valid entry is made...
        while (true) {
			Console::Write( String::Concat( rm->GetString( S"promptName", ci ), S" " ) );

			name = Console::ReadLine();

            if ( !name->Equals( S"" ) )
                return;

			Console::WriteLine();
			Console::WriteLine( rm->GetString( S"promptMissing", ci ) );
        }
    }

    void ShowDegrees() {

		Console::WriteLine();

        // show the inital prompt until a valid entry is made...
        while (true) {
			Console::Write( String::Concat( rm->GetString( S"promptDegrees", ci ), S" ", rm->GetString( S"degree1", ci ), S" " ) );

            try {
				degrees = Convert::ToInt32( Console::ReadLine() );
            }
            catch( Exception* ) {}

			if ( degrees >= Convert::ToInt32( rm->GetString( S"degree2", ci ) ) &&
				degrees <= Convert::ToInt32( rm->GetString( S"degree3", ci ) ) )
                return;

			Console::WriteLine();
			Console::WriteLine( rm->GetString( S"promptValidDeg", ci ) );
        }
    }



    void ShowAge( Int32 lb, Int32 ub ) {

		Console::WriteLine();

        // show the inital prompt until a valid entry is made...
        while (true) {
			Console::Write( String::Concat( rm->GetString( S"promptAge", ci ), S" " ) );

            try {
				age = Convert::ToInt32( Console::ReadLine() );
            }
            catch( Exception* ) {}

            if ( age >= lb && age <= ub )
                return;

			Console::WriteLine();
			Console::WriteLine( rm->GetString( S"promptValidAge", ci ) );
        }
    }

    void ShowPrompt( String* RetrieveString, Int32 lb, Int32 ub ) {

		Console::WriteLine();

        // show the inital prompt until a valid entry is made...
        while (true) {
			Console::Write( String::Concat( rm->GetString( RetrieveString, ci ), S" " ) );

            try {
				culture = Convert::ToInt32(Console::ReadLine());
            }
            catch( Exception* ) {}

            if ( culture >= lb && culture <= ub )
                break;

			Console::WriteLine();
			Console::WriteLine( rm->GetString( S"promptMissing", ci ) );
        }
	}

    void ShowDistance() {

		Console::WriteLine();

        // show the inital prompt until a valid entry is made...
        while (true) {
			Console::Write( String::Concat( rm->GetString( S"promptDist", ci ), S" ", rm->GetString( S"dist1", ci ), S" " ) );

            try {
				distToWork = Convert::ToInt32( Console::ReadLine() );
			}
            catch( Exception* ) {}

            if ( distToWork > 0 && distToWork <= 2000 )
                break;

			Console::WriteLine();
			Console::WriteLine( rm->GetString( S"promptValidDist", ci ) );
        }
    }

    void PrintOutputs() {

		Console::WriteLine();
        Console::Write( rm->GetString( S"promptEntries", ci ) );

        Console::WriteLine();
        Console::WriteLine( S"{0,-20}{1}", rm->GetString( S"outputName", ci ), name);
        Console::WriteLine( S"{0,-20}{1}", rm->GetString( S"outputAge", ci ), __box(age) );
        Console::WriteLine( S"{0,-20}{1}", rm->GetString( S"outputDegrees", ci ), __box(degrees) );
        Console::WriteLine( S"{0,-20}{1}", rm->GetString( S"outputDist", ci ), __box(distToWork) );
    }
};

void main() {

    UseResources* ma = new UseResources;

    // show the base cultures for which the app was designed to handle...
	Console::WriteLine( S"1. New Zealand English" );
	Console::WriteLine( S"2. US English" );
	Console::WriteLine( S"3. German (Germany)" );

    ma->ShowPrompt( S"promptCulture", 1, 4 );
	Console::WriteLine( S"\r\n" );

    //set the current culture to the choice made!
    switch ( ma->culture )
    {
        case 1: // New Zealand
            ma->ci = new CultureInfo( S"en-NZ" );
            break;

        case 3: // German
            ma->ci = new CultureInfo( S"de-DE" );
            break;

        default: // use the default...
            ma->ci = new CultureInfo( S"en" );
            break;
    }

	ma->ShowName();
    ma->ShowAge( 15, 120 );
    ma->ShowDegrees();
    ma->ShowDistance();
    ma->PrintOutputs();
}
