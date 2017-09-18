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

using namespace System;
using namespace System::Globalization;

__gc class CultureAndRegion
{

 public: static void Main(String* args[])
 {
    CultureInfo* c = new CultureInfo("en-us");
	Console::WriteLine ("The CultureInfo is set to: {0}", c->DisplayName);
	Console::WriteLine ("The parent culture is: {0}", c->Parent->DisplayName);
	Console::WriteLine ("The three leter ISO language name is: {0}", c->ThreeLetterISOLanguageName);
    Console::WriteLine ("The default calendar for this culture is: {0}\n\n", c->Calendar->ToString());

    RegionInfo *r = new RegionInfo("us");
    Console::WriteLine ("The name of this region is: {0}", r->Name);
    Console::WriteLine ("The currency symbol for the region is: {0}", r->CurrencySymbol);
    Console::WriteLine ("Is this region metric : {0} \n\n", r->IsMetric.ToString());

    CultureInfo *c2 = new CultureInfo("de-ch");
    Console::WriteLine ("The CultureInfo is set to: {0}", c2->DisplayName);
    Console::WriteLine ("The parent culture is: {0}", c2->Parent->DisplayName);
    Console::WriteLine ("The three leter ISO language name is: {0}", c2->ThreeLetterISOLanguageName);
    Console::WriteLine ("The default calendar for this culture is: {0}\n\n", c2->Calendar->ToString());

    RegionInfo *r2 = new RegionInfo("de");
    Console::WriteLine ("The name of this region is: {0}", r2->Name);
    Console::WriteLine ("The currency symbol for the region is: {0}", r2->CurrencySymbol);
    Console::WriteLine ("Is this region metric : {0}", r2->IsMetric.ToString());

    Console::WriteLine ();
    Console::WriteLine ("Press Enter to continue...");
	Console::ReadLine();
 }
};

void main( int argc, char *argv[ ], char *envp[ ] )
{
	CultureAndRegion::Main(0);		
};



