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
using namespace Text::RegularExpressions;


void main(int argc, char ** argv){
   Regex * digitregex = new Regex(S"(?<digit>[0-9])");
   String * before = S"Here is so4848me te88xt with emb4493edded numbers.";
            
   if ( argc > 1 ) {
   String * args[] = Environment::GetCommandLineArgs();
   before = String::Join(S" ", args);
   }
            
   String * after = digitregex -> Replace(before, "");            

   Console::WriteLine(String::Concat(S"Before: ", before));
   Console::WriteLine(String::Concat(S"After : ", after));

   Console::WriteLine();
   Console::WriteLine(S"Press Enter to Continue...");
   Console::ReadLine();
}

