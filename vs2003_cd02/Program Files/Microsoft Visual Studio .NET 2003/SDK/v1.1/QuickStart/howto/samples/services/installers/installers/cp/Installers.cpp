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
#using <system.dll>
#using <system.messaging.dll>

using namespace System;
using namespace System::Diagnostics;
using namespace System::Messaging;

// run InstallUtil.exe installers.exe
// verify that the evnet log was created
// verify that the message queue was created
// run InstallUtil.exe /u installers.exe
// verify that the message queue was removed
// verify that the event log was removed

  void main( void ) {

	bool resourcesInstalled = true;
	if( !MessageQueue::Exists( S".\\InstallersSample" ) )
	{
		Console::WriteLine( S"This application requires InstallersSample Message Queue to be installed." );
		resourcesInstalled = false;
	}

	if( !EventLog::SourceExists( S"InstallersSample" ) )
	{
		Console::WriteLine( S"This application requires InstallersSample Event Log Source to be setup." );
		resourcesInstalled = false;
	}

	if( !resourcesInstalled )
	{
		Console::WriteLine( String::Concat( S"Please run InstallUtil.exe ", Environment::GetCommandLineArgs()[0] ) );
		return;
	}

	// the application may proceed!
	Console::WriteLine( S"Message Queue and Event Log are installed!" );
  }

