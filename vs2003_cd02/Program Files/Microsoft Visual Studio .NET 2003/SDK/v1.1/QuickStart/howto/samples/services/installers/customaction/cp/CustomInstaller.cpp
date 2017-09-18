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
#using <system.configuration.install.dll>
#using <system.dll>

using namespace System;
using namespace System::Collections;
using namespace System::Configuration::Install;

public __gc class CustomInstaller : public Installer {
public:

  void Install(IDictionary* state) {
	  Context->LogMessage(S"Installing");
	  Installer::Install(state);
	  Console::WriteLine(S"Installing: Any code could be executed here!");
  }

  void Uninstall(IDictionary* state) {
	  Context->LogMessage(S"Uninstalling");
	  Console::WriteLine(S"Uninstalling: Any code could be executed here!");
	  Installer::Uninstall(state);
  }
};