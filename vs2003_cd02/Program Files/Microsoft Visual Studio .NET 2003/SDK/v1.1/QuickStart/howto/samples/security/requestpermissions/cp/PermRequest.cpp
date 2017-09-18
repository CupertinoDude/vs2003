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

// This is the main project file for VC++ application project 
// generated using an Application Wizard.

#include <tchar.h>

#using <mscorlib.dll>

using namespace System;
using namespace System::Collections;
using namespace System::Security;
using namespace System::Security::Permissions;

[assembly:EnvironmentPermission(SecurityAction::RequestMinimum,
Read="PROCESSOR_IDENTIFIER;PROCESSOR_REVISION;NUMBER_OF_PROCESSORS;OS")];
[assembly:EnvironmentPermission(SecurityAction::RequestOptional, Unrestricted=true)];
[assembly:EnvironmentPermission(SecurityAction::RequestRefuse,
Read="USERNAME;USERDOMAIN;USERDNSDOMAIN;COMPUTERNAME;LOGONSERVER",
Write="USERNAME;USERDOMAIN;USERDNSDOMAIN;COMPUTERNAME;LOGONSERVER")];

String* GetEnvironmentValue(String* Var);

// This is the entry point for this application
int _tmain()
{
	//We are guaranteed to get these (providing they are set, of course)
	Console::WriteLine(S"Processor: {0}", GetEnvironmentValue(S"PROCESSOR_IDENTIFIER"));
	Console::WriteLine(S"Revision: {0}", GetEnvironmentValue(S"PROCESSOR_REVISION"));
	Console::WriteLine(S"Count: {0}", GetEnvironmentValue(S"NUMBER_OF_PROCESSORs"));
	Console::WriteLine(S"Operating System: {0}", GetEnvironmentValue(S"OS"));

	//We may or may not get these depending upon security policy
	Console::WriteLine(S"System Drive: {0}", GetEnvironmentValue(S"SYSTEMDRIVE"));
	Console::WriteLine(S"System Path: {0}", GetEnvironmentValue(S"SYSTEMROOT"));
	Console::WriteLine(S"Extensions: {0}", GetEnvironmentValue(S"PATHEXT"));

	//Should always return a security exception
	Console::WriteLine("ComputerName: {0}", GetEnvironmentValue(S"COMPUTERNAME"));

	Console::Write(S"\nPress Enter to exit...");
	Console::Read();

    return 0;
}


String* GetEnvironmentValue(String* Var) 
{
	try 
	{
		String* Val = Environment::GetEnvironmentVariable(Var);

		if (Val == 0)
			return S"*Not Set*";
		else
			return Val;

	} 
	catch (SecurityException*) 
	{
		return S"*Inadequate Permissions*";
	} 
	catch (Exception* e) 
	{
		return String::Concat(S"*Exception: ", e->Message, S"*");
	}
}

  