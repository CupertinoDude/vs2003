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

#using <System.dll>
using namespace System::Text::RegularExpressions;

void main(int argc, char ** argv)
{

            Regex * digitregex = new Regex(S"(?<number>\\d+)");
            String * s = S"abc 123 def 456 ghi 789";

            if ( argc > 1 ) {
		    String * args[] = Environment::GetCommandLineArgs();
                s = String::Join(S" ", args);
            }

            MatchCollection * mc = digitregex->Matches(s);

            if ( mc->Count > 0 ) {
                Console::WriteLine(S"Digits:");
                for(Int32 i = 0; i < mc-> Count; i++)
                    Console::WriteLine(String::Concat(S"  ",mc -> Item[i]->Value));
            } else {
                Console::WriteLine(String::Concat(S"[", s, S"] contains no numbers."));
            };

            Console::WriteLine();
            Console::WriteLine(S"Press Enter to Continue...");
            Console::ReadLine();
}


  
