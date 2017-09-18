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

void main( void )
{
  String* assemblyName = Environment::GetCommandLineArgs()[0];
  if( !assemblyName->EndsWith( S".exe" ) ) {
    assemblyName = String::Concat( assemblyName, S".exe" );
  }
  Console::WriteLine( String::Concat( S"Please run InstallUtil.exe ", assemblyName ) );
  Console::WriteLine();
  Console::WriteLine( S"Press Enter to continue..." );
  Console::ReadLine();
}
