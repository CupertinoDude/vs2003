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
using namespace System::Security;
using namespace System::Security::Permissions;
using namespace System::Security::Principal;
using namespace System::Threading;

[assembly:SecurityPermission(SecurityAction::RequestMinimum, ControlPrincipal=true)];

[PrincipalPermission(SecurityAction::Demand, Role=S"BUILTIN\\Administrators")]
String* DeclAdminCheck() 
{
	return S"Declarative check for Administrators group passed!";
}

[PrincipalPermission(SecurityAction::Demand, Role=S"BUILTIN\\Guests")]
String* DeclGuestCheck() 
{
	return S"Declarative check for Guests group passed!";
}

// This is the entry point for this application
int _tmain()
{
	AppDomain::CurrentDomain->SetPrincipalPolicy(PrincipalPolicy::WindowsPrincipal);

	WindowsPrincipal* user = __try_cast<WindowsPrincipal*>(Thread::CurrentPrincipal);

	Console::WriteLine(S"User name: {0}",                  user->Identity->Name);
	Console::WriteLine(S"Authentication type: {0}",        user->Identity->AuthenticationType);
	Console::WriteLine(S"Is in Administrators group: {0}", user->IsInRole(WindowsBuiltInRole::Administrator).ToString() );
	Console::WriteLine(S"Is in Guests group: {0}",         user->IsInRole(WindowsBuiltInRole::Guest).ToString());

	try 
	{
		Console::WriteLine(S"\n{0}", DeclAdminCheck());
	}
	catch(Exception* e) 
	{
		SecurityException* se = dynamic_cast<SecurityException*>(e);

		if ( se != 0 ) 
		{
			if ( se->PermissionType == __typeof(PrincipalPermission) ) 
			{
				Console::WriteLine(S"\nDeclarative check for Admin group failed!");
			}
		}
		else 
		{
			Console::WriteLine(S"\nException occurred: {0}\n", e->ToString() );
		}
	}

	try 
	{
		Console::WriteLine(S"\n{0}", DeclGuestCheck());
	}
	catch(Exception* e) 
	{
		SecurityException* se = dynamic_cast<SecurityException*>(e);

		if ( se != 0 ) 
		{
			if ( se->PermissionType == __typeof(PrincipalPermission) ) 
			{
				Console::WriteLine(S"\nDeclarative check for Guests group failed!");
			}
		}
		else 
		{
			Console::WriteLine(S"\nException occurred: {0}\n", e->ToString() );
		}
	}

	Console::WriteLine(S"\nPress Enter to Exit.");
	Console::Read();
}